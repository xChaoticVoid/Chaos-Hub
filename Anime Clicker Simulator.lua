local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "ChaosHub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

GUI:Notification{
	Title = "Game Detected",
	Text = "Anime Clicker Simulator Gui Loaded!",
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
	Name = "Auto Click",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        if state then
        getgenv().Click = true
        while getgenv().Click == true do
        local args = {
            [1] = false,
            [2] = "Clicker!"
        }
        game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
        wait()
        end
            else
                getgenv().Click = false
            end
    end
}

Tab:Toggle{
	Name = "Auto Rebirth",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        if state then
            getgenv().Rebirth = true
            while getgenv().Rebirth == true do
            local args = {
                [1] = SelectRebirth
            }
            game:GetService("ReplicatedStorage").Remotes.RebirthRemote:FireServer(unpack(args))
            wait()
            end
            else
            getgenv().Rebirth = false
            end    
    end
}

Tab:Slider{
        Name = "Amount Of Rebirths",
        Default = 50,
        Min = 0,
        Max = 100,
        Callback = function(a) 
            SelectRebirth = a
        end
    }

ad = {}
for i,v in pairs(game:GetService("Workspace").Bosses:GetChildren()) do
if v:IsA('Model') then
   if not table.find(ad, v.Name) then
       table.insert(ad, v.Name)
   end 
end
end

local MyDropdown = Tab:Dropdown{
	Name = "Bosses",
	StartingText = "List Of Bosses",
	Description = nil,
	Items = 
    ad,
	Callback = function(c) return 
        Bosses == c
    end
}


Tab:Toggle{
	Name = "Auto Boss",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        if state then
            getgenv().boss = true
            while getgenv().boss == true do
        local args = {
            [1] = true,
            [2] = "Clicker!",
            [3] = Bosses
        }
        game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
        wait()
        end
        else
            getgenv().boss = false
        end
    end
}

local MyDropdown = Tab:Dropdown{
	Name = "Upgrades",
	StartingText = "List Of Upgrades",
	Description = nil,
	Items = 
        {"Run Speed", "More Rebirths", "Star Open Speed", "More Storage", "Crit Chance", "More Yen"},
	Callback = function(h) return 
        Upgrade == h
    end
}

Tab:Toggle{
	Name = "Auto Upgrade",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        if state then
            getgenv().U = true
            while getgenv().U == true do
            local args = {
                [1] = Upgrade
            }
            
            game:GetService("ReplicatedStorage").Remotes.RequestUpgrade:FireServer(unpack(args))
            wait(3)
        end
        else
            getgenv().U = false
        end
    end
}


Tab:Button{
	Name = "Daily Reward",
	Description = nil,
	Callback = function() 
        local args = {
            [1] = "DailyRewards"
        }
        game:GetService("ReplicatedStorage").Remotes.CollectChest:InvokeServer(unpack(args))
    end
}

local Tab = GUI:Tab{
	Name = "Misc",
	Icon = "rbxthumb://type=Asset&id=3331928717&w=150&h=150"
}

Tab:Textbox{
	Name = "Walk Speed",
	Callback = function(aaa) 
        local wad = aaa
        local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid;
        Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        Humanoid.WalkSpeed = wad
        end)
        Humanoid.WalkSpeed = wad
    end
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