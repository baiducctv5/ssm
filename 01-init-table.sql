create database if not exists zz;
use zz;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_aj_xgry
-- ----------------------------
DROP TABLE IF EXISTS `t_aj_xgry`;
CREATE TABLE `t_aj_xgry`  (
  `t_ajid` bigint(20) NOT NULL COMMENT '案件id',
  `t_xgryid` bigint(20) NOT NULL COMMENT '相关人员id',
  `t_lx` tinyint(1) NOT NULL COMMENT '人员类型 0犯罪嫌疑人 1受害人',
  PRIMARY KEY (`t_ajid`, `t_xgryid`, `t_lx`) USING BTREE
) ENGINE = InnoDB COMMENT = '案件与相关人员关联关系表';

-- ----------------------------
-- Table structure for t_ajjbxx
-- ----------------------------
DROP TABLE IF EXISTS `t_ajjbxx`;
CREATE TABLE `t_ajjbxx`  (
  `t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_ajbh` varchar(50) NOT NULL COMMENT '案件编号',
  `t_ajmc` varchar(100) NOT NULL COMMENT '案件名称',
  `t_ssd` bigint(20) NOT NULL COMMENT '所属地区（行政区划信息表ID）',
  `t_ssdjs` varchar(100) NULL DEFAULT NULL COMMENT '所属地区解释',
  `t_ssdlj` varchar(100) NULL DEFAULT NULL COMMENT '所属地区路径1,2,3',
  `t_ssdxz` varchar(255) NULL DEFAULT NULL COMMENT '所属地区详址 广东省,深圳市,南山区,xx街道,xx巷',
  `t_ajxz` varchar(2) NOT NULL COMMENT '案件性质',
  `t_ajxzjs` varchar(20) NOT NULL COMMENT '案件性质解释',
  `t_ajfsrq` date NOT NULL COMMENT '案件发生日期',
  `t_ajparq` date NULL DEFAULT NULL COMMENT '案件破案日期',
  `t_zars` int(6) NULL DEFAULT NULL COMMENT '作案人数',
  `t_ztrs` int(6) NULL DEFAULT NULL COMMENT '在逃人数',
  `t_zbrs` int(6) NULL DEFAULT NULL COMMENT '抓捕人数',
  `t_aflx` bigint(20) NOT NULL COMMENT '案发路线(路线信息表ID)',
  `t_badw` varchar(255) NOT NULL COMMENT '办案单位',
  `t_ajzpqk` varchar(4000) NULL DEFAULT NULL COMMENT '案件侦破情况',
  `t_fzxyrs` int(6) NULL DEFAULT 0 COMMENT '犯罪嫌疑人数',
  `t_shrs` int(6) NULL DEFAULT 0 COMMENT '受害人数',
  `t_sfma` tinyint(1) NULL DEFAULT 0 COMMENT '是否命案',
  `t_jd` double(11, 8) NULL DEFAULT NULL COMMENT '经度',
  `t_wd` double(10, 8) NULL DEFAULT NULL COMMENT '纬度',
  `t_cjr` bigint(20) NOT NULL COMMENT '创建人',
  `t_cjsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `INDEX_AJXZ`(`t_ajxz`) USING BTREE COMMENT '案件性质',
  INDEX `INDEX_SSDLJ` (`t_ssdlj`) USING BTREE COMMENT '所属地路径',
  INDEX `INDEX_FSRQ` (`t_ajfsrq`) USING BTREE COMMENT '案件发生日期',
  INDEX `INDEX_PARQ` (`t_ajparq`) USING BTREE COMMENT '案件破案日期'
) ENGINE = InnoDB COMMENT = '案件基本信息表';

-- ----------------------------
-- Table structure for t_azbry
-- ----------------------------
DROP TABLE IF EXISTS `t_azbry`;
CREATE TABLE `t_azbry`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_grtj` varchar(2) NULL DEFAULT NULL COMMENT '感染途径',
  `t_grtjjs` varchar(26) NULL DEFAULT NULL COMMENT '感染途径解释',
  `t_sfywffzs` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有违法犯罪史',
  `t_wffzqk` varchar(1024) NULL DEFAULT NULL COMMENT '违法犯罪情况',
  `t_ajlb` varchar(50) NULL DEFAULT '0' COMMENT '案件类别',
  `t_ajlbjs` varchar(100) NULL DEFAULT NULL COMMENT '案件类别解释',
  `t_gzlx` varchar(2) NULL DEFAULT NULL COMMENT '关注类型',
  `t_gzlxjs` varchar(12) NULL DEFAULT NULL COMMENT '关注类型解释',
  `t_xczfrq` date NULL DEFAULT NULL COMMENT '下次走访日期',
  `t_bfrxm` varchar(50) NULL DEFAULT NULL COMMENT '帮扶人姓名',
  `t_bfrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '帮扶人联系方式',
  `t_bfqk` varchar(1024) NULL DEFAULT NULL COMMENT '帮扶情况',
  `t_szqk` varchar(2) NULL DEFAULT NULL COMMENT '收治情况',
  `t_szqkjs` varchar(20) NULL DEFAULT NULL COMMENT '收治情况解释',
  `t_szjgmc` varchar(100) NULL DEFAULT NULL COMMENT '收治机构名称',
  `t_zt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `t_djr` bigint(20) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfyx` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `t_ydzfrq` date NULL DEFAULT NULL COMMENT '原定走访日期',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE,
  INDEX `index_zhxgsj`(`t_zhxgsj`) USING BTREE,
  INDEX `index_zt`(`t_zt`) USING BTREE
) ENGINE = InnoDB  COMMENT = '艾滋病人员信息';

-- ----------------------------
-- Table structure for t_dbhf
-- ----------------------------
DROP TABLE IF EXISTS `t_dbhf`;
CREATE TABLE `t_dbhf`  (
  `t_id` int(11) NOT NULL COMMENT '主键',
  `t_dbdw` varchar(100) NOT NULL COMMENT '督办单位',
  `t_dbqqr` int(11) NOT NULL COMMENT '督办请求人',
  `t_dbsdsj` date NOT NULL COMMENT '督办送达时间',
  `t_dbdf` varchar(255) NULL DEFAULT '0' COMMENT '督办答复',
  `t_dsrfkmycd` int(11) NULL DEFAULT NULL COMMENT '当事人反馈满意程度',
  `t_dsrfk` varchar(255) NULL DEFAULT NULL COMMENT '当事人反馈',
  `t_kpyj` varchar(255) NULL DEFAULT NULL COMMENT '考评意见',
  `t_kpsj` date NULL DEFAULT NULL COMMENT '考评时间',
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB COMMENT = '督办回访信息';

-- ----------------------------
-- Table structure for t_fgyzjjzz
-- ----------------------------
DROP TABLE IF EXISTS `t_fgyzjjzz`;
CREATE TABLE `t_fgyzjjzz`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，id',
  `t_zrwgjg` bigint(20) NULL DEFAULT NULL COMMENT '责任网格机构id',
  `t_zrwgr` bigint(20) NULL DEFAULT NULL COMMENT '责任网格人id',
  `t_zbfzrxm` varchar(50) NULL DEFAULT NULL COMMENT '治保负责人姓名',
  `t_zbfzrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '治保负责人联系方式',
  `t_sfwhqy` tinyint(1) NULL DEFAULT NULL COMMENT '是否危化企业',
  `t_aqyhlx` varchar(2) NULL DEFAULT NULL COMMENT '安全隐患类型',
  `t_aqyhlxjs` varchar(12) NULL DEFAULT NULL COMMENT '安全隐患类型解释',
  `t_gzcd` varchar(2) NULL DEFAULT NULL COMMENT '关注程度',
  `t_gzcdjs` varchar(8) NULL DEFAULT NULL COMMENT '关注程度解释',
  `t_cjr` int(11) NOT NULL COMMENT '创建人',
  `t_cjsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `t_zhxgr` int(11) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfjbjlzgdzztj` tinyint(1) NULL DEFAULT NULL COMMENT '是否具备建立中共党组织条件',
  `t_sfyzgdzz` tinyint(1) NULL DEFAULT NULL COMMENT '是否有中共党组织',
  `t_zgdysl` int(6) NULL COMMENT '中共党员数量',
  `t_sfygqtzz` tinyint(1) NULL DEFAULT NULL COMMENT '是否有共青团组织',
  `t_gqttysl` int(6) NULL COMMENT '共青团团员数量',
  `t_sfygh` tinyint(1) NULL DEFAULT NULL COMMENT '是否有公会',
  `t_ghhysl` int(6) NULL COMMENT '公会会员数量',
  `t_sfyflzz` tinyint(1) NULL DEFAULT NULL COMMENT '是否有妇联组织',
  `t_fvsl` int(6) NULL COMMENT '妇女数量',
  `t_qyqk` int(11) NULL DEFAULT NULL COMMENT '企业情况(企业基本信息表ID)',
  `t_fddbrzjdm` varchar(3) DEFAULT NULL COMMENT '法定代表人证件代码',
  `t_fddbrzjdmjs` varchar(50) DEFAULT NULL COMMENT '法定代表人证件代码解释',
  `t_fddbrzjhm` varchar(50) DEFAULT NULL COMMENT '法定代表人证件号码',
  `t_fddbrxm` varchar(80) NULL DEFAULT NULL COMMENT '法定代表人姓名',
  `t_fddbrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '法定代表人联系方式',
  `t_qyssd` bigint(20) NULL DEFAULT NULL COMMENT '企业所属地区（行政区划信息表ID）',
  `t_ssdlj` varchar(100) NULL DEFAULT NULL COMMENT '所属地区路径1,2,3',
  `t_ssdxz` varchar(255) NULL DEFAULT NULL COMMENT '所属地区详址 广东省,深圳市,南山区,xx街道,xx巷',
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB  COMMENT = '非公有制经济组织';

-- ----------------------------
-- Table structure for t_fwjbxx
-- ----------------------------
DROP TABLE IF EXISTS `t_fwjbxx`;
CREATE TABLE `t_fwjbxx`  (
  `t_fwbm` varchar(50) NOT NULL COMMENT '房屋编号',
  `t_fwszd` bigint(12) NOT NULL COMMENT '房屋所在地（行政区划信息表ID）',
  `t_fwszdjs` varchar(100) NOT NULL COMMENT '房屋所在地解释',
  `t_fwszdqlj` varchar(64) NULL DEFAULT NULL COMMENT '房屋所在地全路径',
  `t_fwxz` varchar(200) NULL DEFAULT NULL COMMENT '房屋详址',
  `t_jzyt` varchar(2) NULL DEFAULT NULL COMMENT '建筑用途',
  `t_jzytjs` varchar(20) NULL DEFAULT NULL COMMENT '建筑用途解释',
  `t_jzmj` varchar(10) NULL DEFAULT NULL COMMENT '建筑面积',
  `t_fwyt` varchar(2) NULL DEFAULT NULL COMMENT '房屋用途',
  `t_fwytjs` varchar(20) NULL DEFAULT NULL COMMENT '房屋用途解释',
  `t_yhlx` varchar(2) NULL DEFAULT NULL COMMENT '隐患类型',
  `t_yhlsjs` varchar(20) NULL DEFAULT NULL COMMENT '隐患类型解释',
  `t_zrwgjg` bigint(20) NOT NULL COMMENT '责任网格机构ID',
  `t_zrwgy` bigint(20) NOT NULL COMMENT '责任网格员ID',
  `t_fzzjlx` varchar(3) NULL DEFAULT NULL COMMENT '房主证件类型',
  `t_fzzjlxjs` varchar(50) NULL DEFAULT NULL COMMENT '房主证件类型解释',
  `t_fzzjhm` varchar(50) NULL DEFAULT NULL COMMENT '房主证件号码',
  `t_fzxm` varchar(50) NULL DEFAULT NULL COMMENT '房主姓名',
  `t_fzlxfs` varchar(50) NULL DEFAULT NULL COMMENT '房主联系方式',
  `t_fzxzd` bigint(12) NULL DEFAULT NULL COMMENT '房主现住地（行政区划信息表ID）',
  `t_fzxzdjs` varchar(100) NULL DEFAULT NULL COMMENT '房主现住地解释',
  `t_fzszdqlj` varchar(64) NULL DEFAULT NULL COMMENT '房主所在地全路径',
  `t_fzxzmxz` varchar(200) NULL DEFAULT NULL COMMENT '房主现住门（楼）详址',
  `t_jd` double(11, 8) NULL DEFAULT NULL COMMENT '经度',
  `t_wd` double(10, 8) NULL DEFAULT NULL COMMENT '纬度',
  `t_cjr` bigint(20) NOT NULL COMMENT '创建人',
  `t_cjsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfyx` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`t_fwbm`) USING BTREE,
  INDEX `index_fwyt`(`t_fwyt`) USING BTREE,
  INDEX `index_jzyt`(`t_jzyt`) USING BTREE,
  INDEX `index_zhxgsj`(`t_zhxgsj`) USING BTREE,
  INDEX `index_zrwgjg`(`t_zrwgjg`) USING BTREE,
  INDEX `index_fwszd`(`t_fwszd`) USING BTREE,
  INDEX `index_fzzjhm`(`t_fzzjhm`) USING BTREE,
  INDEX `index_wgzry`(`t_zrwgy`) USING BTREE
) ENGINE = InnoDB COMMENT = '房屋基本信息';

-- ----------------------------
-- Table structure for t_fwsyrxx
-- ----------------------------
DROP TABLE IF EXISTS `t_fwsyrxx`;
CREATE TABLE `t_fwsyrxx`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_fwbh` varchar(50) NOT NULL COMMENT '房屋编号(房屋基本信息表编号)',
  `t_xm` varchar(50) NOT NULL COMMENT '姓名',
  `t_zjlx` varchar(3) NOT NULL COMMENT '证件类型',
  `t_zjlxjs` varchar(20) NULL DEFAULT NULL COMMENT '证件类型解释',
  `t_zjhm` varchar(50) NOT NULL COMMENT '证件号码',
  `t_ydarygx` varchar(2) NOT NULL COMMENT '与档案人员关系',
  `t_ydarygxjs` varchar(30) NULL DEFAULT NULL COMMENT '与档案人员关系解释',
  `lxfs` varchar(50) NOT NULL COMMENT '联系方式',
  `t_djr` bigint(20) NULL DEFAULT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_fwbh`(`t_fwbh`) USING BTREE
) ENGINE = InnoDB  COMMENT = '房屋使用人信息';

-- ----------------------------
-- Table structure for t_hjqkjl
-- ----------------------------
DROP TABLE IF EXISTS `t_hjqkjl`;
CREATE TABLE `t_hjqkjl`  (
  `t_hjjl_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '化解记录id',
  `t_sjid` bigint(20) NOT NULL COMMENT '事件id',
  `t_sjzt` tinyint(1) NOT NULL COMMENT '事件状态 0化解中 1成功 2失败',
  `t_hjfs` varchar(4) NOT NULL COMMENT '化解方式',
  `t_hjfsjs` varchar(30) NOT NULL COMMENT '化解方式解释',
  `t_hjqk` varchar(4500) NOT NULL COMMENT '化解情况',
  `t_zrwgy` bigint(20) NOT NULL COMMENT '责任网格员id',
  `t_zrwgyxm` varchar(50) NOT NULL COMMENT '责任网格员姓名',
  `t_zrwgylxfs` varchar(50) NULL DEFAULT NULL COMMENT '责任网格员联系方式',
  `t_zrwgdw` bigint(20) NOT NULL COMMENT '责任网格单位',
  `t_zrwgdwmc` varchar(255) NOT NULL COMMENT '责任网格单位名称',
  `t_hjsj` datetime(0) NOT NULL COMMENT '化解时间',
  PRIMARY KEY (`t_hjjl_id`) USING BTREE
) ENGINE = InnoDB  COMMENT = '化解情况记录表';

