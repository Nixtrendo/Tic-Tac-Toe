using Godot;
using System;
using System.Net;
using System.Net.Sockets;
using System.IO;
public partial class Client : Node
{
	public string ip;
	public int port;

	private bool socketReady;
	private TcpClient socket;
	private NetworkStream stream;
	private StreamWriter writer;
	private StreamReader reader;
	
	Node2D Board;
	Node2D Menu;

	public bool isX = false;
	public bool isMyTurn = false;
	public String Username1 = "";
	public String Username2 = "";
	public override void _Ready()
	{
	}

	public bool ConnectToServer( string host, int port, string username)
	{
		GD.Print("Start connecting to server");
		if(socketReady)
		{
			GD.Print("Already connected");
			return false;
		}
		try
		{
			GD.Print("Connecting...");
			socket = new TcpClient(host, port);
			stream = socket.GetStream();
			writer = new StreamWriter(stream);
			reader = new StreamReader(stream);
			socketReady = true;
			Send("UN,"+username);
		}
		catch(Exception e)
		{
			GD.Print(e.Message);
		}
		GD.Print("Connected!");
		return socketReady;
	}

	public void Send(string data)
	{
		if(!socketReady)
		{
			return;
		}
		writer.WriteLine(data);
		writer.Flush();
	}
	private void OnIncomingData(string data)
	{
		string[] cmd = data.Split(',');
		String switchCheck = cmd[0];
		switch(switchCheck)
		{
			case "SG":
				isX = bool.Parse(cmd[1]);
				isMyTurn = isX;
				Menu = (Node2D)GetNode("/root/Menu");
				if (Menu != null)
				{
					Menu.Call("loadGame");
				}
				break;
			case "MM":
				int pos = int.Parse(cmd[1]);
				string turn = cmd[2];
				Board = (Node2D)GetNode("/root/Board");
				if(Board!=null)
				{
					Board.Call("make_move_opponent", pos,turn);
				}
				break;
			case "SON":
				string myName = cmd[1];
				string oppName = cmd[2];
				Board = (Node2D)GetNode("/root/Board");
				if(Board!=null)
				{
					Board.Call("setNames",myName,oppName);
				}
				break;
			case "EG":
				string Winner = cmd[1];
				isMyTurn = false;
				Board = (Node2D)GetNode("/root/Board");
				if(Board!=null)
				{
					Board.Call("setWinner",Winner);
				}
				break;
			default: 
				break;
		}
	}
	public override void _Process(double delta)
	{
		if(socketReady)
		{
			if(stream.DataAvailable)
			{
				string data = reader.ReadLine();
				if(data!=null)
				{
					OnIncomingData(data);
				}
			}
		}
	}
}
