local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})
local client = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local world = {}
local egg = {}

OrionLib:AddTable(ReplicatedStorage["Assets"]["Worlds"],world)
OrionLib:AddTable(ReplicatedStorage["Assets"]["Eggs"],egg)

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Hatch",
Icon = "rbxassetid://",
PremiumOnly = false
})

T1:AddToggle({
  Name = "Auto Launch",
  Default = false,
  Callback = function(Value)
     _G.Lch = Value
      while wait() do
        if _G.Lch == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["LauncherService"]["RF"]["LaunchBegan"]:InvokeServer(client,false)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Collect drops/stars",
  Default = false,
  Callback = function(Value)
     _G.strs = Value
      while wait() do
        if _G.strs == false then break end
        for i,v in pairs(workspace["DROPS"]:GetChildren()) do
          game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["DropService"]["RE"]["PickupDrop"]:FireServer({v.Name})
        end
      end
  end    
})

T2:AddDropdown({
  Name = "Select world",
  Default = world[1],
  Options = world,
  Callback = function(Value)
      _G.tps = Value
  end    
})

T2:AddButton({
Name = "Teleport",
Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["PlotService"]["RF"]["ChangeWorld"]:InvokeServer(_G.tps)
  end    
})

T3:AddDropdown({
  Name = "Select egg",
  Default = egg[1],
  Options = egg,
  Callback = function(Value)
      _G.eggth = Value
  end    
})

T3:AddToggle({
  Name = "Auto Hatch",
  Default = false,
  Callback = function(Value)
     _G.lolhtc = Value
      while wait() do
        if _G.lolhtc == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["PetsService"]["RF"]["HatchEgg"]:InvokeServer(_G.eggth,1)
      end
  end    
})
