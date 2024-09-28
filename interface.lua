local Players = game:GetService("Players")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
   Name = "Arsenal",
   LoadingTitle = "Neptune Script",
   LoadingSubtitle = "by Froceur",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, 
      FileName = "Neptune Script"
   },
   Discord = {
      Enabled = true,
      Invite = "neptunescript", 
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Neptune Script",
      Subtitle = "https://discord.gg/neptunescript",
      Note = "join the server to get the key",
      FileName = "Key",
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {"neptune404"}
   }
})



local MainTab = Window:CreateTab("Principal", nil) 
local MainSection = MainTab:CreateSection("Main")



local aimbot = MainTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function()

		loadstring(game:HttpGet("https://raw.githubusercontent.com/froceurdev/aimbot/main/aimkey"))()
        -- https://raw.githubusercontent.com/elsinconu/aimbot_nokey/main/aimbot.lua
        -- https://raw.githubusercontent.com/froceurdev/aimbot/main/aimkey
    end
 })


 local espTab = Window:CreateTab("ESP", nil)
 local espSection = espTab:CreateSection("Main")


local ESPEnabled = false


local ESP = nil
local ESPScriptUrl = "https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"

local Esp = espTab:CreateToggle({
    Name = "playeur Name",
    Callback = function()
       

        local function API_Check()
            if Drawing == nil then
                return "No"
            else
                return "Yes"
            end
        end
        
        local Find_Required = API_Check()
        
        if Find_Required == "No" then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Exunys Developer";
                Text = "ESP script could not be loaded because your exploit is unsupported.";
                Duration = math.huge;
                Button1 = "OK"
            })
        
            return
        end
        
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local Camera = workspace.CurrentCamera
        
        local Typing = false
        
        _G.SendNotifications = true   -- If set to true then the script would notify you frequently on any changes applied and when loaded / errored. (If a game can detect this, it is recommended to set it to false)
        _G.DefaultSettings = false   -- If set to true then the ESP script would run with default settings regardless of any changes you made.
        
        _G.TeamCheck = false   -- If set to true then the script would create ESP only for the enemy team members.
        
        _G.ESPVisible = true   -- If set to true then the ESP will be visible and vice versa.
        _G.TextColor = Color3.fromRGB(255, 80, 10)   -- The color that the boxes would appear as.
        _G.TextSize = 14   -- The size of the text.
        _G.Center = true   -- If set to true then the script would be located at the center of the label.
        _G.Outline = true   -- If set to true then the text would have an outline.
        _G.OutlineColor = Color3.fromRGB(0, 0, 0)   -- The outline color of the text.
        _G.TextTransparency = 0.7   -- The transparency of the text.
        _G.TextFont = Drawing.Fonts.UI   -- The font of the text. (UI, System, Plex, Monospace) 
        
        _G.DisableKey = Enum.KeyCode.Q   -- The key that disables / enables the ESP.
        
        local function CreateESP()
            for _, v in next, Players:GetPlayers() do
                if v.Name ~= Players.LocalPlayer.Name then
                    local ESP = Drawing.new("Text")
        
                    RunService.RenderStepped:Connect(function()
                        if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                            local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
        
                            ESP.Size = _G.TextSize
                            ESP.Center = _G.Center
                            ESP.Outline = _G.Outline
                            ESP.OutlineColor = _G.OutlineColor
                            ESP.Color = _G.TextColor
                            ESP.Transparency = _G.TextTransparency
                            ESP.Font = _G.TextFont
        
                            if OnScreen == true then
                                local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                                local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                                local Dist = (Part1 - Part2).Magnitude
                                ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                                ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= v.Team then
                                        ESP.Visible = _G.ESPVisible
                                    else
                                        ESP.Visible = false
                                    end
                                else
                                    ESP.Visible = _G.ESPVisible
                                end
                            else
                                ESP.Visible = false
                            end
                        else
                            ESP.Visible = false
                        end
                    end)
        
                    Players.PlayerRemoving:Connect(function()
                        ESP.Visible = false
                    end)
                end
            end
        
            Players.PlayerAdded:Connect(function(Player)
                Player.CharacterAdded:Connect(function(v)
                    if v.Name ~= Players.LocalPlayer.Name then 
                        local ESP = Drawing.new("Text")
            
                        RunService.RenderStepped:Connect(function()
                            if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                                local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
            
                                ESP.Size = _G.TextSize
                                ESP.Center = _G.Center
                                ESP.Outline = _G.Outline
                                ESP.OutlineColor = _G.OutlineColor
                                ESP.Color = _G.TextColor
                                ESP.Transparency = _G.TextTransparency
            
                                if OnScreen == true then
                                    local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                                local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                                    local Dist = (Part1 - Part2).Magnitude
                                    ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                                    ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                                    if _G.TeamCheck == true then 
                                        if Players.LocalPlayer.Team ~= Player.Team then
                                            ESP.Visible = _G.ESPVisible
                                        else
                                            ESP.Visible = false
                                        end
                                    else
                                        ESP.Visible = _G.ESPVisible
                                    end
                                else
                                    ESP.Visible = false
                                end
                            else
                                ESP.Visible = false
                            end
                        end)
            
                        Players.PlayerRemoving:Connect(function()
                            ESP.Visible = false
                        end)
                    end
                end)
            end)
        end
        
        if _G.DefaultSettings == true then
            _G.TeamCheck = false
            _G.ESPVisible = true
            _G.TextColor = Color3.fromRGB(40, 90, 255)
            _G.TextSize = 14
            _G.Center = true
            _G.Outline = false
            _G.OutlineColor = Color3.fromRGB(0, 0, 0)
            _G.DisableKey = Enum.KeyCode.Q
            _G.TextTransparency = 0.75
        end
        
        UserInputService.TextBoxFocused:Connect(function()
            Typing = true
        end)
        
        UserInputService.TextBoxFocusReleased:Connect(function()
            Typing = false
        end)
        
        
        local Success, Errored = pcall(function()
            CreateESP()
        end)
        
        if Success and not Errored then
            if _G.SendNotifications == true then
            end
        elseif Errored and not Success then
            if _G.SendNotifications == true then
            end
            TestService:Message("The ESP script has errored, please notify Exunys with the following information :")
            warn(Errored)
            print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")
        end


    end
 })

 local Esp = espTab:CreateToggle({
    Name = "Box Playeur",
    Callback = function()
        

        local function API_Check()
            if Drawing == nil then
                return "No"
            else
                return "Yes"
            end
        end
        
        local Find_Required = API_Check()
        
        if Find_Required == "No" then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Exunys Developer";
                Text = "Boxes script could not be loaded because your exploit is unsupported.";
                Duration = math.huge;
                Button1 = "OK"
            })
        
            return
        end
        
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local Camera = workspace.CurrentCamera
        
        local Typing = false
        
        _G.SendNotifications = true  
        _G.DefaultSettings = false  
        
        _G.TeamCheck = false  
        
        _G.BoxesVisible = true  
        _G.LineColor = Color3.fromRGB(255, 41, 41)   
        _G.LineThickness = 1  
        _G.LineTransparency = 0.7   
        _G.SizeIncrease = 1  
        
        _G.DisableKey = Enum.KeyCode.Q  



        local function CreateBoxes()
            for _, v in next, Players:GetPlayers() do
                if v.Name ~= Players.LocalPlayer.Name then
                    local TopLeftLine = Drawing.new("Line")
                    local TopRightLine = Drawing.new("Line")
                    local BottomLeftLine = Drawing.new("Line")
                    local BottomRightLine = Drawing.new("Line")
        
                    RunService.RenderStepped:Connect(function()
                        if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then 
                            TopLeftLine.Thickness = _G.LineThickness
                            TopLeftLine.Transparency = _G.LineTransparency
                            TopLeftLine.Color = _G.LineColor
        
                            TopRightLine.Thickness = _G.LineThickness
                            TopRightLine.Transparency = _G.LineTransparency
                            TopRightLine.Color = _G.LineColor
        
                            BottomLeftLine.Thickness = _G.LineThickness
                            BottomLeftLine.Transparency = _G.LineTransparency
                            BottomLeftLine.Color = _G.LineColor
        
                            BottomRightLine.Thickness = _G.LineThickness
                            BottomRightLine.Transparency = _G.LineTransparency
                            BottomRightLine.Color = _G.LineColor
                            
                            local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * _G.SizeIncrease
        
                            local TopLeftPosition, TopLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)
                            local TopRightPosition, TopRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)
                            local BottomLeftPosition, BottomLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)
                            local BottomRightPosition, BottomRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)
        
                            if TopLeftVisible == true then
                                TopLeftLine.From = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)
                                TopLeftLine.To = Vector2.new(TopRightPosition.X, TopRightPosition.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= v.Team then
                                        TopLeftLine.Visible = _G.BoxesVisible
                                    else
                                        TopLeftLine.Visible = false
                                    end
                                else
                                    TopLeftLine.Visible = _G.BoxesVisible
                                end
                            else
                                TopLeftLine.Visible = false
                            end
        
                            if TopRightVisible == true and _G.BoxesVisible == true then
                                TopRightLine.From = Vector2.new(TopRightPosition.X, TopRightPosition.Y)
                                TopRightLine.To = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= v.Team then
                                        TopRightLine.Visible = _G.BoxesVisible
                                    else
                                        TopRightLine.Visible = false
                                    end
                                else
                                    TopRightLine.Visible = _G.BoxesVisible
                                end
                            else
                                TopRightLine.Visible = false
                            end
        
                            if BottomLeftVisible == true and _G.BoxesVisible == true then
                                BottomLeftLine.From = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)
                                BottomLeftLine.To = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= v.Team then
                                        BottomLeftLine.Visible = _G.BoxesVisible
                                    else
                                        BottomLeftLine.Visible = false
                                    end
                                else
                                    BottomLeftLine.Visible = _G.BoxesVisible
                                end
                            else
                                BottomLeftLine.Visible = false
                            end
        
                            if BottomRightVisible == true and _G.BoxesVisible == true then
                                BottomRightLine.From = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)
                                BottomRightLine.To = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= v.Team then
                                        BottomRightLine.Visible = _G.BoxesVisible
                                    else
                                        BottomRightLine.Visible = false
                                    end
                                else
                                    BottomRightLine.Visible = _G.BoxesVisible
                                end
                            else
                                BottomRightLine.Visible = false
                            end
                        else
                            TopRightLine.Visible = false
                            TopLeftLine.Visible = false
                            BottomLeftLine.Visible = false
                            BottomRightLine.Visible = false
                        end
                    end)
        
                    Players.PlayerRemoving:Connect(function()
                        TopRightLine.Visible = false
                        TopLeftLine.Visible = false
                        BottomLeftLine.Visible = false
                        BottomRightLine.Visible = false
                    end)
                end
            end
        
            Players.PlayerAdded:Connect(function(Player)
                Player.CharacterAdded:Connect(function(v)
                    if v.Name ~= Players.LocalPlayer.Name then
                        local TopLeftLine = Drawing.new("Line")
                        local TopRightLine = Drawing.new("Line")
                        local BottomLeftLine = Drawing.new("Line")
                        local BottomRightLine = Drawing.new("Line")
            
                        RunService.RenderStepped:Connect(function()
                            if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then 
                                TopLeftLine.Thickness = _G.LineThickness
                                TopLeftLine.Transparency = _G.LineTransparency
                                TopLeftLine.Color = _G.LineColor
            
                                TopRightLine.Thickness = _G.LineThickness
                                TopRightLine.Transparency = _G.LineTransparency
                                TopRightLine.Color = _G.LineColor
            
                                BottomLeftLine.Thickness = _G.LineThickness
                                BottomLeftLine.Transparency = _G.LineTransparency
                                BottomLeftLine.Color = _G.LineColor
            
                                BottomRightLine.Thickness = _G.LineThickness
                                BottomRightLine.Transparency = _G.LineTransparency
                                BottomRightLine.Color = _G.LineColor
                                
                                local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * _G.SizeIncrease
            
                                local TopLeftPosition, TopLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)
                                local TopRightPosition, TopRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)
                                local BottomLeftPosition, BottomLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)
                                local BottomRightPosition, BottomRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)
            
                                if TopLeftVisible == true then
                                    TopLeftLine.From = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)
                                    TopLeftLine.To = Vector2.new(TopRightPosition.X, TopRightPosition.Y)
                                    if _G.TeamCheck == true then 
                                        if Players.LocalPlayer.Team ~= Player.Team then
                                            TopLeftLine.Visible = _G.BoxesVisible
                                        else
                                            TopLeftLine.Visible = false
                                        end
                                    else
                                        TopLeftLine.Visible = _G.BoxesVisible
                                    end
                                else
                                    TopLeftLine.Visible = false
                                end
            
                                if TopRightVisible == true and _G.BoxesVisible == true then
                                    TopRightLine.From = Vector2.new(TopRightPosition.X, TopRightPosition.Y)
                                    TopRightLine.To = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)
                                    if _G.TeamCheck == true then 
                                        if Players.LocalPlayer.Team ~= Player.Team then
                                            TopRightLine.Visible = _G.BoxesVisible
                                        else
                                            TopRightLine.Visible = false
                                        end
                                    else
                                        TopRightLine.Visible = _G.BoxesVisible
                                    end
                                else
                                    TopRightLine.Visible = false
                                end
            
                                if BottomLeftVisible == true and _G.BoxesVisible == true then
                                    BottomLeftLine.From = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)
                                    BottomLeftLine.To = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)
                                    if _G.TeamCheck == true then 
                                        if Players.LocalPlayer.Team ~= Player.Team then
                                            BottomLeftLine.Visible = _G.BoxesVisible
                                        else
                                            BottomLeftLine.Visible = false
                                        end
                                    else
                                        BottomLeftLine.Visible = _G.BoxesVisible
                                    end
                                else
                                    BottomLeftLine.Visible = false
                                end
            
                                if BottomRightVisible == true and _G.BoxesVisible == true then
                                    BottomRightLine.From = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)
                                    BottomRightLine.To = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)
                                    if _G.TeamCheck == true then 
                                        if Players.LocalPlayer.Team ~= Player.Team then
                                            BottomRightLine.Visible = _G.BoxesVisible
                                        else
                                            BottomRightLine.Visible = false
                                        end
                                    else
                                        BottomRightLine.Visible = _G.BoxesVisible
                                    end
                                else
                                    BottomRightLine.Visible = false
                                end
                            else
                                TopRightLine.Visible = false
                                TopLeftLine.Visible = false
                                BottomLeftLine.Visible = false
                                BottomRightLine.Visible = false
                            end
                        end)
            
                        Players.PlayerRemoving:Connect(function()
                            TopRightLine.Visible = false
                            TopLeftLine.Visible = false
                            BottomLeftLine.Visible = false
                            BottomRightLine.Visible = false
                        end)
                    end
                end)
            end)
        end
        
        if _G.DefaultSettings == true then
            _G.TeamCheck = false
            _G.BoxesVisible = true
            _G.LineColor = Color3.fromRGB(40, 90, 255)
            _G.LineThickness = 1
            _G.LineTransparency = 0.5
            _G.SizeIncrease = 1.5
            _G.DisableKey = Enum.KeyCode.Q
        end
        
        UserInputService.TextBoxFocused:Connect(function()
            Typing = true
        end)
        
        UserInputService.TextBoxFocusReleased:Connect(function()
            Typing = false
        end)
    
        
        local Success, Errored = pcall(function()
            CreateBoxes()
        end)
        
        if Success and not Errored then
            if _G.SendNotifications == true then
            end
        elseif Errored and not Success then
            if _G.SendNotifications == true then
            end
            TestService:Message("The boxes script has errored, please notify Exunys with the following information :")
            warn(Errored)
            print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")
        end



    end
 })

 
