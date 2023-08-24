

local CoreGui = Instance.new("ScreenGui")
local Coreloader = Instance.new("Frame")
local Loader = Instance.new("Frame")
local Thing = Instance.new("Frame")
local TextLabel2 = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
 
CoreGui.Name = "CoreGui"
CoreGui.Parent = game.CoreGui
CoreGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Coreloader.Name = "Coreloader"
Coreloader.Parent = CoreGui
Coreloader.BackgroundColor3 = Color3.fromRGB(30, 31, 33)
Coreloader.BorderColor3 = Color3.new(0, 0, 0)
Coreloader.BorderSizePixel = 0
Coreloader.Position = UDim2.new(0.35, 0, 0.36807102, 0)
Coreloader.Size = UDim2.new(0, 568, 0, 239)

Loader.Name = "Loader"
Loader.Parent = Coreloader
Loader.BackgroundColor3 = Color3.fromRGB(49, 50, 54)
Loader.BorderColor3 = Color3.new(0, 0, 0)
Loader.BorderSizePixel = 0
Loader.Position = UDim2.new(0.0528169014, 0, 0.815899551, 0)
Loader.Size = UDim2.new(0, 507, 0, 8)

Thing.Name = "Thing"
Thing.Parent = Loader
Thing.BackgroundColor3 = Color3.fromRGB(27, 97, 227)
Thing.BorderColor3 = Color3.new(0, 0, 0)
Thing.BorderSizePixel = 0
Thing.Size = UDim2.new(0, 0, 0, 8)

TextLabel2.Name = "TextLabel2"
TextLabel2.Parent = Coreloader
TextLabel2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel2.BackgroundTransparency = 1
TextLabel2.BorderColor3 = Color3.new(0, 0, 0)
TextLabel2.BorderSizePixel = 0
TextLabel2.Position = UDim2.new(0.0827464759, 0, 0.125523016, 0)
TextLabel2.Size = UDim2.new(0, 473, 0, 50)
TextLabel2.Font = Enum.Font.Gotham
TextLabel2.Text = "Lucid Loader"
TextLabel2.TextColor3 = Color3.new(1, 1, 1)
TextLabel2.TextSize = 28

TextLabel.Parent = Coreloader
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.new(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.107394367, 0, 0.882845163, 0)
TextLabel.Size = UDim2.new(0, 441, 0, 19)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = ""
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 14

TextButton.Parent = Coreloader
TextButton.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.383802831, 0, 0.430962354, 0)
TextButton.Size = UDim2.new(0, 130, 0, 50)
TextButton.Font = Enum.Font.Gotham
TextButton.Text = "Copy Discord Link"
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.TextSize = 14



local frame = game:GetService("CoreGui").CoreGui.Coreloader.Loader.Thing
local guisize = UDim2.new(0, 509,0, 8)
local tween_time = math.random(4,5)
local tween_time2 = 2
local frame2 = game:GetService("CoreGui").CoreGui.Coreloader
local guipos = UDim2.new(0.35, 0,-0.500, 0)
local button = game:GetService("CoreGui").CoreGui.Coreloader.TextButton

button.MouseButton1Click:Connect(function()
setclipboard("https://discord.gg/hwmCFgppQH")
end)

wait(0.1)	

function namechange1()
	game:GetService("CoreGui").CoreGui.Coreloader.TextLabel2.Text = "Lucid Loader"
end

function namechange2()
	game:GetService("CoreGui").CoreGui.Coreloader.TextLabel2.Text = "Lucid Loader"
end

function namechange3()
	game:GetService("CoreGui").CoreGui.Coreloader.TextLabel2.Text = "Lucid Loader"
end

function namechange4()
	game:GetService("CoreGui").CoreGui.Coreloader.TextLabel2.Text = "Lucid Loader"
end

function starttween()
	local tweenInfo = TweenInfo.new(tween_time, Enum.EasingStyle.Linear)
	local tween = game:GetService("TweenService"):Create(frame, tweenInfo, {Size = guisize})
	tween:Play()
end	
wait(0.5)
starttween()
wait(1)
namechange1()
wait(1.2)
namechange2()
wait(1.4)
namechange3()
wait(2.4)
namechange4()
wait(6.0)

