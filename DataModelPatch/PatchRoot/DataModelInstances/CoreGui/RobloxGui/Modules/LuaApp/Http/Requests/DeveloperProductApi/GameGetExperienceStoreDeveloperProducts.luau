local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UrlModule = require(Modules.LuaApp.Http.Url)
local GetFIntExperienceStoreApiPageSizeModule = require(Modules.LuaApp.Flags.GetFIntExperienceStoreApiPageSize)

return function(Callback, p1, p2)
	-- upvalues: GetFIntExperienceStoreApiPageSizeModule (copy), UrlModule (copy)
	return Callback(string.format("%sexperience-store/v1/universes/%s/store?limit=%d&cursor=%s", UrlModule.APIS_URL, p1, GetFIntExperienceStoreApiPageSizeModule(), p2), "GET")
end