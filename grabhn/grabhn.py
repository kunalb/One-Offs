import urllib.request
import json

try:

    res = urllib.request.urlopen('http://api.ihackernews.com/page')
    data = res.read().decode('utf-8')
    pages = json.loads(data)

    print("# Hacker News\n")

    for page in pages['items']:
        print("- " + page['title'])
        print("  " + len(page['title'])*"-")
        print("  " + page['url'])
        print("  http://news.ycombinator.com/item?id=3154446" + str(page['id']))
        print("\n")

except Exception as e:
    print(e)
