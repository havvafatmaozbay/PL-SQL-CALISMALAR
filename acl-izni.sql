--ACL ACCESS CONTROL LIST 
--DBA YETKILI KULLANICIDAN OLUR
--C�Z�M
--CREATE AN ACL
--ADD PRIVIGELES
--ASSIGN THE ACL(BAGLANTI YAPILACAK ADRESE ACLI ATA)

SELECT * FROM DBA_NETWORK_ACLS;

BEGIN
    DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(
        ACL =>'http_permissions.xml',
        DESCRIPTION => 'HTTP ACCESS',
        principal =>'FATMA',
        is_grant=> TRUE,
        privilege =>'connect',
        START_DATE => NULL, END_DATE =>NULL
    );
        
END;

--2.ad�m
--pr�v�lege yoksa vercez

select * from dba_network_acl_privileges where principal = 'FATMA';

BEGIN
    DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(
        ACL =>'http_permissions.xml',
        principal =>'FATMA',
        is_grant=> TRUE,
        privilege =>'connect'
        );
END;


--3.ADIM = LU�TURRULAN ACCESS PRIVILEGE L�STES�N� HEDEF AKSESE ATAYACA�IZ
--HEDEF AKSES MERKEZ BANKASI

BEGIN
    DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(
        ACL =>'http_permissions.xml',
        HOST => 'www.tcmb.gov.tr',
        lower_port => 80,
        upper_port =>80
        );

END;




