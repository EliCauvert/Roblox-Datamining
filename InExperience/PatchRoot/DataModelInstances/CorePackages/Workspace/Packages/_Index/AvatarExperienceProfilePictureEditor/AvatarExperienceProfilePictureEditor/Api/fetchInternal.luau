local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local httpRequestModule = require(avatarExperienceProfilePictureEditor.Parent.HttpRequest)
local _ = require(avatarExperienceProfilePictureEditor.Common.Enums)

return httpRequestModule.config({
	requestFunction = function(p0, p1, p2) --[[ line: 11 ]]
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.RequestInternal(p0, p1, p2)
	end
})