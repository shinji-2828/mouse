package postgres

import "database/sql"

type Client struct {
	DB *sql.DB
}

func Initialize() {

}
