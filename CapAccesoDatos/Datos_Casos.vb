Imports System.Data.SqlClient
Imports CapEntidadesSiReGe

Public Class Datos_Casos

    Inherits Conexion
    Dim cmd As New SqlCommand

#Region "Insertar datos a la tabla tblCasos"
    'EFECTO: Esta función inserta los datos para la tabla tblCasos
    'RECIBE: Requiere el llamado de la Entidad de Casos
    'DEVUELVE: NO DEVUELVE
    Public Function insertarCasos(ByVal dts As Entidad_Casos) As Boolean
        Try

            cmd = New SqlCommand("palInsertarCasos")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
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

        End Try
    End Function
#End Region

#Region "Mostrar los datos de la tabla tblCasos"
    'EFECTO: Esta función muestra los datos de la tabla tblCasos
    'RECIBE: No require de parámetros
    'DEVUELVE: Devuelve los datos de la tabla tblCasos
    Public Function mostrarCasos() As DataTable
        Try

            cmd = New SqlCommand("palMostrarCasos")
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

#Region "Borrar datos a la tabla tblCasos"
    'EFECTO: Esta función elimina los datos especificos de la tabla tblCasos
    'RECIBE: Requiere el llamado de la Entidad de Casos
    'DEVUELVE: NO DEVUELVE
    Public Function borrarCasos(ByVal dts As Entidad_Casos) As Boolean
        Try

            cmd = New SqlCommand("palEliminarCasos")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
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

        End Try
    End Function
#End Region

#Region "Modificar datos a la tabla tblCasos"
    'EFECTO: Esta función modifica los datos para la tabla tblCasos
    'RECIBE: Requiere el llamado de la Entidad de Casos
    'DEVUELVE: NO DEVUELVE
    Public Function modificarCasos(ByVal dts As Entidad_Casos) As Boolean
        Try

            cmd = New SqlCommand("palModificarCasos")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
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

        End Try
    End Function
#End Region

End Class
