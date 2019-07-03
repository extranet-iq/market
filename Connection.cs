using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;

namespace GemCafe
{
    class Connection
    {
        static XmlDocument xdoc = new XmlDocument();
        public Connection()
        {
            try
            {
                xdoc.Load(Application.StartupPath + "\\config.xml");
                server = "" + xdoc.SelectSingleNode("app/server/ip").InnerText;
                port = "" + xdoc.SelectSingleNode("app/server/port").InnerText;
                sam_printer = "" + xdoc.SelectSingleNode("app/printer/sam").InnerText;
                emsonprinter = "" + xdoc.SelectSingleNode("app/printer/epson").InnerText;
                con = new MySqlConnection("SERVER="+server+";PORT=" + port + "; DATABASE=" + database + "; UID=" + UID + "; PASSWORD=" + password + ";charset=UTF8;SslMode=none");
            }

            catch (Exception) { }
        }
        public static string data_path = "\\Data\\";
        public static string server;
        public static string port;
        static string database = "gem";
        static string UID = "peshawa";
        static string password = "peshawa";
        public static string sam_printer;
        public static string emsonprinter;
        public MySqlConnection con ;

    }
}
