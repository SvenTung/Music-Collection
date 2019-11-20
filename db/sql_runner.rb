require 'pg'
class Runner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'music_collection', host: 'localhost'})
      db.prepare('code', sql)
      result = db.exec_prepared('code', values)
    ensure
      db.close if db != nil
    end
    return result
  end

end
