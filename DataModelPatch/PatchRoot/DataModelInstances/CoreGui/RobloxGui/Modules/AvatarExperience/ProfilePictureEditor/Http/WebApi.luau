local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local UrlModule = require(Modules.LuaApp.Http.Url)
local UtilsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Utils)

return {
	FetchPPEConfig = function(Callback)
		-- upvalues: UrlModule (copy)
		return Callback(string.format("%s/v1/avatar/thumbnail-customizations", UrlModule.AVATAR_URL), "GET")
	end,
	WritePPEConfig = function(Callback, p1, p2, DistanceScale, YRotDeg, FieldOfViewDeg)
		-- upvalues: ArgCheckModule (copy), UrlModule (copy), UtilsModule (copy), HttpService (copy)
		ArgCheckModule.isType(p1, "userdata", "WebApi.WritePPEConfig expects thumbnailType to be a userdata")
		ArgCheckModule.isTypeOrNil(p2, "string", "WebApi.WritePPEConfig expects emoteAssetId to be a string or nil")
		ArgCheckModule.isType(DistanceScale, "number", "WebApi.WritePPEConfig expects cameraDistanceScale to be a number")
		ArgCheckModule.isType(YRotDeg, "number", "WebApi.WritePPEConfig expects cameraYRotDeg to be a number")
		ArgCheckModule.isType(FieldOfViewDeg, "number", "WebApi.WritePPEConfig expects fieldOfViewDeg to be a number")
		
		return Callback(string.format("%s/v1/avatar/thumbnail-customization", UrlModule.AVATAR_URL), "POST", {
			postBody = HttpService:JSONEncode({
				thumbnailType = UtilsModule.ConvertThumbnailTypeToInt(p1),
				emoteAssetId = if p2 then tonumber(p2) else 0,
				camera = {
					fieldOfViewDeg = FieldOfViewDeg,
					yRotDeg = YRotDeg,
					distanceScale = DistanceScale
				}
			})
		})
	end
}