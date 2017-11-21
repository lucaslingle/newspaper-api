from newspaper import Article
import datetime

def lambda_handler(event, context):
    url = event['url']
    article = Article(url)
    article.download()
    article.parse()

    title = article.title
    authors = article.authors
    authors = [a for a in authors if len(a) < 50]

    publication_dt = article.publish_date
    publication_date_str = ""
    if publication_dt:
        publication_date_str = datetime.datetime.strftime(publication_dt, "%Y-%m-%d'T'%H:%M:%S")

    content = article.text

    return {
        'url' : url,
        'domain' : article.source_url,
        'title' : title,
        'authors': authors,
        'publication_date' : publication_date_str,
        'content' : article.text
    }
