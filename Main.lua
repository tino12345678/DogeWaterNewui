repeat wait() until game:IsLoaded()

local LB_MODULE = {}

do
	local getService = function(name)
		repeat wait() until game:GetService(name) ~= nil
		return game:GetService(name)
	end
	
	local sendNotification = function(title, content)
		getService('StarterGui'):SetCore('SendNotification', {
			Title = title or 'No Title';
			Text = content or 'No Content';
		})
	end
	
	local Main = {
		Services = {
			['CoreGui'] = getService('CoreGui');
			['Players'] = getService('Players');
			['ReplicatedStorage'] = getService('ReplicatedStorage');
			['RunService'] = getService('RunService');
			['UserInputService'] = getService('UserInputService');
			['Workspace'] = getService('Workspace');
		};
	
		REQUIRED = {
			['getgenv'] = pcall(function()return getgenv end) and getgenv;
			-- ['Drawing'] = pcall(function()return Drawing end) and Drawing;
		};
	
		MISSING = {};
	
		COLOR = {
			WINDOW = Color3.fromRGB(40,40,40);
			WINDOW_CLOSED = Color3.fromRGB(80, 0, 140);
			WINDOW_OPENED = Color3.fromRGB(0, 0, 140);
			TEXT = Color3.fromRGB(180,180,180);
			BUTTONBG = Color3.fromRGB(60,60,60);
			BUTTONTEXT = Color3.fromRGB(180,180,180);
			SELECTEDBG = Color3.fromRGB(80,80,80);
			SELECTEDTEXT = Color3.fromRGB(200,200,200);
			TITLEBAR = Color3.fromRGB(30,30,30);
		}
	}

	for a,b in next, Main.REQUIRED do
		if not b then
			table.insert(Main.MISSING, a)
		end
	end

	if #Main.MISSING ~= 0 then
		sendNotification('[UI LIB] Missing Feature(s)', table.concat(Main.MISSING, ', '))
		script:Destroy()
		return nil
	end

	if getgenv().LBConnections and typeof(getgenv().LBConnections) == 'table' then
		for a,b in next, getgenv().LBConnections do
			b:Disconnect()
		end
	end

	for a,b in next, Main.Services.CoreGui:children() do
		if string.find(b.Name, 'LB UI Library') then
			b:Destroy()
		end
	end

	if getgenv().UILibrary_Loading then return nil end
	getgenv().UILibrary_Loading = true

	if Drawing then
		local draw = Drawing.new('Square')
		draw.Size = Vector2.new(0,0)
		draw.Color = Color3.fromRGB(20,20,20)
		draw.Transparency = 1
		draw.Filled = true
		draw.Visible = true
		for i=0,100,1 do
			Main.Services.RunService.RenderStepped:wait()
			draw.Position = Vector2.new(
				(workspace.CurrentCamera.ViewportSize.X / 2) - i,
				(workspace.CurrentCamera.ViewportSize.Y / 2) - i
			)
			draw.Size = Vector2.new(draw.Size.X+2,draw.Size.Y+2)
		end

		draw.Transparency = 1
		local text = Drawing.new('Text')
		text.Text = 'Dogewater\nis\nloading\nplease\nwait'
		text.Center = true
		text.Color = Color3.fromRGB(255,255,255)
		text.Size = 30
		text.Position = Vector2.new(
			(workspace.CurrentCamera.ViewportSize.X / 2),
			(workspace.CurrentCamera.ViewportSize.Y / 2)-92
		)
		text.Transparency = 0
		text.Visible = true
		for i=0,1,.01 do
			Main.Services.RunService.RenderStepped:wait()
			text.Transparency = i
		end
		text.Transparency = 1
		wait(1)
		for i=1,0,-.01 do
			Main.Services.RunService.RenderStepped:wait()
			text.Transparency = i
		end
		for i=100,0,-1 do
			Main.Services.RunService.RenderStepped:wait()
			draw.Position = Vector2.new(
				(workspace.CurrentCamera.ViewportSize.X / 2) - i,
				(workspace.CurrentCamera.ViewportSize.Y / 2) - i
			)
			draw.Size = Vector2.new(draw.Size.X-2,draw.Size.Y-2)
		end
		draw:Remove()
		text:Remove()
	end
    wait(2)
    local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local UI = GUI:CreateWindow("DogeWater.xyz v2","https://discord.gg/CS6BVVRdZY")

