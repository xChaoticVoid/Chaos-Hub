local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "ChaosHub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

GUI:Notification{
	Title = "Game Detected",
	Text = "Giant Dancing Simulator",
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
	Name = "Get All Eggs",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().egg = state
        if state then
            egg()
        end
    end
}

Tab:Toggle{
	Name = "Auto Gems",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().gem = state
        if state then
            gem()
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
getgenv().egg = true
local player = game.Players.LocalPlayer.Character.HumanoidRootPart
while getgenv().egg == true do
for i ,v in pairs(game:GetService("Workspace").EggHunt:GetDescendants()) do
  if v.Name == "MainPart" then
      player.CFrame = v.CFrame
      if v:FindFirstChild("ProximityPrompt") then
      fireproximityprompt(v.ProximityPrompt)
  end
end
end
wait()
end
end

function gem()
getgenv().gem = true
while getgenv().egg == true do
for i, v in pairs(game:GetService("Workspace").Gems:GetDescendants()) do
   if v.Name == "TouchInterest" and v.Parent then
       firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
   end
end
wait(2)
end
end