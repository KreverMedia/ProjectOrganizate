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
@Table(name = "nuevacuenta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Nuevacuenta.findAll", query = "SELECT n FROM Nuevacuenta n")
    , @NamedQuery(name = "Nuevacuenta.findByCodigo", query = "SELECT n FROM Nuevacuenta n WHERE n.codigo = :codigo")
    , @NamedQuery(name = "Nuevacuenta.findByIdrol", query = "SELECT n FROM Nuevacuenta n WHERE n.idrol = :idrol")})
public class Nuevacuenta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "codigo")
    private String codigo;
    @Basic(optional = false)
    @Column(name = "idrol")
    private int idrol;

    public Nuevacuenta() {
    }

    public Nuevacuenta(String codigo) {
        this.codigo = codigo;
    }

    public Nuevacuenta(String codigo, int idrol) {
        this.codigo = codigo;
        this.idrol = idrol;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getIdrol() {
        return idrol;
    }

    public void setIdrol(int idrol) {
        this.idrol = idrol;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigo != null ? codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Nuevacuenta)) {
            return false;
        }
        Nuevacuenta other = (Nuevacuenta) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "pojos.Nuevacuenta[ codigo=" + codigo + " ]";
    }
    
}
