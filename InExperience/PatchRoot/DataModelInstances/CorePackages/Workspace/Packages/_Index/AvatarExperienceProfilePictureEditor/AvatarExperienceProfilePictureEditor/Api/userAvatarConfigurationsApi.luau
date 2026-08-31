local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local httpModule = require(avatarExperienceProfilePictureEditor.Parent.Http)
local enumsModule = require(avatarExperienceProfilePictureEditor.Common.Enums)
local list = { "ProfileFrame", "ThumbnailCustomizations" }

local function _(p1, p2)
	if typeof(p2) == "string" then
		table.insert(p1, `selectionTypes={p2}`)
		
		return
	end
	for i, v in p2 do
		table.insert(p1, `selectionTypes={v}`)
	end
end

local function buildUserAvatarConfigurationsUrl(p3, p4)
	-- upvalues: list (ref), httpModule (ref)
	p4 = p4 or list
	local t = {}
	
	if typeof(p4) == "string" then
		table.insert(t, `selectionTypes={p4}`)
	else
		for i, v in p4 do
			table.insert(t, `selectionTypes={v}`)
		end
	end
	return `{httpModule.Url.AVATAR_URL}v4/avatar/users/{p3}?{table.concat(t, "&")}`
end

return {
	DEFAULT_SELECTION_TYPES = list,
	buildUserAvatarConfigurationsUrl = buildUserAvatarConfigurationsUrl,
	fetchUserAvatarConfigurations = function(p5, p6, p7)
		-- upvalues: buildUserAvatarConfigurationsUrl (ref), enumsModule (ref)
		return p5(buildUserAvatarConfigurationsUrl(p6, p7), enumsModule.RequestMethods.GET)
	end
}