repeat task.wait() until game:IsLoaded()
if game.PlaceId ~= 131398325 then
    while true do
        task.wait()
    end
end

-- Loading the library
local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/InForsaken/TML/main/Solaris%20Library.lua"))()

local win = SolarisLib:New({
    Name = "Eclipse GUI",
    FolderToSave = "EclipseGUI"
  })

-- Loading the library
local teleport = win:Tab("Teleports")
local utility = win:Tab("Utility")
  
local boss = teleport:Section("Bosses")
local city = teleport:Section("Cities")
local utilities = utility:Section("Utilities")
local enables = utility:Section("Enables")

local user = game:GetService("Players").LocalPlayer.Name
local player = game:GetService("Players").LocalPlayer

local locTBO = "695.588501, 85.4963455, 2756.03271, 0.755978763, -1.7349933e-08, 0.65459615, 4.27031992e-08, 1, -2.28122001e-08, -0.65459615, 4.51988882e-08, 0.755978763"
local locKadee = "727.29248, 107.496353, 1785.83728, 0.556794524, 2.60836908e-09, 0.83065027, 3.83331127e-08, 1, -2.88352826e-08, -0.83065027, 4.78967372e-08, 0.556794524"
local locJudy = "611.769714, 75.0998077, -1387.81958, -0.892561495, 1.86099713e-09, -0.450925648, -5.27852553e-11, 1, 4.23154267e-09, 0.450925648, 3.80071441e-09, -0.892561495"
local locDemon = "-2709.60693, 78.4999771, 416.860809, 0.70128572, 1.14660086e-08, -0.712880313, -9.08581543e-10, 1, 1.51902544e-08, 0.712880313, -1.00049986e-08, 0.70128572"
local locKnight = "-101.512383, 85.4999924, 508.514832, 0.356125474, -1.11925749e-08, -0.934438169, -5.9924794e-08, 1, -3.48159155e-08, 0.934438169, 6.83948471e-08, 0.356125474"
local locCity = "494.000122, 87.7298279, 502.999939, -0.0175019484, 1.05737641e-07, 0.999846816, 7.18695281e-09, 1, -1.05628033e-07, -0.999846816, 5.33715561e-09, -0.0175019484"
local locDesert = "535.96936, 87.4999771, 2229.42163, -0.00187812373, 1.91051464e-09, -0.999998212, -3.22411486e-10, 1, 1.9111237e-09, 0.999998212, 3.26000255e-10, -0.00187812373"
local locVillage = "-416.356812, 86.4999847, -711.766968, -0.999965429, 6.27715491e-10, -0.00831575599, 5.76243664e-10, 1, 6.19206997e-09, 0.00831575599, 6.18706419e-09, -0.999965429"
local locShop = "426.000641, 86.7298203, 547.499207, 0.99999994, 1.50345212e-08, 0.00025941772, -1.4998319e-08, 1, -1.39557486e-07, -0.00025941772, 1.39553592e-07, 0.99999994"
local location

-- Functions
function tp(loc)
    location = CFrame.new(table.unpack(loc:gsub(" ",""):split(",")))
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = location
end

function buff()
    for x=15, 8, -1 do
        local buffs = {
            [1] = game:GetService("Players"):WaitForChild("SkyDragonLord"):WaitForChild("PlayerGui"):WaitForChild("SystemGUI"):WaitForChild("Shortcut"):WaitForChild("Line2"):WaitForChild("Line"):WaitForChild(x)
        }
        game:GetService("Players"):WaitForChild("SkyDragonLord"):WaitForChild("PlayerGui"):WaitForChild("SystemGUI"):WaitForChild("EventHandler"):WaitForChild("ShortcutButtonActivate"):FireServer(unpack(buffs))
        Wait(4.1)
    end
    
    for x=15, 14, -1 do
        local buffs = {
            [1] = game:GetService("Players"):WaitForChild(player.Name):WaitForChild("PlayerGui"):WaitForChild("SystemGUI"):WaitForChild("Shortcut"):WaitForChild("Line3"):WaitForChild("Line"):WaitForChild(x)
        }
        game:GetService("Players"):WaitForChild(player.Name):WaitForChild("PlayerGui"):WaitForChild("SystemGUI"):WaitForChild("EventHandler"):WaitForChild("ShortcutButtonActivate"):FireServer(unpack(buffs))
        Wait(0.1)
    end
end

-- Buttons
boss:Button("The Burning One", function()
    tp(locTBO)
end)

boss:Button("Kadee", function()
    tp(locKadee)
end)

boss:Button("Judy", function()
    tp(locJudy)
end)

boss:Button("Demon Lord", function()
    tp(locDemon)
end)

boss:Button("Evil Knight", function()
    tp(locKnight)
end)

city:Button("Imperial City", function()
    tp(locCity)
end)
  
city:Button("Deep Desert", function()
    tp(locDesert)
end)

city:Button("Rainbow Village", function()
    tp(locVillage)
end)

utilities:Button("Open Shop", function()
    local current = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    Wait(0.5)
    tp(locShop)
    Wait(1)
    local shop = {
        [1] = game:GetService("ReplicatedStorage"):WaitForChild("NPCService"):WaitForChild("Andrew, The Pharmacist")
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RemoteObject"):WaitForChild("SetNPCChatting"):FireServer(unpack(shop))
    Wait(1)
    tp(current)
end)

utilities:Button("Sell Items", function()
    for x=4, 72, 1 do
        local args = {
            [1] = x
        }
    
        game:GetService("Players"):WaitForChild(user):WaitForChild("PlayerGui"):WaitForChild("SystemGUI"):WaitForChild("EventHandler"):WaitForChild("onDragToSell"):FireServer(unpack(args))
    end
end)

utilities:Button("Buff Up", function()
    buff()
end)

enables:Button("Attack Speed + Range", function()
    player.AttackSpeed.Value = 1000
    player.AttackType.Value = "Ranged"
end)

enables:Button("Auto Pickup Items", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InForsaken/TML/main/Auto%20Pickup.lua"))()
end)
