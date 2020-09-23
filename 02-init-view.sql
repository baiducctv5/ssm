# 新增视图 人口基本信息【syrk_rkgl】
# 视图 实有人口基本信息（流动人口、户籍人口、留守人口）
# lx  0户籍人口 1-流动人口 2-留守人口
CREATE VIEW syrk_rkgl AS
SELECT ld.t_id,ld.t_yhh,ld.t_zhxgsj, 1 as lx FROM t_ldryxx ld WHERE t_sfyx=1
union all
SELECT hj.t_id,hj.t_yhh,hj.t_zhxgsj, 0 as lx FROM t_hjryxx hj WHERE t_sfyx=1
union all
SELECT ls.t_id,ls.t_yhh,ls.t_zhxgsj, 2 as lx  FROM t_lsryxx ls WHERE t_sfyx=1;


# 案事件汇总视图
# t_xz    性质    :1案件 2事件
# t_xm    姓名    :案件为犯罪嫌疑人姓名+受害人姓名,事件为当事人姓名(全部为逗号分隔的字符串)
# t_zjhm  证件号码 :案件为犯罪嫌疑人证件号码+受害人证件号码,事件为当事人证件号码(全部为逗号分隔的字符串)
CREATE VIEW `v_asj` AS
(SELECT
	`aj`.`t_id`,
	`aj`.`t_ssd` AS `t_ssd`,
	`aj`.`t_ssdjs` AS `t_ssdjs`,
	`aj`.`t_ssdlj` AS `t_ssdlj`,
	`aj`.`t_ssdxz` AS `t_ssdxz`,
	`aj`.`t_ajbh` AS `t_ajbh`,
	`aj`.`t_ajmc` AS `t_mc`,
	`aj`.`t_ajfsrq` AS `t_rq`,
	`aj`.`t_aflx` AS `t_lx`,
	`lx`.`t_lxmc` AS `t_lxjs`,
	GROUP_CONCAT(`ry`.`t_xm`) AS `t_xm`,
	GROUP_CONCAT(`ry`.`t_zjhm`) AS `t_zjhm`,
    -1 AS `t_zrwgdw`,
	-1 AS `t_zrwgy`,
	`aj`.`t_zhxgsj` AS `t_zhxgsj`,
	-1 AS `t_sjzt`,
	1 AS `t_xz`
FROM
	(
		`t_ajjbxx` `aj`
		LEFT JOIN `t_lxjbxx` `lx` ON ((`aj`.`t_aflx` = `lx`.`t_id` ))
		LEFT JOIN `t_aj_xgry` `ajry` ON ((`aj`.`t_id` = `ajry`.`t_ajid` ))
		LEFT JOIN `t_ryxx` `ry` ON ((`ajry`.`t_xgryid` = `ry`.`t_yhh` ))
		) GROUP BY `aj`.`t_id`
)
union all

(SELECT
	`md`.`t_id`,
	`md`.`t_ssd` AS `t_ssd`,
	`md`.`t_ssdjs` AS `t_ssdjs`,
	`md`.`t_ssdlj` AS `t_ssdlj`,
	`md`.`t_ssdxz` AS `t_ssdxz`,
	 null AS `t_ajbh`,
	`md`.`t_sjmc` AS `t_mc`,
	`md`.`t_fsrq` AS `t_rq`,
	`md`.`t_fslx` AS `t_lx`,
	`lx`.`t_lxmc` AS `t_lxjs`,
	GROUP_CONCAT(`ry`.`t_xm`) AS `t_xm`,
	GROUP_CONCAT(`ry`.`t_zjhm`) AS `t_zjhm`,
	`md`.`t_zrwgdw` AS `t_zrwgdw`,
	`md`.`t_zrwgy` AS `t_zrwgy`,
	`md`.`t_zhxgsj` AS `t_zhxgsj`,
	`md`.`t_sjzt` AS `t_sjzt`,
	2 AS `t_xz`

FROM
	(
		`t_mdjfsjxx` `md`
		LEFT JOIN `t_lxjbxx` `lx` ON ((`md`.`t_fslx` = `lx`.`t_id` ))
		LEFT JOIN `t_mdjfsj_dsr` `mdry` ON ((`md`.`t_id` = `mdry`.`t_sjid` ))
		LEFT JOIN `t_ryxx` `ry` ON ((`mdry`.`t_yhh` = `ry`.`t_yhh` ))
		) GROUP BY `md`.`t_id`
);