function endtween2()
	local tweenInfo2 = TweenInfo.new(tween_time2, Enum.EasingStyle.Quad)
	local tween2 = game:GetService("TweenService"):Create(frame2, tweenInfo2, {Position = guipos})
	tween2:Play()
end
endtween2()

wait(5)



	game:GetService("CoreGui").CoreGui:Destroy()



do --//
    local coreGui = game:GetService("CoreGui")
    local contentProvider = game:GetService('ContentProvider')
    local tbl = {}
    
    for index, descendant in pairs(coreGui:GetDescendants()) do
        if descendant:IsA("ImageLabel") and string.find(descendant.Image, "rbxasset://") then
            table.insert(tbl, descendant.Image)
        end
    end
    
    local preloadAsync; preloadAsync = hookfunction(contentProvider.PreloadAsync, function(self, ...)
        local args = {...}
        if not checkcaller() and type(args[1]) == "table" and table.find(args[1], coreGui) then
            args[1] = tbl
            return preloadAsync(self, unpack(args))
        end
        return preloadAsync(self, ...)
    end)
    
    local function compareMethod(m1, m2)
        return string.lower(m1) == string.lower(m2)
    end
    
    local __namecall; __namecall = hookmetamethod(game, "__namecall", function(self, ...)
        local args = {...}
        local method = getnamecallmethod()
        if not checkcaller() and type(args[1]) == "table" and table.find(args[1], coreGui) and self == contentProvider and compareMethod("PreloadAsync", method) then
            args[1] = tbl
            return __namecall(self, unpack(args))
        end
        return __namecall(self, ...)
    end)
end





















local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LucidHubPremium/Lucid-V2-/main/LucidLib.lua"))()

local window = library:Window({
   Title = "Lucid [V2]",
   Accent = Color3.fromRGB(97, 153, 242),
   Logo = 3610245066,
   ToggleKey = Enum.KeyCode.LeftAlt
})








	local Spoofed = {};
        local Clone = game.Clone;
        local oldIdx;
        local oldNewIdx;
        local OldNC;
        
        
        local Player = game:GetService("Players").LocalPlayer;
        
        local Methods = {
            "FindFirstChild",
            "FindFirstChildOfClass",
            "FindFirstChildWhichIsA"
        }

        local function SpoofProp(Instance, Property)
            local Cloned = Clone(Instance);
        
            table.insert(Spoofed, {
                Instance = Instance,
                Property = Property;
                ClonedInstance = Cloned;
            })
        end
        
        
        oldIdx = hookmetamethod(game, "__index", function(self, key)
            for i,v in next, Spoofed do
                if self == v.Instance and key == v.Property and not checkcaller() then
                    return oldIdx(v.ClonedInstance, key)
                end
        
                if key == "Parent" and (self == v.ClonedInstance or self == v.Instance) and checkcaller() == false then
                    return oldIdx(v.Instance, key)
                end
            end
        
            return oldIdx(self, key)
        end)
        
        oldNewIdx = hookmetamethod(game, "__newindex", function(self, key, newval, ...)
            for i,v in next, Spoofed do
                if self == v.Instance and key == v.Property and not checkcaller() then
                    return oldNewIdx(v.ClonedInstance, key, newval, ...);
                end
            end
            return oldNewIdx(self, key, newval, ...)
        end)
        
        OldNC = hookmetamethod(game, "__namecall", function(self, ...)
            
            local Method = getnamecallmethod();
        
            if not table.find(Methods, Method) or Player.Character == nil or self ~= Player.Character then
                return OldNC(self, ...)
            end
            
            local Results = OldNC(self, ...);
        
            if Results and Results:IsA("Humanoid") and Player.Character and self == Player.Character then
                for i,v in next, Spoofed do
                    if v.Instance == Results then
                        return v.ClonedInstance
                    end
                end
            end
            return OldNC(self, ...)
        end)
        
        for i, Method in next, Methods do
            local Old;
        
            Old = hookfunction(game[Method], function(self, ...)
                if not Player.Character or self ~= Player.Character then
                    return Old(self, ...)
                end
        
                local Results = Old(self, ...);
        
                if Results and Results:IsA("Humanoid") and Player.Character and self == Player.Character then
                    for i,v in next, Spoofed do
                        if v.Instance == Results then
                            return v.ClonedInstance
                        end
                    end
                end
                return Old(self, ...)
            end)
        end










