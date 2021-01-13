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
            cmd = New SqlCommand("palInsertarInforme")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
            cmd.Parameters.AddWithValue("@vchTituloInforme", dts._tituloInforme)
            cmd.Parameters.AddWithValue("@intIdEmpleados", dts._idEmpleados)
            cmd.Parameters.AddWithValue("@vchTipoInforme", dts._tipoInforme)
            cmd.Parameters.AddWithValue("@vchNumeroOficio", dts._numeroOficio)
            cmd.Parameters.AddWithValue("@dtiFechaAprobacion", dts._fechaAprobacion)
            cmd.Parameters.AddWithValue("@dtiFechaCulminacion", dts._fechaCulminacion)
            cmd.Parameters.AddWithValue("@dtiFechaTraslado", dts._fechaTraslado)
            cmd.Parameters.AddWithValue("@vchAvanceInforme", dts._avanceInforme)
            If cmd.ExecuteNonQuery Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        Finally

        End Try
    End Function
#End Region

#Region "Mostrar los datos de la tabla tblInformes"
    'EFECTO: Esta función muestra los datos de la tabla tblInformes
    'RECIBE: No require de parámetros
    'DEVUELVE: Devuelve los datos de la tabla tblInformes
    Public Function mostrarInforme() As DataTable
        Try
            cmd = New SqlCommand("palMostrarInforme")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
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

        End Try
    End Function
#End Region

#Region "Borrar datos a la tabla tblInformes"
    'EFECTO: Esta función elimina los datos especificos de la tabla tblInformes
    'RECIBE: Requiere el llamado de la Entidad de Informe
    'DEVUELVE: NO DEVUELVE
    Public Function borrarInforme(ByVal dts As Entidad_Informe) As Boolean
        Try
            cmd = New SqlCommand("palEliminarInforme")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
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

        End Try
    End Function
#End Region

#Region "Modificar datos a la tabla tblInformes"
    'EFECTO: Esta función modifica los datos para la tabla tblInformes
    'RECIBE: Requiere el llamado de la Entidad de Informe
    'DEVUELVE: NO DEVUELVE
    Public Function modificarInforme(ByVal dts As Entidad_Informe) As Boolean
        Try
            cmd = New SqlCommand("palModificarInforme")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
            cmd.Parameters.AddWithValue("@intIdInforme", dts._idInforme)
            cmd.Parameters.AddWithValue("@vchTituloInforme", dts._tituloInforme)
            cmd.Parameters.AddWithValue("@intIdEmpleados", dts._idEmpleados)
            cmd.Parameters.AddWithValue("@vchTipoInforme", dts._tipoInforme)
            cmd.Parameters.AddWithValue("@vchNumeroOficio", dts._numeroOficio)
            cmd.Parameters.AddWithValue("@dtiFechaAprobacion", dts._fechaAprobacion)
            cmd.Parameters.AddWithValue("@dtiFechaCulminacion", dts._fechaCulminacion)
            cmd.Parameters.AddWithValue("@dtiFechaTraslado", dts._fechaTraslado)
            cmd.Parameters.AddWithValue("@vchAvanceInforme", dts._avanceInforme)
            If cmd.ExecuteNonQuery Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        Finally

        End Try
    End Function
#End Region




End Class
