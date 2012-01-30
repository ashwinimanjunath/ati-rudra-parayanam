package org.arp.arp_2012.utils;

import java.io.ByteArrayInputStream;
import java.util.List;

import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.CreateBucketRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;
import com.amazonaws.services.s3.model.Region;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectSummary;

public class S3Client {

	private final AmazonS3 s3;

	private static final String BUCKET_NAME = "sai-arp-2012-registration";

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
					request.setRegion(Region.US_West.toString());
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

	public final boolean doesFileExist(final String fileName) {
		try {
			s3.getObjectMetadata(BUCKET_NAME, fileName);
			return true;
		} catch (Exception e) {
		}

		return false;
	}
	
	public final List<S3ObjectSummary> all() {
		try {
			return s3.listObjects(BUCKET_NAME).getObjectSummaries();
		} catch (Exception e) {
		}

		return null;
	}


	public final PutObjectResult saveFile(final String fileName,
			final byte[] bytes) {
		try {
			final ObjectMetadata meta = new ObjectMetadata();
			meta.setContentLength(bytes.length);
			final PutObjectRequest request = new PutObjectRequest(BUCKET_NAME,
					fileName, new ByteArrayInputStream(bytes), meta);
			request.withCannedAcl(CannedAccessControlList.PublicRead);
			PutObjectResult response = s3.putObject(request);
			return response;
		} catch (final Exception e) {
			throw new RuntimeException(e);
		}
	}
}