-- ----------------------------
-- Table structure for t_hjryxx
-- ----------------------------
DROP TABLE IF EXISTS `t_hjryxx`;
CREATE TABLE `t_hjryxx`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_rhyzqk` varchar(2) NULL DEFAULT NULL COMMENT '人户一致情况',
  `t_hm` varchar(50) NULL DEFAULT NULL COMMENT '户号',
  `t_yhzgx` varchar(2) NULL DEFAULT NULL COMMENT '与户主关系',
  `t_yhzgxjs` varchar(20) NULL DEFAULT NULL COMMENT '与户主关系解释',
  `t_hzxm` varchar(50) NULL DEFAULT NULL COMMENT '户主姓名',
  `t_hzsfzhm` varchar(18) NULL DEFAULT NULL COMMENT '户主身份证号码',
  `t_hzlxfs` varchar(50) NULL DEFAULT NULL COMMENT '户主联系方式',
  `t_djr` bigint(20) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfyx` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_sfyx`(`t_sfyx`) USING BTREE,
  INDEX `index_t_zhxgsj`(`t_zhxgsj`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE
) ENGINE = InnoDB  COMMENT = '户籍人员信息表';

-- ----------------------------
-- Table structure for t_hlhxjwd
-- ----------------------------
DROP TABLE IF EXISTS `t_hlhxjwd`;
CREATE TABLE `t_hlhxjwd`  (
  `t_lxid` int(11) NOT NULL COMMENT '路线id',
  `t_jd` double(11, 8) NOT NULL COMMENT '经度',
  `t_wd` double(10, 8) NOT NULL COMMENT '纬度',
  `t_px` tinyint(2) NOT NULL COMMENT '序号',
  PRIMARY KEY (`t_lxid`, `t_jd`, `t_wd`) USING BTREE
) ENGINE = InnoDB COMMENT = '护路护线经纬度表';

-- ----------------------------
-- Table structure for t_jdwlaqgl
-- ----------------------------
DROP TABLE IF EXISTS `t_jdwlaqgl`;
CREATE TABLE `t_jdwlaqgl`  (
  `t_jd_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_ssd` bigint(20) NULL DEFAULT NULL COMMENT '所属地（行政区划信息表ID）',
  `t_ssdjs` varchar(100) NULL DEFAULT NULL COMMENT '所属地解释',
  `t_ssdlj` varchar(100) NULL DEFAULT NULL COMMENT '所属地区路径1,2,3',
  `t_ssdxz` varchar(150) NULL DEFAULT NULL COMMENT '所属地区详址 广东省,深圳市,南山区,xx街道,xx巷',
  `t_djzclx` varchar(3) NULL DEFAULT '0' COMMENT '登记注册类型',
  `t_djzclxjs` varchar(16) NULL DEFAULT NULL COMMENT '登记注册类型解释',
  `t_kgqk` varchar(3) NULL DEFAULT NULL COMMENT '控股情况',
  `t_kgqkjs` varchar(12) NULL DEFAULT NULL COMMENT '控股情况解释',
  `t_zrwgjg` bigint(20) NULL DEFAULT NULL COMMENT '责任网格机构id',
  `t_zrwgy` bigint(20) NULL DEFAULT NULL COMMENT '责任网格人id',
  `t_fzrxm` varchar(50) NULL DEFAULT NULL COMMENT '负责人姓名',
  `t_fzrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '责任人联系方式',
  `t_jyfw` varchar(2) NULL DEFAULT NULL COMMENT '经营范围',
  `t_jyfwjs` varchar(12) NULL DEFAULT NULL COMMENT '经营范围解释',
  `t_jksxjsl` int(5) NULL DEFAULT 0 COMMENT '监控摄像机数量',
  `t_xgjsl` int(4) NULL DEFAULT 0 COMMENT 'X光机数量',
  `t_fwpp` varchar(50) NULL DEFAULT NULL COMMENT '服务品牌',
  `t_sflsxyshfx` tinyint(1) NULL DEFAULT 0 COMMENT '是否100%先验视后封箱',
  `t_sflsjdsmz` tinyint(1) NULL DEFAULT 0 COMMENT '是否落实100%寄递实名制',
  `t_sflsxgjaj` tinyint(1) NULL DEFAULT 0 COMMENT '是否落实100%X光机安检',
  `t_cjr` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `t_cjsj` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `t_zhxgr` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_qyqk` int(11) NOT NULL COMMENT '企业情况(企业基本信息表ID)',
  PRIMARY KEY (`t_jd_id`) USING BTREE,
  UNIQUE INDEX `INDEX_QY_ID`(`t_qyqk`) USING BTREE COMMENT '企业id唯一索引',
  INDEX `INDEX_DJZCLX`(`t_djzclx`) USING BTREE COMMENT '登记注册类型索引',
  INDEX `INDEX_JYFW`(`t_jyfw`) USING BTREE COMMENT '经营范围索引'
) ENGINE = InnoDB  COMMENT = '寄递物流安全管理信息';

-- ----------------------------
-- Table structure for t_jfsjnbqqjl
-- ----------------------------
DROP TABLE IF EXISTS `t_jfsjnbqqjl`;
CREATE TABLE `t_jfsjnbqqjl`  (
  `t_qqjlid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '请求记录id',
  `t_sjid` bigint(20) NOT NULL COMMENT '事件ID（纠纷事件表ID）',
  `t_qqlx` tinyint(1) NOT NULL COMMENT '请求类型(1-业务分流 2-重新分配)',
  `t_bgqzrwgdwid` bigint(20) NULL DEFAULT NULL COMMENT '变更前责任网格单位id',
  `t_bghzrwgdwid` bigint(20) NULL DEFAULT NULL COMMENT '变更后责任网格单位id',
  `t_bgqzrwgdwmc` varchar(255) NULL DEFAULT NULL COMMENT '变更前责任网格单位名称',
  `t_bghzrwgdwmc` varchar(255) NULL DEFAULT NULL COMMENT '变更后责任网格单位名称',
  `t_bgqzrwgyid` bigint(20) NULL DEFAULT NULL COMMENT '变更前责任网格员id',
  `t_bghzrwgyid` bigint(20) NULL DEFAULT NULL COMMENT '变更后责任网格员id',
  `t_bgqzrwgyxm` varchar(255) NULL DEFAULT NULL COMMENT '变更前责任网格员姓名',
  `t_bghzrwgyxm` varchar(255) NULL DEFAULT NULL COMMENT '变更后责任网格员姓名',
  `t_qqyy` varchar(100) NULL DEFAULT '0' COMMENT '请求原因',
  `t_sqr` bigint(20) NOT NULL COMMENT '申请人',
  `t_sqrxm` varchar(255) NULL DEFAULT NULL COMMENT '申请人姓名',
  `t_sqrsj` datetime(0) NOT NULL COMMENT '申请时间',
  `t_spr` bigint(20) NULL DEFAULT NULL COMMENT '审批人',
  `t_sprxm` varchar(255) NULL DEFAULT NULL COMMENT '审批人姓名',
  `t_sprsj` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `t_zt` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0待审核 1通过 2拒绝',
  PRIMARY KEY (`t_qqjlid`) USING BTREE
) ENGINE = InnoDB  COMMENT = '纠纷事件内部请求记录表';

-- ----------------------------
-- Table structure for t_jhrb
-- ----------------------------
DROP TABLE IF EXISTS `t_jhrb`;
CREATE TABLE `t_jhrb`  (
  `t_yhh` bigint(11) NOT NULL COMMENT '用户号(人员信息表ID)',
  `t_jhryhh` bigint(11) NOT NULL COMMENT '监护人用户号',
  `t_ybdayhgx` varchar(11) NULL DEFAULT NULL COMMENT '与本档案用户关系',
  `t_ybdayhgxjs` varchar(11) NULL DEFAULT NULL COMMENT '与本档案用户关系解释',
  `t_djr` bigint(11) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  INDEX `index_yhh`(`t_yhh`) USING BTREE
) ENGINE = InnoDB COMMENT = '监护人表';

