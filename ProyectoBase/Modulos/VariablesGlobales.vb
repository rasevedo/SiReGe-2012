Module VariablesGlobales

    Public ConexionSQLServer As New SqlClient.SqlConnection

    Public _Funciones As New CapLogicaNegocioSiReGe.Funciones

    Public _WSIntegra2 As New CapLogicaNegocioSiReGe.Integra2.WebIntegra
    Public _WSSigrh As New CapLogicaNegocioSiReGe.SIGRH.WebSigrh

    Enum BaseDatos
        NombreBaseDatos = 1
    End Enum

End Module
