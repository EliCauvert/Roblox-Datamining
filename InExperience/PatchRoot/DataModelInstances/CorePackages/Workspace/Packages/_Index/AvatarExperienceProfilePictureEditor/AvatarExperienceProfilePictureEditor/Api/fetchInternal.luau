local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local HttpRequestModule = require(AvatarExperienceProfilePictureEditor.Parent.HttpRequest)
local _ = require(AvatarExperienceProfilePictureEditor.Common.Enums)

return HttpRequestModule.config({
	requestFunction = function(p1, p2, p3) --[[ Line: 11 ]]
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})