-- ----------------------------
-- Table structure for t_jszahz
-- ----------------------------
DROP TABLE IF EXISTS `t_jszahz`;
CREATE TABLE `t_jszahz`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_jtjjqk` varchar(2) NULL DEFAULT NULL COMMENT '家庭经济情况',
  `t_jtjjqkjs` varchar(16) NULL DEFAULT NULL COMMENT '家庭经济情况解释',
  `t_sfnrdb` tinyint(1) NULL DEFAULT 0 COMMENT '是否纳入低保',
  `t_cfbrq` date NULL DEFAULT NULL COMMENT '初发病日期',
  `t_mqzdlx` varchar(2) NULL DEFAULT NULL COMMENT '目前诊断类型',
  `t_mqzdlxjs` varchar(40) NULL DEFAULT NULL COMMENT '目前诊断类型解释',
  `t_ywzszhs` tinyint(1) NOT NULL DEFAULT 0 COMMENT '有无肇事肇祸史',
  `t_zszhcs` int(6) NULL DEFAULT NULL COMMENT '肇事肇祸次数',
  `t_sczszhrq` date NULL DEFAULT NULL COMMENT '上次肇事肇祸日期',
  `t_mqwxxpgdj` varchar(2) NULL DEFAULT NULL COMMENT '目前危险性评估等级',
  `t_mqwxxpgdjjs` varchar(8) NULL DEFAULT NULL COMMENT '目前危险性评估等级解释',
  `t_xczfrq` date NULL DEFAULT NULL COMMENT '下次走访日期',
  `t_zlqk` varchar(2) NULL DEFAULT NULL COMMENT '治疗情况',
  `t_zlqkjs` varchar(30) NULL DEFAULT NULL COMMENT '治疗情况解释',
  `t_zlyymc` varchar(100) NULL DEFAULT NULL COMMENT '治疗医院名称',
  `t_sszyylyy` varchar(30) NULL DEFAULT NULL COMMENT '实施住院医疗原因（可多选，用|分隔）',
  `t_sszyylyyjs` varchar(200) NULL DEFAULT NULL COMMENT '实施治疗医院原因解释',
  `t_jskfxljgmc` varchar(100) NULL DEFAULT NULL COMMENT '接收康复训练机构名称',
  `t_cyglry` varchar(20) NULL DEFAULT NULL COMMENT '参与管理人员（可多选，用|分隔）',
  `t_cyglryjs` varchar(100) NULL DEFAULT NULL COMMENT '参与管理人员解释（可多选，用|分隔）',
  `t_bfqk` varchar(20) NULL DEFAULT NULL COMMENT '帮扶情况（可多选，用|分隔）',
  `t_bfqkjs` varchar(255) NULL DEFAULT NULL COMMENT '帮扶情况解释（可多选，用|分隔）',
  `t_zt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `t_djr` bigint(20) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfyx` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_mqzdlx`(`t_mqzdlx`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE,
  INDEX `index_zhxgsj`(`t_zhxgsj`) USING BTREE,
  INDEX `index_zt`(`t_zt`) USING BTREE
) ENGINE = InnoDB  COMMENT = '精神障碍患者信息';

-- ----------------------------
-- Table structure for t_jszahzzf
-- ----------------------------
DROP TABLE IF EXISTS `t_jszahzzf`;
CREATE TABLE `t_jszahzzf`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_jtjjqk` varchar(2) NULL DEFAULT NULL COMMENT '家庭经济情况',
  `t_jtjjqkjs` varchar(16) NULL DEFAULT NULL COMMENT '家庭经济情况解释',
  `t_sfnrdb` tinyint(1) NULL DEFAULT 0 COMMENT '是否纳入低保',
  `t_cfbrq` date NULL DEFAULT NULL COMMENT '初发病日期',
  `t_mqzdlx` varchar(2) NULL DEFAULT NULL COMMENT '目前诊断类型',
  `t_mqzdlxjs` varchar(40) NULL DEFAULT NULL COMMENT '目前诊断类型解释',
  `t_ywzszhs` tinyint(1) NOT NULL DEFAULT 0 COMMENT '有无肇事肇祸史',
  `t_zszhcs` int(6) NULL DEFAULT NULL COMMENT '肇事肇祸次数',
  `t_sczszhrq` date NULL DEFAULT NULL COMMENT '上次肇事肇祸日期',
  `t_mqwxxpgdj` varchar(2) NULL DEFAULT NULL COMMENT '目前危险性评估等级',
  `t_mqwxxpgdjjs` varchar(8) NULL DEFAULT NULL COMMENT '目前危险性评估等级解释',
  `t_ydzfrq` date NULL DEFAULT NULL COMMENT '原定走访日期',
  `t_xczfrq` date NULL DEFAULT NULL COMMENT '下次走访日期',
  `t_zlqk` varchar(2) NULL DEFAULT NULL COMMENT '治疗情况',
  `t_zlqkjs` varchar(30) NULL DEFAULT NULL COMMENT '治疗情况解释',
  `t_zlyymc` varchar(100) NULL DEFAULT NULL COMMENT '治疗医院名称',
  `t_sszyylyy` varchar(30) NULL DEFAULT NULL COMMENT '实施住院医疗原因（可多选，用|分隔）',
  `t_sszyylyyjs` varchar(200) NULL DEFAULT NULL COMMENT '实施治疗医院原因解释',
  `t_jskfxljgmc` varchar(100) NULL DEFAULT NULL COMMENT '接收康复训练机构名称',
  `t_cyglry` varchar(20) NULL DEFAULT NULL COMMENT '参与管理人员（可多选，用|分隔）',
  `t_cyglryjs` varchar(100) NULL DEFAULT NULL COMMENT '参与管理人员解释（可多选，用|分隔）',
  `t_bfqk` varchar(20) NULL DEFAULT NULL COMMENT '帮扶情况（可多选，用|分隔）',
  `t_bfqkjs` varchar(255) NULL DEFAULT NULL COMMENT '帮扶情况解释（可多选，|分隔）',
  `t_djr` bigint(20) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE,
  INDEX `index_zhxgsj`(`t_zhxgsj`) USING BTREE
) ENGINE = InnoDB  COMMENT = '精神障碍患者走访表';

-- ----------------------------
-- Table structure for t_jtcyb
-- ----------------------------
DROP TABLE IF EXISTS `t_jtcyb`;
CREATE TABLE `t_jtcyb`  (
  `t_dayh` bigint(20) NOT NULL COMMENT '档案用户（人员信息表ID）',
  `t_cyyh` bigint(20) NOT NULL COMMENT '成员用户（人员信息表ID）',
  `t_ybdarygx` varchar(2) NOT NULL COMMENT '与本档案人员关系',
  `t_ybdarygxjs` varchar(20) NULL DEFAULT NULL COMMENT '与本档案人员关系解释',
  `t_cyxxgzdd` varchar(200) NULL DEFAULT NULL COMMENT '成员详细工作地址',
  `t_djry` bigint(20) NULL DEFAULT NULL COMMENT '登记人员',
  `t_djsj` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  INDEX `index_cyyh`(`t_cyyh`) USING BTREE,
  INDEX `index_dayh`(`t_dayh`) USING BTREE
) ENGINE = InnoDB COMMENT = '家庭成员表';

-- ----------------------------
-- Table structure for t_jwryxx
-- ----------------------------
DROP TABLE IF EXISTS `t_jwryxx`;
CREATE TABLE `t_jwryxx`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_wwx` varchar(40) NOT NULL COMMENT '外文姓',
  `t_wwm` varchar(40) NOT NULL COMMENT '外文名',
  `t_lhmd` varchar(2) NOT NULL COMMENT '来华目的',
  `t_lhmdjs` varchar(10) NOT NULL COMMENT '来华目的解释',
  `t_ddrq` date NOT NULL COMMENT '抵达日期',
  `t_yjlkrq` date NOT NULL COMMENT '预计离开日期',
  `t_sfzdgzry` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否重点关注人员',
  `t_djr` bigint(20) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfyx` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_lhmd`(`t_lhmd`) USING BTREE,
  INDEX `index_sfzdgzry`(`t_sfzdgzry`) USING BTREE,
  INDEX `index_wmmandwwx`(`t_wwm`, `t_wwx`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE,
  INDEX `index_zhxgsj`(`t_zhxgsj`) USING BTREE
) ENGINE = InnoDB  COMMENT = '境外人员信息';

-- ----------------------------
-- Table structure for t_ldryxx
-- ----------------------------
DROP TABLE IF EXISTS `t_ldryxx`;
CREATE TABLE `t_ldryxx`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_bzlx` varchar(2) NULL DEFAULT NULL COMMENT '办证类型',
  `t_bzlxjs` varchar(10) NULL DEFAULT NULL COMMENT '办证类型解释',
  `t_zjhm` varchar(22) NULL DEFAULT NULL COMMENT '证件号码',
  `t_zjkssj` date NULL DEFAULT NULL COMMENT '证件开始时间',
  `t_zjsxsj` date NULL DEFAULT NULL COMMENT '证件失效时间',
  `t_zslb` varchar(2) NULL DEFAULT NULL COMMENT '住所类别',
  `t_zslbjs` varchar(16) NULL DEFAULT NULL COMMENT '住所类别解释',
  `t_lryy` varchar(2) NULL DEFAULT NULL COMMENT '流入原因',
  `t_lryyjs` varchar(10) NULL DEFAULT NULL COMMENT '流入原因解释',
  `t_sfzdgzry` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否重点关注人员',
  `t_djr` bigint(20) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfyx` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_sfyx`(`t_sfyx`) USING BTREE,
  INDEX `index_t_zhxgsj`(`t_zhxgsj`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE
) ENGINE = InnoDB  COMMENT = '流动人员信息';

-- ----------------------------
-- Table structure for t_ldzrz
-- ----------------------------
DROP TABLE IF EXISTS `t_ldzrz`;
CREATE TABLE `t_ldzrz`  (
  `t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，ID',
  `t_bssdq` bigint(12) NOT NULL COMMENT '被实施地区（行政区划信息表ID）',
  `t_bssdqjs` varchar(100) DEFAULT NULL COMMENT '被实施地区解释',
  `t_zrzzjg` bigint(20) NOT NULL COMMENT '责任综治机构(组织机构信息表ID)',
  `t_ssztmc` varchar(100) NOT NULL COMMENT '实施主体名称',
  `t_zczl` varchar(2) NOT NULL COMMENT '政策总类',
  `t_zczljs` varchar(16) DEFAULT NULL COMMENT '政策总类解释',
  `t_cjr` bigint(20) NOT NULL COMMENT '创建人',
  `t_cjsj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `t_bssdqid` varchar(64) NOT NULL COMMENT '被实施地区id列表',
  `t_sfsc` int(11) DEFAULT '0' COMMENT '1-删除',
  `t_fwdqqcj` varchar(255) DEFAULT NULL COMMENT '被实施地区全层级',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='综治领导责任制信息';
-- ----------------------------
-- Table structure for t_lsryxx
-- ----------------------------
DROP TABLE IF EXISTS `t_lsryxx`;
CREATE TABLE `t_lsryxx`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_rhyzqk` varchar(2) NULL DEFAULT NULL COMMENT '人户一致情况',
  `t_lsrylx` varchar(2) NULL DEFAULT NULL COMMENT '留守人员类型',
  `t_lsrylxjs` varchar(10) NULL DEFAULT NULL COMMENT '留守人员类型解释',
  `t_jkqk` varchar(2) NULL DEFAULT NULL COMMENT '健康情况',
  `t_jkqkjs` varchar(10) NULL DEFAULT NULL COMMENT '健康情况解释',
  `t_grnsr` varchar(8) NULL DEFAULT NULL COMMENT '个人年收入',
  `t_jtnsr` varchar(8) NULL DEFAULT NULL COMMENT '家庭年收入',
  `t_knhsq` varchar(1024) NULL DEFAULT NULL COMMENT '困难和诉求',
  `t_bfqk` varchar(1024) NULL DEFAULT NULL COMMENT '帮扶情况',
  `t_djr` bigint(20) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfyx` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_sfyx`(`t_sfyx`) USING BTREE,
  INDEX `index_t_zhxgsj`(`t_zhxgsj`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE
) ENGINE = InnoDB  COMMENT = '留守人员信息表';

