from flask import Flask
app = Flask(__name__)
from flask import render_template

@app.route("/")
def demo_map():
    return render_template("demo.html",
        ip="172.24.40.89"
    )

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=8000,
        use_reloader=True,
        debug=True,
    )
