local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "Chaos",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

GUI:Notification{
	Title = "Game Detected",
	Text = "Prop Hunt!",
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

GUI:Credit{
	Name = "Kiriot22",
	Description = "KiriotHub's ESP lib",
}

local Tab = GUI:Tab{
	Name = "Visuals",
	Icon = "rbxthumb://type=Asset&id=5219208999&w=150&h=150"
}

Tab:Toggle{
	Name = "Enable Esp",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        ESP:Toggle(state)
    end
}

Tab:Toggle{
	Name = "Enable Players",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        ESP.Players = state
    end
}

Tab:Toggle{
	Name = "Enable Boxes",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        ESP.Boxes = state
    end
}

Tab:Toggle{
	Name = "Enable Names",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        ESP.Names = state
    end
}

Tab:Toggle{
	Name = "Enable Tracers",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        ESP.Tracers = state
    end
}

local Tab = GUI:Tab{
	Name = "Misc",
	Icon = "rbxthumb://type=Asset&id=3331928717&w=150&h=150"
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