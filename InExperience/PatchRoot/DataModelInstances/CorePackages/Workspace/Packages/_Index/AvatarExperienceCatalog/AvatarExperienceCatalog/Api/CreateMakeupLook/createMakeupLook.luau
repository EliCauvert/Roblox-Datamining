local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local url = require(parent.Http).Url
local _ = require(parent.LuauPolyfill)

return function(p0, p1) --[[ line: 37 | named "createMakeupLook" ]]
	-- upvalues: url (ref), httpService (ref)
	local var1, var2 = p0(`{url.AVATAR_URL}v3/outfits/create`, "POST", { postBody = httpService:JSONEncode(p1) })
	
	return var1, var2
end