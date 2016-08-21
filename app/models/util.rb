class Util
  # select op_code,count(*) as op_sum from logs where time>='2016-08-21 08:30:00' and time <='2016-08-21 08:45:00' group by op_code order by op_sum desc
  # select op_code,count(*) as op_sum from logs where time>='2016-08-21 09:15:00' and time <='2016-08-21 09:30:00' group by op_code order by op_sum desc
  # select op_code,count(*) as op_sum from logs where time>='2016-08-21 09:35:00' and time <='2016-08-21 09:50:00' group by op_code order by op_sum desc
  # select op_code,count(*) as op_sum from logs where time>='2016-08-21 10:00:00' and time <='2016-08-21 10:15:00' group by op_code order by op_sum desc
  def self.op_sum(s, e)
    results = ActiveRecord::Base.connection.execute("select op_code,count(*) as op_sum from logs where time>='#{s}' and time <='#{e}' group by op_code order by op_sum desc").to_a
    results.each do |item|
      item['op_human'] = to_human(item['op_code'])
    end
    results.select{|x| x['op_sum'] > 100}
  end

  # '2016-08-21 09:13:00','2016-08-21 09:52:00'
  # '2016-08-21 08:00:00','2016-08-21 08:39:00'
  def self.new_teleport
    alert = ActiveRecord::Base.connection.execute("select teleport_addr from logs where time>='2016-08-21 09:13:00' and time <='2016-08-21 09:52:00'").to_a.map{|x| x['teleport_addr']}.compact.uniq
    normal = ActiveRecord::Base.connection.execute("select teleport_addr from logs where time>='2016-08-21 08:00:00' and time <='2016-08-21 08:39:00'").to_a.map{|x| x['teleport_addr']}.compact.uniq
    binding.pry
  end

  # '2016-08-21 09:13:00','2016-08-21 09:52:00'
  # '2016-08-21 08:00:00','2016-08-21 08:39:00'
  def self.new_device_ip
    alert = ActiveRecord::Base.connection.execute("select device_ip from logs where time>='2016-08-21 09:13:00' and time <='2016-08-21 09:52:00'").to_a.map{|x| x['device_ip']}.compact.uniq
    normal = ActiveRecord::Base.connection.execute("select device_ip from logs where time>='2016-08-21 08:00:00' and time <='2016-08-21 08:39:00'").to_a.map{|x| x['device_ip']}.compact.uniq
    binding.pry
  end

  # '2016-08-21 09:13:00','2016-08-21 09:52:00'
  # '2016-08-21 08:00:00','2016-08-21 08:39:00'
  def self.top_op_code_device_ip
    alert = ActiveRecord::Base.connection.execute("select device_ip,op_code,count(*) as op_sum from logs where time>='2016-08-21 09:13:00' and time <='2016-08-21 09:52:00' group by device_ip,op_code order by op_sum desc").to_a
    normal = ActiveRecord::Base.connection.execute("select device_ip,op_code,count(*) as op_sum from logs where time>='2016-08-21 08:00:00' and time <='2016-08-21 08:39:00' group by device_ip,op_code order by op_sum desc").to_a
    alert.each do |item|
      item['op_human'] = to_human(item['op_code'])
    end
    alert.select!{|x| x['op_sum'] > 100}
    normal.each do |item|
      item['op_human'] = to_human(item['op_code'])
    end
    normal.select!{|x| x['op_sum'] > 100}
    binding.pry
  end

  def self.to_human(str)
    return if str.size != 4
    str.scan(/../).map{|x| x.to_i(16).chr}.join
  end
end