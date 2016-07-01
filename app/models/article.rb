class Article < ApplicationRecord
  def self.generate_one
    Article.create({
      t_str_arr: ["fantasy", "fiction"],
      t_int_arr: [4, 5],
      t_hstore: { "color" => "blue", "resolution" => "800x600" },
      t_json: { kind: "user_renamed", change: ["jack", "john"], name: 'sunyafei', age: 27, school: ['河北工程', '行唐一中']},
      t_range: Date.new(2014, 2, 11)..Date.new(2014, 2, 12),
      # t_address: "(石家庄市,疙瘩头村)",
      t_status: "published",
      t_bit_8: "01010011",
      t_ip: "192.168.1.12",
      t_network: "192.168.2.0/24",
      t_mac_addr: "32:01:16:6d:05:ef",
      title: '李白',
      body: '仰天大笑出门去,我辈岂是蓬蒿人!'
      })
  end
end
