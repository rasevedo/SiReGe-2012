Imports System.Data.SqlClient
Imports CapEntidadesSiReGe

Public Class Datos_Informe

    Inherits conexion
    Dim cmd As New SqlCommand

    Public Function insertarInforme(ByVal dts As Entidad_Informe) As Boolean
        Try
            conectado()
            cmd = New SqlCommand("palInsertarInforme")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
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
            desconectado()
        End Try
    End Function

    Public Function mostrarInforme() As DataTable
        Try
            conectado()
            cmd = New SqlCommand("palMostrarInforme")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
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
            desconectado()
        End Try
    End Function

    Public Function borrarInforme(ByVal dts As Entidad_Informe) As Boolean
        Try
            conectado()
            cmd = New SqlCommand("palEliminarInforme")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
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
            desconectado()
        End Try
    End Function

    Public Function modificarInforme(ByVal dts As Entidad_Informe) As Boolean
        Try
            conectado()
            cmd = New SqlCommand("palModificarInforme")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
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
            desconectado()
        End Try
    End Function




End Class