-- ----------------------------
-- Table structure for t_lxjbxx
-- ----------------------------
DROP TABLE IF EXISTS `t_lxjbxx`;
CREATE TABLE `t_lxjbxx`  (
  `t_id` bigint ( 11 ) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `t_lxmc` varchar(100) NOT NULL COMMENT '路线名称',
  `t_lxlx` varchar(2) NULL DEFAULT NULL COMMENT '路线类型',
  `t_lxlxjs` varchar(16) NULL DEFAULT NULL COMMENT '路线类型解释',
  `t_lsdwmc` varchar(100) NOT NULL COMMENT '隶属单位名称',
  `t_lsdwlxfs` varchar(50) NULL DEFAULT NULL COMMENT '隶属单位联系方式',
  `t_lsdwfzr` varchar(50) NOT NULL COMMENT '隶属单位负责人',
  `t_lsdwfzrlxfs` varchar(50) NOT NULL COMMENT '隶属单位负责人联系方式',
  `t_lsdwxz` varchar(200) NULL DEFAULT NULL COMMENT '隶属单位详址',
  `t_zrwgjg` bigint(20) NULL DEFAULT NULL COMMENT '责任网格机构',
  `t_zrwgy` bigint(20) NULL DEFAULT NULL COMMENT '责任网格员',
  `t_gxdwmc` varchar(100) NULL DEFAULT NULL COMMENT '管辖单位名称',
  `t_gxdwlxfs` varchar(50) NULL DEFAULT NULL COMMENT '管辖单位联系方式',
  `t_gxdwxz` varchar(200) NULL DEFAULT NULL COMMENT '管辖单位详址',
  `t_fgzbfzr` varchar(50) NULL DEFAULT NULL COMMENT '分管质保负责人',
  `t_fgzbfzrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '分管质保负责人联系方式',
  `t_zayhdj` varchar(2) NULL DEFAULT NULL COMMENT '治安隐患等级',
  `t_zayhdjjs` varchar(8) NULL DEFAULT NULL COMMENT '治安隐患等级解释',
  `t_zayhjb` varchar(255) NULL DEFAULT NULL COMMENT '治安隐患情况',
  `t_cjr` bigint(20) NOT NULL COMMENT '创建人',
  `t_cjsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_lxssd` bigint(20) NULL DEFAULT NULL COMMENT '路线所属地区（行政区划信息表ID）',
  `t_ssdlj` varchar(100) NULL DEFAULT NULL COMMENT '所属地区路径1,2,3',
  `t_ssdxz` varchar(255) NULL DEFAULT NULL COMMENT '所属地区详址 广东省,深圳市,南山区,xx街道,xx巷',
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB  COMMENT = '路线基本信息';

-- ----------------------------
-- Table structure for t_mdjfsj_dsr
-- ----------------------------
DROP TABLE IF EXISTS `t_mdjfsj_dsr`;
CREATE TABLE `t_mdjfsj_dsr`  (
  `t_sjid` bigint(20) NOT NULL COMMENT '事件id',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号',
  PRIMARY KEY (`t_sjid`, `t_yhh`) USING BTREE
) ENGINE = InnoDB COMMENT = '矛盾纠纷当时人关联关系表';

-- ----------------------------
-- Table structure for t_mdjfsjxx
-- ----------------------------
DROP TABLE IF EXISTS `t_mdjfsjxx`;
CREATE TABLE `t_mdjfsjxx`  (
  `t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_sjmc` varchar(100) NOT NULL COMMENT '事件名称',
  `t_ssd` bigint(12) NOT NULL COMMENT '所属地（行政区划信息表ID）',
  `t_ssdjs` varchar(50) NOT NULL COMMENT '所属地解释',
  `t_ssdlj` varchar(100) NULL DEFAULT NULL COMMENT '所属地区路径1,2,3',
  `t_ssdxz` varchar(255) NULL DEFAULT NULL COMMENT '所属地区详址 广东省,深圳市,南山区,xx街道,xx巷',
  `t_fslx` int(11) NOT NULL COMMENT '发生路线（路线信息表ID）',
  `t_fslxjs` varchar(100) NULL DEFAULT NULL COMMENT '发生路线解释',
  `t_fsrq` date NOT NULL COMMENT '发生日期',
  `t_sjgm` varchar(2) NOT NULL COMMENT '事件规模',
  `t_sjgmjs` varchar(16) NULL DEFAULT NULL COMMENT '事件规模解释',
  `t_sjlb` varchar(8) NOT NULL COMMENT '事件类别',
  `t_sjlbjs` varchar(30) NULL DEFAULT NULL COMMENT '事件类别解释',
  `t_dsrsl` int(6) NOT NULL COMMENT '当事人数量',
  `t_zrwgdw` bigint(20) NOT NULL COMMENT '责任网格单位（机构队伍表ID）',
  `t_zrwgdwmc` varchar(255) NULL DEFAULT NULL COMMENT '责任网格单位名称',
  `t_zrwgy` bigint(20) NULL DEFAULT NULL COMMENT '责任网格员（人员信息表ID）',
  `t_zrwgyxm` varchar(255) NULL DEFAULT NULL COMMENT '责任网格员姓名',
  `t_zrwgylxfs` varchar(50) NULL DEFAULT NULL COMMENT '责任网格员联系方式',
  `t_sjzt` tinyint(1) NULL DEFAULT NULL COMMENT '事件状态(0化解中 1未分配网格员 2报告成功 3报告失败 4已归档)',
  `t_bjrq` datetime(0) NULL DEFAULT NULL COMMENT '办截日期',
  `t_hjsx` datetime(0) NULL DEFAULT NULL COMMENT '化解时限',
  `t_hjfs` varchar(4) NULL DEFAULT NULL COMMENT '化解方式',
  `t_hjfsjs` varchar(30) NULL DEFAULT NULL COMMENT '化解方式解释',
  `t_hjqk` varchar(4500) NULL DEFAULT NULL COMMENT '化解情况',
  `t_cjr` int(11) NOT NULL COMMENT '创建人',
  `t_cjsj` datetime(0) NOT NULL COMMENT '创建时间',
  `t_zhxgr` int(11) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` datetime(0) NOT NULL COMMENT '最后修改时间',
  `t_dsrfkmyd` tinyint(4) NULL DEFAULT NULL COMMENT '当事人反馈满意度',
  `t_dsrfk` varchar(255) NULL DEFAULT NULL COMMENT '当事人反馈',
  `t_zrwgjgyj` varchar(255) NULL DEFAULT NULL COMMENT '责任网格机构意见',
  `t_kpyj` varchar(255) NULL DEFAULT NULL COMMENT '考评意见',
  `t_kprq` datetime(0) NULL DEFAULT NULL COMMENT '考评日期',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `INDEX_SJGM`(`t_sjgm`) USING BTREE COMMENT '事件规模',
  INDEX `INDEX_SJZT`(`t_sjzt`) USING BTREE COMMENT '事件状态',
  INDEX `INDEX_FSRQ`(`t_fsrq`) USING BTREE COMMENT '发生日期',
  INDEX `INDEX_CJSJ`(`t_cjsj`) USING BTREE COMMENT '创建时间',
  INDEX `INDEX_ZRWGDW`(`t_zrwgdw`) USING BTREE COMMENT '责任网格单位'
) ENGINE = InnoDB  COMMENT = '矛盾纠纷事件信息';

-- ----------------------------
-- Table structure for t_qyjbxx
-- ----------------------------
DROP TABLE IF EXISTS `t_qyjbxx`;
CREATE TABLE `t_qyjbxx`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，id',
  `t_tyshxydm` varchar(18) NOT NULL COMMENT '统一社会信用代码',
  `t_qymc` varchar(100) NOT NULL COMMENT '企业名称',
  `t_qylb` varchar(2) NULL DEFAULT NULL COMMENT '企业类别',
  `t_qylbjs` varchar(16) NULL DEFAULT NULL COMMENT '企业类别解释',
  `t_qydz` varchar(200) NULL DEFAULT NULL COMMENT '企业地址',
  `t_qylxfs` varchar(50) NULL DEFAULT NULL COMMENT '企业联系方式',
  `t_qyygs` int(6) NULL DEFAULT NULL COMMENT '企业员工数',
  `t_zt` tinyint(1) NULL DEFAULT NULL COMMENT '企业状态 0正常 1待审批 2已注销',
  `t_jd` double(11, 8) NULL DEFAULT NULL COMMENT '经度',
  `t_wd` double(10, 8) NULL DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB  COMMENT = '企业基本信息表';

