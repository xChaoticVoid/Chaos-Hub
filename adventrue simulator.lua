getgenv().a = false
getgenv().b = false
getgenv().c = false
getgenv().d = false
getgenv().e = false
getgenv().f = false


--Gui
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "ChaosHub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

GUI:Notification{
	Title = "Game Detected",
	Text = " ",
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
	Name = "Auto Attack",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().a = state
        if state then
            click()
                end
    end
}

Tab:Toggle{
	Name = "Auto Sell",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().b = state
        if state then
            sell()
                end
    end
}

Tab:Toggle{
	Name = "Auto Buy Sword",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().c = state
        if state then
            sword()
                end
    end
}

Tab:Toggle{
	Name = "Auto Buy Genetics",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().d = state
        if state then
            Genetics()
                end
    end
}

Tab:Toggle{
	Name = "Auto Buy hits",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().e = state
        if state then
            hits()
                end
    end
}

Tab:Toggle{
	Name = "Auto Buy Jumps",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().f = state
        if state then
            jumps()
                end
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



---Scripts

    function click()
    spawn(function()
    while getgenv().a == true do
    local ohTable1 = {
        ["Action"] = "Attack"
    }
    game:GetService("ReplicatedStorage").Remotes.Events.Weapon:FireServer(ohTable1)
    wait()
    end
    end)
    end
    
    function sell()
    spawn(function()
    while getgenv().b == true do
    local ohTable1 = {
	["Action"] = "Sell",
	["Request"] = "Sell"
    }
    game:GetService("ReplicatedStorage").Remotes.Events.Shop:FireServer(ohTable1)        wait()
    end
    end)
    end

    function sword()
    spawn(function()
    while getgenv().c == true do
    local ohTable1 = {
        ["Action"] = "Buy All",
        ["Category"] = "Weapons"
    }
    game:GetService("ReplicatedStorage").Remotes.Events.Shop:FireServer(ohTable1)
    wait()
    end
    end)
    end
    
    function Genetics()
    spawn(function()
    while getgenv().d == true do
    local ohTable1 = {
        ["Action"] = "Buy All",
        ["Category"] = "Genetics"
    }
    game:GetService("ReplicatedStorage").Remotes.Events.Shop:FireServer(ohTable1)
    wait()
    end
    end)
    end
    
    function hits()
    spawn(function()
    while getgenv().e == true do
    local ohTable1 = {
        ["Action"] = "Buy All",
        ["Category"] = "Boss Hits"
    }
    game:GetService("ReplicatedStorage").Remotes.Events.Skill:FireServer(ohTable1)
    wait()
    end
    end)
    end
    
    function jumps()
    spawn(function()
    while getgenv().f == true do
    local ohTable1 = {
        ["Action"] = "Buy All",
        ["Category"] = "Double Jumps"
    }
    game:GetService("ReplicatedStorage").Remotes.Events.Skill:FireServer(ohTable1)
    wait()
    end
    end)
    end