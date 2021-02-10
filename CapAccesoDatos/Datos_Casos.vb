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

            Conx.ConnectionString = CnnString

            cmd = New SqlCommand("palInsertarCasos")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx
            cmd.Connection.Open()

            cmd.Parameters.AddWithValue("@vchNumeroCasos", dts._numeroCasos)
            cmd.Parameters.AddWithValue("@vchEstadoCasos", dts._estadoCasos)
            cmd.Parameters.AddWithValue("@dtiFechaCasos", DateTime.Parse(dts._fechaCasos))
            cmd.Parameters.AddWithValue("@intCedulaDenuncianteCasos", dts._cedulaDenuncianteCasos)
            cmd.Parameters.AddWithValue("@vchNombreDenucianteCasos", dts._nombreDenuncianteCasos)
            cmd.Parameters.AddWithValue("@vchNombreFuncionario", dts._nombreFuncionario)
            cmd.Parameters.AddWithValue("@vchNombreCentroEducativo", dts._nombreCentroEducativo)
            cmd.Parameters.AddWithValue("@intIdUnidad", dts._idUnidad)
            cmd.Parameters.AddWithValue("@vchNumeroOficio", dts._numeroOficio)

            If dts._fechaOficio = "#12:00:00 AM#" Then
                cmd.Parameters.AddWithValue("@dtiFechaOficio", System.DBNull.Value)
            Else
                cmd.Parameters.AddWithValue("@dtiFechaOficio", dts._fechaOficio)
            End If

            cmd.Parameters.AddWithValue("@intIdDimension", dts._idDimension)
            cmd.Parameters.AddWithValue("@vchCondicionCasos", dts._condicionCasos)
            cmd.Parameters.AddWithValue("@vchDetalleInconformidadCasos", dts._detalleInconformidadCasos)
            cmd.Parameters.AddWithValue("@vchRespuestaCasos", dts._respuestaCasos)
            cmd.Parameters.AddWithValue("@vchValoracionAdmisibilidad", dts._valoracionAdmisibilidad)
            cmd.Parameters.AddWithValue("@vchVeredictoValoracionIngreso", dts._veredictoValoracionIngreso)
            cmd.Parameters.AddWithValue("@vchTrazabilidadCasos", dts._trazabilidadCasos)

            If dts._fechaRespuestaCasos = "#12:00:00 AM#" Then
                cmd.Parameters.AddWithValue("@dtiFechaRespuestaCasos", System.DBNull.Value)
            Else
                cmd.Parameters.AddWithValue("@dtiFechaRespuestaCasos", dts._fechaRespuestaCasos)
            End If

            If dts._fechaCerradoCasos = "#12:00:00 AM#" Then
                cmd.Parameters.AddWithValue("@dtiFechaCerradoCasos", System.DBNull.Value)
            Else
                cmd.Parameters.AddWithValue("@dtiFechaCerradoCasos", dts._fechaCerradoCasos)
            End If

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

#Region "Mostrar los datos de la tabla tblCasos"
    'EFECTO: Esta función muestra los datos de la tabla tblCasos
    'RECIBE: No require de parámetros
    'DEVUELVE: Devuelve los datos de la tabla tblCasos
    Public Function mostrarCasos() As DataTable
        Try
            Conx.ConnectionString = CnnString

            cmd = New SqlCommand("palMostrarCasos")
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

#Region "Borrar datos a la tabla tblCasos"
    'EFECTO: Esta función elimina los datos especificos de la tabla tblCasos
    'RECIBE: Requiere el llamado de la Entidad de Casos
    'DEVUELVE: NO DEVUELVE
    Public Function borrarCasos(ByVal dts As Entidad_Casos) As Boolean
        Try
            Conx.ConnectionString = CnnString

            cmd = New SqlCommand("palEliminarCasos")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx

            cmd.Connection.Open()
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
            cmd.Connection.Close()
        End Try
    End Function
#End Region

