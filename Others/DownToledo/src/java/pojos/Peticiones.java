/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojos;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author spiro
 */
@Entity
@Table(name = "peticiones")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Peticiones.findAll", query = "SELECT p FROM Peticiones p")
    , @NamedQuery(name = "Peticiones.findByIdpeticion", query = "SELECT p FROM Peticiones p WHERE p.idpeticion = :idpeticion")
    , @NamedQuery(name = "Peticiones.findByNombre", query = "SELECT p FROM Peticiones p WHERE p.nombre = :nombre")
    , @NamedQuery(name = "Peticiones.findByApellido1", query = "SELECT p FROM Peticiones p WHERE p.apellido1 = :apellido1")
    , @NamedQuery(name = "Peticiones.findByApellido2", query = "SELECT p FROM Peticiones p WHERE p.apellido2 = :apellido2")
    , @NamedQuery(name = "Peticiones.findByCorreo", query = "SELECT p FROM Peticiones p WHERE p.correo = :correo")
    , @NamedQuery(name = "Peticiones.findByDescripcion", query = "SELECT p FROM Peticiones p WHERE p.descripcion = :descripcion")})
public class Peticiones implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpeticion")
    private Integer idpeticion;
    @Column(name = "Nombre")
    private String nombre;
    @Column(name = "Apellido1")
    private String apellido1;
    @Column(name = "Apellido2")
    private String apellido2;
    @Column(name = "correo")
    private String correo;
    @Column(name = "descripcion")
    private String descripcion;

    public Peticiones() {
    }

    public Peticiones(Integer idpeticion) {
        this.idpeticion = idpeticion;
    }

    public Integer getIdpeticion() {
        return idpeticion;
    }

    public void setIdpeticion(Integer idpeticion) {
        this.idpeticion = idpeticion;
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

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idpeticion != null ? idpeticion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Peticiones)) {
            return false;
        }
        Peticiones other = (Peticiones) object;
        if ((this.idpeticion == null && other.idpeticion != null) || (this.idpeticion != null && !this.idpeticion.equals(other.idpeticion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "pojos.Peticiones[ idpeticion=" + idpeticion + " ]";
    }
    
}
