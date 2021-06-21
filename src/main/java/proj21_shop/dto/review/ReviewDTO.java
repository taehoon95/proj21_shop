package proj21_shop.dto.review;

import java.sql.Date;
import java.util.List;

import proj21_shop.dto.product.ProductDTO;
import proj21_shop.dto.product.ProductImageDTO;

public class ReviewDTO {
	private String memberId;
	private int proNum;

	private ProductDTO proName;

	private int reviewNum;

	private ProductImageDTO proImagefilename;

	private String reviewContent;
	private String reviewImagefilename1;
	private String reviewImagefilename2;

	private Date reviewDate;

	private int reviewReplyCount;
	private int reviewStar;

	private List<ReviewReplyDTO> reviewReplys;
	
	public List<ReviewReplyDTO> getReviewReplys() {
		return reviewReplys;
	}

	public void setReviewReplys(List<ReviewReplyDTO> reviewReplys) {
		this.reviewReplys = reviewReplys;
	}

	public ProductDTO getProName() {
		return proName;
	}

	public ProductImageDTO getProImagefilename() {
		return proImagefilename;
	}

	public void setProImagefilename(ProductImageDTO proImagefilename) {
		this.proImagefilename = proImagefilename;
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
