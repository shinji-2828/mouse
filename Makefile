up:
	docker-compose up --build -d

down:
	docker-compose down

ps:
	docker-compose ps

reboot:
	docker-compose up --build -d
	docker-compose down

gen-models:
	docker-compose exec -T app sh /go/src/mouse/tools/sqlboiler/codegen.sh