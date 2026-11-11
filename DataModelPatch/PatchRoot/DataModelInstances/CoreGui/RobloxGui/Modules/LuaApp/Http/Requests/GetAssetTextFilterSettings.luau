local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NewResult = require(Modules.LuaApp.Http.UrlBuilder).new({
	path = "asset-text-filter-settings/public/universe/{universeId}",
	base = require(Modules.LuaApp.Http.Url).APIS_URL
})

return function(Callback, UniverseId)
	-- upvalues: NewResult (copy)
	assert(type(UniverseId) == "string", "GetAssetTextFilterSettings request expects universeId to be a string")
	
	return Callback(NewResult({ universeId = UniverseId }), "GET")
end