local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local url = require(parent.Http).Url
local _ = require(parent.LuauPolyfill)

return function(p1, p2)
	-- upvalues: url (ref), httpService (ref)
	local var1, var2 = p1(`{url.AVATAR_URL}v3/outfits/create`, "POST", { postBody = httpService:JSONEncode(p2) })
	
	return var1, var2
end