#Region "Modificar datos a la tabla tblCasos"
    'EFECTO: Esta función modifica los datos para la tabla tblCasos
    'RECIBE: Requiere el llamado de la Entidad de Casos
    'DEVUELVE: NO DEVUELVE
    Public Function modificarCasos(ByVal dts As Entidad_Casos) As Boolean
        Try
            Conx.ConnectionString = CnnString

            cmd = New SqlCommand("palModificarCasos")
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = Conx

            cmd.Connection.Open()
            cmd.Parameters.AddWithValue("@intIdCasos", dts._idCasos)
            cmd.Parameters.AddWithValue("@vchNumeroCasos", dts._numeroCasos)
            cmd.Parameters.AddWithValue("@vchEstadoCasos", dts._estadoCasos)
            cmd.Parameters.AddWithValue("@dtiFechaCasos", Convert.ToDateTime(dts._fechaCasos))
            cmd.Parameters.AddWithValue("@intCedulaDenuncianteCasos", dts._cedulaDenuncianteCasos)
            cmd.Parameters.AddWithValue("@vchNombreDenucianteCasos", dts._nombreDenuncianteCasos)
            cmd.Parameters.AddWithValue("@vchNombreFuncionario", dts._nombreFuncionario)
            cmd.Parameters.AddWithValue("@vchNombreCentroEducativo", dts._nombreCentroEducativo)
            ' cmd.Parameters.AddWithValue("@intIdUnidad", dts._idUnidad)
            cmd.Parameters.AddWithValue("@vchNumeroOficio", dts._numeroOficio)

            If dts._fechaOficio = "#12:00:00 AM#" Then
                cmd.Parameters.AddWithValue("@dtiFechaOficio", System.DBNull.Value)
            Else
                cmd.Parameters.AddWithValue("@dtiFechaOficio", dts._fechaOficio)
            End If

            ' cmd.Parameters.AddWithValue("@intIdDimension", dts._idDimension)
            cmd.Parameters.AddWithValue("@vchCondicionCasos", dts._condicionCasos)
            cmd.Parameters.AddWithValue("@vchDetalleInconformidadCasos", dts._detalleInconformidadCasos)
            cmd.Parameters.AddWithValue("@vchRespuestaCasos", dts._respuestaCasos)
            cmd.Parameters.AddWithValue("@vchValoracionAdmisibilidad", dts._valoracionAdmisibilidad)
            cmd.Parameters.AddWithValue("@vchVeredictoValoracionIngreso", dts._veredictoValoracionIngreso)
            cmd.Parameters.AddWithValue("@vchTrazabilidadCasos", dts._trazabilidadCasos)

            If dts._fechaRespuestaCasos = "#12:00:00 AM#" Then
                cmd.Parameters.AddWithValue("@dtiFechaRespuestaCasos", System.DBNull.Value)
            Else
                cmd.Parameters.AddWithValue("@dtiFechaRespuestaCasos", dts._fechaRespuestaCasos)
            End If

            If dts._fechaCerradoCasos = "#12:00:00 AM#" Then
                cmd.Parameters.AddWithValue("@dtiFechaCerradoCasos", System.DBNull.Value)
            Else
                cmd.Parameters.AddWithValue("@dtiFechaCerradoCasos", dts._fechaCerradoCasos)
            End If

            '------------------------------------------------------------------------------------'

            If dts._fechaCasoAvance1 = "#12:00:00 AM#" Then
                cmd.Parameters.AddWithValue("@dtiCasoAvanceFecha1", System.DBNull.Value)
            Else
                cmd.Parameters.AddWithValue("@dtiCasoAvanceFecha1", dts._fechaCasoAvance1)
            End If

            cmd.Parameters.AddWithValue("@vchCasoAvance1", dts._detalleCasoAvance1)

            If dts._fechaCasoAvance2 = "#12:00:00 AM#" Then
                cmd.Parameters.AddWithValue("@dtiCasoAvanceFecha2", System.DBNull.Value)
            Else
                cmd.Parameters.AddWithValue("@dtiCasoAvanceFecha2", dts._fechaCasoAvance2)
            End If

            cmd.Parameters.AddWithValue("@vchCasoAvance2", dts._detalleCasoAvance2)

            If dts._fechaCasoAvance3 = "#12:00:00 AM#" Then
                cmd.Parameters.AddWithValue("@dtiCasoAvanceFecha3", System.DBNull.Value)
            Else
                cmd.Parameters.AddWithValue("@dtiCasoAvanceFecha3", dts._fechaCasoAvance3)
            End If

            cmd.Parameters.AddWithValue("@vchCasoAvance3", dts._detalleCasoAvance3)

            If dts._fechaCasoAvance4 = "#12:00:00 AM#" Then
                cmd.Parameters.AddWithValue("@dtiCasoAvanceFecha4", System.DBNull.Value)
            Else
                cmd.Parameters.AddWithValue("@dtiCasoAvanceFecha4", dts._fechaCasoAvance4)
            End If

            cmd.Parameters.AddWithValue("@vchCasoAvance4", dts._detalleCasoAvance4)


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


#Region "Mostrar los datos de avance en tabla"
    'EFECTO: Esta función muestra los datos de la tabla tblCasos
    'RECIBE: No require de parámetros
    'DEVUELVE: Devuelve los datos de la tabla tblCasos
    Public Function mostrarAvancesCaso() As DataTable
        Try
            Conx.ConnectionString = CnnString
            cmd = New SqlCommand("palMostrarAvanceCasos")
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

End Class
