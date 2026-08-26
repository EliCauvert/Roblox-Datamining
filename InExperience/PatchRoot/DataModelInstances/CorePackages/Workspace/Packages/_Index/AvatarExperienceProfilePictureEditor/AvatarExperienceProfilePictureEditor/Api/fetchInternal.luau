local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local httpRequestModule = require(avatarExperienceProfilePictureEditor.Parent.HttpRequest)
local _ = require(avatarExperienceProfilePictureEditor.Common.Enums)

return httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})