local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UsePreviousFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.usePrevious
local CameraPresetsUtility = require(CorePackages.Packages.Thumbnailing).CameraPresetsUtility
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local LookViewportUtilsModule = require(script.Parent.LookViewportUtils)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetFFlagAXLookViewportCameraAlignmentModule = require(Modules.AvatarExperience.Flags.GetFFlagAXLookViewportCameraAlignment)
local GetFFlagAXLookViewportUseFallbackEmoteModule = require(Modules.AvatarExperience.Flags.GetFFlagAXLookViewportUseFallbackEmote)
local AXLookViewportCameraFOV = game:DefineFastInt("AXLookViewportCameraFOV", 56)
local AXLookViewportFallbackEmoteId = game:DefineFastString("AXLookViewportFallbackEmoteId", "136596589997464")
local GetFFlagAXAnimatedLooksThumbnailsModule = require(Modules.AvatarExperience.Flags.GetFFlagAXAnimatedLooksThumbnails)

return function(p1)
	-- upvalues: ReactModule (copy), UsePreviousFunction (copy), HttpService (copy), LookViewportUtilsModule (copy), GetFFlagAXLookViewportCameraAlignmentModule (copy), GetFFlagAXLookViewportUseFallbackEmoteModule (copy), AXLookViewportFallbackEmoteId (copy), CameraPresetsUtility (copy), AXLookViewportCameraFOV (copy), GetFFlagAXAnimatedLooksThumbnailsModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef("")
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(CFrame.new())
	local UsePreviousResult = UsePreviousFunction(p1.lookDetails)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy)
		if UseRefResult2.current then
			UseRefResult2.current.CurrentCamera = UseRefResult1.current
		end
	end, { UseRefResult2, UseRefResult1 })
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), HttpService (upval), UseRefResult3 (copy), LookViewportUtilsModule (upval), GetFFlagAXLookViewportCameraAlignmentModule (upval), GetFFlagAXLookViewportUseFallbackEmoteModule (upval), AXLookViewportFallbackEmoteId (upval), CameraPresetsUtility (upval), AXLookViewportCameraFOV (upval), UseBindingResult2 (copy), GetFFlagAXAnimatedLooksThumbnailsModule (upval), p1 (copy)
		if UseRefResult.current then
			UseRefResult.current:ClearAllChildren()
		end
		if not p2 then return end
		local Guid = HttpService:GenerateGUID(false)
		UseRefResult3.current = Guid
		local AvatarModel = LookViewportUtilsModule.createAvatarModel(p2)
		
		if GetFFlagAXLookViewportCameraAlignmentModule() then
			local EmoteAssetId = p2.displayProperties and p2.displayProperties.emoteAssetId
			local Flag = false
			
			if GetFFlagAXLookViewportUseFallbackEmoteModule() and not EmoteAssetId then
				Flag = true
				EmoteAssetId = AXLookViewportFallbackEmoteId
			end
			UseBindingResult2((CameraPresetsUtility.GetCameraCFrame_ForAvatarR15Action_LookAtGoldenRatioOfTheHumanoid(AvatarModel, function()
				-- upvalues: EmoteAssetId (ref), LookViewportUtilsModule (upval), AvatarModel (copy)
				if EmoteAssetId then
					LookViewportUtilsModule.applyPose(EmoteAssetId, AvatarModel)
				end
			end, Flag, AXLookViewportCameraFOV)))
		end
		if UseRefResult3.current ~= Guid then
			AvatarModel:Destroy()
			
			return
		end
		AvatarModel.Parent = UseRefResult.current
		
		if not GetFFlagAXLookViewportCameraAlignmentModule() then
			AvatarModel:PivotTo(CFrame.new(0, 0, 0))
			local Pivot = AvatarModel:GetPivot()
			UseBindingResult2(CFrame.new(Pivot.Position + Pivot.LookVector * 6, Pivot.Position) - vector.create(0, 0.75, 0))
		end
		if GetFFlagAXAnimatedLooksThumbnailsModule() and p1.avatarModelRef then
			p1.avatarModelRef.current = AvatarModel
		end
	end, { UseRefResult })
	ReactModule.useEffect(function()
		-- upvalues: LookViewportUtilsModule (upval), UsePreviousResult (copy), p1 (copy), UseResult (copy)
		if LookViewportUtilsModule.areLooksDifferent(UsePreviousResult, p1.lookDetails) then
			task.spawn(function()
				-- upvalues: UseResult (upval), p1 (upval)
				UseResult(p1.lookDetails)
			end)
		end
	end, { p1.lookDetails, UsePreviousResult, UseResult })
	
	return ReactModule.createElement("ViewportFrame", {
		BackgroundTransparency = 1,
		LightDirection = vector.create(-1, -1, 2),
		Size = UDim2.fromScale(1, 1),
		LightColor = Color3.fromRGB(218, 203, 173),
		ref = UseRefResult2
	}, {
		WorldModel = ReactModule.createElement("WorldModel", { ref = UseRefResult }),
		Camera = ReactModule.createElement("Camera", {
			CameraType = Enum.CameraType.Scriptable,
			CFrame = UseBindingResult,
			ref = UseRefResult1
		})
	})
end