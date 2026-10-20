local RunService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local CorePackages = game:GetService("CorePackages")
local Workspace1 = game:GetService("Workspace")
local GenerateDummyModule = require(script.Parent.Parent.Utility.GenerateDummy)
local CurrentCamera = workspace.CurrentCamera
local ScaledFIntSafetyBubbleTransparencyPercent = require(CorePackages.Workspace.Packages.VrCommon).FIntSafetyBubbleTransparencyPercent * 0.01
local IsNotVRSafetyBubbleModeMatch = true
local Largest = math.max(require(CorePackages.Workspace.Packages.VrCommon).FIntSafetyBubbleRadius * CurrentCamera.HeadScale, 0.1)
local Character = nil

function initDummy()
	-- upvalues: Character (ref), GenerateDummyModule (copy), Workspace1 (copy)
	Character = GenerateDummyModule(vector.create(0, 8.800000190734863, -50.5), vector.create(0, 180, 0))
	Character.Parent = Workspace1
end

local function calculateTransparency(_, IsNotVRSafetyBubbleModeMatch): number
	-- upvalues: VRService (copy), CurrentCamera (copy), Character (ref), Largest (copy), ScaledFIntSafetyBubbleTransparencyPercent (copy)
	if IsNotVRSafetyBubbleModeMatch then
		local Distance: number = ((CurrentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)).Position - Character.HumanoidRootPart.Position).Magnitude
		local ScaledLargest = Largest * 0.75
		
		return (math.clamp(if Distance < ScaledLargest then ScaledFIntSafetyBubbleTransparencyPercent else (1 - (Distance - ScaledLargest) / (Largest - ScaledLargest)) * ScaledFIntSafetyBubbleTransparencyPercent, 0, 1))
	else
		return 0
	end
end

function EnableSafetyBubbleDummy()
	-- upvalues: Character (ref), UserGameSettings (copy), IsNotVRSafetyBubbleModeMatch (ref), calculateTransparency (copy), RunService (copy)
	initDummy()
	RunService.Stepped:Connect(function()
		-- upvalues: Character (upval), UserGameSettings (upval), IsNotVRSafetyBubbleModeMatch (upval), calculateTransparency (upval)
		local Children = Character:GetChildren()
		IsNotVRSafetyBubbleModeMatch = UserGameSettings.VRSafetyBubbleMode ~= Enum.VRSafetyBubbleMode.Anyone
		for _, player in ipairs(game.Players:GetPlayers()) do
			if player.Character then
				local Transparency = calculateTransparency(player, IsNotVRSafetyBubbleModeMatch)
				Character.Head.Face.Transparency = Transparency
				
				for i = 1, #Children do
					if Children[i]:IsA("Part") then
						Children[i].Transparency = Transparency
					end
				end
			end
		end
	end)
end

return EnableSafetyBubbleDummy