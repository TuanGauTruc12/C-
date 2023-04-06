namespace StudyEnglish.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DanhMuc")]
    public partial class DanhMuc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DanhMuc()
        {
            Video = new HashSet<Video>();
        }

        [Key]
        public int maDanhMuc { get; set; }

        [StringLength(100)]
        public string tenDanhMuc { get; set; }

        [StringLength(50)]
        public string linkDanhMuc { get; set; }

        public int? maThuocTinh { get; set; }

        public virtual ThuocTinh ThuocTinh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Video> Video { get; set; }
    }
}
