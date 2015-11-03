class Adhoc < ActiveRecord::Base
	JENISWILAYAH = {jenis_wilayah: [{nama: "PROPINSI"}, {nama: "KOTA"}, {nama: "KABUPATEN"}]}

	validates :jenis_wilayah, :nama_wilayah,
            presence: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }
  scope :by_jenis_wilayah, lambda{ |jenis_wilayah| where("jenis_wilayah = ?", jenis_wilayah) unless jenis_wilayah.nil? }
  scope :by_nama_wilayah, lambda{ |nama_wilayah| where("nama_wilayah like ?", "%#{nama_wilayah}%") unless nama_wilayah.nil? }

  def self.apiall(data = {})
    adhoc          = self.by_id(data[:id]).by_jenis_wilayah(data[:jenis_wilayah]).by_nama_wilayah(data[:nama_wilayah])
    paginate_adhoc = adhoc.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      adhoc: paginate_adhoc.map{|value| value.construct},
      count: paginate_adhoc.count,
      total: adhoc.count
		}
  end

  def construct
    return {
      id: id,
      jenis_wilayah: jenis_wilayah,
      nama_wilayah: nama_wilayah,
      jumlah_ppk: jumlah_ppk,
      jumlah_pps: jumlah_pps,
      jumlah_tps: jumlah_tps,
      jumlah_kpps: jumlah_kpps
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end

end
