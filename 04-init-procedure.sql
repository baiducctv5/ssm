create
    definer = root@`%` function getChild(rootId int) returns varchar(1000)
BEGIN
    DECLARE sTemp VARCHAR(1000);
    DECLARE sTempChd VARCHAR(1000);

    SET sTemp = '$';
    SET sTempChd = cast(rootId as CHAR);

    WHILE (sTempChd is not null)
        DO
            SET sTemp = concat(sTemp, ',', sTempChd);
            SELECT group_concat(t_id)
            INTO sTempChd
            FROM t_zzjgxx
            where FIND_IN_SET(t_sjjg, sTempChd) > 0;
        END WHILE;
    RETURN sTemp;
END;

create
    definer = root@`%` function getParent(rootId int) returns varchar(1000)
BEGIN
    DECLARE sTemp VARCHAR(1000);
    DECLARE sTempPar VARCHAR(1000);
    SET sTemp = '';
    SET sTempPar = rootId;

    #循环递归
    WHILE sTempPar is not null
        DO
            #判断是否是第一个，不加的话第一个会为空
            IF sTemp != '' THEN
                SET sTemp = concat(sTemp, ',', sTempPar);
            ELSE
                SET sTemp = sTempPar;
            END IF;
            SELECT group_concat(t_sjjg)
            INTO sTempPar
            FROM t_zzjgxx
            where t_sjjg <> t_id
              and FIND_IN_SET(t_id, sTempPar) > 0;
        END WHILE;

    RETURN sTemp;
END;


CREATE DEFINER=`root`@`%` FUNCTION `getAreaParent`(rootId bigint) RETURNS varchar(10000)
BEGIN
  DECLARE sTemp VARCHAR(10000);
  DECLARE sTempPar VARCHAR(10000);
  SET sTemp = '';
  SET sTempPar = rootId;

  #循环递归
  WHILE sTempPar is not null DO
        #判断是否是第一个，不加的话第一个会为空
        IF sTemp != '' THEN
            SET sTemp = concat(sTempPar,',',sTemp);
        ELSE
            SET sTemp = sTempPar;
        END IF;
        SELECT group_concat(t_fjqhdm) INTO sTempPar FROM t_xzqhxx where t_fjqhdm<>t_qhdm and t_fjqhdm<>0	and FIND_IN_SET(t_qhdm,sTempPar)>0;
  END WHILE;

  RETURN sTemp;
END