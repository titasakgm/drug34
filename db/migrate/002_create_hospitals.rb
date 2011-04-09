class CreateHospitals < ActiveRecord::Migration
  def self.up
    create_table :hospitals do |t|
      t.string :hcode
      t.string :hname
    end
  end

  def self.down
    drop_table :hospitals
  end
end
