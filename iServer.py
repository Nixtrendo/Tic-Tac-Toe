import socket
from _thread import *
import time
IP = "127.0.0.1"
PORT= 4000

server_socket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
server_socket.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
server_socket.bind((IP,PORT))
server_socket.listen()
username1 = ''
username2 = ''
connectionUser1 = None
connectionUser2 = None
isGameStarted = False
def send(client_socket,msg):
    client_socket.send((msg+"\n").encode('utf-8'))

def client_handler(connection):
    global username1
    global username2
    global connectionUser1
    global connectionUser2
    global isGameStarted
    if connectionUser1 is None:
        connectionUser1 = connection
    elif connectionUser2 is None:
        connectionUser2 = connection
    while True:
        data = connection.recv(1024)
        message = data.decode('utf-8').strip()
        messageCommand = message.split(',')
        if not isGameStarted and username1 != '' and username2 == '':
                isGameStarted = True
                send(connectionUser1,"SG,true")
                send(connectionUser2,"SG,false")
        if messageCommand[0] == "UN":
            if username1 == '':
                username1 = messageCommand[1]
                print("User 1 connected: " +username1)
            elif username2 == '' and messageCommand[1] != username1:
                username2 = messageCommand[1]
                print("User 2 connected: "+username2)
        if messageCommand[0] == "MM":
            if messageCommand[2] == "X":
                send(connectionUser2,"MM,"+messageCommand[1]+","+"X")
            if messageCommand[2] == "O":
                send(connectionUser1,"MM,"+messageCommand[1]+","+"O")
        if messageCommand[0] == "GN":
            send(connectionUser1,"SON,"+username1+","+username2)
            send(connectionUser2,"SON,"+username2+","+username1)
        if messageCommand[0] == "W":
            if messageCommand[1] == "X":
                send(connectionUser1,"EG,"+username1)
                send(connectionUser2,"EG,"+username1)
                isGameStarted = False
                break
            elif messageCommand[1] == "O":
                send(connectionUser1,"EG,"+username2)
                send(connectionUser2,"EG,"+username2)
                isGameStarted = False
                break
            elif messageCommand[1] == "Draw":
                send(connectionUser1,"EG,Draw")
                send(connectionUser2,"EG,Draw")
                isGameStarted = False
                break
    if not isGameStarted:
        time.sleep(0.5)
        username1 =''
        username2 =''
        connection.close()
        connectionUser1 = None
        connectionUser2 = None
            
            

def accept_connections(ServerSocket):
    Client, address = ServerSocket.accept()
    print(f'Connected to: {address[0]}:{str(address[1])}')
    start_new_thread(client_handler, (Client, ))

while True:
    accept_connections(server_socket)
