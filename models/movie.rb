class Movie

    attr_reader :id, :title, :genre

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @genre = options['genre']
    end

    def save()
        sql = "INSERT INTO movies
        (
          id,
          title,
          genre
        )
        VALUES
        (
          $1,
          $2,
          $3
        )
        RETURNING id"
        values = [@id, @title, @genre]
        movie = SqlRunner.run( sql, values ).first
        @id = movie['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM movies"
        SqlRunner.run(sql)
    end
end
