import ibm_db
conn=ibm_db.connect("DATABASE=bludb;HOSTNAME=2d46b6b4-cbf6-40eb-bbce-6251e6ba0300.bs2io90l08kqb1od8lcg.databases.appdomain.cloud;PORT=32328;SECURITY=SSL;SSLServerCertificate=DigiCertGlobalRootCA.crt;UID=lsc91268;PWD=uq25o5poIDMBtVdL",'','')

print(conn)
print("CONNECTION SUCESSFULL")