local teleportAttackLoopEnabled = false
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = game.Workspace.CurrentCamera
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer


local teleportAttackButton = MainTab:CreateButton({
    Name = "Tp kill",
    Callback = function()

        Rayfield:Notify({
            Title = "Tp Kill",
            Content = "Appuyez sur F3 pour commencer TP kill",
            Duration = 8.5,
        })
        
        local teleportAttackLoopEnabled = false
        local Camera = game.Workspace.CurrentCamera
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local UserInputService = game:GetService("UserInputService")
        local RunService = game:GetService("RunService")
        
        local function GetClosestEnemy()
            local ClosestDistance = math.huge
            local ClosestEnemy = nil
            for _, Player in pairs(Players:GetPlayers()) do
                if Player ~= LocalPlayer and Player.Team ~= LocalPlayer.Team and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                    local Distance = (Player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if Distance < ClosestDistance then
                        ClosestDistance = Distance
                        ClosestEnemy = Player
                    end
                end
            end
            return ClosestEnemy
        end
        
        local function IsSafePosition(position)
            if position.Y < -10 then
                return false, "Position en dessous de la carte."
            end
        
            local nearbyParts = workspace:FindPartsInRegion3(
                Region3.new(position - Vector3.new(5, 5, 5), position + Vector3.new(5, 5, 5)),
                LocalPlayer.Character,
                10
            )
            if #nearbyParts == 0 then
                return false, "Aucun objet trouvé à proximité."
            end
        
            return true, "Position sécurisée."
        end
        
        local function TeleportAndAttack()
            local TargetEnemy = GetClosestEnemy()
            if TargetEnemy and TargetEnemy.Character and TargetEnemy.Character:FindFirstChild("HumanoidRootPart") then
                local TargetHRP = TargetEnemy.Character.HumanoidRootPart
                local TargetPosition = TargetHRP.Position + Vector3.new(0, 3, 0)
                
                local safe, reason = IsSafePosition(TargetPosition)
                if not safe then
                    warn("Téléportation annulée: " .. reason)
                    return
                end
        
                LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(TargetPosition))
        
                local TargetHead = TargetEnemy.Character:FindFirstChild("Head")
                if TargetHead then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, TargetHead.Position)
                    
                    while teleportAttackLoopEnabled and TargetEnemy.Parent do
                        if teleportAttackLoopEnabled then
                            for i = 1, 3 do  
                                mouse1click()
                                wait(0)  
                            end
                            game:GetService("Players").LocalPlayer.NRPBS.FireDamage = 200
                            game:GetService("Players").LocalPlayer.NRPBS.ExplosiveDamage = 200
                            game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
                            game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
                        else
                            break
                        end
                        wait(0) 
                    end
                end
            end
        end

        local teleportConnection
        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.F3 then
                teleportAttackLoopEnabled = not teleportAttackLoopEnabled
                if teleportAttackLoopEnabled then
                    teleportConnection = RunService.RenderStepped:Connect(function()
                        if teleportAttackLoopEnabled then
                            TeleportAndAttack()
                        end
                    end)
                else
                    if teleportConnection then
                        teleportConnection:Disconnect()
                        teleportConnection = nil
                    end
                    game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 30
                    game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 30
                end
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Teleport & Attack",
                    Text = teleportAttackLoopEnabled and "Enabled" or "Disabled",
                    Duration = 3
                })
            end
        end)
        
    end
})