-- ----------------------------
-- Table structure for t_ryxx
-- ----------------------------
DROP TABLE IF EXISTS `t_ryxx`;
CREATE TABLE `t_ryxx`  (
  `t_yhh` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户号，主键',
  `t_zjlx` varchar(3) NOT NULL DEFAULT '111' COMMENT '证件类型',
  `t_zjlxjs` varchar(20) NOT NULL DEFAULT '居民身份证' COMMENT '证件类型解释',
  `t_zjhm` varchar(30) NOT NULL COMMENT '证件号码',
  `t_zjyxrq` date NULL DEFAULT NULL COMMENT '证件有效日期',
  `t_zjsxrq` date NULL DEFAULT NULL COMMENT '证件失效日期',
  `t_xm` varchar(50) NULL DEFAULT NULL COMMENT '姓名',
  `t_xmpyszm` varchar(50) NULL DEFAULT NULL COMMENT '姓名拼音首字母',
  `t_cym` varchar(50) NULL DEFAULT NULL COMMENT '曾用名',
  `t_cympyszm` varchar(50) NULL DEFAULT NULL COMMENT '曾用名拼音首字母',
  `t_xb` varchar(1) NOT NULL DEFAULT '1' COMMENT '性别',
  `t_xbjs` varchar(10) NULL DEFAULT '男性' COMMENT '性别解释',
  `t_csrq` date NOT NULL COMMENT '出生日期',
  `t_gj` varchar(3) NULL DEFAULT '156' COMMENT '国籍',
  `t_gjjs` varchar(50) NULL DEFAULT '中国' COMMENT '国籍解释',
  `t_mz` varchar(2) NULL DEFAULT NULL COMMENT '民族',
  `t_mzjs` varchar(50) NULL DEFAULT NULL COMMENT '民族解释',
  `t_jg` bigint(20) NULL DEFAULT NULL COMMENT '籍贯',
  `t_jgjs` varchar(50) NULL DEFAULT NULL COMMENT '籍贯解释',
  `t_jgqlj` varchar(64) NULL DEFAULT NULL COMMENT '籍贯全路径，用,分隔',
  `t_hyzk` varchar(2) NULL DEFAULT NULL COMMENT '婚姻状况',
  `t_hyzkjs` varchar(10) NULL DEFAULT NULL COMMENT '婚姻状况解释',
  `t_zzmm` varchar(2) NULL DEFAULT NULL COMMENT '政治面貌',
  `t_zzmmjs` varchar(16) NULL DEFAULT NULL COMMENT '政治面貌解释',
  `t_xl` varchar(2) NULL DEFAULT NULL COMMENT '学历',
  `t_xljs` varchar(20) NULL DEFAULT NULL COMMENT '学历解释',
  `t_zjxy` varchar(2) NULL DEFAULT NULL COMMENT '宗教信仰',
  `t_zjxyjs` varchar(16) NULL DEFAULT NULL COMMENT '宗教信仰解释',
  `t_zylx` varchar(6) NULL DEFAULT NULL COMMENT '职业类型',
  `t_zylxjs` varchar(50) NULL DEFAULT NULL COMMENT '职业类型解释',
  `t_zy` varchar(50) NULL DEFAULT NULL COMMENT '职业',
  `t_fwcs` varchar(100) NULL DEFAULT NULL COMMENT '服务场所',
  `t_lxfs` varchar(50) NULL DEFAULT NULL COMMENT '联系方式',
  `t_hjd` bigint(12) NULL DEFAULT NULL COMMENT '户籍地（行政区划信息表ID）',
  `t_hjdjs` varchar(100) NULL DEFAULT NULL COMMENT '户籍地解释',
  `t_hjdqlj` varchar(64) NULL DEFAULT NULL COMMENT '户籍地全路径，用,分隔',
  `t_hjmxz` varchar(80) NULL DEFAULT NULL COMMENT '户籍门（楼）详址',
  `t_xzd` bigint(12) NULL DEFAULT NULL COMMENT '现住地（行政区划信息表ID）',
  `t_xzdjs` varchar(100) NULL DEFAULT NULL COMMENT '现住地解释',
  `t_xzdqlj` varchar(64) NULL DEFAULT NULL COMMENT '现住地全路径，用,分隔',
  `t_xzmxz` varchar(80) NULL DEFAULT NULL COMMENT '现住门（楼）详址',
  `t_tx` bigint(20) DEFAULT NULL COMMENT '头像',
  `t_wgzrjg` bigint(20) NOT NULL COMMENT '网格责任机构ID（组织机构表ID）',
  `t_wgzry` bigint(20) NOT NULL COMMENT '网格责任员ID（人员信息表ID）',
  `t_xzfwbh` varchar(50) NULL DEFAULT NULL COMMENT '现住房屋编号（房租基本信息表ID）',
  `t_cjr` bigint(20) NOT NULL COMMENT '创建人',
  `t_cjsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`t_yhh`) USING BTREE,
  UNIQUE INDEX `unique_zjhm_zjlx`(`t_zjhm`, `t_zjlx`) USING BTREE,
  INDEX `index_gj`(`t_gj`) USING BTREE,
  INDEX `index_wgzrjg`(`t_wgzrjg`) USING BTREE,
  INDEX `index_xb`(`t_xb`) USING BTREE,
  INDEX `index_xm`(`t_xm`) USING BTREE,
  INDEX `index_xzfwbh`(`t_xzfwbh`) USING BTREE,
  INDEX `index_zjlx`(`t_zjlx`) USING BTREE,
  INDEX `index_hjd_xzd_jg`(`t_hjd`, `t_xzd`, `t_jg`),
  INDEX `index_tx` (`t_tx`) USING BTREE
) ENGINE = InnoDB  COMMENT = '人员信息表';

-- ----------------------------
-- Table structure for t_shzz
-- ----------------------------
DROP TABLE IF EXISTS `t_shzz`;
CREATE TABLE `t_shzz`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，id',
  `t_tyshxydm` varchar(18) NOT NULL COMMENT '统一社会信用代码',
  `t_djzh` varchar(32) NULL DEFAULT NULL COMMENT '登记证号',
  `t_djjgdm` varchar(50) NULL DEFAULT NULL COMMENT '登记机关代码',
  `t_pzrq` date NULL DEFAULT NULL COMMENT '批准日期',
  `t_sgzzmv` varchar(100) NOT NULL COMMENT '社会组织名称',
  `t_shzzlx` varchar(2) NULL DEFAULT NULL COMMENT '社会组织类型',
  `t_shzzlxjs` varchar(16) NULL DEFAULT NULL COMMENT '社会组织类型解释',
  `t_zjly` varchar(100) NULL DEFAULT NULL COMMENT '资金来源',
  `t_zt` tinyint(1) DEFAULT '0' COMMENT '状态',
  `t_zs` varchar(200) DEFAULT NULL COMMENT '住所',
  `t_qyygs` int(6) DEFAULT '0' COMMENT '企业员工数',
  `t_bgdz` varchar(200) NULL DEFAULT NULL COMMENT '办公地址',
  `t_zrwgjg` varchar(100) NULL DEFAULT NULL COMMENT '责任网格机构',
  `t_zrwgr` varchar(500) NULL DEFAULT NULL COMMENT '责任网格人',
  `t_frxm` varchar(80) NULL DEFAULT NULL COMMENT '法人姓名',
  `t_frlxfs` varchar(50) NULL DEFAULT NULL COMMENT '法人联系方式',
  `t_frzjlx` varchar(3) DEFAULT NULL COMMENT '法人证件类型',
  `t_frzjlxjs` varchar(50) DEFAULT NULL COMMENT '法人证件类型解释',
  `t_frzjhm` varchar(50) DEFAULT NULL COMMENT '法人证件号码',
  `t_fzrzjlx` varchar(3) DEFAULT NULL COMMENT '负责人证件类型',
  `t_fzrzjlxjs` varchar(50) DEFAULT NULL COMMENT '负责人证件类型解释',
  `t_fzrzjhm` varchar(50) DEFAULT NULL COMMENT '负责人证件号码',
  `t_fzrxm` varchar(80) NULL DEFAULT NULL COMMENT '负责人姓名',
  `t_fzrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '负责人联系方式',
  `t_zbfzrxm` varchar(50) NULL DEFAULT NULL COMMENT '治保负责人姓名',
  `t_zbfzrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '治保负责人联系方式',
  `t_gzcd` varchar(2) NULL DEFAULT NULL COMMENT '关注程度',
  `t_gzcdjs` varchar(8) NULL DEFAULT NULL COMMENT '关注程度解释',
  `t_sfywjbj` tinyint(1) NULL DEFAULT NULL COMMENT '是否有境外背景',
  `t_jd` double(11, 8) NULL DEFAULT NULL COMMENT '经度',
  `t_wd` double(10, 8) NULL DEFAULT NULL COMMENT '纬度',
  `t_cjr` int(11) NOT NULL COMMENT '创建人',
  `t_cjsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `t_zhxgr` int(11) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfjbjlzgdzztj` tinyint(1) NULL DEFAULT NULL COMMENT '是否具备建立中共党组织条件',
  `t_sfyzgdzz` tinyint(1) NULL DEFAULT NULL COMMENT '是否有中共党组织',
  `t_zgdysl` int(6) NULL DEFAULT NULL COMMENT '中共党员数量',
  `t_sfygqtzz` tinyint(1) NULL DEFAULT NULL COMMENT '是否有共青团组织',
  `t_gqttysl` int(6) NULL DEFAULT NULL COMMENT '共青团团员数量',
  `t_sfygh` tinyint(1) NULL DEFAULT NULL COMMENT '是否有工会',
  `t_ghhysl` int(6) NULL DEFAULT NULL COMMENT '公会会员数量',
  `t_sfyflzz` tinyint(1) NULL DEFAULT NULL COMMENT '是否有妇联组织',
  `t_fvsl` int(6) NULL DEFAULT NULL COMMENT '妇女数量',
  `t_qyssd` bigint(20) NULL DEFAULT NULL COMMENT '组织所属地区（行政区划信息表ID）',
  `t_ssdlj` varchar(100) NULL DEFAULT NULL COMMENT '所属地区路径1,2,3',
  `t_ssdxz` varchar(255) NULL DEFAULT NULL COMMENT '所属地区详址 广东省,深圳市,南山区,xx街道,xx巷',
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB  COMMENT = '社会组织';

-- ----------------------------
-- Table structure for t_sjzd
-- ----------------------------
DROP TABLE IF EXISTS `t_sjzd`;
CREATE TABLE `t_sjzd`  (
  `t_bmlx` varchar(50) NOT NULL COMMENT '编码类型',
  `t_bmz` varchar(8) NOT NULL COMMENT '编码值',
  `t_bmmc` varchar(100) NOT NULL COMMENT '编码名称',
  `t_ms` varchar(50) NULL DEFAULT NULL COMMENT '描述',
  `t_zt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1-使用 0 禁用',
  UNIQUE INDEX `unique_bmlx`(`t_bmlx`, `t_bmz`) USING BTREE
) ENGINE = InnoDB COMMENT = '数据字典表';

-- ----------------------------
-- Table structure for t_sqjzry
-- ----------------------------
DROP TABLE IF EXISTS `t_sqjzry`;
CREATE TABLE `t_sqjzry`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_sqjzrybh` varchar(16) NULL DEFAULT NULL COMMENT '社区矫正人员编号',
  `t_yjycs` varchar(100) NULL DEFAULT NULL COMMENT '原羁押场所',
  `t_jzlb` varchar(2) NULL DEFAULT NULL COMMENT '矫正类别',
  `t_jzlbjs` varchar(16) NULL DEFAULT NULL COMMENT '矫正类别解释',
  `t_ajlb` varchar(50) NULL DEFAULT NULL COMMENT '案件类别',
  `t_ajlbjs` varchar(255) NULL DEFAULT NULL COMMENT '案件类别解释',
  `t_jtzm` varchar(100) NULL DEFAULT NULL COMMENT '具体罪名',
  `t_jtzmjs` varchar(255) NULL DEFAULT NULL COMMENT '具体罪名解释',
  `t_ypxq` varchar(50) NULL DEFAULT NULL COMMENT '原判刑期',
  `t_ypxksrq` date NULL DEFAULT NULL COMMENT '原判刑开始日期',
  `t_ypxjsrq` date NULL DEFAULT NULL COMMENT '原判刑结束日期',
  `t_jzksrq` date NULL DEFAULT NULL COMMENT '矫正开始日期',
  `t_jzjsrq` date NULL DEFAULT NULL COMMENT '矫正结束日期',
  `t_jsfs` varchar(2) NULL DEFAULT NULL COMMENT '接收方式',
  `t_jsfsjs` varchar(10) NULL DEFAULT NULL COMMENT '接收方式解释',
  `t_ssqk` varchar(50) NULL DEFAULT NULL COMMENT '四史情况（多选，用|分隔）',
  `t_ssqkjs` varchar(100) NULL DEFAULT NULL COMMENT '四史情况解释',
  `t_sfgf` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否惯犯',
  `t_sasqk` varchar(50) NULL DEFAULT NULL COMMENT '三涉情况（多选，用|分隔）',
  `t_sasqkjs` varchar(100) NULL DEFAULT NULL COMMENT '三涉情况解释',
  `t_sfjljzxz` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否建立矫正小组',
  `t_jzxzcyzcqk` varchar(50) NULL DEFAULT NULL COMMENT '矫正小组成员组成情况（多选，用|分隔）',
  `t_jzxzcyzcqkjs` varchar(150) NULL DEFAULT NULL COMMENT '矫正小组成员组成情况解释',
  `t_jzjclx` varchar(2) NULL DEFAULT NULL COMMENT '矫正解除（终止）类型',
  `t_jzjclxjs` varchar(50) NULL DEFAULT NULL COMMENT '矫正解除类型解释',
  `t_sfytg` tinyint(1) NULL DEFAULT 0 COMMENT '是否有托管',
  `t_tgyy` varchar(1024) NULL DEFAULT NULL COMMENT '托管原因',
  `t_jcjdtgqk` varchar(1024) NULL DEFAULT NULL COMMENT '检查监督托管情况',
  `t_tgjzqk` varchar(1024) NULL DEFAULT NULL COMMENT '托管纠正情况',
  `t_sflg` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否漏管',
  `t_lgyy` varchar(1024) NULL DEFAULT NULL COMMENT '漏管原因',
  `t_jcjdlgqk` varchar(1024) NULL DEFAULT NULL COMMENT '检查监督漏管情况',
  `t_lgjzqk` varchar(1024) NULL DEFAULT NULL COMMENT '漏管纠正情况',
  `t_jcqk` varchar(1024) NULL DEFAULT NULL COMMENT '奖惩情况',
  `t_xfzxbgqk` varchar(1024) NULL DEFAULT NULL COMMENT '刑法执行变更情况',
  `t_sfcxfz` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否重新犯罪',
  `t_cxfzzm` varchar(100) NULL DEFAULT NULL COMMENT '重新犯罪罪名',
  `t_zt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `t_djr` bigint(11) NULL DEFAULT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(11) NULL DEFAULT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfyx` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `t_xczfrq` date NULL DEFAULT NULL COMMENT '下次走访日期',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE
) ENGINE = InnoDB  COMMENT = '社区矫正人员信息';

-- ----------------------------
-- Table structure for t_sqjzryzfb
-- ----------------------------
DROP TABLE IF EXISTS `t_sqjzryzfb`;
CREATE TABLE `t_sqjzryzfb`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_sfytg` tinyint(1) NULL DEFAULT 0 COMMENT '是否有托管',
  `t_tgyy` varchar(1024) NULL DEFAULT NULL COMMENT '托管原因',
  `t_jcjdtgqk` varchar(1024) NULL DEFAULT NULL COMMENT '检查监督托管情况',
  `t_tgjzqk` varchar(1024) NULL DEFAULT NULL COMMENT '托管纠正情况',
  `t_sflg` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否漏管',
  `t_lgyy` varchar(1024) NULL DEFAULT NULL COMMENT '漏管原因',
  `t_jcjdlgqk` varchar(1024) NULL DEFAULT NULL COMMENT '检查监督漏管情况',
  `t_lgjzqk` varchar(1024) NULL DEFAULT NULL COMMENT '漏管纠正情况',
  `t_jcqk` varchar(1024) NULL DEFAULT NULL COMMENT '奖惩情况',
  `t_xfzxbgqk` varchar(1024) NULL DEFAULT NULL COMMENT '刑法执行变更情况',
  `t_sfcxfz` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否重新犯罪',
  `t_cxfzzm` varchar(100) NULL DEFAULT NULL COMMENT '重新犯罪罪名',
  `t_ydzfrq` date NULL DEFAULT NULL COMMENT '原定走访日期',
  `t_xczfrq` date NOT NULL COMMENT '下次走访日期',
  `t_djr` bigint(11) NULL DEFAULT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记日期',
  `t_zhxgr` bigint(11) NULL DEFAULT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE
) ENGINE = InnoDB  COMMENT = '社区矫正人员信息走访表';

