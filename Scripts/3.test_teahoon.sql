-- LEE TaeHoon TEST scripts
show tables;

select *
  from cart;
select *
  from member;
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
select *
  from Address;
select *
  from admin;
select *
  from `order`;
 
-- 제품 전체 검색(제품, 제품 이미지 조인문)
create view productAll
as
select p.pro_num,pro_category,pro_name,pro_price,pro_content,pro_salesrate,pro_cre_date,pro_status,pro_color,pro_size,pro_quantity,pro_sold,pro_hits,re_replyCount
		   ,pro_img_code,pro_imagefilename,pro_img_state
  from product p join pro_img i on p.pro_num = i.pro_num;

select * from productAll;
 
-- 제품 삭제
delete
  from product
 where pro_category <=8000;