using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace Comparisions
{
    public class UpdateSalary
    {
        public static string ConnectionString = "Server=.; Database =C21_DB1; User ID = sa; Password = 123456;";


        public static DataTable GetAllEmps()
        {
            DataTable dataTabl = new DataTable();

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                string query = "SELECT * FROM Employees2";

                SqlCommand command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    dataTabl.Load(reader);

                }catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
            return dataTabl;

        }

        public static int UpdateEmpsSalary(string Name, float Persentage)
        {
            int rowsAffected = 0;
            using (SqlConnection connection= new SqlConnection(ConnectionString))
            {
                string query = @"UPDATE Employees2 SET Salary = Salary * @Percentage WHERE Name = @Name";
                SqlCommand command= new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Name", Name);
                command.Parameters.AddWithValue("@Percentage", Persentage);

                try
                {
                    connection.Open();
                    rowsAffected = command.ExecuteNonQuery();
                    
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }

            }
            return rowsAffected;
        }

        public static float UpdateEmpsBonus(string Name, float Bonus)
        {
            float bonus= 0;
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                string query = @"Select Bonus = Salary * @Bonus from Employees2  WHERE Name = @Name";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Name", Name);
                command.Parameters.AddWithValue("@Bonus", Bonus);

                try
                {
                    connection.Open();
                    bonus = (float)command.ExecuteScalar();

                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }

            }
            return bonus;
        }

        public static string UpdateEmpsBonus(string Name, string rate)
        {
            string Rate ="";
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                string query = @"Select Rate = @rate from Employees2  WHERE Name = @Name";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Name", Name);
                command.Parameters.AddWithValue("@rate", rate);

                try
                {
                    connection.Open();
                    Rate = (string)command.ExecuteScalar();

                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }

            }
            return Rate;
        }
        public static void UpdateDatabase(DataTable dataTable)
        {
            string query = @"
        Use C21_DB1;
        UPDATE Employees2 SET Bonus = @Bonus WHERE Name = @Name"; // Modify query as needed

            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    foreach (DataRow row in dataTable.Rows)
                    {
                        if (row.RowState == DataRowState.Modified)
                        {
                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                // Add parameters to match the columns in your database
                                command.Parameters.AddWithValue("@Bonus", row["Bonus"]); // Replace "ColumnName" with actual column name
                                command.Parameters.AddWithValue("@Name", row["Name"]); // Replace "ID" with the primary key column name

                                command.ExecuteNonQuery();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception (e.g., log the error)
                Debug.WriteLine(ex.Message);
            }
        }

    }
}
