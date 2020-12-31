Imports System.Data.SqlClient
Imports CapEntidadesSiReGe

Public Class Datos_Casos

    Inherits conexion
    Dim cmd As New SqlCommand
    Public Function insertarCasos(ByVal dts As Entidad_Casos) As Boolean
        Try
            conectado()
            cmd = New SqlCommand("palInsertarCasos")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@vchNumeroCasos", dts._numeroCasos)
            cmd.Parameters.AddWithValue("@vchEstadoCasos", dts._estadoCasos)
            cmd.Parameters.AddWithValue("@dtiFechaCasos", Convert.ToDateTime(dts._fechaCasos))
            cmd.Parameters.AddWithValue("@intCedulaDenuncianteCasos", dts._cedulaDenuncianteCasos)
            cmd.Parameters.AddWithValue("@vchNombreDenucianteCasos", dts._nombreDenuncianteCasos)
            cmd.Parameters.AddWithValue("@intIdEmpleados", dts._idEmpleados)
            cmd.Parameters.AddWithValue("@vchNombreCentroEducativo", dts._nombreCentroEducativo)
            cmd.Parameters.AddWithValue("@intIdUnidad", dts._idUnidad)
            cmd.Parameters.AddWithValue("@vchNumeroOficio", dts._numeroOficio)
            cmd.Parameters.AddWithValue("@dtiFechaOficio", Convert.ToDateTime(dts._fechaOficio))
            cmd.Parameters.AddWithValue("@intIdDimension", dts._idDimension)
            cmd.Parameters.AddWithValue("@vchCondicionCasos", dts._condicionCasos)
            cmd.Parameters.AddWithValue("@vchDetalleInconformidadCasos", dts._detalleInconformidadCasos)
            cmd.Parameters.AddWithValue("@vchRespuestaCasos", dts._respuestaCasos)
            cmd.Parameters.AddWithValue("@vchValoracionAdmisibilidad", dts._valoracionAdmisibilidad)
            cmd.Parameters.AddWithValue("@vchVeredictoValoracionIngreso", dts._veredictoValoracionIngreso)
            cmd.Parameters.AddWithValue("@vchTrazabilidadCasos", dts._trazabilidadCasos)
            cmd.Parameters.AddWithValue("@dtiFechaRespuestaCasos", Convert.ToDateTime(dts._fechaRespuestaCasos))
            cmd.Parameters.AddWithValue("@dtiFechaCerradoCasos", Convert.ToDateTime(dts._fechaCerradoCasos))
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

    Public Function mostrarCasos() As DataTable
        Try
            conectado()
            cmd = New SqlCommand("palMostrarCasos")
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

    Public Function borrarCasos(ByVal dts As Entidad_Casos) As Boolean
        Try
            conectado()
            cmd = New SqlCommand("palEliminarCasos")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@intIdCasos", dts._idCasos)
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

    Public Function modificarCasos(ByVal dts As Entidad_Casos) As Boolean
        Try
            conectado()
            cmd = New SqlCommand("palModificarCasos")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = cnn
            cmd.Parameters.AddWithValue("@intIdCasos", dts._idCasos)
            cmd.Parameters.AddWithValue("@vchNumeroCasos", dts._numeroCasos)
            cmd.Parameters.AddWithValue("@vchEstadoCasos", dts._estadoCasos)
            cmd.Parameters.AddWithValue("@dtiFechaCasos", Convert.ToDateTime(dts._fechaCasos))
            cmd.Parameters.AddWithValue("@intCedulaDenuncianteCasos", dts._cedulaDenuncianteCasos)
            cmd.Parameters.AddWithValue("@vchNombreDenucianteCasos", dts._nombreDenuncianteCasos)
            cmd.Parameters.AddWithValue("@intIdEmpleados", dts._idEmpleados)
            cmd.Parameters.AddWithValue("@vchNombreCentroEducativo", dts._nombreCentroEducativo)
            cmd.Parameters.AddWithValue("@intIdUnidad", dts._idUnidad)
            cmd.Parameters.AddWithValue("@vchNumeroOficio", dts._numeroOficio)
            cmd.Parameters.AddWithValue("@dtiFechaOficio", Convert.ToDateTime(dts._fechaOficio))
            cmd.Parameters.AddWithValue("@intIdDimension", dts._idDimension)
            cmd.Parameters.AddWithValue("@vchCondicionCasos", dts._condicionCasos)
            cmd.Parameters.AddWithValue("@vchDetalleInconformidadCasos", dts._detalleInconformidadCasos)
            cmd.Parameters.AddWithValue("@vchRespuestaCasos", dts._respuestaCasos)
            cmd.Parameters.AddWithValue("@vchValoracionAdmisibilidad", dts._valoracionAdmisibilidad)
            cmd.Parameters.AddWithValue("@vchVeredictoValoracionIngreso", dts._veredictoValoracionIngreso)
            cmd.Parameters.AddWithValue("@vchTrazabilidadCasos", dts._trazabilidadCasos)
            cmd.Parameters.AddWithValue("@dtiFechaRespuestaCasos", Convert.ToDateTime(dts._fechaRespuestaCasos))
            cmd.Parameters.AddWithValue("@dtiFechaCerradoCasos", Convert.ToDateTime(dts._fechaCerradoCasos))
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