local Lucid = {
	pv = true,
	unitoggle = true,
	blatoggle = true,
	block = true,
	AutoFollowQb = true,
	tprange = 0,
	autocatchv = 0,
}

local players = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local remotes = replicatedStorage:FindFirstChild("Remotes")
local characterSoundEvent = remotes:FindFirstChild("CharacterSoundEvent")
local player = players.LocalPlayer
local runService = game:GetService("RunService")

local blatant = 0
local universal = 0
local uis = game:GetService("UserInputService")
local uniDelay = 0
local regDelay = 0

-- Functions







local tooggleEnabled = false -- Variable to track the toggle state







local tab = window:NewTab({
   Logo = 4483345998
})

local tabsection = tab:TabSection({
   Title = "Lucid [V2]"
})

local column = tabsection:AddColumn({
   Title = "Catching"
})


local section = column:Section({
   Title = "Coming Soon!"
})







local column = tabsection:AddColumn({
   Title = "Player"
})


local section = column:Section({
   Title = "Humanoid"
})

section:Slider({
   Text = "WalkSpeed",
   Min = 20,
   Max = 45,
   Def = 0,
   Callback = function(value) 
        Player.Character.Humanoid.WalkSpeed = value            -- Change any value you want
end,
  })
		       
        
        SpoofProp(Player.Character.Humanoid, "WalkSpeed")      -- Here you can either change to walkspeed or "JumpPower"
      
      

Player.CharacterAdded:Connect(function(character)
            character:WaitForChild("Humanoid")
            SpoofProp(character.Humanoid, "WalkSpeed")
            character.Humanoid.WalkSpeed = value
        end)




section:Slider({
   Text = "JumpPower",
   Min = 50,
   Max = 100,
   Def = 0,
   Callback = function(value) 
        Player.Character.Humanoid.JumpPower = value            -- Change any value you want
end,
  })
		       
        
        SpoofProp(Player.Character.Humanoid, "JumpPower")      -- Here you can either change to walkspeed or "JumpPower"
      
      

Player.CharacterAdded:Connect(function(character)
            character:WaitForChild("Humanoid")
            SpoofProp(character.Humanoid, "JumpPower")
            character.Humanoid.JumpPower = value
        end)




section:Slider({
   Text = "HipHeight",
   Min = 0,
   Max = 20,
   Def = 0,
   Callback = function(value) 
        Player.Character.Humanoid.HipHeight = value            -- Change any value you want
end,
  })
		       
        
        SpoofProp(Player.Character.Humanoid, "HipHeight")      -- Here you can either change to walkspeed or "JumpPower"
      
      

Player.CharacterAdded:Connect(function(character)
            character:WaitForChild("Humanoid")
            SpoofProp(character.Humanoid, "HipHeight")
            character.Humanoid.HipHeight = value
        end)


local column = tabsection:AddColumn({
   Title = "Physics"
})





local section = column:Section({
   Title = "Enhancement"
})





local qbaimpred = false


