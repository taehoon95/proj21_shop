-- jongyoon test script
show tables;
select *
  from address;
select *
  from admin;
select *
  from cart;
select *
  from `member`;
select *
  from `order`;
select *
  from pro_img;
select *
  from product;
select *
  from qna;
select *
  from re_reply;
select *
  from review;
 
-- 만약 주문 수 가 0이면 false 아니면 true
select if(count(*)=0,'false','true')
  from `order`;

select *
  from `order`;
 
-- 총 판매 금액
select sum(order_pro_quantity * order_price)
  from `order`;
 
-- 총 주문 건 수
select count(distinct order_num)
  from `order`;

-- 총 주문 수
select count(*)
  from `order`;
-- 배송 준비 중 수 
select count(*)
  from `order`
 where delivery_status='배송준비중';
-- 배송 중 수 
select count(*)
  from `order`
 where delivery_status='배송 중';
-- 배송 완료 수
select count(*)
  from `order`
 where delivery_status='배송 완료';
-- 환불 완료 수
select count(*)
  from `order` 
 where delivery_status='환불 완료';
-- 환불 대기 수
select count(*)
  from `ORDER`
 where delivery_status='환불 대기중';
-- 총 주문
-- 모든 환불완료

-- ----------------------------------------------------
-- AdminMember
-- ----------------------------------------------------

-- 총 회원수
SELECT count(*)
FROM MEMBER;

-- 남성 회원수
SELECT count(*)
  FROM `member`
 WHERE m_gender = 0;

-- 여성 회원수
SELECT count(*)
  FROM `member`
 WHERE m_gender = 1;

-- 회원 이름으로 검색
SELECT count(*)
  FROM `member`
 WHERE m_name like CONCAT('%','종','%');

-- 
SELECT count(*)
  FROM `member`
 WHERE m_name like CONCAT('%',#{keyword},'%');

/*
 [MySQL]
title like CONCAT('%',#{keyword},'%'
*/

select *
  from `member`;

SELECT m_id, m_passwd, m_name, m_phone, m_birthday, m_gender, m_addr1, m_addr2, m_addr3, m_question
	 , m_answer, m_email, m_join, m_point, m_total_buy, m_total_order, m_total_login, m_exit
	 
SELECT
	*
FROM
	(
	SELECT
		ROWNUM AS recNum,
		m_id,
		m_name,
		m_gender,
		m_point,
		m_rank,
		m_cre_date,
		m_lately_date,
		m_total_order,
		m_total_buy,
		m_saving
	FROM
		(
		SELECT
			member_code,
			member_id,
			member_name,
			member_gender,
			member_point,
			member_rank,
			member_cre_date,
			member_lately_date,
			member_total_order,
			member_total_buy,
			member_saving
		FROM
			`member`));
	-- m_id, m_passwd, m_name, m_phone, m_birthday, m_gender, m_addr1, m_addr2, m_addr3, m_question, m_answer,

-- m_email, m_join, m_point, m_total_buy, m_total_order, m_total_login, m_exit				 
SELECT *
  FROM (SELECT m_id, m_name, m_gender, m_point, m_join, m_total_order, m_total_buy
		  FROM (SELECT m_id, m_name, m_gender, m_point, m_join, m_total_order, m_total_buy
				  FROM MEMBER
			   	 WHERE m_name LIKE CONCAT('%','이종','%')	AND m_gender = 0
				 ORDER BY m_total_buy DESC, m_total_order DESC));

SELECT m_id, m_name, m_gender, m_point, m_join, m_total_order, m_total_buy
FROM MEMBER
WHERE m_name LIKE CONCAT('%','이종','%')	AND m_gender = 0
ORDER BY m_total_buy DESC, m_total_order DESC;
			
/*SELECT
	ROWNUM AS recNum,
	m_id,
	m_name,
	m_gender,
	m_point,
	m_join,
	m_total_order,
	m_total_buy
FROM
	(
	SELECT
		m_id,
		m_name,
		m_gender,
		m_point,
		m_join,
		m_total_order,
		m_total_buy
	FROM
		MEMBER;*/

-- ----------------------------------------------------
-- AdminProduct
-- ----------------------------------------------------
select pro_num, pro_category, pro_name, pro_price, pro_content, pro_salesrate, pro_cre_date, pro_status, pro_color, pro_size, pro_quantity, pro_sold, pro_hits, re_replyCount
  from product;
/* 총 제품 수 */
select count(pro_num) from product	;
/* 새로나온 제품 기준 30일 */
select count(pro_num) from product	where DATE_ADD(pro_cre_date, INTERVAL 30 DAY)>=NOW();
/* 판매량이 많은 제품  */
select count(pro_num) from product	where pro_sold>=10;
/* 세일중인 제품 */
select count(pro_num) from product	where pro_salesrate>0;
/* 후기수 가 많은 제품 */
select count(pro_num) from product	where re_replyCount>=2;
/* 판매 중지된 상품 */
select count(pro_num) from product	where pro_status='품절';


SELECT count(DATE_ADD(pro_cre_date, INTERVAL 30 DAY))
  FROM product;
 
 select a.* from (
		select rownum rn ,b.*, c.pro_imageFileName
		from product b , product_image c
		where b.pro_code=c.pro_code and
		b.pro_code in (select e.pro_code from product_detail e) and
		c.pro_imagefileType='main_image'
			and b.pro_status=#{direct_pro_status}
			and b.pro_status=#{pro_status}
			and b.pro_category=#{pro_category}
			and pro_name like '%'||#{keyword}||'%'
		order by
		<if test="order_price !=null and !order_price.equals('')">
			<choose>
				<when test="order_price.equals('price_desc')">
					b.pro_price DESC ,
				</when>
				<when test="order_price.equals('price_asc')">
					b.pro_price ASC ,
				</when>
			</choose>
		</if>
		<if test="order_salesRate !=null and !order_salesRate.equals('')">
			<choose>
				<when test="order_salesRate.equals('salesRate_desc')">
					b.pro_salesrate DESC ,
				</when>
				<when test="order_salesRate.equals('salesRate_asc')">
					b.pro_salesrate ASC ,
				</when>
			</choose>
		</if>
		<if test="order_count !=null and !order_count.equals('')">
			<choose>
				<when test="order_count.equals('count_desc')">
					b.pro_count DESC ,
				</when>
				<when test="order_count.equals('count_asc')">
					b.pro_count ASC ,
				</when>
			</choose>
		</if>
		b.pro_code
		)a where rn between (#{section,jdbcType=NUMERIC}-1)*200+(#{pageNum,jdbcType=NUMERIC}-1)*20+1
		and
		(#{section,jdbcType=NUMERIC}-1)*200+#{pageNum,jdbcType=NUMERIC}*20
