local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "ChaosHub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

GUI:Notification{
	Title = "Game Detected",
	Text = "Animal Simulator",
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

Tab:Toggle{
	Name = "Auto Eggs",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
    getgenv().a = state
    if state then
        egg()
    end
    end
}

Tab:Toggle{
	Name = "Auto Chest",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
    getgenv().b = state
    if state then
        chest()
    end
    end
}

local Tab = GUI:Tab{
	Name = "Misc",
	Icon = "rbxthumb://type=Asset&id=3331928717&w=150&h=150"
}

Tab:Slider{
	Name = "Walk Speed",
	Default = 50,
	Min = 0,
	Max = 200,
	Callback = function(speed) 
        pcall(function()
			game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = speed
        end)
    end
}

Tab:Slider{
	Name = "Jump Power",
	Default = 50,
	Min = 0,
	Max = 200,
	Callback = function(jump) 
        pcall(function()
			game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = jump
        end)
    end
}

Tab:Slider{
	Name = "Gravity",
	Default = 50,
	Min = 0,
	Max = 200,
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

function egg()
getgenv().a = true
while getgenv().a == true do
for i ,v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
   if v:IsA("MeshPart") then
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
   end
end
wait()
end
end

function chest()
    getgenv().b = true
    while getgenv().b == true do
    for i ,v in pairs(game:GetService("Workspace").Treasures:GetChildren()) do
       if v:IsA("MeshPart") then
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
       end
    end
    wait()
    end
    end