using Microsoft.Data.SqlClient;
using SQLInjectionTest.Entities;

namespace SQLInjectionTest.Services
{
    public static class VulnerableDataAccess
    {
        private static string connectionString = "Server=localhost,1433;Database=master;User Id=sa;Password=MyStrong!Passw0rd;Encrypt=True;TrustServerCertificate=True;";
        public static List<Car> GetCarsByName(string name)
        {
            List<Car> cars = new List<Car>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @$"
                        SELECT [Make]
                              ,[Model]
                              ,[Color]
                        FROM [MyDatabase].[dbo].[Cars] c
                        JOIN [MyDatabase].[dbo].[Users] u ON u.Id = c.UserId
                        WHERE LOWER(u.Name) = '{name.ToLower()}';
                    ";
                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Car car = new Car
                    {
                        Make = reader.GetString(0),
                        Model = reader.GetString(1),
                        Color = reader.GetString(2)
                    };
                    cars.Add(car);
                }
            }

            return cars;
        }
    }
}