-- ----------------------------
-- Table structure for t_sssaxx
-- ----------------------------
DROP TABLE IF EXISTS `t_sssaxx`;
CREATE TABLE `t_sssaxx`  (
  `t_ajid` bigint(20) NULL COMMENT '案件id',
  `t_xxbh` int(11) NOT NULL COMMENT '学校编号（学校基本信息表ID）'
) ENGINE = InnoDB COMMENT = '师生涉案信息';

-- ----------------------------
-- Table structure for t_xdry
-- ----------------------------
DROP TABLE IF EXISTS `t_xdry`;
CREATE TABLE `t_xdry`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_ccfxrq` date NULL DEFAULT NULL COMMENT '初次发现日期',
  `t_xdyy` varchar(2) NULL DEFAULT NULL COMMENT '吸毒原因',
  `t_xdyyjs` varchar(10) NULL DEFAULT NULL COMMENT '吸毒原因解释',
  `t_xdhg` varchar(3) NULL DEFAULT NULL COMMENT '吸毒后果',
  `t_xdhgjs` varchar(20) NULL DEFAULT NULL COMMENT '吸毒后果解释',
  `t_xczfrq` date NULL DEFAULT NULL COMMENT '下次走访日期',
  `t_gkqk` varchar(2) NULL DEFAULT NULL COMMENT '管控情况',
  `t_gkqkjs` varchar(26) NULL DEFAULT NULL COMMENT '管控情况解释',
  `t_gkrxm` varchar(50) NULL DEFAULT '0' COMMENT '管控人姓名',
  `t_gkrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '管控人联系方式',
  `t_bfrxm` varchar(50) NULL DEFAULT NULL COMMENT '帮扶人姓名',
  `t_bfrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '帮扶人联系方式',
  `t_bfqk` varchar(1024) NULL DEFAULT NULL COMMENT '帮扶情况',
  `t_ywfzs` tinyint(1) NOT NULL DEFAULT 0 COMMENT '有无犯罪史',
  `t_fzqk` varchar(1024) NULL DEFAULT NULL COMMENT '犯罪情况',
  `t_zt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `t_djr` bigint(20) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfyx` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_gkqk`(`t_gkqk`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE,
  INDEX `index_zhxgsj`(`t_zhxgsj`) USING BTREE,
  INDEX `index_zt`(`t_zt`) USING BTREE
) ENGINE = InnoDB COMMENT = '吸毒人员信息';

-- ----------------------------
-- Table structure for t_xdryzfb
-- ----------------------------
DROP TABLE IF EXISTS `t_xdryzfb`;
CREATE TABLE `t_xdryzfb`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_ydzfrq` date NULL DEFAULT NULL COMMENT '原定走访日期',
  `t_xczfrq` date NULL DEFAULT NULL COMMENT '下次走访日期',
  `t_bfrxm` varchar(50) NULL DEFAULT NULL COMMENT '帮扶人姓名',
  `t_bfrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '帮扶人联系方式',
  `t_bfqk` varchar(1024) NULL DEFAULT NULL COMMENT '帮扶情况',
  `t_ywfzs` tinyint(1) NOT NULL DEFAULT 0 COMMENT '有无犯罪史',
  `t_fzqk` varchar(1024) NULL DEFAULT NULL COMMENT '犯罪情况',
  `t_djr` bigint(20) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE,
  INDEX `index_zhxgsj`(`t_zhxgsj`) USING BTREE
) ENGINE = InnoDB  COMMENT = '吸毒人员走访表';

-- ----------------------------
-- Table structure for t_xmsfry
-- ----------------------------
DROP TABLE IF EXISTS `t_xmsfry`;
CREATE TABLE `t_xmsfry`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_sflf` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否累犯',
  `t_yzm` varchar(2) NULL DEFAULT NULL COMMENT '原罪名',
  `t_yzmjs` varchar(30) NULL DEFAULT NULL COMMENT '原罪名解释',
  `t_ypxq` varchar(50) NULL DEFAULT NULL COMMENT '原判刑期',
  `t_fxcs` varchar(100) NULL DEFAULT NULL COMMENT '服刑场所',
  `t_wxxpglx` varchar(2) NULL DEFAULT NULL COMMENT '危险性评估类型',
  `t_wxxpglxjs` varchar(16) NULL DEFAULT NULL COMMENT '危险性评估类型解释',
  `t_xjrq` date NULL DEFAULT NULL COMMENT '衔接日期',
  `t_xjqk` varchar(2) NULL DEFAULT NULL COMMENT '衔接情况',
  `t_xjqkjs` varchar(20) NULL DEFAULT NULL COMMENT '衔接情况解释',
  `t_azrq` date NULL DEFAULT NULL COMMENT '安置日期',
  `t_azqk` varchar(2) NULL DEFAULT NULL COMMENT '安置情况',
  `t_azqkjs` varchar(30) NULL DEFAULT NULL COMMENT '安置情况解释',
  `t_wazyy` varchar(1024) NULL DEFAULT NULL COMMENT '未安置原因',
  `t_bjqk` varchar(1024) NULL DEFAULT NULL COMMENT '帮教情况',
  `t_sfcxfz` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否重新犯罪',
  `t_cxfzzm` varchar(255) NULL DEFAULT NULL COMMENT '重新犯罪罪名',
  `t_cxfzzmjs` varchar(255) NULL DEFAULT NULL COMMENT '重新犯罪罪名解释',
  `t_zt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `t_djr` bigint(11) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(11) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfyx` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `t_sfrq` date NULL DEFAULT NULL COMMENT '释放日期',
  `t_xczfrq` date NULL DEFAULT NULL COMMENT '下次走访日期',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE
) ENGINE = InnoDB  COMMENT = '刑满释放人员信息';

-- ----------------------------
-- Table structure for t_xmsfryzfb
-- ----------------------------
DROP TABLE IF EXISTS `t_xmsfryzfb`;
CREATE TABLE `t_xmsfryzfb`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_wxxpglx` varchar(2) NOT NULL COMMENT '危险性评估类型',
  `t_wxxpglxjs` varchar(16) NULL DEFAULT NULL COMMENT '危险性评估类型解释',
  `t_xjrq` date NOT NULL COMMENT '衔接日期',
  `t_xjqk` varchar(2) NOT NULL COMMENT '衔接情况',
  `t_xjqkjs` varchar(20) NULL DEFAULT NULL COMMENT '衔接情况解释',
  `t_azrq` date NOT NULL COMMENT '安置日期',
  `t_azqk` varchar(2) NOT NULL COMMENT '安置情况',
  `t_azqkjs` varchar(30) NULL DEFAULT NULL COMMENT '安置情况解释',
  `t_wazyy` varchar(1024) NULL DEFAULT NULL COMMENT '未安置原因',
  `t_bjqk` varchar(1024) NULL DEFAULT NULL COMMENT '帮教情况',
  `t_sfcxfz` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否重新犯罪',
  `t_cxfzzm` varchar(255) NULL DEFAULT NULL COMMENT '重新犯罪罪名',
  `t_cxfzzmjs` varchar(255) NULL DEFAULT NULL COMMENT '重新犯罪罪名解释',
  `t_ydzfrq` date NULL DEFAULT NULL COMMENT '原定走访日期',
  `t_xczfrq` date NOT NULL COMMENT '下次走访日期',
  `t_djr` bigint(11) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(11) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE
) ENGINE = InnoDB  COMMENT = '刑满释放人员信息走访表';

-- ----------------------------
-- Table structure for t_xxjbxx
-- ----------------------------
DROP TABLE IF EXISTS `t_xxjbxx`;
CREATE TABLE `t_xxjbxx`  (
  `t_id` bigint ( 11 ) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_xxmc` varchar(100) NOT NULL COMMENT '学校名称',
  `t_xxdz` varchar(200) NULL DEFAULT NULL COMMENT '学校地址',
  `t_xxbxlx` varchar(2) NULL DEFAULT NULL COMMENT '学校办学类型',
  `t_xxbxlxjs` varchar(30) NULL DEFAULT NULL COMMENT '学校办学类型解释',
  `t_zxxsrs` int(6) DEFAULT '0' COMMENT '在校学生人数',
  `t_zgjyxzbm` varchar(100) NULL DEFAULT NULL COMMENT '主管教育行政部门',
  `t_xzxm` varchar(50) NOT NULL COMMENT '校长姓名',
  `t_xzlxfs` varchar(50) NOT NULL COMMENT '校长联系方式',
  `t_zrwgjg` bigint(20) NULL DEFAULT NULL COMMENT '责任网格机构',
  `t_zrwgy` bigint(20) NULL DEFAULT NULL COMMENT '责任网格员',
  `t_fgaqbwzrrxm` varchar(50) NULL DEFAULT NULL COMMENT '分管安全保卫责任人姓名',
  `t_fgaqbwzrrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '分管安全保卫责任人联系方式',
  `t_aqbwzrrxm` varchar(50) NULL DEFAULT NULL COMMENT '安全保卫责任人姓名',
  `t_aqbwzrrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '安全保卫责任人联系方式',
  `t_zazrrxm` varchar(50) NULL DEFAULT NULL COMMENT '治安责任人姓名',
  `t_zazrrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '治安责任人联系方式',
  `t_aqbwrs` int(3) NULL DEFAULT NULL COMMENT '安全保卫人数',
  `t_cjr` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `t_cjsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_jd` double(11, 8) NULL DEFAULT NULL COMMENT '经度',
  `t_wd` double(10, 8) NULL DEFAULT NULL COMMENT '纬度',
  `t_xxssd` bigint(20) NULL DEFAULT NULL COMMENT '学校所属地区（行政区划信息表ID）',
  `t_ssdlj` varchar(100) NULL DEFAULT NULL COMMENT '所属地区路径1,2,3',
  `t_ssdxz` varchar(255) NULL DEFAULT NULL COMMENT '所属地区详址 广东省,深圳市,南山区,xx街道,xx巷',
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB  COMMENT = '学校基本信息';

-- ----------------------------
-- Table structure for t_xxzbzdrq
-- ----------------------------
DROP TABLE IF EXISTS `t_xxzbzdrq`;
CREATE TABLE `t_xxzbzdrq`  (
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（用户信息表ID）',
  `t_whcd` varchar(2) NULL DEFAULT NULL COMMENT '危害程度',
  `t_sfgz` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否关注',
  `t_zarklb` varchar(2) NULL DEFAULT NULL COMMENT '治安人口类别',
  `t_zarklbjs` varchar(10) NULL DEFAULT NULL COMMENT '治安人口类别解释',
  `t_xxbh` bigint(20) NULL DEFAULT NULL COMMENT '学校编号（学校基本信息表ID）',
  `t_djr` bigint(11) NULL DEFAULT NULL COMMENT '登记人',
  `t_djsj` date NULL DEFAULT NULL COMMENT '登记日期',
  `t_zhxgr` bigint(11) NULL DEFAULT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_whcdjs` varchar(50) NULL DEFAULT NULL COMMENT '危害程度解释',
  `t_sfgzjs` varchar(50) NULL DEFAULT NULL COMMENT '是否关注解釋',
  PRIMARY KEY (`t_yhh`) USING BTREE
) ENGINE = InnoDB COMMENT = '学校周边重点人群';

-- ----------------------------
-- Table structure for t_xzqhxx
-- ----------------------------
DROP TABLE IF EXISTS `t_xzqhxx`;
CREATE TABLE `t_xzqhxx`  (
  `t_qhdm` bigint(12) NOT NULL COMMENT '区划代码',
  `t_mc` varchar(50) NOT NULL COMMENT '名称',
  `t_jb` tinyint(1) NOT NULL COMMENT '级别 1-省级 2-地级 3-县级 4-乡级 5-乡以下',
  `t_fjqhdm` bigint(12) NULL DEFAULT NULL COMMENT '父级区划代码',
  `t_zt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1-使用中 0 禁用',
  PRIMARY KEY (`t_qhdm`) USING BTREE,
  INDEX `index_fjqhdm`(`t_fjqhdm`) USING BTREE
) ENGINE = InnoDB COMMENT = '行政区划信息';

-- ----------------------------
-- Table structure for t_zdqsn
-- ----------------------------
DROP TABLE IF EXISTS `t_zdqsn`;
CREATE TABLE `t_zdqsn`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_rylx` varchar(2) NULL DEFAULT NULL COMMENT '人员类型',
  `t_rylxjs` varchar(30) NULL DEFAULT NULL COMMENT '人员类型解释',
  `t_jtqk` varchar(2) NULL DEFAULT NULL COMMENT '家庭情况',
  `t_jtqkjs` varchar(30) NULL DEFAULT NULL COMMENT '家庭情况解释',
  `t_sfwffz` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否违法犯罪',
  `t_wffzqk` varchar(1024) NULL DEFAULT NULL COMMENT '违法犯罪情况',
  `t_bfrxm` varchar(50) NULL DEFAULT NULL COMMENT '帮扶人姓名',
  `t_bfrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '帮扶人联系方式',
  `t_bfsd` varchar(2) NULL DEFAULT NULL COMMENT '帮扶手段',
  `t_bfsdjs` varchar(10) NULL DEFAULT NULL COMMENT '帮扶手段解释',
  `t_bfqk` varchar(1024) NULL DEFAULT NULL COMMENT '帮扶情况',
  `t_zt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `t_djr` bigint(11) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(11) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_sfyx` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `t_xczfrq` date NULL DEFAULT NULL COMMENT '下次走访日期',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE
) ENGINE = InnoDB  COMMENT = '重点青少年信息';

