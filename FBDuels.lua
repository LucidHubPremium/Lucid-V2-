local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LucidHubPremium/Lucid-V2-/main/LucidLib.lua"))()

local window = library:Window({
   Title = "Lucid [V2]",
   Accent = Color3.fromRGB(97, 153, 242),
   Logo = 3610245066,
   ToggleKey = Enum.KeyCode.LeftAlt
})






local Velocity hub = {
     pv = true,
     universal = 0,
     blatant = 0,
     unitoggle = true,
     blatoggle = true,
     block = true,
     blockslider = 1.5,
     AutoFollowQb = true,
     tprange = 0,
     autocatchv = 0,
    }












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





section:Button({
   Text = "Legit Mags",
   Callback = function() 
    function football(ball)
        if ball and playerArm then do
            wait(magdelay)
            firetouchinterest(playerArm, ball, 0)
            firetouchinterest(playerArm, ball, 1)
        end
    end
    end
        service.Stepped:Connect(function()
        for i,v in pairs (workspace.Balls_Kickz:GetChildren()) do 
            if v.Name == "Football" and v:IsA("BasePart") then
                football(v)
            end
        end
    end)
end,
})

section:Slider({
   Text = "Legit Mag Delay",
   Min = 0,
   Max = 5,
   Def = 0,
   Callback = function(v) 
    magdelay = v
end,
})










local column = tabsection:AddColumn({
   Title = "Player"
})


local section = column:Section({
   Title = "Humanoid"
})


section:Button({
   Text = "JumpPower",
   Callback = function(value) 
    local p = game.Players.LocalPlayer.Character.HumanoidRootPart
local yeah_this_is_yeah = Instance.new("BodyForce")
yeah_this_is_yeah.Parent = p
yeah_this_is_yeah.Force = Vector3.new(0, 500, 0)
		end,
	})
	



section:Button({
   Text = "WalkSpeed",
   Callback = function(value)
    lp = game.Players.LocalPlayer
UIS = game:GetService("UserInputService")


repeat
wait(0.1)
until lp.Character:FindFirstChild('HumanoidRootPart')

local speed = CFrame.new(0,0,0)
local lastpos = lp.Character.HumanoidRootPart.Position


while true do
if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
speed = lp.Character.HumanoidRootPart.Position - lastpos
if speed.Y < 0 then
speed = speed - Vector3.new(0, speed.Y, 0)
end
lp.Character.HumanoidRootPart.CFrame = lp.Character.HumanoidRootPart.CFrame + (speed/2)
lastpos = lp.Character.HumanoidRootPart.Position
end
wait(0.1)
end
		end,
	})




section:Toggle({
   Text = "Double Jump",
   State = false,
   Callback = function() 
   
--Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			end
		end
	end)
end
   end,
})

local section = column:Section({
   Title = "Body"
})


local Playeer = game.Players.LocalPlayer
_G.CheckingTool = false


section:Toggle({
   Text = "Long Legs",
   State = false,
   Callback = function(bool) 
   
_G.CheckingTool = bool
Highlight = Instance.new("Highlight", Playeer.Character['Left Leg'])
Highlight.Enabled = bool
Highlight = Instance.new("Highlight", Playeer.Character['Right Leg'])
Highlight.Enabled = bool
getgenv().jjj = bool
if getgenv().jjj == true then
Playeer.Character['Left Leg'].Size = Vector3.new(1, _G.Legs, 1)
Playeer.Character['Right Leg'].Size = Vector3.new(1, _G.Legs, 1)
Playeer.Character['Left Leg'].Transparency = .9999999999999999999
Playeer.Character['Right Leg'].Transparency = .9999999999999999999
elseif getgenv().jjj == false then
Playeer.Character['Left Leg'].Size = Vector3.new(1, 2, 1)
Playeer.Character['Right Leg'].Size = Vector3.new(1, 2, 1)
Playeer.Character['Left Leg'].Transparency = 0
Playeer.Character['Right Leg'].Transparency = 0
end
end,
  })
  
  
  
 
 section:Slider({
   Text = "Long Legs Height",
   Min = 1,
   Max = 15,
   Def = 1,
   Callback = function(g) 
     _G.Legs = g
if _G.CheckingTool == true then
Playeer.Character['Left Leg'].Size = Vector3.new(1, _G.Legs, 1)
Playeer.Character['Right Leg'].Size = Vector3.new(1, _G.Legs, 1)
elseif _G.CheckingTool == false then
		end
end,
  })
  
  
  

local section = column:Section({
   Title = "Physics"
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
