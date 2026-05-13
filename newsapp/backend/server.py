from flask import Flask, jsonify
import requests
from flask_cors import CORS

app = Flask(__name__)
CORS(app) 

NEWS_ENDPOINT = "https://newsapi.org/v2/everything"
API_KEY = "a444c92ac15e4b16a34a7693f910993a"

@app.route('/news')
def news():
    params = {
        "q": "Kurdistan",
        "language": "en",
        "sortBy": "publishedAt",
        "apiKey": API_KEY
    }

    res = requests.get(NEWS_ENDPOINT, params=params)
    return jsonify(res.json())

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)