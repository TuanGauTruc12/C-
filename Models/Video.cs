namespace StudyEnglish.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Video")]
    public partial class Video
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Video()
        {
            BaiTap = new HashSet<BaiTap>();
            LichSu = new HashSet<LichSu>();
        }

        [Key]
        public int maVideo { get; set; }

        public int maMucDo { get; set; }

        [Required]
        [StringLength(200)]
        public string tenVideo { get; set; }

        public string linkVideo { get; set; }

        public int? maDanhMuc { get; set; }

        public string image { get; set; }

        [StringLength(20)]
        public string time { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BaiTap> BaiTap { get; set; }

        public virtual DanhMuc DanhMuc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LichSu> LichSu { get; set; }

        public virtual MucDo MucDo { get; set; }
    }
}
