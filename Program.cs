// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");
using IBM.Data.Db2;
// See https://aka.ms/new-console-template for more information
Console.WriteLine("Hello, World!!!");
Console.WriteLine("Using DB2 .NET provider");
string connString = "Database=sample;server=waldevdbctw1001.dev.rocketsoftware.com:50000;uid=db2admin;pwd=Welcome2Rocket;";
DB2Connection con1 = new DB2Connection(connString);
DB2Connection con2 = new DB2Connection(connString);
/*DB2Connection con3 = new DB2Connection(connString);
DB2Connection con4 = new DB2Connection(connString);*/

con1.Open();
Console.WriteLine("con1 Connection Open");
Console.WriteLine(con1.InternalOperation1());

con1.Close();
Console.WriteLine("Con1 connection closed");
