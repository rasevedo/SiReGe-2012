Imports System.Data.SqlClient
Imports CapEntidadesSiReGe

Public Class Datos_Gestiones

    Inherits conexion
    Dim cmd As New SqlCommand

    Public Function insertarGestiones(ByVal dts As Entidad_Gestiones) As Boolean
        Try
            conectado()
            cmd = New SqlCommand("palInsertarGestiones")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@intIdEmpleados", dts._idEmpleados)
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
            cmd.Parameters.AddWithValue("@vchCategoriaGestiones", dts._categoriaGestiones)
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
            desconectado()
        End Try
    End Function

    Public Function mostrarGestiones() As DataTable
        Try
            conectado()
            cmd = New SqlCommand("palMostrarGestiones")
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

    Public Function borrarGestiones(ByVal dts As Entidad_Gestiones) As Boolean
        Try
            conectado()
            cmd = New SqlCommand("palEliminarGestiones")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@intIdGestiones", dts._idGestiones)
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

    Public Function modificarGestiones(ByVal dts As Entidad_Gestiones) As Boolean
        Try
            conectado()
            cmd = New SqlCommand("palModificarGestiones")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@intIdGestiones", dts._idGestiones)
            cmd.Parameters.AddWithValue("@intIdEmpleados", dts._idEmpleados)
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
            cmd.Parameters.AddWithValue("@vchCategoriaGestiones", dts._categoriaGestiones)
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
            desconectado()
        End Try
    End Function



End Class