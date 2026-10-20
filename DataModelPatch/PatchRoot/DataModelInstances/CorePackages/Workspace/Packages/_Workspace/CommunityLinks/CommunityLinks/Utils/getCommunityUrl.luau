local Parent = script:FindFirstAncestor("CommunityLinks").Parent
local Url = require(Parent.Http).Url
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local LuaAppEnableCommunityLinksRedirect = game:DefineFastFlag("LuaAppEnableCommunityLinksRedirect", false)

return function(CommunityId)
	-- upvalues: LuaAppEnableCommunityLinksRedirect (copy), UrlBuilder (copy), Url (copy)
	return if LuaAppEnableCommunityLinksRedirect then UrlBuilder.new({
		path = "community-links/v1/guilded/{communityId}/join",
		base = Url.APIS_URL,
		query = { a = "red" }
	})({ communityId = CommunityId }) else "https://guilded.gg/teams/" .. CommunityId .. "?a=red"
end