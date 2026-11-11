local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local ConstantsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Constants)
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local UtilsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Utils)
local WebApiModule = require(Modules.AvatarExperience.ProfilePictureEditor.Http.WebApi)
local SetEmoteAssetIdModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetEmoteAssetId)
local SetCameraSliderZoomModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderZoom)
local SetCameraSliderRotateModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderRotate)

local function parseFetchPPEConfigResult(ResponseBody, Closeup)
	-- upvalues: UtilsModule (copy)
	local v1: string? = nil
	local DistanceScale = 1
	local YRotDeg = 0
	local ConvertThumbnailTypeToIntResult = UtilsModule.ConvertThumbnailTypeToInt(Closeup)
	local AvatarThumbnailCustomizations = ResponseBody.avatarThumbnailCustomizations
	
	if AvatarThumbnailCustomizations then
		for _, avatarThumbnailCustomization in AvatarThumbnailCustomizations do
			if avatarThumbnailCustomization.thumbnailType == ConvertThumbnailTypeToIntResult then
				if avatarThumbnailCustomization.emoteAssetId and avatarThumbnailCustomization.emoteAssetId ~= 0 then
					v1 = tostring(avatarThumbnailCustomization.emoteAssetId)
				end
				if avatarThumbnailCustomization.camera then
					DistanceScale = avatarThumbnailCustomization.camera.distanceScale
					
					if DistanceScale == -1 then
						DistanceScale = 1
					end
					YRotDeg = avatarThumbnailCustomization.camera.yRotDeg
				end
			end
		end
	end
	return v1, UtilsModule.getSliderValueFromCameraDistanceScale(DistanceScale), (UtilsModule.getSliderValueFromYRotDeg(YRotDeg))
end

return function(p1)
	-- upvalues: ConstantsModule (copy), PerformFetch (copy), WebApiModule (copy), parseFetchPPEConfigResult (copy), PPEThumbnailTypeModule (copy), SetEmoteAssetIdModule (copy), SetCameraSliderZoomModule (copy), SetCameraSliderRotateModule (copy), PromiseModule (copy), Logging (copy)
	return PerformFetch.Single(ConstantsModule.PPEConfigFetchStatusKey, function(p2)
		-- upvalues: WebApiModule (upval), p1 (copy), parseFetchPPEConfigResult (upval), PPEThumbnailTypeModule (upval), SetEmoteAssetIdModule (upval), SetCameraSliderZoomModule (upval), SetCameraSliderRotateModule (upval), PromiseModule (upval), Logging (upval)
		return WebApiModule.FetchPPEConfig(p1):andThen(function(Result)
			-- upvalues: parseFetchPPEConfigResult (upval), PPEThumbnailTypeModule (upval), p2 (copy), SetEmoteAssetIdModule (upval), SetCameraSliderZoomModule (upval), SetCameraSliderRotateModule (upval), PromiseModule (upval)
			local ResponseBody = Result and Result.responseBody
			
			if not ResponseBody then
				return PromiseModule.reject()
			end
			local ParseFetchPPEConfigResultResult, ParseFetchPPEConfigResultResult2, ParseFetchPPEConfigResultResult3 = parseFetchPPEConfigResult(ResponseBody, PPEThumbnailTypeModule.Closeup)
			p2:dispatch(SetEmoteAssetIdModule(ParseFetchPPEConfigResultResult))
			
			if ParseFetchPPEConfigResultResult2 then
				p2:dispatch(SetCameraSliderZoomModule(ParseFetchPPEConfigResultResult2))
			end
			if ParseFetchPPEConfigResultResult3 then
				p2:dispatch(SetCameraSliderRotateModule(ParseFetchPPEConfigResultResult3))
			end
			return PromiseModule.resolve()
		end, function(p3)
			-- upvalues: Logging (upval), PromiseModule (upval)
			Logging.warn("WebApi failure in FetchPPEConfig")
			
			return PromiseModule.reject(p3)
		end)
	end)
end