local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local httpModule = require(avatarExperienceProfilePictureEditor.Parent.Http)
local enumsModule = require(avatarExperienceProfilePictureEditor.Common.Enums)
local list = { "ProfileFrame", "ThumbnailCustomizations" }

local function _(p0, p1) --[[ line: 12 | named "appendSelectionTypeQueryParams" ]]
	if typeof(p1) == "string" then
		table.insert(p0, `selectionTypes={p1}`)
		
		return
	end
	for i, v in p1 do
		table.insert(p0, `selectionTypes={v}`)
	end
end

local function buildUserAvatarConfigurationsUrl(p2, p3) --[[ line: 23 ]]
	-- upvalues: list (ref), httpModule (ref)
	p3 = p3 or list
	local t = {}
	
	if typeof(p3) == "string" then
		table.insert(t, `selectionTypes={p3}`)
	else
		for i, v in p3 do
			table.insert(t, `selectionTypes={v}`)
		end
	end
	return `{httpModule.Url.AVATAR_URL}v4/avatar/users/{p2}?{table.concat(t, "&")}`
end

return {
	DEFAULT_SELECTION_TYPES = list,
	buildUserAvatarConfigurationsUrl = buildUserAvatarConfigurationsUrl,
	fetchUserAvatarConfigurations = function(p4, p5, p6) --[[ line: 30 ]]
		-- upvalues: buildUserAvatarConfigurationsUrl (ref), enumsModule (ref)
		return p4(buildUserAvatarConfigurationsUrl(p5, p6), enumsModule.RequestMethods.GET)
	end
}