local AimHax = UI:addPage("Aimhax",2,false,6)
AimHax:addLabel("AimHax","HAX")
AimHax:addButton("Enable Aimlock Button",function()
    loadstring(game:HttpGet("https://pastebin.com/raw/L96cDMMb"))()
end)
AimHax:addLabel("Settings", "settings")
AimHax:addSlider("FovCircle",1,300,function(value)
    Aiming.FOV = value
end)
AimHax:addTextBox("Prediction","0.165 best",function(value)
    DaHoodSettings.Prediction = value
end)
AimHax:addToggle("ToggleFovCircle",function(value)
    Aiming.ShowFOV = false
    if value == false then 
        game.StarterGui:SetCore("SendNotification",{
            Title = "FovCircle";
            Text = "false";
        })
    else 
        Aiming.ShowFOV = true
        game.StarterGui:SetCore("SendNotification",{
            Title = "FovCircle";
            Text = "true";
        })
    end
end)
AimHax:addDropdown("Silent Aim Part",{"Head","HumanoidRootPart","UpperTorso"},function(value)
    Aiming.AimPart = value
end)



local player = UI:addPage("Player",2,false,6)
player:addLabel("player", "player")
player:addButton("FLY(z)", function(value)
	loadstring(game:HttpGet("https://pastebin.com/raw/KHLhNmH7"))()
end)
player:addButton("Speedglitch(x)", function(value)
	loadstring(game:HttpGet("https://pastebin.com/raw/9fpMEZCs"))()
end)
player:addButton("Realistic speed glitch(y)", function()
	local Player = game:GetService("Players").LocalPlayer
    local Mouse = Player:GetMouse()
    local SpeedGlitch = false
    local Wallet = Player.Backpack:FindFirstChild("Wallet")

    local UniversalAnimation = Instance.new("Animation")

    function stopTracks()
        for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
            if (v.Animation.AnimationId:match("rbxassetid")) then
                v:Stop()
            end
        end
    end

    function loadAnimation(id)
        if UniversalAnimation.AnimationId == id then
            stopTracks()
            UniversalAnimation.AnimationId = "1"
        else
            UniversalAnimation.AnimationId = id
            local animationTrack = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(UniversalAnimation)
            animationTrack:Play()
        end
    end

    Mouse.KeyDown:Connect(function(Key)
        if Key == "y" then
            SpeedGlitch = not SpeedGlitch
            if SpeedGlitch == true then
                stopTracks()
                loadAnimation("rbxassetid://3189777795")
                wait(1.5)
                Wallet.Parent = Player.Character
                wait(0.15)
                Player.Character:FindFirstChild("Wallet").Parent = Player.Backpack
                wait(0.05)
                repeat game:GetService("RunService").Heartbeat:wait()
                    keypress(0x49)
                    game:GetService("RunService").Heartbeat:wait()
                    keypress(0x4F)
                    game:GetService("RunService").Heartbeat:wait()
                    keyrelease(0x49)
                    game:GetService("RunService").Heartbeat:wait()
                    keyrelease(0x4F)
                    game:GetService("RunService").Heartbeat:wait()
                until SpeedGlitch == false
            end
        end
    end)
end)

player:addButton("AntiStomp", function(value)
	loadstring(game:HttpGet("https://pastebin.com/raw/SpfW1zL1"))()
end)
player:addButton("GodMOde", function(value)
	game.StarterGui:SetCore("SendNotification",{
		Title = "Godmode";
		Text = "rejoin to be normal";
	})
	loadstring(game:HttpGet("https://pastebin.com/raw/ec32x80f"))()
	wait(10)
	local name = game.Players.LocalPlayer.Name
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
	game.Players.LocalPlayer.Character:ClearAllChildren()
	local lol =    game.Workspace:WaitForChild(name)
	local money = Instance.new("Folder",game.Players.LocalPlayer.Character);money.Name = "FULLY_LOADED_CHAR"
	lol.Parent = game.Workspace.Players
	game.Players.LocalPlayer.Character:WaitForChild("BodyEffects")
	game.Players.LocalPlayer.Character.BodyEffects.BreakingParts:Destroy()
end)
player:addButton("Unjail", function(value)
	local plr = game.Players.LocalPlayer
	if plr.DataFolder.Currency.Value >= 125 then
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(-270.94, 20.327, -242.38)--Key
		plr.Character.HumanoidRootPart.CFrame = CFrame.new(-270.94, 20.327, -242.38)--Key(Backup)
		wait()
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Key] - $125"].ClickDetector)
		wait(.1)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Key] - $125"].ClickDetector)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Key] - $125"].ClickDetector)
		repeat wait() until plr.Backpack:FindFirstChild('[Key]')
		local Hum = plr.Character:FindFirstChildOfClass('Humanoid')
		if Hum.Health > 0 then
			key1 = plr.Backpack:FindFirstChild('[Key]')
			if key1 then
				Hum:EquipTool(key1)
				for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
					if v:isA("Tool") then
						plr.Character.Humanoid:EquipTool(key1)
						plr.Character.HumanoidRootPart.CFrame = CFrame.new(-485.668, 23.631, -285.169)--Bank
						v:Activate()
					elseif plr.DataFolder.Currency.Value < 125 then
						print('Not Enough Cash (Requied 125$)')	
						wait(1)
					end
				end
			end
		end
	end
