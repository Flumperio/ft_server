docker build -t ftserver:latest /Users/juasanto/Desktop/ft_server/ --build-arg index_onoff=1
docker run -p 80:80 -p 443:443 ftserver:latest