section:Toggle({
   Text = "Qb Aim Trajectory Predictions",
   State = false,
   Callback = function(v)
	qbaimpred = v -- Update the toggle state

	if qbaimpred then
		local beam = Instance.new("Beam")
		local a0 = Instance.new("Attachment")
		local a1 = Instance.new("Attachment")   
		local mouse = game.Players.LocalPlayer:GetMouse()
		beam.Color = ColorSequence.new(Color3.fromRGB(97, 165, 237))
		beam.Transparency = NumberSequence.new(0, 0)
		beam.Segments = 10 * 300
		beam.Name = "Hitbox"
		beam.Parent = workspace.Terrain
		a0.Parent = workspace.Terrain
		a1.Parent = workspace.Terrain
		beam.Attachment0 = a0
		beam.Attachment1 = a1
		beam.Width0 = 0.5
		beam.Width1 = 0.5
		while qbaimpred do
			task.wait()
			if game.Players.LocalPlayer.Character:FindFirstChild("Football") and game.Players.LocalPlayer.PlayerGui:FindFirstChild("BallGui") and game.Players.LocalPlayer.Character:FindFirstChild("Head") then
				local power = tonumber(game.Players.LocalPlayer.PlayerGui.BallGui.Frame.Disp.Text)
				local direction = (mouse.Hit.Position - workspace.CurrentCamera.CFrame.Position).Unit
				local vel = power * direction
				local origin = game.Players.LocalPlayer.Character.Head.Position + direction * 5
				local c0, c1, cf1, cf2 = beamProjectile(Vector3.new(0, -28, 0), vel, origin, 15)
				a0.CFrame = a0.Parent.CFrame:Inverse() * cf1
				a1.CFrame = a1.Parent.CFrame:Inverse() * cf2
				beam.CurveSize0 = c0
				beam.CurveSize1 = c1
			end
		end
		beam:Destroy() -- Clean up the beam when toggled off
	else
		-- Toggle turned off
		-- Add any additional code here to handle the toggle turning off
	end
end,
	})





