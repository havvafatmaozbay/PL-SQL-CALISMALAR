-- JOB TANIMLAMA
--GUNLUKKUR PROCEDURUNUN HER GUN 11:59DA ÇALIÞMASINI SAÐLAR

BEGIN
    SYS.Dbms_Scheduler.Create_Job(
        job_name => 'TCMBKURGETIR1',
        job_type => 'STORED_PROCEDURE', --plsql block
        job_action =>'"FATMA"."WSL_GET_KURLAR"',
        Number_Of_Arguments => 0,
        START_DATE =>TO_TIMESTAMP_TZ('2021-12-05 11:59:00 Europe/Istanbul', 'YYYY-MM-DD HH24.MI.SS TZR'),
        REPEAT_INTERVAL => 'FREQ=DAILY;BYHOUR=11;BYMINUTE=59;BYSECOND=0',
        END_DATE => NULL,
        JOB_CLASS =>'"SYS"."DEFAULT_JOB_CLASS"',
        ENABLED => TRUE,
        AUTO_DROP =>FALSE , --TRUE DENIRSE BÝ KERE ÇALIÞIR VE YOK EDER
        COMMENTS => '',
        CREDENTIAL_NAME => NULL,
        DESTINATION_NAME =>NULL -- JOB ÇALIÞIP ÇALIÞMADIÐINDA MESAJ VERDÝRMEK ÝÇÝN
     );
     
END;