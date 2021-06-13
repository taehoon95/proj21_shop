package proj21_shop.dto.review;

import java.sql.Date;

import proj21_shop.dto.product.ProductDTO;

public class ReviewDTO {
	private ProductDTO proName;

	private int reviewNum;
	private int proNum;

	private String memberId;
	private String reviewContent;
	private String reviewImagefilename1;
	private String reviewImagefilename2;

	private Date reviewDate;

	private int reviewReplyCount;
	private int reviewStar;

	public ProductDTO getProName() {
		return proName;
	}

	public void setProName(ProductDTO proName) {
		this.proName = proName;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public int getProNum() {
		return proNum;
	}

	public void setProNum(int proNum) {
		this.proNum = proNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewImagefilename1() {
		return reviewImagefilename1;
	}

	public void setReviewImagefilename1(String reviewImagefilename1) {
		this.reviewImagefilename1 = reviewImagefilename1;
	}

	public String getReviewImagefilename2() {
		return reviewImagefilename2;
	}

	public void setReviewImagefilename2(String reviewImagefilename2) {
		this.reviewImagefilename2 = reviewImagefilename2;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getReviewReplyCount() {
		return reviewReplyCount;
	}

	public void setReviewReplyCount(int reviewReplyCount) {
		this.reviewReplyCount = reviewReplyCount;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

}