local otherTab = Window:CreateTab("autre", nil)
local otherSection = otherTab:CreateSection("Main")

local level = false

local level = otherTab:CreateButton({
    Name = "infinite level",
    Callback = function()
        level = not level
        if level then
            game:GetService("Players").LocalPlayer.CareerStatsCache.Score.Value = '910000000000000'
            game:GetService("Players").LocalPlayer.CareerStatsCache.Kills.Value = '100000000'
        end
    end
 })

 
local infjmp = true
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")


local infjmp = false
local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

local jumpRequestConnection

local jumpButton = MainTab:CreateButton({
    Name = "infini jump",
    Callback = function()
        infjmp = not infjmp
        if infjmp then
            humanoid.JumpPower = 35 
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            
            if not jumpRequestConnection then
                jumpRequestConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                    if infjmp then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end)
            end
        else
            humanoid.JumpPower = 50
        end
    end
})

local gunsection = MainTab:CreateSection("gun")

local rainbowgun = MainTab:CreateButton({
    Name = "rainbow gun",
    Callback = function()
            local c = 1
function zigzag(X)
 return math.acos(math.cos(X * math.pi)) / math.pi
end
game:GetService("RunService").RenderStepped:Connect(function()
 if game.Workspace.Camera:FindFirstChild('Arms') then
  for i,v in pairs(game.Workspace.Camera.Arms:GetDescendants()) do
   if v.ClassName == 'MeshPart' then 
    v.Color = Color3.fromHSV(zigzag(c),1,1)
    c = c + .0001
   end
  end
 end
end)
    end
 })




local amoEnabled = false

local amoButton = MainTab:CreateButton({
    Name = "Infinite Ammo",
    Callback = function()
        amoEnabled = not amoEnabled
        while amoEnabled do
            game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
            game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
            wait() 
        end
    end
})


