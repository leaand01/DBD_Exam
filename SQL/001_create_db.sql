-- Create local exam_DB if do not exist
if not exists (select * from sys.databases where name = 'exam_DB')
begin
	create database exam_DB;
end