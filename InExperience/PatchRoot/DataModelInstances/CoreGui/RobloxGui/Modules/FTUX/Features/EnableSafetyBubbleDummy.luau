local runService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local corePackagesService = game:GetService("CorePackages")
local workspaceService = game:GetService("Workspace")
local generateDummyModule = require(script.Parent.Parent.Utility.GenerateDummy)
local currentCamera = workspace.CurrentCamera
local fIntSafetyBubbleRadius = require(corePackagesService.Workspace.Packages.VrCommon).FIntSafetyBubbleRadius
local var1 = require(corePackagesService.Workspace.Packages.VrCommon).FIntSafetyBubbleTransparencyPercent * 0.01
local var2 = true
local maxValue = math.max(fIntSafetyBubbleRadius * currentCamera.HeadScale, 0.1)
local var3 = nil

function initDummy()
	-- upvalues: var3 (write), generateDummyModule (ref), workspaceService (ref)
	var3 = generateDummyModule(Vector3.new(0, 8.800000190735, -50.5), Vector3.new(0, 180, 0))
	var3.Parent = workspaceService
end

local function calculateTransparency(_, p1)
	-- upvalues: VRService (ref), currentCamera (ref), var3 (write), maxValue (ref), var1 (ref)
	if p1 then
		local magnitude = ((currentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)).Position - var3.HumanoidRootPart.Position).Magnitude
		local _ = 0
		local var4 = maxValue * 0.75
		
		return math.clamp(if magnitude < var4 then var1 else (1 - (magnitude - var4) / (maxValue - var4)) * var1, 0, 1)
	end
	return 0
end

function EnableSafetyBubbleDummy()
	-- upvalues: var3 (write), userGameSettingsService (ref), var2 (write), calculateTransparency (ref), runService (ref)
	initDummy()
	runService.Stepped:Connect(function()
		-- upvalues: var3 (copy), userGameSettingsService (copy), var2 (copy), calculateTransparency (copy)
		local children = var3:GetChildren()
		var2 = userGameSettingsService.VRSafetyBubbleMode ~= Enum.VRSafetyBubbleMode.Anyone
		
		for i, v in ipairs(game.Players:GetPlayers()) do
			if v.Character then
				local var4 = calculateTransparency(v, var2)
				var3.Head.Face.Transparency = var4
				
				for i_1 = 1, #children do
					if children[i_1]:IsA("Part") then
						children[i_1].Transparency = var4
					end
				end
			end
		end
	end)
end

return EnableSafetyBubbleDummy