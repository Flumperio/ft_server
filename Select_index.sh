# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    index-on.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juasanto <juasanto@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/02 12:46:31 by juasanto          #+#    #+#              #
#    Updated: 2021/02/02 13:10:27 by juasanto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Selección de auto-index.

read -p "Para este contededor de Docker quieres auto-index ?. 1(Si), 2(No)", index_onoff
# if [[ $index_onoff != "1"] & [$index_onoff != "2" ]];
# 	then echo "La respuesta es 1 ó 2, así que vuelve a ejecutar esto malandrin.";
# 		exit;
# fi

if [ $index_onoff == "1" ]; then
		docker build -t ftserver:latest /Users/jcsantos/Documents/GitHub/ft_server/ --build-arg index_onoff=1
		docker run -p 80:80 -p 443:443 ftserver:latest
		exit;
fi
if [ $index_onoff == "2" ]; then
		docker build -t ftserver:latest /Users/jcsantos/Documents/GitHub/ft_server/ --build-arg index_onoff=0
		docker run -p 80:80 -p 443:443 ftserver:latest
		exit;
fi
echo "La respuesta es 1 ó 2, así que vuelve a intentarlo Campeón.";
bash /Users/jcsantos/Documents/GitHub/ft_server/index-on.sh
