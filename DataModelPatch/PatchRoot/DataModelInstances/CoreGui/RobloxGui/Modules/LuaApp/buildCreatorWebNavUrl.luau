local UrlBuilderModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder)
local BuildRobloxWebNavQueryParamsModule = require(script.Parent.buildRobloxWebNavQueryParams)

return function(p1)
	-- upvalues: UrlBuilderModule (copy), BuildRobloxWebNavQueryParamsModule (copy)
	return UrlBuilderModule.addQueryString(UrlBuilderModule.static.creatorHub(), BuildRobloxWebNavQueryParamsModule(p1))
end