local NetworkRequests = script.Parent.networkRequests
local CreateGetSocialLinksModule = require(NetworkRequests.createGetSocialLinks)
local CreateGetSelfSocialLinksModule = require(NetworkRequests.createGetSelfSocialLinks)
local CreateSetSocialLinksModule = require(NetworkRequests.createSetSocialLinks)

return function(p1) --[[ Line: 7 ]]
	-- upvalues: CreateGetSocialLinksModule (copy), CreateGetSelfSocialLinksModule (copy), CreateSetSocialLinksModule (copy)
	return {
		GetSocialLinks = CreateGetSocialLinksModule(p1),
		GetSelfSocialLinks = CreateGetSelfSocialLinksModule(p1),
		SetSocialLinks = CreateSetSocialLinksModule(p1)
	}
end