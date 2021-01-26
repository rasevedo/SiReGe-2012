Imports System.Data.SqlClient
Imports CapEntidadesSiReGe

Public Class Datos_Gestiones

    Inherits Conexion
    Dim cmd As New SqlCommand


#Region "Insertar datos a la tabla tblGestiones"
    'EFECTO: Esta función inserta los datos para la tabla tblGestiones
    'RECIBE: Requiere el llamado de la Entidad de Gestiones
    'DEVUELVE: NO DEVUELVE
    Public Function insertarGestiones(ByVal dts As Entidad_Gestiones) As Boolean
        Try
            Conx.ConnectionString = CnnString

            cmd = New SqlCommand("palInsertarGestiones")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
            cmd.Connection.Open()

            cmd.Parameters.AddWithValue("@vchNombreFuncionario", dts._nombreFuncionario)
            cmd.Parameters.AddWithValue("@vchTipoGestiones", dts._tipoGestiones)
            cmd.Parameters.AddWithValue("@intCedulaUsuario", dts._cedulaUsuario)
            cmd.Parameters.AddWithValue("@vchNombreUsuario", dts._nombreUsuario)
            cmd.Parameters.AddWithValue("@vchTipoUsuario", dts._tipoUsuario)
            cmd.Parameters.AddWithValue("@dtiFechaIngreso", DateTime.Parse(dts._fechaIngreso))
            cmd.Parameters.AddWithValue("@vchConfidencialidadGestiones", dts._confidencialidadGestiones)
            cmd.Parameters.AddWithValue("@vchFuenteGeneradora", dts._fuenteGeneradora)
            cmd.Parameters.AddWithValue("@vchTipoServicio", dts._tipoServicio)
            cmd.Parameters.AddWithValue("@vchDireccionRegional", dts._direccionRegional)
            cmd.Parameters.AddWithValue("@vchSupervicionGestiones", dts._supervicionGestiones)
            cmd.Parameters.AddWithValue("@vchNombreCentroEducativo", dts._nombreCentroEducativo)
            cmd.Parameters.AddWithValue("@intIdUnidad", dts._idUnidad)
            cmd.Parameters.AddWithValue("@intIdDimension", dts._idDimension)
            cmd.Parameters.AddWithValue("@vchNumeroOficio", dts._numeroOficio)
            cmd.Parameters.AddWithValue("@vchDetalleGestiones", dts._detalleGestiones)
            cmd.Parameters.AddWithValue("@vchRespuestaGestiones", dts._respuestaGestiones)

            cmd.Parameters.AddWithValue("@intIdGestiones", SqlDbType.Int).Direction = ParameterDirection.Output

            If cmd.ExecuteNonQuery Then
                dts._idGestiones = cmd.Parameters("@intIdGestiones").Value.ToString()
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        Finally
            cmd.Connection.Close()
        End Try
    End Function
#End Region

#Region "Mostrar los datos de la tabla tblGestiones"
    'EFECTO: Esta función muestra los datos de la tabla tblGestiones
    'RECIBE: No require de parámetros
    'DEVUELVE: Devuelve los datos de la tabla tblGestiones
    Public Function mostrarGestiones() As DataTable
        Try
            Conx.ConnectionString = CnnString

            cmd = New SqlCommand("palMostrarGestiones")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
            cmd.Connection.Open()
            If cmd.ExecuteNonQuery Then
                Dim dt As New DataTable
                Dim da As New SqlDataAdapter(cmd)
                da.Fill(dt)
                Return dt
            Else
                Return Nothing
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
            Return Nothing
        Finally
            cmd.Connection.Close()
        End Try
    End Function
#End Region

#Region "Borrar datos a la tabla tblGestiones"
    'EFECTO: Esta función elimina los datos especificos de la tabla tblGestiones
    'RECIBE: Requiere el llamado de la Entidad de Gestiones
    'DEVUELVE: NO DEVUELVE
    Public Function borrarGestiones(ByVal dts As Entidad_Gestiones) As Boolean
        Try
            Conx.ConnectionString = CnnString

            cmd = New SqlCommand("palEliminarGestiones")

            cmd.Connection = Conx
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection.Open()

            cmd.Parameters.AddWithValue("@intIdGestiones", dts._idGestiones)

            If cmd.ExecuteNonQuery Then
                Return True
                MsgBox("Exito")               
            Else
                Return False
                MsgBox("Fallo")
            End If
        Catch ex As Exception
            MsgBox("Entro aqui: " + ex.Message)
            Return False
        Finally
            cmd.Connection.Close()
        End Try
    End Function
#End Region

#Region "Modificar datos a la tabla tblGestiones"
    'EFECTO: Esta función modifica los datos para la tabla tblGestiones
    'RECIBE: Requiere el llamado de la Entidad de Gestiones
    'DEVUELVE: NO DEVUELVE
    Public Function modificarGestiones(ByVal dts As Entidad_Gestiones) As Boolean
        Try
            Conx.ConnectionString = CnnString


            cmd = New SqlCommand("palModificarGestiones")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx

            cmd.Connection.Open()

            cmd.Parameters.AddWithValue("@intIdGestiones", dts._idGestiones)
            cmd.Parameters.AddWithValue("@vchNombreFuncionario", dts._nombreFuncionario)
            cmd.Parameters.AddWithValue("@vchTipoGestiones", dts._tipoGestiones)
            cmd.Parameters.AddWithValue("@intCedulaUsuario", dts._cedulaUsuario)
            cmd.Parameters.AddWithValue("@vchNombreUsuario", dts._nombreUsuario)
            cmd.Parameters.AddWithValue("@vchTipoUsuario", dts._tipoUsuario)
            cmd.Parameters.AddWithValue("@dtiFechaIngreso", Convert.ToDateTime(dts._fechaIngreso))
            cmd.Parameters.AddWithValue("@vchConfidencialidadGestiones", dts._confidencialidadGestiones)
            cmd.Parameters.AddWithValue("@vchFuenteGeneradora", dts._fuenteGeneradora)
            cmd.Parameters.AddWithValue("@vchTipoServicio", dts._tipoServicio)
            cmd.Parameters.AddWithValue("@vchDireccionRegional", dts._direccionRegional)
            cmd.Parameters.AddWithValue("@vchSupervicionGestiones", dts._supervicionGestiones)
            cmd.Parameters.AddWithValue("@vchNombreCentroEducativo", dts._nombreCentroEducativo)
            cmd.Parameters.AddWithValue("@intIdUnidad", dts._idUnidad)
            cmd.Parameters.AddWithValue("@intIdDimension", dts._idDimension)
            cmd.Parameters.AddWithValue("@vchNumeroOficio", dts._numeroOficio)
            cmd.Parameters.AddWithValue("@vchDetalleGestiones", dts._detalleGestiones)
            cmd.Parameters.AddWithValue("@vchRespuestaGestiones", dts._respuestaGestiones)

            If cmd.ExecuteNonQuery Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        Finally
            cmd.Connection.Close()
        End Try
    End Function
#End Region



End Class