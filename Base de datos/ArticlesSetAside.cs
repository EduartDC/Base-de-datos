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
    
    public partial class ArticlesSetAside
    {
        public int idArticlesSetAside { get; set; }
        public int discount { get; set; }
    
        public virtual SetAside SetAside { get; set; }
        public virtual Articles Article { get; set; }
    }
}
