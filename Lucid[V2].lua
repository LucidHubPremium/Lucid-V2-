local whitelist = { 
     Usernames = { 
         "NvidiRTX1", 
         "Glucosesssss", 
         "fortnite_OG321u", 
	"lowpeaks",
  	"heIIpeak",
     }, 
     UserIds = { 
         00000000, 
         11111111, 
         22222222, 
     } 
 } 
  
 local isPassed = false 
 local player = game.Players.LocalPlayer 
  
 for i,v in pairs(whitelist.Usernames) do 
     if player.Name == v then 
         isPassed = true 
     end 
 end 
  
 for i,v in pairs(whitelist.UserIds) do 
     if player.UserId == v then 
         isPassed = true 
     end 
 end 
  
 if isPassed == false then 
     player:Kick("You are not whitelisted!") 
     task.wait(3) 
     game:Shutdown() 
     task.wait(1) 
     while true do end 
 end 



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

















local wiihub = {
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

local Players = game:GetService("Players")
local Mouse = Players.LocalPlayer:GetMouse()
local numTeleports = 30 -- Define the number of teleports
local tooggleEnabled = false -- Variable to track the toggle state

local function universalcatch()
	if tooggleEnabled then
		local catchRight = Players.LocalPlayer.Character:FindFirstChild("CatchRight")

		if not catchRight then
			return
		end

		local closestFootball = nil
		local closestDistance = math.huge

		for i, v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "Football" and v:IsA("BasePart") then
				local distance = (v.Position - catchRight.Position).Magnitude
				if distance < closestDistance and distance <= universal then
					v.CanCollide = false
					closestDistance = distance
					closestFootball = v
				end
			end
		end

		if closestFootball then
				wait(uniDelay)
			firetouchinterest(game.Players.LocalPlayer.Character["CatchRight"], closestFootball, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["CatchRight"], closestFootball, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["CatchRight"], closestFootball, 1)
			firetouchinterest(game.Players.LocalPlayer.Character["CatchRight"], closestFootball, 1)
			task.wait()
		end
	end
end

local regtog = false -- Variable to track the toggle state

local function teleportToClosestFootball()
	if regtog == true then
		task.wait()
		uis.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				local catchRight = Players.LocalPlayer.Character:FindFirstChild("CatchRight")

				if not catchRight then
					return
				end

				local closestFootball = nil
				local closestDistance = math.huge

				for i, v in pairs(game.Workspace:GetDescendants()) do
					if v.Name == "Football" and v:IsA("BasePart") then
						local distance = (v.Position - catchRight.Position).Magnitude
						if distance < closestDistance and distance <= blatant then
							v.CanCollide = false
							closestDistance = distance
							closestFootball = v
						end
					end
				end

				-- Teleport the closest football if found
				if closestFootball then
					for _ = 1, numTeleports do
						if regtog == true then
							wait(regDelay)
							local tweenService = game:GetService("TweenService")
							local tweenInfo = TweenInfo.new(.05, Enum.EasingStyle.Linear)
							tweenService:Create(closestFootball, tweenInfo, {CFrame = catchRight.CFrame}):Play()
							wait(.05)
						end
					end
				end
			end
		end)
	end
end





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
   Title = "Adjustable Magnets"
})


section:Toggle({
   Text = "Lucid [V2] Magnets",
   State = false,
   Callback = function(v)
tooggleEnabled = v
	while tooggleEnabled == true do
		task.wait()
		universalcatch()
	end
end,
 })




section:Slider({
   Text = "Customizable Distance",
   Min = 0,
   Max = 30,
   Def = 0,
 Callback = function(v)
  universal = v
		end,
})





section:Slider({
   Text = "Customizable Delay",
   Min = 0,
   Max = 1,
   Def = 0,
   Callback = function(v) 
uniDelay = v
    end,
})
























local section = column:Section({
   Title = "Regular Magnets"
})
















section:Toggle({
   Text = "Lucid [V1] Magnets",
   State = false,
   Callback = function(v)
regtog = v
	if regtog == true then
		task.wait()
		teleportToClosestFootball()
	end
end,
 })




section:Slider({
   Text = "Customizable Distance",
   Min = 0,
   Max = 60,
   Def = 0,
 Callback = function(v)
   blatant = v
		end,
})





section:Slider({
   Text = "Customizable Delay",
   Min = 0,
   Max = 1,
   Def = 0,
   Callback = function(v) 
regDelay = v
    end,
})




local section = column:Section({
   Title = "Pull Vector"
})




