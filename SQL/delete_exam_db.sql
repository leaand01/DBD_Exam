if exists (select * from sys.databases where name = 'exam_DB')
begin
    drop database exam_DB;
end
