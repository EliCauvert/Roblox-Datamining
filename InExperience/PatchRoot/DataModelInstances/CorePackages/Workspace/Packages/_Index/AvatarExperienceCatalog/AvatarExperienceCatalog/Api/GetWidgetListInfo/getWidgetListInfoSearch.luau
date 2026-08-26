local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local url = require(parent.Http).Url
local _ = require(parent.LuauPolyfill)
local normalizeWidgetListInfoResponseToWidgetListInfoModule = require(script.Parent.normalizeWidgetListInfoResponseToWidgetListInfo)
local constantsModule = require(script.Parent.constants)
local _ = require(avatarExperienceCatalog.Models.WidgetListInfo)
local makeAXResponseHandlerModule = require(avatarExperienceCatalog.Utils.makeAXResponseHandler)

return function(p1, p2, p3)
	-- upvalues: url (ref), makeAXResponseHandlerModule (ref), normalizeWidgetListInfoResponseToWidgetListInfoModule (ref), constantsModule (ref)
	local var1, var2 = p1(`{url.APIS_URL}marketplace-widgets/v1/widgets/search?{url:makeQueryString({ requestId = p2, query = p3 })}`, "GET")
	
	return makeAXResponseHandlerModule(var1, normalizeWidgetListInfoResponseToWidgetListInfoModule, {
		modelMismatchCounter = constantsModule.FETCH_WIDGET_INFO_MODEL_MISMATCH_COUNTER_NAME,
		latencyCounter = constantsModule.FETCH_WIDGET_INFO_LATENCY_COUNTER_NAME
	}), var2
end