section:Button({
   Text = "Pull Vector [V1]",
   Callback = function(Value) 
local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")

function moveBall(ball)
    if ball and player.Character then
        local direction = (ball.Position - player.Character.HumanoidRootPart.Position).Unit
        player.Character.HumanoidRootPart.Velocity = direction * 100  -- Adjust the velocity as desired
    end
end

function jump()
    if player.Character then
        player.Character.Humanoid.Jump = true
    end
end

runService.Stepped:Connect(function()
    local nearestFootball = nil
    local nearestDistance = math.huge

    for _, football in ipairs(workspace:GetChildren()) do
        if football.Name == "Football" and football:IsA("BasePart") then
            local distance = (player.Character.HumanoidRootPart.Position - football.Position).Magnitude
            if distance < nearestDistance then
                nearestFootball = football
                nearestDistance = distance
            end
        end
    end

    if nearestFootball and nearestDistance < 10 then
        moveBall(nearestFootball)
        wait(0.0)  -- Adjust the delay time as desired
        jump()
    end
end)


end,
	})





local column = tabsection:AddColumn({
   Title = "QB Aimbot"
})


local section = column:Section({
   Title = "Quarterback"
})




section:Button({
   Text = "Lucid Aimbot [V1]",
   Callback = function() 



local players = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local player = players.LocalPlayer
local mouse = loadstring(game:HttpGet("https://raw.githubusercontent.com/devdoroz/better-roblox-mouse/main/main.lua"))()
local locked = false
local enabled = true
local target = nil
local h = Instance.new("Hint"); h.Parent = workspace
local part = Instance.new("Part"); part.Parent = workspace; part.Anchored = true part.Size = Vector3.new(5, 1, 1); part.CanCollide = false
local beam = Instance.new("Beam"); beam.Parent = workspace.Terrain
local a0, a1 = Instance.new("Attachment"), Instance.new("Attachment"); a0.Parent = workspace.Terrain; a1.Parent = workspace.Terrain
beam.Width0 = 0.5
beam.Width1 = 0.5
beam.Transparency = NumberSequence.new(0)
beam.Color = ColorSequence.new(Color3.fromRGB(90, 151, 250))
beam.Attachment0 = a0
beam.Segments = 3000
beam.Attachment1 = a1
local data = {
	Angle = 40,
	Power = 0,
	Direction = Vector3.new(0, 0, 0)
}

do -- mouse stuff
	local whitelistedMousePart = Instance.new("Part")
	whitelistedMousePart.Size = Vector3.new(2048, 1, 2048)
	whitelistedMousePart.Anchored = true
	whitelistedMousePart.Transparency = 1
	whitelistedMousePart.Position = player.Character.HumanoidRootPart.Position - Vector3.new(0, 4, 0)
	whitelistedMousePart.CanCollide = false
	whitelistedMousePart.Parent = workspace
	local mouseRaycastParams = RaycastParams.new()
	mouseRaycastParams.FilterType = Enum.RaycastFilterType.Include
	mouseRaycastParams.FilterDescendantsInstances = {whitelistedMousePart}
	mouse:SetRaycastParams(mouseRaycastParams)
end

local function inverseCosine(degrees)
	return math.cos(math.rad(degrees))
end

local function calculateTimeToPeak(from, to, height)
	local g = Vector3.new(0, -28, 0)
	local conversionFactor = 4
	local xMeters = height * conversionFactor

	local a = 0.5 * g.Y
	local b = to.Y - from.Y
	local c = xMeters - from.Y

	local discriminant = b * b - 4 * a * c
	if discriminant < 0 then
		return nil
	end

	local t1 = (-b + math.sqrt(discriminant)) / (2 * a)
	local t2 = (-b - math.sqrt(discriminant)) / (2 * a)

	local t = math.max(t1, t2)
	return t
end

local function calculateLanding(power, direction)
	local origin = player.Character.Head.Position + direction * 5
	local velocity = power * direction
	local t = (velocity.Y / 28) * 2
	return origin + Vector3.new(velocity.X * t, 0, velocity.Z * t), t
end

local function findPossibleCatchers(power, direction)
	local velocity = power * direction
	local landing, airtime = calculateLanding(power, direction)
	local catchers = {}
	for index, player in pairs(players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local distance = (player.Character.HumanoidRootPart.Position - landing).Magnitude
			if distance < (20 * airtime) + 5 then
				catchers[#catchers + 1] = player
			end
		end
	end
	return catchers
end

local function calculatePeakHeight(from, to, angle)
	local unitY = 1 - inverseCosine(angle)
	local distance = (from - to).Magnitude
	return unitY * distance
end

local function calculateVelocity(from, to, time)
	local g = Vector3.new(0, -28, 0)
	local v0 = (to - from - 0.5*g*time*time)/time;
	local dir = ((from + v0) - from).Unit
	local power = v0.Y / dir.Y
	return v0, dir, math.clamp(power or math.round(power), 0, 95)
end

local function findTarget()
	local np = nil
	local nm = math.huge
	local s = {workspace}
	if workspace:FindFirstChild("npcwr") then
		table.insert(s, workspace.npcwr.a)
		table.insert(s, workspace.npcwr.b)
	end
	for i, p in pairs(s) do
		for i, c in pairs(p:GetChildren()) do
			if c:FindFirstChildWhichIsA("Humanoid") and c:FindFirstChild("HumanoidRootPart") then
				local plr = players:GetPlayerFromCharacter(c)
				if plr == player then continue end
				if not plr and game.PlaceId ~= 8206123457 then continue end
				if not player.Neutral then
					if plr.Team ~= player.Team then
						continue
					end
				end
				local d = (c.HumanoidRootPart.Position - mouse.Hit.Position).Magnitude
				if d < nm then
					nm = d
					np = c
				end	
			end
		end
	end
	return np
end

local function getMoveDirection(target)
	if players:GetPlayerFromCharacter(target) then
		return target.Humanoid.MoveDirection
	else
		return (target.Humanoid.WalkToPoint - target.Head.Position).Unit
	end
end

local __namecall; __namecall = hookmetamethod(game, "__namecall", function(self, ...)
	local method = getnamecallmethod()
	local args = {...}
	if args[1] == "Clicked" and enabled then
		local nwArgs = {"Clicked", player.Character.Head.Position, player.Character.Head.Position + data.Direction * 10000, (game.PlaceId == 8206123457 and data.Power) or 61, data.Power}
		print(data.Direction, data.Power)
		return __namecall(self, unpack(nwArgs))	
	end
	return __namecall(self, ...)
end)

userInputService.InputBegan:Connect(function(input, gp)
	if not gp then
		if input.KeyCode == Enum.KeyCode.R then
			while userInputService:IsKeyDown(Enum.KeyCode.R) do
				data.Angle += 5
				data.Angle = math.clamp(data.Angle, 5, 90)
				task.wait(1/6)
			end
		elseif input.KeyCode == Enum.KeyCode.F then
			while userInputService:IsKeyDown(Enum.KeyCode.F) do
				data.Angle -= 5
				data.Angle = math.clamp(data.Angle, 5, 90)
				task.wait(1/6)
			end
		elseif input.KeyCode == Enum.KeyCode.Q then
			locked = not locked
		end
	end
end)

local function beamProjectile(g, v0, x0, t1)
	local c = 0.5*0.5*0.5;
	local p3 = 0.5*g*t1*t1 + v0*t1 + x0;
	local p2 = p3 - (g*t1*t1 + v0*t1)/3;
	local p1 = (c*g*t1*t1 + 0.5*v0*t1 + x0 - c*(x0+p3))/(3*c) - p2;

	local curve0 = (p1 - x0).Magnitude;
	local curve1 = (p2 - p3).Magnitude;

	local b = (x0 - p3).Unit;
	local r1 = (p1 - x0).Unit;
	local u1 = r1:Cross(b).Unit;
	local r2 = (p2 - p3).Unit;
	local u2 = r2:Cross(b).Unit;
	b = u1:Cross(r1).Unit;

	local cf1 = CFrame.new(
		x0.x, x0.y, x0.z,
		r1.x, u1.x, b.x,
		r1.y, u1.y, b.y,
		r1.z, u1.z, b.z
	)

	local cf2 = CFrame.new(
		p3.x, p3.y, p3.z,
		r2.x, u2.x, b.x,
		r2.y, u2.y, b.y,
		r2.z, u2.z, b.z
	)

	return curve0, -curve1, cf1, cf2;
end

			while true do
	task.wait()
	if not locked then
		target = findTarget()
	end
	if target and enabled and player.PlayerGui:FindFirstChild("BallGui") and player.Character:FindFirstChild("Head") and target:FindFirstChild("HumanoidRootPart") then
		local lead = 0
		local moveDirection = getMoveDirection(target)
		local angleAddition = (moveDirection.Magnitude > 0 and 5) or 0
		local peakHeight = calculatePeakHeight(player.Character.Head.Position, target.HumanoidRootPart.Position + moveDirection * lead, data.Angle + angleAddition)
		local t = calculateTimeToPeak(player.Character.Head.Position, target.HumanoidRootPart.Position + moveDirection * lead, peakHeight) or 0.5
		local vel, direction, power = calculateVelocity(player.Character.Head.Position, target.HumanoidRootPart.Position + (moveDirection * 20 * t) + (moveDirection * lead), t)
		local catchers = findPossibleCatchers(power, direction)
		local landing, airtime = calculateLanding(power, direction)
		local c0, c1, cf1, cf2 = beamProjectile(Vector3.new(0, -28, 0), power * direction, player.Character.Head.Position + (direction * 5), airtime)
		part.Position = landing
		beam.CurveSize0 = c0
		beam.CurveSize1 = c1
		a0.CFrame = a0.Parent.CFrame:Inverse() * cf1
		a1.CFrame = a1.Parent.CFrame:Inverse() * cf2
		data.Direction = direction; data.Power = power
				end
end
end,
})

		
	
	



section:TextLabel({
   Text = "F or R to Adjust Angle"
})




















local column = tabsection:AddColumn({
   Title = "Physics"
})
















local section = column:Section({
   Title = "Enhancement"
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




section:Divide({})



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


section:Divide({})


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
   Text = "Change Field Color",
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
	




