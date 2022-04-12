local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "ChaosHub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

GUI:Notification{
	Title = "Game Detected",
	Text = "Legends Of Speed",
	Duration = 3,
	Callback = function() end
}

GUI:Notification{
	Title = "Discord",
	Text = "Make Sure To Join The Discord Server! :D",
	Duration = 3,
	Callback = function() end
}

GUI:Credit{
	Name = "Chaotic_Void",
	Description = "Hub Owner",
}

local Tab = GUI:Tab{
	Name = "Main",
	Icon = "rbxthumb://type=Asset&id=3517717568&w=150&h=150"
}

Tab:Button{
	Name = "Fire all Touch Interest",
	Description = nil,
	Callback = function() 
        fire()
    end
}

Tab:Button{
	Name = "Auto Collect Orbs",
	Description = nil,
	Callback = function() 
        get()
    end
}

Tab:Button{
	Name = "Auto Hoop",
	Description = nil,
	Callback = function() 
        ada()
    end
}

local Tab = GUI:Tab{
	Name = "Misc",
	Icon = "rbxthumb://type=Asset&id=3331928717&w=150&h=150"
}

Tab:Textbox{
	Name = "Gravity",
	Callback = function(text) 
        workspace.Gravity = text
    end
}

Tab:Button{
	Name = "Inf Jump",
	Description = nil,
	Callback = function() 
    local infjump = true
    game:GetService("UserInputService").JumpRequest:connect(function()
    if infjump then
    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
   end
end)
end
}

local Tab = GUI:Tab{
	Name = "Discord",
	Icon = "rbxthumb://type=Asset&id=9334666836&w=150&h=150"
}

Tab:Button{
	Name = "Copy Discord Server Invite",
	Description = nil,
	Callback = function()
        GUI:Notification{
            Title = "Discord",
            Text = "Discord Invite Has Been Copied!",
            Duration = 3,
            Callback = function() end
        }
        setclipboard("https://discord.gg/wk7Wer9rGk")
    end
}

function fire()
    spawn(function()
for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v.Name == "TouchInterest" and v.Parent then
        firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
    end
end
end)
end

function get()
spawn(function()
while wait(0.1) do
for i, v in pairs(game:GetService("Workspace").orbFolder:GetDescendants()) do
    if v.Name == "TouchInterest" and v.Parent then
        firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
    end
end
end
end)
end

function ada()
spawn(function()
while wait(1) do
    for i, v in pairs(game:GetService("Workspace").Hoops:GetChildren()) do
    firetouchinterest(v, game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, 0)
    wait()
    firetouchinterest(v, game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, 1)
    end
    end
end)
end