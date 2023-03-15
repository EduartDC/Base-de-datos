//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Base_de_datos
{
    using System;
    using System.Collections.Generic;
    
    public partial class Belongings
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Belongings()
        {
            this.ImagesBelongings = new HashSet<ImagesBelonging>();
        }
    
        public int idBelonging { get; set; }
        public double appraisalValue { get; set; }
        public string category { get; set; }
        public string description { get; set; }
        public string characteristics { get; set; }
        public double loanAmount { get; set; }
        public string serialNumber { get; set; }
    
        public virtual Contracts Contract { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ImagesBelonging> ImagesBelongings { get; set; }
    }
}
