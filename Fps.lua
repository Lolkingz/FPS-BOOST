-- Load Rayfield library
local Rayfield
pcall(function()
    Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

-- Check if Rayfield is loaded correctly
if not Rayfield then
    print("Rayfield failed to load!")
    return
end

-- Create Rayfield Window
local Window = Rayfield:CreateWindow({
    Name = "Universal FPS Booster Hub",
    Icon = 0,
    LoadingTitle = "Loading.",
    LoadingSubtitle = "by Phenorez (roblox)",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Universal FPS Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

-- Main Tab
local MainTab = Window:CreateTab("😏Main", nil)
local MainSection = MainTab:CreateSection("Home")

-- FPS Booster Function
local function ActivateFPSBooster()
    local decalsyeeted = true
    local removeTextures = true
    local destroyUnneeded = true

    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain

    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0

    l.GlobalShadows = false
    l.FogEnd = 1e10
    l.Brightness = 0

    settings().Rendering.QualityLevel = "Level01"

    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.CastShadow = false
        elseif v:IsA("Decal") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("Texture") and removeTextures then
            v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Sound") and destroyUnneeded then
            v:Destroy()
        elseif v:IsA("Accessory") and destroyUnneeded then
            v:Destroy()
        end
    end

    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") then
            e.Enabled = false
        end
    end

    print("Ultra FPS Booster Activated!")
    game.StarterGui:SetCore("SendNotification", {
        Title = "FPS Booster",
        Text = "Optimized for max FPS!",
        Duration = 5
    })
end

-- FPS Booster Button
MainTab:CreateButton({
    Name = "Activate FPS Booster",
    Callback = function()
        ActivateFPSBooster()
    end
})
