
Este script automatiza a instalação e configuração do NetTime, um serviço que substitui o Time Provider padrão do Windows. Ele configura o NetTime para sincronizar o horário do sistema usando os servidores NTP do Brasil.

Como Funciona
Baixa a versão mais recente do instalador do NetTime.
Instala o NetTime silenciosamente como um serviço do Windows.
Configura os servidores NTP brasileiros no arquivo NetTime.ini:
a.ntp.br
b.ntp.br
c.ntp.br
pool.ntp.br
Define o serviço NetTimeSvc para iniciar automaticamente.
Exclui o executável para manter o sistema limpo.
Reinicia o serviço para aplicar as configurações.
Importante
Sempre verifique o link para a última versão do NetTime antes de executar o script: https://www.timesynctool.com/.
O script atual está configurado para baixar a versão 3.14. Se houver uma versão mais recente, atualize o link no script.
Como Usar
Baixe o arquivo setup-nettime.bat do repositório.
Execute o arquivo como Administrador:
Clique com o botão direito e selecione Executar como administrador.
O script fará todo o processo automaticamente.