section:Toggle({
   Text = "Optimal Jump Location",
   State = false,
   Callback = function(v)
	if v then
		local player = game.Players.LocalPlayer

		local function handleBall(ball)
			if ball.Name == "Football" and ball:IsA("BasePart") then
				local v0 = ball.Velocity
				local x0 = ball.Position
				local dt = 1/30
				local grav = Vector3.new(0, -28, 0)
				local points = {
					[1] = x0
				}
				local function check(p, v0)
					local raycastParams = RaycastParams.new()
					raycastParams.RespectCanCollide = true
					local ray = workspace:Raycast(p, Vector3.new(0, -1000, 0), raycastParams)
					local ray2 = workspace:Raycast(p, Vector3.new(0, -7.2 * 2, 0), raycastParams)
					return ray and not ray2
				end
				while true do
					if not check(points[#points], v0) then
						if v0.Y < 0 then
							break
						end
					end
					local currentPoint = points[#points]
					v0 += grav * dt
					points[#points + 1] = currentPoint + (v0 * dt)
				end
				local optimal = points[#points]
				local part = Instance.new("Part")
				part.Anchored = true
				part.CanCollide = false
				part.Position = Vector3.new(optimal.X, player.Character.HumanoidRootPart.Position.Y + 1.5, optimal.Z)
				part.Parent = workspace
				part.Material = Enum.Material.Neon
				part.Size = Vector3.new(2.5, 2.5, 2.5)
				repeat task.wait() until ball.Parent ~= workspace
				part:Destroy()
			end
		end

		local function handleChildAdded(ball)
			task.wait()
			handleBall(ball)
		end
		eventConnection = workspace.ChildAdded:Connect(handleChildAdded)
	else
		if eventConnection then
			eventConnection:Disconnect()
			eventConnection = nil
		end
	end
end,
  })






local isAntiJamEnabled = false

local function updateCollisionState()
	while true do
		if isAntiJamEnabled then
			if game.Players.LocalPlayer.Character.Head.CanCollide then
				for _, player in ipairs(game:GetService('Players'):GetPlayers()) do
					if player ~= game.Players.LocalPlayer then
						pcall(function()
							player.Character.Torso.CanCollide = false
							player.Character.Head.CanCollide = false
						end)
					end
				end
			end
		else
			if not game.Players.LocalPlayer.Character.Head.CanCollide then
				game.Players.LocalPlayer.Character.Torso.CanCollide = true
				game.Players.LocalPlayer.Character.Head.CanCollide = true
			end
		end
		task.wait()
	end
end

section:Toggle({
   Text = "Anti Collision",
   State = false,
   Callback = function(enabled) 
		isAntiJamEnabled = enabled
end,
  })


spawn(updateCollisionState)

local player = game.Players.LocalPlayer
local toggleEnabled = false -- Variable to track if the toggle is enabled

local function onKeyPress(input)
    if toggleEnabled and input.KeyCode == Enum.KeyCode.F then
        local character = player.Character
        local humanoid = character and character:FindFirstChild("Humanoid")
        if character and humanoid then
            local forwardVector = character.HumanoidRootPart.CFrame.LookVector
            local newPosition = character.HumanoidRootPart.Position + forwardVector * 3
            local newCFrame = CFrame.new(newPosition, newPosition + forwardVector)
            character.HumanoidRootPart.CFrame = newCFrame
        end
    end
end




section:Toggle({
   Text = "Quick TP [F]",
   State = false,
   Callback = function(value) 
		toggleEnabled = value -- Update the toggle state when it's toggled on/off
end,
  })


game:GetService("UserInputService").InputBegan:Connect(onKeyPress)




local column = tabsection:AddColumn({
   Title = "Automatics"
})


local section = column:Section({
   Title = "Auto"
})


local autokick = false 

task.spawn(function()

getgenv().Variables = {}

	Variables.Players = game:GetService("Players")
	Variables.ReplicatedStorage = game:GetService("ReplicatedStorage")
	Variables.UserInputService = game:GetService("UserInputService")
	Variables.Client = Variables.Players.LocalPlayer
	Variables.Character = Variables.Client.Character or Variables.Client.CharacterAdded:Wait()

	Variables.Client.CharacterAdded:Connect(function(Character)
		Variables.Character = Character 
	end)

	local Aimbot = {}

	function Aimbot:GetAccuracyArrow(Arrows)
		local Y = 0
		local Arrow1 = nil

		for _, Arrow in pairs(Arrows) do
			if Arrow.Position.Y.Scale > Y then
				Y = Arrow.Position.Y.Scale
				Arrow1 = Arrow 
			end
		end

		return Arrow1
	end

	Variables.Client.PlayerGui.ChildAdded:Connect(function(child)
		if child.Name == "KickerGui" and autokick == true then
			local KickerGui = child 
			local Meter = KickerGui:FindFirstChild("Meter")
			local Cursor = Meter:FindFirstChild("Cursor")
			local Arrows = {}

			for i,v in pairs(Meter:GetChildren()) do
				if string.find(v.Name:lower(), "arrow") then
					table.insert(Arrows, v)
				end
			end 

			repeat task.wait() until Cursor.Position.Y.Scale < 0.02
			mouse1click()
			repeat task.wait() until Cursor.Position.Y.Scale >= Aimbot:GetAccuracyArrow(Arrows).Position.Y.Scale + (.03 / (100 / 100))
			mouse1click()
		end
	end)
end)



section:Toggle({
   Text = "Auto Kick",
   State = false,
   Callback = function(v) 
		autokick = v
end,
  })








section:Button({
   Text = "Auto Finish Captain",
   Callback = function() 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Models.LockerRoomA.FinishLine.CFrame + Vector3.new(0, 2, 0)
        end,
	})


local column = tabsection:AddColumn({
   Title = "Trolling"
})


local section = column:Section({
   Title = ""
})



local connection

section:Toggle({
   Text = "Click Tackle TP",
   State = false,
   Callback = function(v) 
		if v then
		connection = game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function()
			for i, v in pairs(game.workspace:GetDescendants()) do
				if v.Name == "Football" and v:IsA("Tool") then
					local toolPosition = v.Parent.HumanoidRootPart.Position
					local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
					if (toolPosition - playerPosition).Magnitude <= tprange then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.HumanoidRootPart.CFrame + Vector3.new(1, 1, 1)
					end
				end
			end
		end)
	else
		if connection then
			connection:Disconnect() -- Disconnect the mouse click event only if it exists
		end
	end
end,
  })





section:Slider({
   Text = "Tackle TP Range",
   Min = 0,
   Max = 15,
   Def = 0,
   Callback = function(v) 
       tprange = v
end,
})





section:Toggle({
   Text = "Underground",
   State = false,
   Callback = function(v) 
	state = v
	local transparency = state and 0.5 or 0
	local model = game:GetService("Workspace").Models.Field.Grass
	for _, part in pairs(model:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = not state
			part.Transparency = transparency
		end
	end
	if state then
		local part = Instance.new("Part")
		part.Size = Vector3.new(500, 0.001, 500)
		part.CFrame = CFrame.new(Vector3.new(10.3562937, -1.51527438, 30.4708614))
		part.Anchored = true
		part.Parent = game.Workspace

		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://182724289"
		track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
		track:Play(.1, 1, 1)
	else

		if track ~= nil then
			track:Stop()
		end
	end
end,
  })



local column = tabsection:AddColumn({
   Title = "Settings"
})


local section = column:Section({
   Title = "Ball Visuals"
})


local Tracers = {}
     local DistanceLabels = {}
     local tracerEnabled = false
     
     function AttachBall(Ball)
         local RootPart = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.PrimaryPart
         if RootPart then
             if Ball then
                 local Tracer = Drawing.new("Line")
                 Tracer.Visible = false
                 Tracer.Color = Color3.fromRGB(99, 148, 247)
                 Tracer.Thickness = 1
                 Tracer.Transparency = 1
     
                 local TextLabel = Drawing.new("Text")
                 TextLabel.Text = ""
                 TextLabel.Transparency = 1
                 TextLabel.Visible = false
                 TextLabel.Color = Color3.fromRGB(99, 148, 247)
                 TextLabel.Size = 25
     
                 local con
                 con = game:GetService("RunService").RenderStepped:Connect(function()
                     if RootPart.Parent ~= nil and Ball.Parent ~= nil and tracerEnabled then
                         local Vector, OnScreen = game.Workspace.CurrentCamera:WorldToViewportPoint(Ball.Position)
                         local Vector2_, OnScreen2 = game.Workspace.CurrentCamera:WorldToViewportPoint(RootPart.Position)
                         local Distance = (RootPart.Position - Ball.Position).Magnitude
     
                         if OnScreen and OnScreen2 then
                             Tracer.From = Vector2.new(Vector2_.X, Vector2_.Y)
                             Tracer.To = Vector2.new(Vector.X, Vector.Y)
                             Tracer.Visible = true
                             TextLabel.Visible = true
     
                             TextLabel.Text = tostring(math.floor(Distance)) .. " Yards"
                             TextLabel.Position = Vector2.new(Vector.X, Vector.Y)
     
                             if Distance <= 50 then
                                 TextLabel.Color = Color3.fromRGB(99, 148, 247)
                                 Tracer.Color = Color3.fromRGB(99, 148, 247)
                             else
                                 TextLabel.Color = Color3.fromRGB(99, 148, 247)
                                 Tracer.Color = Color3.fromRGB(99, 148, 247)
                             end
                         else
                             Tracer.Visible = false
                             TextLabel.Visible = false
                         end
                     else
                         con:Disconnect()
                         Tracer.Visible = false
                         TextLabel.Visible = false
                     end
                 end)
     
                 table.insert(Tracers, Tracer)
                 table.insert(DistanceLabels, TextLabel)
             end
         end
     end
     
     workspace.ChildAdded:Connect(function(child)
         if child.Name == "Football" then
             if tracerEnabled then
                 AttachBall(child)
             end
         end
     end)


section:Toggle({
   Text = "Ball ESP",
   State = false,
   Callback = function(enabled) 
   tracerEnabled = enabled
    
        if not enabled then
            
            for _, tracer in ipairs(Tracers) do
                tracer:Remove()
            end
    
            for _, label in ipairs(DistanceLabels) do
                label:Remove()
            end
    
            Tracers = {}
            DistanceLabels = {}
        else
    
            for _, child in ipairs(workspace:GetChildren()) do
                if child.Name == "Football" then
                    AttachBall(child)
                end
            end
        end
     end,
})


local section = column:Section({
   Title = ""
})

local set = {
    sinewavefield = false
}

section:Toggle({
   Text = "Sinewave Field",
   State = false,
   Callback = function(v) 
    set.sinewavefield = v
end,
	})

task.spawn(function()
    local grass = {}
    for i, v in next, game:GetService("Workspace").Models.Field.Grass.Normal:GetDescendants() do
        if v.Name == "Grass" or v.Name == "Mid" and v:IsA("BasePart") then
            table.insert(grass, v)
        end
    end
    local origColor = game:GetService("Workspace").Models.Field.Grass.Outside.Grass.Color

    local sin = math.sin
    local pi = math.pi
    local parts = {}
    local numParts = #grass
    local amplitude = 0.1
    local frequency = 0.55
    local offset = 0
    local oldoffset = 0

    local ts = game:GetService("TweenService")
    local tweens = {}

    -- Store the original colors of the grass parts
    local originalColors = {}
    for i, part in ipairs(grass) do
        originalColors[part] = part.Color
    end

    while true do
        if not set.sinewavefield then
            for i, tween in ipairs(tweens) do
                tween:Cancel()
            end
            tweens = {}

            -- Restore the original colors of the grass parts
            for i, part in ipairs(grass) do
                part.Color = originalColors[part]
            end

            task.wait()
            continue
        end

        offset = offset + 0.1
        local floor_offset = math.floor(offset)

        for i, part in ipairs(grass) do
            local hue = 0.6 -- Adjust this value to the desired hue (blue)
            local saturation = 0.5
            local value = 0.5 + (sin(offset * frequency + i * pi / #grass) + 1) / 2 * 0.4

            local color = Color3.fromHSV(hue, saturation, value)

            local tween = ts:Create(part, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), { Color = color })
            tween:Play()
            table.insert(tweens, tween)
        end

        if math.floor(oldoffset) ~= floor_offset and floor_offset % 5 == 0 then
            task.wait(0.25)
        end

        wait()
    end
end)




local section = column:Section({
   Title = ""
})




section:Button({
   Text = "Destroy Uniform",
   Callback = function() 
            for i, v in pairs(game.workspace:GetDescendants()) do
                if v:IsA("Model") and v.Parent.Name == game.Players.LocalPlayer.Name and v.Name == "Uniform" then
                v:Destroy()
                end
            end
        end,
     })






section:Button({
   Text = "Chat Spy",
   Callback = function(value) 
 
--This script reveals ALL hidden messages in the default chat
--chat "/spy" to toggle!
	enabled = true
--if true will check your messages too
	spyOnMyself = true
--if true will chat the logs publicly (fun, risky)
	public = false
--if true will use /me to stand out
	publicItalics = true
--customize private logs
	privateProperties = {
		Color = Color3.fromRGB(62, 148, 240); 
    Font = Enum.Font.SourceSansBold;
  			  TextSize = 18;
}
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance
 
local function onChatted(p,msg)
    if _G.chatSpyInstance == instance then
        if p==player and msg:lower():sub(1,4)=="/spy" then
            enabled = not enabled
            wait(0.3)
            privateProperties.Text = "[Lucid Spy] "..(enabled and "en" or "dis").."abled"
            StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
        elseif enabled and (spyOnMyself==true or p~=player) then
            msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
            local hidden = true
            local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
                if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
                    hidden = false
                end
            end)
            wait(1)
            conn:Disconnect()
            if hidden and enabled then
                if public then
                    saymsg:FireServer((publicItalics and "/me " or '').."[Lucid Spy] [".. p.Name .."]: "..msg,"All")
                else
                    privateProperties.Text = "[Lucid Spy] [".. p.Name .."]: "..msg
                    StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                end
            end
        end
    end
end
 
for _,p in ipairs(Players:GetPlayers()) do
    p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
    p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "[Lucid Spy] "..(enabled and "en" or "dis").."abled"
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
                end,
})




section:Button({
   Text = "Disable Textures",
   Callback = function(value) 

loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
	end,
})
	





section:Button({
   Text = "Hide Players",
   Callback = function(value) 
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

--//Set a character's transparency to 1
local function SetCharacterTransparency(character)
	for i, descendant in ipairs(character:GetDescendants()) do
		if not descendant:IsA("BasePart") then
			continue
		end

		descendant.Transparency = 1
	end
end

--//Set all player's character's transparency to 1
for i, player in ipairs(Players:GetPlayers()) do
	if player == LocalPlayer then
		continue
	end
	
	player.CharacterAdded:Connect(function(character)
		if not player:HasAppearanceLoaded() then
			player.CharacterAppearanceLoaded:Wait()
		end
		
		SetCharacterTransparency(character)
	end)
	
	if not player.Character then
		continue
	end
	
	SetCharacterTransparency(player.Character)
end
		end,
	})
