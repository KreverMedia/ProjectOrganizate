/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojos;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author spiro
 */
@Entity
@Table(name = "usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u")
    , @NamedQuery(name = "Usuario.findByIdusuario", query = "SELECT u FROM Usuario u WHERE u.idusuario = :idusuario")
    , @NamedQuery(name = "Usuario.findByNombre", query = "SELECT u FROM Usuario u WHERE u.nombre = :nombre")
    , @NamedQuery(name = "Usuario.findByApellido1", query = "SELECT u FROM Usuario u WHERE u.apellido1 = :apellido1")
    , @NamedQuery(name = "Usuario.findByApellido2", query = "SELECT u FROM Usuario u WHERE u.apellido2 = :apellido2")
    , @NamedQuery(name = "Usuario.findByDni", query = "SELECT u FROM Usuario u WHERE u.dni = :dni")
    , @NamedQuery(name = "Usuario.findByFechaNacimiento", query = "SELECT u FROM Usuario u WHERE u.fechaNacimiento = :fechaNacimiento")
    , @NamedQuery(name = "Usuario.findByEdad", query = "SELECT u FROM Usuario u WHERE u.edad = :edad")
    , @NamedQuery(name = "Usuario.findByCorreo", query = "SELECT u FROM Usuario u WHERE u.correo = :correo")
    , @NamedQuery(name = "Usuario.findByTelefono1", query = "SELECT u FROM Usuario u WHERE u.telefono1 = :telefono1")
    , @NamedQuery(name = "Usuario.findByTelefono2", query = "SELECT u FROM Usuario u WHERE u.telefono2 = :telefono2")
    , @NamedQuery(name = "Usuario.findByNumss", query = "SELECT u FROM Usuario u WHERE u.numss = :numss")
    , @NamedQuery(name = "Usuario.findByDireccion", query = "SELECT u FROM Usuario u WHERE u.direccion = :direccion")
    , @NamedQuery(name = "Usuario.findByLocalidad", query = "SELECT u FROM Usuario u WHERE u.localidad = :localidad")
    , @NamedQuery(name = "Usuario.findByProvincia", query = "SELECT u FROM Usuario u WHERE u.provincia = :provincia")
    , @NamedQuery(name = "Usuario.findByFechaIncorporacion", query = "SELECT u FROM Usuario u WHERE u.fechaIncorporacion = :fechaIncorporacion")
    , @NamedQuery(name = "Usuario.findByFechaFinalizacion", query = "SELECT u FROM Usuario u WHERE u.fechaFinalizacion = :fechaFinalizacion")
    , @NamedQuery(name = "Usuario.findByAntiguedad", query = "SELECT u FROM Usuario u WHERE u.antiguedad = :antiguedad")
    , @NamedQuery(name = "Usuario.findByEstudios", query = "SELECT u FROM Usuario u WHERE u.estudios = :estudios")
    , @NamedQuery(name = "Usuario.findByExperiencia", query = "SELECT u FROM Usuario u WHERE u.experiencia = :experiencia")
    , @NamedQuery(name = "Usuario.findByIdiomas", query = "SELECT u FROM Usuario u WHERE u.idiomas = :idiomas")
    , @NamedQuery(name = "Usuario.findByCargo", query = "SELECT u FROM Usuario u WHERE u.cargo = :cargo")
    , @NamedQuery(name = "Usuario.findBySueldoMensual", query = "SELECT u FROM Usuario u WHERE u.sueldoMensual = :sueldoMensual")
    , @NamedQuery(name = "Usuario.findByCotizacionPorcentaje", query = "SELECT u FROM Usuario u WHERE u.cotizacionPorcentaje = :cotizacionPorcentaje")
    , @NamedQuery(name = "Usuario.findByIdhorario", query = "SELECT u FROM Usuario u WHERE u.idhorario = :idhorario")
    , @NamedQuery(name = "Usuario.findByFoto", query = "SELECT u FROM Usuario u WHERE u.foto = :foto")
    , @NamedQuery(name = "Usuario.findByDocumentacion", query = "SELECT u FROM Usuario u WHERE u.documentacion = :documentacion")
    , @NamedQuery(name = "Usuario.findByPorcentajeDiscapacidad", query = "SELECT u FROM Usuario u WHERE u.porcentajeDiscapacidad = :porcentajeDiscapacidad")
    , @NamedQuery(name = "Usuario.findByNombreuser", query = "SELECT u FROM Usuario u WHERE u.nombreuser = :nombreuser")
    , @NamedQuery(name = "Usuario.findByPassword", query = "SELECT u FROM Usuario u WHERE u.password = :password")})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idusuario")
    private Integer idusuario;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "apellido1")
    private String apellido1;
    @Column(name = "apellido2")
    private String apellido2;
    @Column(name = "dni")
    private String dni;
    @Column(name = "fecha_nacimiento")
    @Temporal(TemporalType.DATE)
    private Date fechaNacimiento;
    @Column(name = "edad")
    private Integer edad;
    @Column(name = "correo")
    private String correo;
    @Column(name = "telefono1")
    private Integer telefono1;
    @Column(name = "telefono2")
    private Integer telefono2;
    @Column(name = "numss")
    private String numss;
    @Column(name = "direccion")
    private String direccion;
    @Column(name = "localidad")
    private String localidad;
    @Column(name = "provincia")
    private String provincia;
    @Column(name = "fecha_incorporacion")
    @Temporal(TemporalType.DATE)
    private Date fechaIncorporacion;
    @Column(name = "fecha_finalizacion")
    @Temporal(TemporalType.DATE)
    private Date fechaFinalizacion;
    @Column(name = "antiguedad")
    private Integer antiguedad;
    @Column(name = "estudios")
    private String estudios;
    @Column(name = "experiencia")
    private String experiencia;
    @Column(name = "idiomas")
    private String idiomas;
    @Column(name = "cargo")
    private String cargo;
    @Column(name = "sueldo_mensual")
    private Integer sueldoMensual;
    @Column(name = "cotizacion_porcentaje")
    private Integer cotizacionPorcentaje;
    @Column(name = "idhorario")
    private Integer idhorario;
    @Column(name = "foto")
    private String foto;
    @Column(name = "documentacion")
    private String documentacion;
    @Column(name = "porcentaje_discapacidad")
    private Integer porcentajeDiscapacidad;
    @Basic(optional = false)
    @Column(name = "nombreuser")
    private String nombreuser;
    @Basic(optional = false)
    @Column(name = "password")
    private String password;
    @JoinTable(name = "rol_usuario", joinColumns = {
        @JoinColumn(name = "idusuario", referencedColumnName = "idusuario")}, inverseJoinColumns = {
        @JoinColumn(name = "idrol", referencedColumnName = "idrol")})
    @ManyToMany
    private List<Rol> rolList;

    public Usuario() {
    }

    public Usuario(Integer idusuario) {
        this.idusuario = idusuario;
    }

    public Usuario(Integer idusuario, String nombre, String apellido1, String nombreuser, String password) {
        this.idusuario = idusuario;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.nombreuser = nombreuser;
        this.password = password;
    }

    public Integer getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Integer idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Integer getEdad() {
        return edad;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Integer getTelefono1() {
        return telefono1;
    }

    public void setTelefono1(Integer telefono1) {
        this.telefono1 = telefono1;
    }

    public Integer getTelefono2() {
        return telefono2;
    }

    public void setTelefono2(Integer telefono2) {
        this.telefono2 = telefono2;
    }

    public String getNumss() {
        return numss;
    }

    public void setNumss(String numss) {
        this.numss = numss;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public Date getFechaIncorporacion() {
        return fechaIncorporacion;
    }

    public void setFechaIncorporacion(Date fechaIncorporacion) {
        this.fechaIncorporacion = fechaIncorporacion;
    }

    public Date getFechaFinalizacion() {
        return fechaFinalizacion;
    }

    public void setFechaFinalizacion(Date fechaFinalizacion) {
        this.fechaFinalizacion = fechaFinalizacion;
    }

    public Integer getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(Integer antiguedad) {
        this.antiguedad = antiguedad;
    }

    public String getEstudios() {
        return estudios;
    }

    public void setEstudios(String estudios) {
        this.estudios = estudios;
    }

    public String getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(String experiencia) {
        this.experiencia = experiencia;
    }

    public String getIdiomas() {
        return idiomas;
    }

    public void setIdiomas(String idiomas) {
        this.idiomas = idiomas;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public Integer getSueldoMensual() {
        return sueldoMensual;
    }

    public void setSueldoMensual(Integer sueldoMensual) {
        this.sueldoMensual = sueldoMensual;
    }

    public Integer getCotizacionPorcentaje() {
        return cotizacionPorcentaje;
    }

    public void setCotizacionPorcentaje(Integer cotizacionPorcentaje) {
        this.cotizacionPorcentaje = cotizacionPorcentaje;
    }

    public Integer getIdhorario() {
        return idhorario;
    }

    public void setIdhorario(Integer idhorario) {
        this.idhorario = idhorario;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getDocumentacion() {
        return documentacion;
    }

    public void setDocumentacion(String documentacion) {
        this.documentacion = documentacion;
    }

    public Integer getPorcentajeDiscapacidad() {
        return porcentajeDiscapacidad;
    }

    public void setPorcentajeDiscapacidad(Integer porcentajeDiscapacidad) {
        this.porcentajeDiscapacidad = porcentajeDiscapacidad;
    }

    public String getNombreuser() {
        return nombreuser;
    }

    public void setNombreuser(String nombreuser) {
        this.nombreuser = nombreuser;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @XmlTransient
    public List<Rol> getRolList() {
        return rolList;
    }

    public void setRolList(List<Rol> rolList) {
        this.rolList = rolList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idusuario != null ? idusuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.idusuario == null && other.idusuario != null) || (this.idusuario != null && !this.idusuario.equals(other.idusuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "pojos.Usuario[ idusuario=" + idusuario + " ]";
    }
    
}
