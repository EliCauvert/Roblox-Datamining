local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local url = require(parent.Http).Url
local _ = require(parent.LuauPolyfill)
local normalizeWidgetListInfoResponseToWidgetListInfoModule = require(script.Parent.normalizeWidgetListInfoResponseToWidgetListInfo)
local constantsModule = require(script.Parent.constants)
local _ = require(avatarExperienceCatalog.Models.WidgetListInfo)
local makeAXResponseHandlerModule = require(avatarExperienceCatalog.Utils.makeAXResponseHandler)

return function(p0, p1, p2) --[[ line: 16 | named "getWidgetListInfoSearch" ]]
	-- upvalues: url (ref), makeAXResponseHandlerModule (ref), normalizeWidgetListInfoResponseToWidgetListInfoModule (ref), constantsModule (ref)
	local var4, var5 = p0(`{url.APIS_URL}marketplace-widgets/v1/widgets/search?{url:makeQueryString({ requestId = p1, query = p2 })}`, "GET")
	
	return makeAXResponseHandlerModule(var4, normalizeWidgetListInfoResponseToWidgetListInfoModule, {
		modelMismatchCounter = constantsModule.FETCH_WIDGET_INFO_MODEL_MISMATCH_COUNTER_NAME,
		latencyCounter = constantsModule.FETCH_WIDGET_INFO_LATENCY_COUNTER_NAME
	}), var5
end