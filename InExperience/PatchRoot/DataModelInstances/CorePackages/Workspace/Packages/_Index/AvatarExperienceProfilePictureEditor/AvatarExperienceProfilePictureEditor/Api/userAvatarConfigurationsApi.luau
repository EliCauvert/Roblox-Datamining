local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local HttpModule = require(AvatarExperienceProfilePictureEditor.Parent.Http)
local EnumsModule = require(AvatarExperienceProfilePictureEditor.Common.Enums)
local list = { "ProfileFrame", "ThumbnailCustomizations" }

local function _(List, List1)
	if typeof(List1) == "string" then
		table.insert(List, `selectionTypes={List1}`)
		
		return
	end
	for _, value in List1 do
		table.insert(List, `selectionTypes={value}`)
	end
end

local function buildUserAvatarConfigurationsUrl(p1, p2): string
	-- upvalues: list (copy), HttpModule (copy)
	local P2 = p2 or list
	local List = {}
	
	if typeof(P2) == "string" then
		table.insert(List, `selectionTypes={P2}`)
	else
		for _, value in P2 do
			table.insert(List, `selectionTypes={value}`)
		end
	end
	return `{HttpModule.Url.AVATAR_URL}v4/avatar/users/{p1}?{table.concat(List, "&")}`
end

return {
	DEFAULT_SELECTION_TYPES = list,
	buildUserAvatarConfigurationsUrl = buildUserAvatarConfigurationsUrl,
	fetchUserAvatarConfigurations = function(Callback, p3, p4)
		-- upvalues: buildUserAvatarConfigurationsUrl (copy), EnumsModule (copy)
		return Callback(buildUserAvatarConfigurationsUrl(p3, p4), EnumsModule.RequestMethods.GET)
	end
}