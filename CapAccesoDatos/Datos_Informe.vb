Imports System.Data.SqlClient
Imports CapEntidadesSiReGe

Public Class Datos_Informe

    Inherits Conexion
    Dim cmd As New SqlCommand

#Region "Insertar datos a la tabla tblInformes"
    'EFECTO: Esta función inserta los datos para la tabla tblInformes
    'RECIBE: Requiere el llamado de la Entidad de Informe
    'DEVUELVE: NO DEVUELVE
    Public Function insertarInforme(ByVal dts As Entidad_Informe) As Boolean
        Try
            Conx.ConnectionString = CnnString

            cmd = New SqlCommand("palInsertarInforme")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
            cmd.Connection.Open()
            cmd.Parameters.AddWithValue("@vchTituloInforme", dts._tituloInforme)
            cmd.Parameters.AddWithValue("@vchNombreFuncionario", dts._nombreFuncionario)
            cmd.Parameters.AddWithValue("@vchTipoInforme", dts._tipoInforme)
            cmd.Parameters.AddWithValue("@vchNumeroOficio", dts._numeroOficio)
            cmd.Parameters.AddWithValue("@dtiFechaAprobacion", dts._fechaAprobacion)
            cmd.Parameters.AddWithValue("@dtiFechaCulminacion", dts._fechaCulminacion)
            cmd.Parameters.AddWithValue("@dtiFechaTraslado", dts._fechaTraslado)
            cmd.Parameters.AddWithValue("@vchAvanceInforme", dts._avanceInforme)
            cmd.Parameters.AddWithValue("@vchRemitido", dts._remitido)
            cmd.Parameters.AddWithValue("@vchHallazgo", dts._hallazgo)
            cmd.Parameters.AddWithValue("@vchRecomendaciones", dts._recomendaciones)
            cmd.Parameters.AddWithValue("@vchObservaciones", dts._observaciones)
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

#Region "Mostrar los datos de la tabla tblInformes"
    'EFECTO: Esta función muestra los datos de la tabla tblInformes
    'RECIBE: No require de parámetros
    'DEVUELVE: Devuelve los datos de la tabla tblInformes
    Public Function mostrarInforme() As DataTable
        Try
            Conx.ConnectionString = CnnString

            cmd = New SqlCommand("palMostrarInforme")
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
            cmd.Connection.Close()
            Return Nothing
        Finally
            cmd.Connection.Close()
        End Try
    End Function
#End Region

#Region "Borrar datos a la tabla tblInformes"
    'EFECTO: Esta función elimina los datos especificos de la tabla tblInformes
    'RECIBE: Requiere el llamado de la Entidad de Informe
    'DEVUELVE: NO DEVUELVE
    Public Function borrarInforme(ByVal dts As Entidad_Informe) As Boolean
        Try
            Conx.ConnectionString = CnnString

            cmd = New SqlCommand("palEliminarInforme")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
            cmd.Connection.Open()
            cmd.Parameters.AddWithValue("@intIdInforme", dts._idInforme)
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

#Region "Modificar datos a la tabla tblInformes"
    'EFECTO: Esta función modifica los datos para la tabla tblInformes
    'RECIBE: Requiere el llamado de la Entidad de Informe
    'DEVUELVE: NO DEVUELVE
    Public Function modificarInforme(ByVal dts As Entidad_Informe) As Boolean
        Try
            Conx.ConnectionString = CnnString
            cmd = New SqlCommand("palModificarInforme")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
            cmd.Connection.Open()
            cmd.Parameters.AddWithValue("@intIdInforme", dts._idInforme)
            cmd.Parameters.AddWithValue("@vchTituloInforme", dts._tituloInforme)
            cmd.Parameters.AddWithValue("@vchNombreFuncionario", dts._nombreFuncionario)
            cmd.Parameters.AddWithValue("@vchTipoInforme", dts._tipoInforme)
            cmd.Parameters.AddWithValue("@vchNumeroOficio", dts._numeroOficio)
            cmd.Parameters.AddWithValue("@dtiFechaAprobacion", dts._fechaAprobacion)
            cmd.Parameters.AddWithValue("@dtiFechaCulminacion", dts._fechaCulminacion)
            cmd.Parameters.AddWithValue("@dtiFechaTraslado", dts._fechaTraslado)
            cmd.Parameters.AddWithValue("@vchAvanceInforme", dts._avanceInforme)
            cmd.Parameters.AddWithValue("@vchRemitido", dts._remitido)
            cmd.Parameters.AddWithValue("@vchHallazgo", dts._hallazgo)
            cmd.Parameters.AddWithValue("@vchRecomendaciones", dts._recomendaciones)
            cmd.Parameters.AddWithValue("@vchObservaciones", dts._observaciones)
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
