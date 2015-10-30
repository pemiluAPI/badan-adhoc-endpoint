class CreateAdhocs < ActiveRecord::Migration
  def change
    create_table :adhocs do |t|
    	t.string	:jenis_wilayah
    	t.string	:nama_wilayah
    	t.float		:jumlah_ppk
    	t.float 	:jumlah_pps
    	t.float 	:jumlah_tps
    	t.float 	:jumlah_kpps

      t.timestamps
    end
  end
end
