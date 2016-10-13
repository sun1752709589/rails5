class CreateArticles < ActiveRecord::Migration[5.0]
  def change
  #   execute <<-SQL
  #    DROP TYPE detail_address;
  #    CREATE TYPE detail_address AS
  #      (
  #        city VARCHAR(90),
  #        street VARCHAR(90)
  #      );
  #   SQL
  #  execute <<-SQL
  #    DROP TYPE article_status;
  #    CREATE TYPE article_status AS ENUM ('draft', 'published');
  #  SQL
  #
  #  enable_extension 'hstore' unless extension_enabled?('hstore')
  # #  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  #
  #   # create_table :articles, id: :uuid, default: 'gen_random_uuid()' do |t|
  #   create_table :articles do |t|
  #     t.hstore 't_hstore'
  #     t.binary 't_bin'
  #     t.string 't_str_arr', array: true
  #     t.integer 't_int_arr', array: true
  #     t.json 't_json'
  #     t.daterange 't_range'
  #     # t.column :t_address, :detail_address
  #     t.column :t_status, :article_status
  #     t.column :t_bit_8, "bit(8)"
  #     t.inet 't_ip'
  #     t.cidr 't_network'
  #     t.macaddr 't_mac_addr'
  #     t.string 'title'
  #     t.string 'body'
  #
  #     t.timestamps
  #   end
  #   add_index :articles, "to_tsvector('english', title || ' ' || body)", using: :gin, name: 'articles_idx_on_title_body'
  end
end
