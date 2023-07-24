using dominio;
using System;
using System.Security.Cryptography.X509Certificates;

namespace bussines
{
    public class UsuarioBussines
    {
        public void Actualizar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
               
                datos.setearConsulta("update USERS set nombre = @nombre, apellido = @apellido,email = @email, pass = @pass,  UrlImagenPerfil = @imagen where Id = @Id");
                datos.setearParametro("@imagen", usuario.ImagenPerfil != null ? usuario.ImagenPerfil : (object)DBNull.Value);
                datos.setearParametro("@nombre", usuario.Nombre);
                datos.setearParametro("@apellido", usuario.Apellido);
                datos.setearParametro("@email", usuario.email);
                datos.setearParametro("@pass", usuario.Pass);
                datos.setearParametro("@Id", usuario.Id);
                datos.ejecutarAccion();




            }
            catch (Exception ex)
            {

                throw  ex;
            }
            finally
            {
               datos.cerrarConexion();
            }
        }

        public int insertar(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("insertarNuevo");
                datos.setearParametro("@email", nuevo.email);
                datos.setearParametro("@pass", nuevo.Pass);

                return datos.ejecutarAccionScalar();


            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public bool login(Usuario usuario)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("select id, email, pass, admin,nombre,apellido, UrlIMagenPerfil from Users where email = @email and pass = @pass");
                accesoDatos.setearParametro("@email", usuario.email);
                accesoDatos.setearParametro("@pass", usuario.Pass);
                accesoDatos.setearParametro("@nombre", usuario.Nombre != null ? usuario.Nombre : (object)DBNull.Value);
                accesoDatos.setearParametro("@apellido", usuario.Apellido != null ? usuario.Apellido : (object)DBNull.Value);
                accesoDatos.setearParametro("@UrlImagenPerfil", usuario.ImagenPerfil != null ? usuario.ImagenPerfil : (object)DBNull.Value);
                accesoDatos.ejecutarLectura();

                if (accesoDatos.Lector.Read())
                {
                    usuario.Id = (int)accesoDatos.Lector["id"];
                    usuario.Admin = (bool)accesoDatos.Lector["admin"];
                    if (!(accesoDatos.Lector["nombre"] is DBNull))
                        usuario.Nombre = (string)accesoDatos.Lector["nombre"];
                    if (!(accesoDatos.Lector["apellido"] is DBNull))
                        usuario.Apellido = (string)accesoDatos.Lector["apellido"];

                    if(!(accesoDatos.Lector["UrlImagenPerfil"] is DBNull)) 
                        usuario.ImagenPerfil = (string)accesoDatos.Lector["UrlImagenPerfil"];
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
        
    }
    
}
