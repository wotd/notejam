from notejam import app
from notejam.config import Config 
from healthcheck import HealthCheck

app.config.from_object(Config)


def default_health_handler():
    return True, "OK"


health = HealthCheck()
health.add_check(default_health_handler)

app.add_url_rule("/health", "healthcheck", view_func=lambda: health.run())

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True, port=80)
