if !has('python')
	echo "Python support required."
	finish
end

function! GrabHN()

python3 << EOF

import urllib.request
import json
import vim

try:
    res = urllib.request.urlopen('http://api.ihackernews.com/page')
    data = res.read().decode('utf-8')
    pages = json.loads(data)
    del vim.current.buffer[:]

    vim.current.buffer.append("# Hacker News")
    vim.current.buffer.append("")

    for page in pages['items']:
        vim.current.buffer.append("- " + page['title'])
        vim.current.buffer.append("  " + len(page['title'])*"-")
        vim.current.buffer.append("  " + page['url'])
        vim.current.buffer.append("  http://news.ycombinator.com/item?id=" 
    	    + str(page['id']))
        vim.current.buffer.append("\n")

except Exception as e: 
    print(e)

EOF

endfunction

command! -nargs=0 GrabHN call GrabHN()
