package org.arp.arp_2012.utils;

import java.io.ByteArrayInputStream;

import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.CreateBucketRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectResult;
import com.amazonaws.services.s3.model.S3Object;

public class S3Client {

	private final AmazonS3 s3;

	private static final String BUCKET_NAME = "sai-arp-2012-registrations";

	private static boolean bucketExistenceChecked = false;

	public S3Client() {
		try {
			s3 = new AmazonS3Client(new PropertiesCredentials(
					S3Client.class
							.getResourceAsStream("AwsCredentials.properties")));
			if (!bucketExistenceChecked) {
				if (!s3.doesBucketExist(BUCKET_NAME)) {
					final CreateBucketRequest request = new CreateBucketRequest(
							BUCKET_NAME)
							.withCannedAcl(CannedAccessControlList.PublicRead);
					s3.createBucket(request);
				}
				bucketExistenceChecked = true;
			}
		} catch (final Exception e) {
			throw new RuntimeException(e);
		}

	}

	public final S3Object findFile(final String fileName) {
		return s3.getObject(BUCKET_NAME, fileName);
	}

	public final PutObjectResult saveFile(final String fileName,
			final byte[] bytes) {
		try {
			final String contentType = "application/pdf";
			final ObjectMetadata meta = new ObjectMetadata();
			meta.setContentLength(bytes.length);
			meta.setContentType(contentType);
			PutObjectResult response = s3.putObject(BUCKET_NAME, fileName,
					new ByteArrayInputStream(bytes), meta);
			return response;
		} catch (final Exception e) {
			throw new RuntimeException(e);
		}
	}
}