end)

player:addLabel("Combat","Scroll down")

player:addButton("FistReach", function()
	LP = game.Players.LocalPlayer
	for i,v in ipairs(LP.Character:GetDescendants()) do
		if v:IsA("MeshPart") then v.Massless = true
			v.CanCollide = false
			v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)

		end
	end

	for i,v in ipairs(game.workspace:GetDescendants()) do
		if v:IsA("Seat") then 
			v.Disabled = true
		end
	end
	x = 80
	y = 80
	z = 80


	penis = Vector3.new(x,y,z)

	LP.Character.RightHand.Size = penis

	LP.Character.RightHand.Transparency = 1
	local selectionBox = Instance.new("SelectionBox",LP.Character.RightHand)
	selectionBox.Adornee = LP.Character.RightHand
	selectionBox.Color3 = Color3.new(0, 0.666667, 1)
end)

player:addButton("FreeFist", function()
	local localPlayer       = game:GetService("Players").LocalPlayer;
	local localCharacter    = localPlayer.Character
	local Mouse             = localPlayer:GetMouse();
	local FistControl       = false
	local LeftFist          = localCharacter.LeftHand;
	local RightFist         = localCharacter.RightHand;

	-- // Services
	local uis = game:GetService("UserInputService");

	-- // Coroutine Loop + Functions
	local loopFunction = function()
		LeftFist.CFrame  = CFrame.new(Mouse.Hit.p);
		RightFist.CFrame = CFrame.new(Mouse.Hit.p);
	end;

	local Loop

	local Start = function()
		Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);
	end;

	local Pause = function()
		Loop:Disconnect()
	end;

	-- // Hotkeys
	uis.InputBegan:connect(function(Key)
		if (Key.KeyCode == Enum.KeyCode.F) then
			if (FistControl == false) then
				FistControl = true;
				Start();
				pcall(function()
					localCharacter.RightHand.RightWrist:Remove();
					localCharacter.LeftHand.LeftWrist:Remove();
				end);
			elseif (FistControl == true) then
				FistControl = false;
				Pause();
				local rightwrist  = Instance.new("Motor6D");
				rightwrist.Name   = "RightWrist";
				rightwrist.Parent = localCharacter.RightHand;
				rightwrist.C0     = CFrame.new(1.18422506e-07, -0.5009287, -6.81715525e-18, 1, 0, 0, 0, 1, 0, 0, 0, 1);
				rightwrist.C1     = CFrame.new(3.55267503e-07, 0.125045404, 5.92112528e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1);
				rightwrist.Part0  = localCharacter.RightLowerArm;
				rightwrist.Part1  = localCharacter.RightHand;

				local leftwrist   = Instance.new("Motor6D");
				leftwrist.Name    = "LeftWrist";
				leftwrist.Parent  = localCharacter.LeftHand;
				leftwrist.C0      = CFrame.new(0.000475466368, -0.5009287, 7.59417072e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1);
				leftwrist.C1      = CFrame.new(0.000475821638, 0.125045404, 5.92112528e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1);
				leftwrist.Part0   = localCharacter.LeftLowerArm;
				leftwrist.Part1   = localCharacter.LeftHand;
			end;
		end;
	end);
