using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace SISMed.App_Code
{
    public class Password
    {
        public static string HashPassword(string password)
        {
            SHA512 sha = new SHA512CryptoServiceProvider();
            StringBuilder sb = new StringBuilder();

            sha.ComputeHash(ASCIIEncoding.ASCII.GetBytes(password));
            byte[] result = sha.Hash;

            for (int i = 0; i < result.Length; i++)
            {
                sb.Append(result[i].ToString("x2"));
            }

            return sb.ToString();
        }
    }
}