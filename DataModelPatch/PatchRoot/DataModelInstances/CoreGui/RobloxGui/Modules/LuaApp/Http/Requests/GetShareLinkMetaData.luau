local HttpService = game:GetService("HttpService")
local UrlBuilderModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder)

return function(Callback, LinkId, LinkType)
	-- upvalues: UrlBuilderModule (copy), HttpService (copy)
	return Callback(UrlBuilderModule.fromString("apis:sharelinks/v1/get-metadata")(), "POST", {
		postBody = HttpService:JSONEncode({ linkId = LinkId, linkType = LinkType })
	})
end