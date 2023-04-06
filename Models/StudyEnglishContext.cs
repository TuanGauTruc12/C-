using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace StudyEnglish.Models
{
    public partial class StudyEnglishContext : DbContext
    {
        public StudyEnglishContext()
            : base("name=StudyEnglishContext")
        {
        }

        public virtual DbSet<BaiTap> BaiTap { get; set; }
        public virtual DbSet<DanhMuc> DanhMuc { get; set; }
        public virtual DbSet<LichSu> LichSu { get; set; }
        public virtual DbSet<MucDo> MucDo { get; set; }
        public virtual DbSet<Nguoidung> Nguoidung { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<ThuocTinh> ThuocTinh { get; set; }
        public virtual DbSet<Video> Video { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BaiTap>()
                .Property(e => e.CauHoi)
                .IsUnicode(false);

            modelBuilder.Entity<BaiTap>()
                .Property(e => e.DA)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<BaiTap>()
                .HasMany(e => e.LichSu)
                .WithRequired(e => e.BaiTap)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DanhMuc>()
                .Property(e => e.linkDanhMuc)
                .IsUnicode(false);

            modelBuilder.Entity<MucDo>()
                .HasMany(e => e.Video)
                .WithRequired(e => e.MucDo)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Nguoidung>()
                .Property(e => e.tendangnhap)
                .IsUnicode(false);

            modelBuilder.Entity<Nguoidung>()
                .Property(e => e.matkhau)
                .IsUnicode(false);

            modelBuilder.Entity<Nguoidung>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Nguoidung>()
                .Property(e => e.dienthoai)
                .IsUnicode(false);

            modelBuilder.Entity<Nguoidung>()
                .HasMany(e => e.LichSu)
                .WithRequired(e => e.Nguoidung)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Video>()
                .Property(e => e.linkVideo)
                .IsUnicode(false);

            modelBuilder.Entity<Video>()
                .Property(e => e.image)
                .IsUnicode(false);

            modelBuilder.Entity<Video>()
                .Property(e => e.time)
                .IsUnicode(false);

            modelBuilder.Entity<Video>()
                .HasMany(e => e.BaiTap)
                .WithRequired(e => e.Video)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Video>()
                .HasMany(e => e.LichSu)
                .WithRequired(e => e.Video)
                .WillCascadeOnDelete(false);

           
        }
    }
}
