using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Form
{
    public partial class Cinepolis : System.Web.UI.Page
    {
        public string ConnStr { get; set; }
        public Cinepolis()
        {
            ConnStr = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AddPelicula();
            }
            GetPeliculas();
        }

        private void GetPeliculas()
        {
            try
            {
                var connstr = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;

                var connection = new SqlConnection(connstr);

                var command = new SqlCommand("SELECT * FROM pelicula;", connection);

                var da = new SqlDataAdapter(command);
                var ds = new DataSet();
                da.Fill(ds);

                gvPeliculas.DataSource = ds.Tables[0];
                gvPeliculas.DataBind();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", string.Format("Error" + ex.Message, true));
            }
        }

        private void AddPelicula()
        {
            var connection = new SqlConnection(ConnStr);
            try
            {
                var command = new SqlCommand("INSERT INTO[dbo].[pelicula]           ([peli_nombre],[peli_genero_id],[peli_clasificacion_id],[peli_anio],[peli_productor],[peli_sinopsis],[peli_poster_url],[peli_mini_url],[peli_rating],[peli_video_url],[peli_fecha_creacion],[peli_estatus]) VALUES ('Intensamente 2', 4, 1, 2024, 'Disney', 'Pelicula chida', 'https://prod-ripcut-delivery.disney-plus.net/v1/variantdisney/6252FCE1E1E5E967604E576CE1687E52B051E9C8573BC14A86D81F4212E405F7/scalewidth=1200&amp;aspectRatio=1.78&amp;format=webp', 'https://mx.web.img3.acsta.net/pictures/17/08/07/21/43/466493.jpg', 5.0, 'https://www.youtube.com/embed/9bol4Yyx9Gs', '2024-06-22 15:14', 1)", connection);

                connection.Open();
                var filasAfectadas = command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception ex)
            {
                connection.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", string.Format("Error" + ex.Message, true));
            }
        }
    }
}