
use zz;
insert into t_zzjgxx(t_id,t_jgmc,t_zzfwdq,t_zzfwdqjs,t_jglx,t_sjjg,
                           t_qcj,t_lxfs,t_szdz,t_cjr,t_zhxgr,t_jd,t_wd,t_zzfwdqid,t_ssoid,t_fwdqqcj)
select cast(t.code as UNSIGNED INTEGER) t_id,t.name t_jgmc,
       (select t_qhdm from t_xzqhxx where t_mc = '潼南区' limit 1) t_zzfwdq,
       '潼南区' t_zzfwdqjs,
       '04' t_jglx,
       0 t_sjjg,
       t.code AS t_qcj,
       '023-123456789' t_lxfs,
       '潼南区' t_szdz,
       1 t_cjr,
       1 t_zhxgr,
       0 t_jd,
       0 t_wd,
			 getAreaParent(500152000000) t_zzfwdqid,
			 id AS t_ssoid,
			 getAreaParent(500152000000) AS t_fwdqqcj
       from zzsso.t_organization t order by t.id limit 1;

insert into  t_ryxx(t_zjhm,t_csrq,t_cjr,t_zhxgr,t_wgzry,t_wgzrjg)
select t.id_card t_zjhm,CURRENT_DATE() t_csrq,1 t_cjr,1 t_zhxgr,1 t_wgzry,
       (select t_id from t_zzjgxx order by t_id limit 1) t_wgzrjg
       from zzsso.t_person t order by t.id limit 1;

insert into t_zzjgryxx(t_id,t_yhh,t_cjr,t_zhxgr,t_ssjg)
select t.id t_id,
       (select t_yhh from t_ryxx order by t_yhh limit 1) t_yhh,
       1 t_cjr,1 t_zhxgr,
	    (select t_id from t_zzjgxx order by t_id limit 1) t_ssjg
       from zzsso.t_person t order by t.id limit 1;