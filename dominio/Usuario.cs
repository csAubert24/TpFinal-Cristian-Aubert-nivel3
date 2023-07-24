namespace dominio
{

    public class Usuario
    {
        public int Id { get; set; }
        public string email { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Pass { get; set; }
        public string ImagenPerfil { get; set; }
        public bool Admin { get; set; }

    }

}
