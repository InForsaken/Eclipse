local drops
local items = {
    -- General
    "Skill Enhancement Stone",
    "Immortal Skill Stone",
    "Forge Preservation Stone",
    "Eternal Fragment",

    -- The Burning One
    "Burning Skull",

    -- Kadee
    "Cursed Emblem Fragment (Left)",
    "Cursed Emblem Fragment (Right)",
    "Kadee's Ring",
    "Kadee's Necklace",
    "Kadee's Earring",
    "Kadee's Boots",
    "Kadee's Jewel",
    "Kadee's Essence",
    "Kadee's Energy",
    
    -- Judy
    "Judy's Wings",
    "Judy's Staff Fragment",
    "Judy's Essence",
    "Judy's Energy",

    -- Demon Lord
    "Demon's Horn",
    "Demon's Essence",

    -- Evil Knight
    "Knight's Ring",
    "Knight's Necklace",
    "Knight's Earring",

    -- Super Stones
    "Super Weapon Attack Stone",
    "Super Attack Speed Stone",
    "Super Absorb Stone",
    "Super WalkSpeed Stone",
    "Super Reflect Stone",
    "Super Critical Stone",
    "Super Protection Stone",
    "Super Casting Speed Stone"
}

while true do
    drops = game:GetService("ReplicatedStorage"):WaitForChild("DropService"):WaitForChild("DropDatas"):GetChildren()
    for x=1, #drops, 1 do
        for y=1, #items, 1 do
            if tostring(drops[x]) == items[y] then
                print("Trying to pick up: "..items[y])
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("DropService"):WaitForChild("DropDatas"):WaitForChild(items[y])
                }
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteObject"):WaitForChild("SetDataTarget"):FireServer(unpack(args))
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteObject"):WaitForChild("RequestItemTake"):FireServer()
            end
        end
        Wait(0.1)
    end
    Wait(0.1)
end