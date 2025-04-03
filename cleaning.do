gen age = year_m - a2y


recode b1 ///
	(1 = 0) ///
	(2 = 0) ///
	(3 = 6) ///
	(4 = 9) ///
	(5 = 9) ///
	(6 = 12) ///
	(7 = 12) ///
	(8 = 12) ///
	(9 = 12) ///
	(10 = 14) ///
	(11 = 14) ///
	(12 = 15) ///
	(13 = 14) ///
	(14 = 14) ///
	(15 = 14) ///
	(16 = 14) ///
	(17 = 16) ///
	(18 = 15) ///
	(19 = 16) ///
	(20 = 18) ///
	(21 = 23) ///
	(22 = .) ///
	(97 = .) ///
	(98 = .), generate(edu)
	
recode b13 ///
	(1 = 0) ///
	(2 = 0) ///
	(3 = 6) ///
	(4 = 9) ///
	(5 = 9) ///
	(6 = 12) ///
	(7 = 12) ///
	(8 = 12) ///
	(9 = 12) ///
	(10 = 14) ///
	(11 = 14) ///
	(12 = 15) ///
	(13 = 14) ///
	(14 = 14) ///
	(15 = 14) ///
	(16 = 14) ///
	(17 = 16) ///
	(18 = 15) ///
	(19 = 16) ///
	(20 = 18) ///
	(21 = 23) ///
	(22 = .) ///
	(97 = .) ///
	(98 = .), generate(f_edu)
	
recode b14 ///
	(1 = 0) ///
	(2 = 0) ///
	(3 = 6) ///
	(4 = 9) ///
	(5 = 9) ///
	(6 = 12) ///
	(7 = 12) ///
	(8 = 12) ///
	(9 = 12) ///
	(10 = 14) ///
	(11 = 14) ///
	(12 = 15) ///
	(13 = 14) ///
	(14 = 14) ///
	(15 = 14) ///
	(16 = 14) ///
	(17 = 16) ///
	(18 = 15) ///
	(19 = 16) ///
	(20 = 18) ///
	(21 = 23) ///
	(22 = .) ///
	(97 = .) ///
	(98 = .), generate(m_edu)

gen parent_edu = max(f_edu, m_edu)
gen min_parent_edu = min(f_edu, m_edu)


* 創建一個新的變項 f_job 來存儲受訪者父親的工作類型
gen f_job = ., before(c4)

* 先根據 c3 的值來分類
replace f_job = 1 if c3 == 1 & (c3a == 1 | c3a == 2 | c3a == 4)
replace f_job = 2 if c3 == 1 & (c3a == 3 | c3a == 5 | c3a == 6)
replace f_job = 2 if c3 == 4 | c3 == 5
replace f_job = 3 if c3 == 2 | c3 == 3
replace f_job = 4 if c3 == 4

* 設定 f_job 為因子變數並添加標籤
label define jobtype 1 "公部門" 2 "私部門" 3 "自行創業" 4 "無工作"
label values f_job jobtype

recode c10 (5 = 1) (4 = 2) (3 = 3) (2 = 4) (1 = 5) (97 98 = .), gen(strata_young)

recode e1 ///
(10=1) ///
(9=1) ///
(8=2) ///
(7=2) ///
(6=3) ///
(5=3) ///
(4=4) ///
(3=4) ///
(2=5) ///
(1=5), generate(strata_current)

recode f3 (0 = 1) (1 = 2) (2 = 3) (3 = 4) (96 97 98 99 = .), gen(health)

gen is_entrepreneur = 0

replace is_entrepreneur = 1 if inlist(c18, 1, 2)

replace is_entrepreneur = . if ///
    inlist(c17, 96, 97, 98, 99) | ///
    inlist(c18, 96, 97, 98, 99)
	
recode a8 (8 96 97 98 99 = .)
recode a6 (7 96 97 98 99 = .)
recode a7 (7 96 97 98 99 = .)

recode d4 (96 97 98 99 = .) (4 = 0) (3 = 1) (2 = 2) (1 = 3), gen(trust)
recode f4 (96 97 98 99 = .) (1 = 3) (2 = 2) (3 4 = 1) (5 = 0), gen(happy)

recode d3a d3b d3c d3d d3e d3f d3g d3h d3i d3j (1 = 1) (2 = 0) (96 97 98 99 = .), gen(prof law nurs engineer tec manager farm hair waitr police)

gen isMotherhasjob = .
replace isMotherhasjob = 1 if kc7 == 3
replace isMotherhasjob = 0 if kc7 == 1 | kc7 == 2

recode f1 (96 97 98 99 = .), gen(family_members)
recode c23a (996 999 = .), gen(worktime)
recode b11 (1 = 1) (2 = 0) (96 97 99 = .), gen(hasKid)

recode c24 (1 = 0) (96 97 98 99 = .), gen(income)
replace income = income - 1
recode income (-1 = 0)

recode a1 (1 = 1) (2 = 0), gen(gender)

keep stratum2 edu age f_job gender strata_young strata_current is_entrepreneur f_edu trust happy health worktime gender income
	
reg is_entrepreneur worktime i.stratum2 edu age i.f_job i.gender








