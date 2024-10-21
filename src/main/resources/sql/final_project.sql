SELECT * FROM final_project.members order by reg_date desc; 
-- 회원가입 중복체크 쿼리문
select * from members where member_id = 'lch1999'; -- id중복 체크
select * from members where email = 'lch1999@naver.com'; -- email 중복 체크
select * from members where phone_number = '010-1212-3434'; -- phone_number 중복 체크
select * from members where member_id = 'testuser12';

select count(*) from members where member_id = 'testuser12';
-- 회원가입처리
-- insert into members(member_id, member_name, member_pwd, phone_number, birthday, gender, email, address, nickname)
-- values(#{member_id}, #{member_name}, #{member_pwd}, #{phone_number}, #{birthday}, #{gender}, #{email}, #{address}, #{nickname});

-- 비밀번호는 sha256 암호화
update members set member_pwd = sha2('xptmxm12', 256);

-- 자동 로그인 정보 저장
update members set autologin_code = 'uuid', autologin_date = date_add(now(), interval 7 day) where member_id = '1';

-- 자동 로그인 정보 조회
select count(*) from members where autologin_code = '536c7e52-f089-41f2-ad7b-393e7e3ead58' and autologin_date > now()