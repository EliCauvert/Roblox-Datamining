local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local Url = require(Parent.Http).Url
local _ = require(Parent.LuauPolyfill)

return function(Callback, Input)
	-- upvalues: Url (copy), HttpService (copy)
	local POST, POST2 = Callback(`{Url.AVATAR_URL}v3/outfits/create`, "POST", { postBody = HttpService:JSONEncode(Input) })
	
	return POST, POST2
end