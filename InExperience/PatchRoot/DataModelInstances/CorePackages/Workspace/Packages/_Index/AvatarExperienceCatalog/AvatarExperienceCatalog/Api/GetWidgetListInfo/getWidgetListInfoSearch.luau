local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local Url = require(Parent.Http).Url
local _ = require(Parent.LuauPolyfill)
local NormalizeWidgetListInfoResponseToWidgetListInfoModule = require(script.Parent.normalizeWidgetListInfoResponseToWidgetListInfo)
local ConstantsModule = require(script.Parent.constants)
local _ = require(AvatarExperienceCatalog.Models.WidgetListInfo)
local MakeAXResponseHandlerModule = require(AvatarExperienceCatalog.Utils.makeAXResponseHandler)

return function(Callback, RequestId, Query) --[[ Line: 16 | Named "getWidgetListInfoSearch" ]]
	-- upvalues: Url (copy), MakeAXResponseHandlerModule (copy), NormalizeWidgetListInfoResponseToWidgetListInfoModule (copy), ConstantsModule (copy)
	local GET, GET2 = Callback(`{Url.APIS_URL}marketplace-widgets/v1/widgets/search?{Url:makeQueryString({ requestId = RequestId, query = Query })}`, "GET")
	
	return MakeAXResponseHandlerModule(GET, NormalizeWidgetListInfoResponseToWidgetListInfoModule, {
		modelMismatchCounter = ConstantsModule.FETCH_WIDGET_INFO_MODEL_MISMATCH_COUNTER_NAME,
		latencyCounter = ConstantsModule.FETCH_WIDGET_INFO_LATENCY_COUNTER_NAME
	}), GET2
end