-- ----------------------------
-- Table structure for t_zdqsnzfb
-- ----------------------------
DROP TABLE IF EXISTS `t_zdqsnzfb`;
CREATE TABLE `t_zdqsnzfb`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
  `t_sfwffz` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否违法犯罪',
  `t_wffzqk` varchar(1024) NULL DEFAULT NULL COMMENT '违法犯罪情况',
  `t_bfrxm` varchar(50) NOT NULL COMMENT '帮扶人姓名',
  `t_bfrlxfs` varchar(50) NOT NULL COMMENT '帮扶人联系方式',
  `t_bfsd` varchar(2) NOT NULL COMMENT '帮扶手段',
  `t_bfsdjs` varchar(10) NULL DEFAULT NULL COMMENT '帮扶手段解释',
  `t_bfqk` varchar(1024) NULL DEFAULT NULL COMMENT '帮扶情况',
  `t_ydzfrq` date NULL DEFAULT NULL COMMENT '原定走访日期',
  `t_xczfrq` date NOT NULL COMMENT '下次走访日期',
  `t_djr` bigint(11) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
  `t_zhxgr` bigint(11) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_yhh`(`t_yhh`) USING BTREE
) ENGINE = InnoDB  COMMENT = '重点青少年信息走访表';

-- ----------------------------
-- Table structure for t_zdzadq
-- ----------------------------
DROP TABLE IF EXISTS `t_zdzadq`;
CREATE TABLE `t_zdzadq`  (
  `t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，id',
  `t_ssd` bigint(20) NOT NULL COMMENT '所属地区（行政区划信息表ID）',
  `t_ssdjs` varchar(100) NOT NULL COMMENT '所属地区解释',
  `t_ssdlj` varchar(100) NOT NULL COMMENT '所属地区路径1,2,3',
  `t_ssdxz` varchar(255) NOT NULL COMMENT '所属地区详址 广东省,深圳市,南山区,xx街道,xx巷',
  `t_zazddq` varchar(100) NOT NULL COMMENT '治安重点地区',
  `t_zatcwt` varchar(3) NOT NULL COMMENT '治安突出问题',
  `t_zatcwtjs` varchar(16) NOT NULL COMMENT '治安突出问题解释',
  `t_sjqylx` varchar(2) NOT NULL DEFAULT '0' COMMENT '涉及区域类型',
  `t_sjqylxjs` varchar(16) NOT NULL COMMENT '涉及区域类型解释',
  `t_sjqyfw` varchar(400) NULL DEFAULT NULL COMMENT '涉及区域范围',
  `t_zrwgjg` bigint(20) NOT NULL COMMENT '责任网格机构,组织机构信息ID',
  `t_zrwgy` bigint(20) NOT NULL COMMENT '责任网格员，组织机构人员信息ID',
  `t_zzqtdw` varchar(100) NULL DEFAULT NULL COMMENT '整治牵头单位',
  `t_zzcydw` varchar(400) NULL DEFAULT NULL COMMENT '整治参与单位',
  `t_zzqtdwfzrxm` varchar(50) NULL DEFAULT NULL COMMENT '整治牵头单位负责人姓名',
  `t_zzqtdwfzrlxfs` varchar(100) NULL DEFAULT NULL COMMENT '整治牵头单位负责人联系方式',
  `t_zzwcrq` date NOT NULL COMMENT '整治完成日期',
  `t_zzqk` varchar(1024) NULL DEFAULT NULL COMMENT '整治情况',
  `t_xgpg` varchar(2) NULL DEFAULT '-1' COMMENT '效果评估,-1则表示整治中',
  `t_xgpgjs` varchar(8) NULL DEFAULT NULL COMMENT '效果评估解释',
  `t_cjr` bigint(20) NOT NULL COMMENT '创建人',
  `t_cjsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `t_zhxgr` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `INDEX_SJQYLX`(`t_sjqylx`) USING BTREE COMMENT '涉及区域类型',
  INDEX `INDEX_XGPG`(`t_xgpg`) USING BTREE COMMENT '效果评估',
  INDEX `INDEX_ZATCWT`(`t_zatcwt`) USING BTREE COMMENT '治安突出问题'
) ENGINE = InnoDB  COMMENT = '重点治安地区';

-- ----------------------------
-- Table structure for t_zzjgryxx
-- ----------------------------
DROP TABLE IF EXISTS `t_zzjgryxx`;
CREATE TABLE `t_zzjgryxx`  (
  `t_id` bigint(20) NOT NULL COMMENT '主键',
  `t_yhh` bigint(20) NOT NULL COMMENT '用户号',
  `t_jb` varchar(3) NULL DEFAULT NULL COMMENT '级别',
  `t_jbjs` varchar(16) NULL DEFAULT NULL COMMENT '级别解释',
  `t_zw` varchar(2) NULL DEFAULT NULL COMMENT '职务',
  `t_zwjs` varchar(10) NULL DEFAULT NULL COMMENT '职务解释',
  `t_zytc` varchar(80) NULL DEFAULT NULL COMMENT '专业特长（多选）',
  `t_cjr` bigint(20) NOT NULL COMMENT '创建人',
  `t_cjsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_gddh` varchar(32) NULL DEFAULT NULL COMMENT '固定电话',
  `t_zytcjs` varchar(512) NULL DEFAULT NULL COMMENT '专业特长解释',
  `t_sfsc` int(11) NOT NULL DEFAULT 0 COMMENT '1-删除',
  `t_ssjg` bigint(20) NOT NULL COMMENT '所属机构',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_yhh_copy_1`(`t_yhh`) USING BTREE,
  KEY `index_ssjg` (`t_ssjg`) USING BTREE
) ENGINE = InnoDB COMMENT = '组织机构人员信息表';

-- ----------------------------
-- Table structure for t_zzjgxx
-- ----------------------------
DROP TABLE IF EXISTS `t_zzjgxx`;
CREATE TABLE `t_zzjgxx`  (
  `t_id` bigint(20) NOT NULL COMMENT '主键',
  `t_jgmc` varchar(100) NOT NULL COMMENT '机构名称',
  `t_zzfwdq` bigint(12) NOT NULL COMMENT '综治服务地区（行政区划信息表ID）',
  `t_zzfwdqjs` varchar(100) NULL DEFAULT NULL COMMENT '综治服务地区解释',
  `t_jglx` varchar(8) NOT NULL COMMENT '机构类型 -字典表编码',
  `t_zzlx` varchar(8) NULL DEFAULT NULL COMMENT '组织类型',
  `t_zzlxjs` varchar(30) NULL DEFAULT NULL COMMENT '组织结构解释',
  `t_sjjg` bigint(20) NOT NULL COMMENT '上级机构',
  `t_qcj` varchar(100) NULL DEFAULT NULL COMMENT '全层级（层级之间有|分隔）',
  `t_lxfs` varchar(50) NOT NULL COMMENT '联系方式',
  `t_szdz` varchar(200) NOT NULL COMMENT '所在地址',
  `t_zyzn` varchar(1024) NULL DEFAULT NULL COMMENT '主要职能',
  `t_cjr` bigint(20) NOT NULL COMMENT '创建人',
  `t_cjsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `t_zhxgr` bigint(20) NOT NULL COMMENT '最后修改人',
  `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `t_jd` double(11, 8) NOT NULL COMMENT '经度',
  `t_wd` double(10, 8) NOT NULL COMMENT '纬度',
  `t_sjjgjs` varchar(32) NULL DEFAULT NULL COMMENT '上级机构解释',
  `t_zzfwdqid` varchar(64) NULL DEFAULT NULL COMMENT '综治服务地区id列表',
  `t_fzrxm` varchar(50) NULL DEFAULT NULL COMMENT '负责人姓名',
  `t_fzrlxfs` varchar(50) NULL DEFAULT NULL COMMENT '负责人联系方式',
  `t_jglxjs` varchar(64) NULL DEFAULT NULL COMMENT '机构类型解释',
  `t_sfsc` int(11) NULL DEFAULT 0 COMMENT '1-删除',
  `t_ssoid` varchar(32) NULL DEFAULT NULL COMMENT 'sso组织表的主键',
  `t_fwdqqcj` varchar(255) NULL DEFAULT NULL COMMENT '服务地区全层级',
  PRIMARY KEY (`t_id`) USING BTREE,
  INDEX `index_zzfwdq`(`t_zzfwdq`) USING BTREE,
  KEY `index_id` (`t_id`)
) ENGINE = InnoDB COMMENT = '组织机构信息表';


DROP TABLE IF EXISTS `t_sbtjhzb`;
CREATE TABLE `t_sbtjhzb`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT ,
  `t_wgzrjg` bigint(20) NULL DEFAULT NULL COMMENT '责任网格机构',
  `t_zrwgr` bigint(20) NULL DEFAULT NULL COMMENT '责任网格人',
  `t_type` tinyint(2) NULL DEFAULT NULL COMMENT '统计类型(1.人员 2.房屋 3.定期回访（艾滋病人员、五种人员走访） 4.组织 5.治安问题 6.事件 7.路线)',
  `t_cjsj` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `t_glid` bigint(20) NULL DEFAULT 0 COMMENT '关联主表id (为0时，没有获取到id)',
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB COMMENT = '上报统计汇总表';


