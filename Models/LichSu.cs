namespace StudyEnglish.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LichSu")]
    public partial class LichSu
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int maNguoidung { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int maVideo { get; set; }

        public int maBt { get; set; }

        public DateTime? NgayLamBai { get; set; }

        public int? Diem { get; set; }

        public virtual BaiTap BaiTap { get; set; }

        public virtual Nguoidung Nguoidung { get; set; }

        public virtual Video Video { get; set; }
    }
}