end)
player:addSlider("Fov",70,120,function(value)
    game.workspace.CurrentCamera.FieldOfView = value
end)


local tp = UI:addPage("teleports",2,false,6)
tp:addLabel("Teleports")
tp:addButton("Revolver", function(value)
	getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-638.75, 18.8500004, -118.175011, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)
tp:addButton("Double Shotgun", function(value)
	getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1039.59985, 18.8513641, -256.449951, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)
tp:addButton("Tactical Shortgun", function(value)
	getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(470.877533, 45.1272316, -620.630676, 0.999999821, 0.000604254019, -2.60802135e-08, -0.000604254019, 0.999999821, -8.63220048e-05, -2.60802135e-08, 8.63220048e-05, 1)
	end)
tp:addButton("Food", function(value)
	getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-338.352173, 23.6826477, -297.2146, -0.0060598203, -1.03402984e-08, -0.999981582, -1.61653102e-09, 1, -1.03306892e-08, 0.999981582, 1.55389912e-09, -0.0060598203)
end)
tp:addButton("bank", function(value)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-318.891174, 80.2145309, -257.177429, 0.0479469746, -5.14644114e-08, 0.998850107, -3.12971538e-09, 1, 5.16738901e-08, -0.998850107, -5.60372015e-09, 0.0479469746)
end)
tp:addButton("RPG", function(value)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.815933, -22.9016266, -136.737762, 0.0339428484, -7.90177737e-08, 0.999423802, -4.7851227e-08, 1, 8.06884728e-08, -0.999423802, -5.0562452e-08, 0.0339428484)
end)
tp:addButton("UFO",function(value)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2.85052466, 132, -736.571106, -0.0460956171, -4.24733706e-08, -0.998937011, 7.26012459e-08, 1, -4.58687275e-08, 0.998937011, -7.46384217e-08, -0.0460956171)
end)
tp:addButton("admin guns", function(value)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-872.853516, -34.4276848, -538.013306, -0.999724388, -3.9898886e-08, -0.0234765243, -3.9204977e-08, 1, -3.00177518e-08, 0.0234765243, -2.90890814e-08, -0.999724388)
end)
tp:addButton("Admin guys#2", function(value)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-808.708557, -39.6492004, -932.789368, 0.999899805, 2.01343173e-08, -0.0141554065, -2.17800533e-08, 1, -1.16108232e-07, 0.0141554065, 1.16404912e-07, 0.999899805)
end)


local target = UI:addPage("target")
target:addLabel("Target gui")
target:addButton("Start target gui", function(value)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/GS21Official/DH-VictimMenu-Script/main/Dh%20VictimMenu%3A%20Script"))()
end)

local misc = UI:addPage("MISC")
misc:addLabel("MISC")
misc:addButton("Headless(client)", function(value)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tino12345678/headles/main/headless-cool"))()
end)
misc:addButton("korbloxclient", function(value)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/tino12345678/Korblox/main/KORBLOZ"))()
end)
misc:addButton("trashtalk(j)", function()
	local plr = game.Players.LocalPlayer
	repeat wait() until plr.Character
	local char = plr.Character
	
	local garbage = {
		"ur bad";
		"sonney boy";
		"ez";
		"my grandma has more skill than you";
		"seed";
		"sit son";
		"trash";
		"LOL";
		"LMAO";
		"imagine being you right now";
		"xd";
		"don't try LOL";
		"you lose";
		"why do you even try";
		"I didn't think being this bad was possible";
		"leave";
		"no skill";
		"so sad man.";
		"bad";
		"you're nothing";
		"lol";
		"so trash";
		"so bad";
		"ur salty";
		"salty";
		"look he's mad";
		"cry more";
		"keep crying";
		"cry baby";
		"hahaha I won";
		"no one likes u";
		"run 1s seed";
		"thank you for your time";
		"you were so close!";
		"better luck next time!";
		"rodent";
		"HAHA";
		"ill 5-0";
		"just quit";
		"time to take out the trash";
		"did you get worse?";
		"I'm surprised you haven't quit yet";
	
	
	
	
	
	
	
	
	
	
	
	}
	
	
	function TrashTalk(inputObject, gameProcessedEvent)
		if inputObject.KeyCode == Enum.KeyCode.J and gameProcessedEvent == false then        
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
			garbage[math.random(1,#garbage)],
			"All"
		)
		end
	end
end)
end