DROP TABLE IF EXISTS `t_dtbj`;
CREATE TABLE `t_dtbj` (
  `t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `t_mc` varchar(200) NOT NULL COMMENT '标记的名称',
  `t_bz` varchar(500) NOT NULL COMMENT '备注',
  `t_jd` double(11,8) NOT NULL COMMENT '经度',
  `t_wd` double(10,8) NOT NULL COMMENT '纬度',
  `t_lx` tinyint(2) NOT NULL COMMENT '类型（1.数字网格子系统2.地图指挥子系统）',
  `t_cjr` bigint(20) NOT NULL COMMENT '创建人id',
  `t_cjsj` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地图标记表';


DROP TABLE IF EXISTS `t_wj`;
CREATE TABLE `t_wj` (
  `t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_wjdz` varchar(255) DEFAULT NULL COMMENT '文件地址',
  `t_ywjm` varchar(255) DEFAULT NULL COMMENT '原文件名',
  `t_xwjm` varchar(255) DEFAULT NULL COMMENT '现文件名',
  `t_hzm` varchar(6) DEFAULT NULL COMMENT '后缀名',
  `t_wjlx` tinyint(1) DEFAULT NULL COMMENT '文件类型 1图片 2word 3Excel 9其他',
  `t_djr` bigint(20) NOT NULL COMMENT '登记人',
  `t_djsj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件表';


DROP TABLE IF EXISTS `t_lsjl`;
CREATE TABLE `t_lsjl`  (
  `t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '数字网格子系统历史查询id（主键）',
  `t_cxmc` varchar(50) NOT NULL COMMENT '查询名称',
  `t_lx` tinyint(2) NULL DEFAULT NULL COMMENT '查询模块类型（1.数字网格子系统2.地图指挥子系统）',
  `t_cjsj` datetime NOT NULL COMMENT '创建时间',
  `t_cjr` bigint(20) NOT NULL COMMENT '创建人id',
  PRIMARY KEY (`t_id`)
) ENGINE = InnoDB DEFAULT CHARSET=utf8 COMMENT = '网格子系统历史查询记录表';


DROP TABLE IF EXISTS `device`;
create table device
(
    id               int(11) unsigned auto_increment primary key,
    device_no        varchar(255)     null comment '设备编号',
    device_name      varchar(255)     null comment '名称',
    device_scene     varchar(255)     null comment '设备场景',
    agent_id         int              null comment '通信代理id',
    type             varchar(255)     null comment '类型',
    area_id          int              null comment '区域id',
    organize_id      varchar(50)      null comment '组织code',
    address          varchar(1000)    null comment '地址',
    device_longitude double(10, 6)    null comment '经度',
    device_latitude  double(10, 6)    null comment '纬度',
    remark           varchar(1000)    null comment '备注',
    ip               varchar(255)     null comment 'ip地址',
    status           int              null comment '状态',
    work             int              null comment '工作模式',
    create_time      timestamp        null comment '创建时间',
    is_send          char default '0' not null comment '中阳掌迹测试用',
    bus_plate_id     varchar(50)      null comment '公交车牌号ID',
    name_pinyin 	 varchar(100) DEFAULT NULL COMMENT '设备名称全拼',
    name_first 		 varchar(30) DEFAULT NULL COMMENT '设备名称简拼',
    address_pinyin 	 varchar(255) DEFAULT NULL COMMENT '地址全拼',
    address_first 	 varchar(50) DEFAULT NULL COMMENT '地址简拼',
    type_identifier  varchar(20) DEFAULT NULL COMMENT '设备类型识别码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备';


DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
	`id`                int(11) unsigned NOT NULL,
	`area_name` 		varchar(255) DEFAULT NULL COMMENT '名称',
	`remark` 			varchar(1000) DEFAULT NULL COMMENT '备注',
	`parent_id` 		int(11) DEFAULT NULL COMMENT '父id',
	`area_longitude` 	double(10,6) DEFAULT NULL COMMENT '经度',
	`area_latitude` 	double(10,6) DEFAULT NULL COMMENT '纬度',
	`type` 				int(11) DEFAULT NULL COMMENT '类型',
	`name_pinyin` 		varchar(100) DEFAULT NULL COMMENT '区域名全拼',
	`name_first` 		varchar(30) DEFAULT NULL COMMENT '区域名简拼',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域';

-- ----------------------------
-- Table structure for t_yjsj
-- ----------------------------
DROP TABLE IF EXISTS `t_yjsj`;
CREATE TABLE `t_yjsj` (
	`t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
	`t_sjmc` VARCHAR(50) NOT NULL COMMENT '事件名称',
	`t_sjlx` tinyint(2) NOT NULL COMMENT '事件类型',
	`t_sjlxjs` VARCHAR(20) NOT NULL COMMENT '事件类型解释',
	`t_whcd` tinyint(2) NOT NULL COMMENT '危害程度',
	`t_whcdjs` VARCHAR(20) NOT NULL COMMENT '危害程度解释',
	`t_sfsj` timestamp(0) NOT NULL COMMENT '事发时间',
	`t_sjxq` VARCHAR(200) DEFAULT NULL COMMENT '事件详情',
	`t_sfxz` VARCHAR(100) DEFAULT NULL COMMENT '事发详址',
	`t_jd` double(11, 8) NOT NULL COMMENT '经度',
    `t_wd` double(10, 8) NOT NULL COMMENT '纬度',
	`t_zt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '事件状态 1启用 0停用',
	`t_sfyd` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读 1已读 0未读',
	`t_sbwgjg` bigint(20) NOT NULL COMMENT '上报网格机构',
	`t_djr` bigint(20) NULL DEFAULT NULL COMMENT '登记人',
    `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
    `t_zhxgr` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
    `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
	PRIMARY KEY (`t_id`) USING BTREE,
    INDEX `index_sjlx`(`t_sjlx`) USING BTREE,
    INDEX `index_whcd`(`t_whcd`) USING BTREE,
    INDEX `index_zt`(`t_zt`) USING BTREE,
    INDEX `index_djsj`(`t_djsj`) USING BTREE,
	INDEX `index_sbwgjg`(`t_sbwgjg`) USING BTREE
) ENGINE = InnoDB COMMENT = '应急事件管理表';


-- ----------------------------
-- Table structure for t_yjwz
-- ----------------------------
DROP TABLE IF EXISTS `t_yjwz`;
CREATE TABLE `t_yjwz` (
	`t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
	`t_wzdmc` VARCHAR(50) NOT NULL COMMENT '物资点名称',
	`t_wznr` VARCHAR(50) NOT NULL COMMENT '物资内容',
	`t_wzms` VARCHAR(200) NOT NULL COMMENT '物资描述',
	`t_szdz` VARCHAR(100) NOT NULL COMMENT '所在地址',
	`t_fzrxm` VARCHAR(50) NOT NULL COMMENT '负责人姓名',
	`t_fzrlxfs` VARCHAR(50) NOT NULL COMMENT '负责人联系方式',
	`t_jd` double(11, 8) NOT NULL COMMENT '经度',
    `t_wd` double(10, 8) NOT NULL COMMENT '纬度',
	`t_zt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '物资点状态 1启用 0停用',
	`t_sfyd` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读 1已读 0未读',
	`t_sbwgjg` bigint(20) NOT NULL COMMENT '上报网格机构',
	`t_djr` bigint(20) NULL DEFAULT NULL COMMENT '登记人',
    `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
    `t_zhxgr` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
    `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
	PRIMARY KEY (`t_id`) USING BTREE,
	INDEX `index_wzdmc`(`t_wzdmc`) USING BTREE,
	INDEX `index_wznr`(`t_wznr`) USING BTREE,
	INDEX `index_szdz`(`t_szdz`) USING BTREE,
    INDEX `index_zt`(`t_zt`) USING BTREE,
    INDEX `index_djsj`(`t_djsj`) USING BTREE,
	INDEX `index_sbwgjg`(`t_sbwgjg`) USING BTREE
) ENGINE = InnoDB COMMENT = '应急物资管理表';


-- ----------------------------
-- Table structure for t_rwzp
-- ----------------------------
DROP TABLE IF EXISTS `t_rwzp`;
CREATE TABLE `t_rwzp` (
	`t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
	`t_tclx` TINYINT NOT NULL COMMENT '图层类型 1-综治机构 2-非公有制经济组织 3-社会组织 4-寄递物流 5-矛盾纠纷 6-学校 7-路线 8-案件 9-地图标控',
	`t_tcid` bigint(20) NOT NULL COMMENT '图层id',
	`t_rwlx` VARCHAR(3) NOT NULL COMMENT '任务类型',
	`t_rwlxjs` VARCHAR(30) NOT NULL COMMENT '任务类型解释',
	`t_rwnr` VARCHAR(200) NOT NULL COMMENT '任务内容',
	`t_rwcs` VARCHAR(50) NOT NULL COMMENT '任务场所',
	`t_zt` tinyint(1) NOT NULL DEFAULT 1 COMMENT '任务状态',
	`t_rwzpsj` timestamp(0) NOT NULL  COMMENT '任务指派时间',
    `t_wgzry` bigint(20) NOT NULL COMMENT '网格责任员ID（人员信息表ID）',
	`t_djr` bigint(20) NULL DEFAULT NULL COMMENT '登记人',
    `t_djsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记时间',
    `t_zhxgr` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
    `t_zhxgsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
	PRIMARY KEY (`t_id`) USING BTREE,
	INDEX `index_tcid`(`t_tcid`) USING BTREE,
    INDEX `index_zt`(`t_zt`) USING BTREE,
    INDEX `index_djsj`(`t_djsj`) USING BTREE
) ENGINE = InnoDB COMMENT = '任务指派管理表';

-- ----------------------------
-- Table structure for t_rydwxx
-- ----------------------------
DROP TABLE IF EXISTS `t_rydwxx`;
CREATE TABLE `t_rydwxx` (
    `t_yhh` bigint(20) NOT NULL COMMENT '用户号（人员信息表ID）',
    `t_jd` double(11, 8) NOT NULL COMMENT '经度',
    `t_wd` double(10, 8) NOT NULL COMMENT '纬度',
    `t_zhdwsj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后定位时间',
	PRIMARY KEY (`t_yhh`) USING BTREE
) ENGINE = InnoDB COMMENT = '人员定位信息表';


-- ----------------------------
-- Table structure for t_xxtz
-- ----------------------------
DROP TABLE IF EXISTS `t_xxtz`;
CREATE TABLE `t_xxtz` (
	`t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
	`t_xxtzlx` TINYINT(1) NOT NULL COMMENT '消息通知类型 1应急事件 2被指派的任务',
	`t_rwh` bigint(20) NOT NULL COMMENT '对应任务id 应急表/任务指派表id',
	`t_fsr` bigint(20) NOT NULL COMMENT '发送人',
	`t_jsr` bigint(20) NOT NULL COMMENT '接收人',
	`t_sfyd` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读 1已读 0未读',
	`t_fssj` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '发送时间',
	PRIMARY KEY (`t_id`) USING BTREE,
	INDEX `index_rwh`(`t_rwh`) USING BTREE,
	INDEX `index_fsr`(`t_fsr`) USING BTREE,
	INDEX `index_jsr`(`t_jsr`) USING BTREE
) ENGINE = InnoDB COMMENT = '消息通知表';


-- ----------------------------
-- Table structure for t_hhxx
-- ----------------------------
DROP TABLE IF EXISTS `t_hhxx`;
CREATE TABLE `t_hhxx` (
	`t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
	`t_fsr` bigint(20) NOT NULL COMMENT '发送人',
	`t_jsr` bigint(20) NOT NULL COMMENT '接受人',
	`t_fssj` timestamp(0) NOT NULL COMMENT '发送时间',
	`t_ydsj` timestamp(0) NULL COMMENT '已读时间',
	`t_xxnr` VARCHAR(255) NOT NULL COMMENT '消息内容',
	`t_zt` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0未读 1已读',
	PRIMARY KEY (`t_id`) USING BTREE,
	INDEX `INDEX_FSR`(`t_fsr`) USING BTREE,
	INDEX `INDEX_JSR`(`t_jsr`) USING BTREE
) ENGINE = InnoDB COMMENT = '会话消息表';


-- ----------------------------
-- Table structure for t_hhxx_bf
-- ----------------------------
DROP TABLE IF EXISTS `t_hhxx_bf`;
CREATE TABLE `t_hhxx_bf` (
  `t_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_fsr` bigint(20) NOT NULL COMMENT '发送人',
  `t_jsr` bigint(20) NOT NULL COMMENT '接受人',
  `t_fssj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  `t_ydsj` timestamp NULL DEFAULT NULL COMMENT '已读时间',
  `t_xxnr` varchar(255) NOT NULL COMMENT '消息内容',
  `t_zt` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0未读 1已读',
  `t_bfsj` timestamp NOT NULL COMMENT '备份时间',
  PRIMARY KEY (`t_id`) USING BTREE,
  KEY `INDEX_FSR` (`t_fsr`) USING BTREE,
  KEY `INDEX_JSR` (`t_jsr`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会话消息表的定期备份表';



-- ----------------------------
-- Table structure for t_hhdx
-- ----------------------------
DROP TABLE IF EXISTS `t_hhdx`;
CREATE TABLE `t_hhdx` (
	`t_dqyh` bigint(20) NOT NULL COMMENT '当前用户',
	`t_hhyh` bigint(20) NOT NULL COMMENT '会话用户',
    INDEX `INDEX_DQYH`(`t_dqyh`) USING BTREE,
	INDEX `INDEX_HHYH`(`t_hhyh`) USING BTREE
) ENGINE = InnoDB COMMENT = '会话对象列表';


SET FOREIGN_KEY_CHECKS = 1;



