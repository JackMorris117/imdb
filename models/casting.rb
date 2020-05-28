require_relative("../db/sql_runner")

class Casting
    attr_reader :movie_id, :star_id, :fee

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @movie_id = options[movie_id].to_i
        @star_id = options[star_id].to_i
        @fee = options[fee].to_i
    end

    def save()
        sql = "INSERT INTO castings
        (
          movie_id,
          star_id,
          fee
        )
        VALUES
        (
          $1,
          $2,
          $3
        )
        RETURNING id"
        values = [@movie_id, @star_id, @fee]
        casting = SqlRunner.run( sql, values ).first
        @id = casting['id'].to_i
    end
    def self.all()
        sql = "SELECT * FROM castings"
        castings = SqlRunner.run(sql)
        return Casting.map_items(castings)
    end

    def self.delete_all()
        sql = "DELETE FROM castings"
        SqlRunner.run(sql)
    end

    def Casting.map_items(casting_data)
        result = casting_data.map{|casting| Casting.new(casting)}
        return result
    end

    def movie()
        sql = "SELECT * FROM movies WHERE id = $1;"
        values = [@movies_id]
        movies = SqlRunner.run(sql, values)[0]
        return Movie.new(movie)
      end
    
      def star()
        sql = "SELECT * FROM stars WHERE id = $1;"
        values = [@star_id]
        star = SqlRunner.run(sql, values)[0]
        return Star.new(star)
      end
    
end
