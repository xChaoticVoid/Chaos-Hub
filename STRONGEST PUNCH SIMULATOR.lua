local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "ChaosHub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

GUI:Notification{
	Title = "Game Detected",
	Text = "STRONGEST PUNCH SIMULATOR",
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
	Name = "Auto Punch",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().a = state
        if state then
            punch()
        end
    end
}

Tab:Toggle{
	Name = "Auto Orbs(wait a little while after disable to stop)",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().Toggle = state
        if state then
            orb()
        end
    end
}

local Tab = GUI:Tab{
        Name = "Misc",
        Icon = "rbxthumb://type=Asset&id=3331928717&w=150&h=150"
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


    function punch()
        spawn(function()
        while getgenv().a == true do
        local ohTable1 = {
            [1] = "Activate_Punch"
        }
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(ohTable1)
        wait()
            end
        end)
        end

function orb()
spawn(function()
while wait() do
   if getgenv().Toggle == true then
       for _, v in pairs(game:GetService("Workspace").Map.Stages.Boosts:GetDescendants()) do
           if v:IsA("Model") then
                if v.Parent ~= nil then
                    if tonumber(v.Parent.Name) == game.Players.LocalPlayer.leaderstats.WORLD.Value then
                        wait(0.5)
                       v.PrimaryPart.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    end
               end
           end
       end
    end
end
end)
end