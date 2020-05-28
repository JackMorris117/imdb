require_relative("../db/sql_runner")

class Star

    attr_reader :first_name, :last_name, :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
    end

    def save()
        sql = "INSERT INTO stars
        (
          first_name,
          last_name
        )
        VALUES
        (
          $1,
          $2
        )
        RETURNING id"
        values = [@first_name, @last_name]
        star = SqlRunner.run( sql, values ).first
        @id = star['id'].to_i
    end

    def movies()
        sql = "SELECT movies.*
        FROM movies
        INNER JOIN castings
        ON castings.movies_id = movies.id
        WHERE star_id = $1"
        values = [@id]
        movies = SqlRunner.run(sql, values)
        return Movie.map_items(movies)
    end


    def self.all()
        sql = "SELECT * FROM stars"
        stars = SqlRunner.run(sql)
        return Star.map_items(stars)
    end

    def self.delete_all()
        sql = "DELETE FROM stars"
        SqlRunner.run(sql)
    end

    def Star.map_items(star_data)
        result = star_data.map{|star| Star.new(star)}
        return result
    end

end
