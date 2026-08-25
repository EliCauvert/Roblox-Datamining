local runService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local corePackagesService = game:GetService("CorePackages")
local workspaceService = game:GetService("Workspace")
local generateDummyModule = require(script.Parent.Parent.Utility.GenerateDummy)
local currentCamera = workspace.CurrentCamera
local fIntSafetyBubbleRadius = require(corePackagesService.Workspace.Packages.VrCommon).FIntSafetyBubbleRadius
local var6 = require(corePackagesService.Workspace.Packages.VrCommon).FIntSafetyBubbleTransparencyPercent * 0.01
local var7 = true
local maxValue = math.max(fIntSafetyBubbleRadius * currentCamera.HeadScale, 0.1)
local var9 = nil

function initDummy()
	-- upvalues: var9 (write), generateDummyModule (ref), workspaceService (ref)
	var9 = generateDummyModule(Vector3.new(0, 8.800000190735, -50.5), Vector3.new(0, 180, 0))
	var9.Parent = workspaceService
end

local function calculateTransparency(_, p0)
	-- upvalues: VRService (ref), currentCamera (ref), var9 (write), maxValue (ref), var6 (ref)
	if p0 then
		local magnitude = ((currentCamera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)).Position - var9.HumanoidRootPart.Position).Magnitude
		local _ = 0
		local var11 = maxValue * 0.75
		
		return math.clamp(if magnitude < var11 then var6 else (1 - (magnitude - var11) / (maxValue - var11)) * var6, 0, 1)
	end
	return 0
end

function EnableSafetyBubbleDummy()
	-- upvalues: var9 (write), userGameSettingsService (ref), var7 (write), calculateTransparency (ref), runService (ref)
	initDummy()
	runService.Stepped:Connect(function()
		-- upvalues: var9 (copy), userGameSettingsService (copy), var7 (copy), calculateTransparency (copy)
		local children = var9:GetChildren()
		var7 = userGameSettingsService.VRSafetyBubbleMode ~= Enum.VRSafetyBubbleMode.Anyone
		
		for i, v in ipairs(game.Players:GetPlayers()) do
			if v.Character then
				local var13 = calculateTransparency(v, var7)
				var9.Head.Face.Transparency = var13
				
				for i_1 = 1, #children do
					if children[i_1]:IsA("Part") then
						children[i_1].Transparency = var13
					end
				end
			end
		end
	end)
end

return EnableSafetyBubbleDummy