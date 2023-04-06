using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace StudyEnglish.Models
{
    public partial class Model2 : DbContext
    {
        public Model2()
            : base("name=Model2")
        {
        }

        public virtual DbSet<BaiTap> BaiTap { get; set; }
        public virtual DbSet<LichSu> LichSu { get; set; }
        public virtual DbSet<MucDo> MucDo { get; set; }
        public virtual DbSet<Nguoidung> Nguoidung { get; set; }
        public virtual DbSet<Video> Video { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BaiTap>()
                .Property(e => e.CauHoi)
                .IsUnicode(false);

            modelBuilder.Entity<BaiTap>()
                .Property(e => e.DA1)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<BaiTap>()
                .Property(e => e.DA2)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<BaiTap>()
                .Property(e => e.DA3)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<BaiTap>()
                .Property(e => e.DA4)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<BaiTap>()
                .Property(e => e.DA5)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<BaiTap>()
                .HasMany(e => e.LichSu)
                .WithRequired(e => e.BaiTap)
                .WillCascadeOnDelete(false);

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
