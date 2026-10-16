local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local Url = require(Parent.Http).Url
local _ = require(Parent.LuauPolyfill)
local NormalizeWidgetListInfoResponseToWidgetListInfoModule = require(script.Parent.normalizeWidgetListInfoResponseToWidgetListInfo)
local ConstantsModule = require(script.Parent.constants)
local _ = require(AvatarExperienceCatalog.Models.WidgetListInfo)
local MakeAXResponseHandlerModule = require(AvatarExperienceCatalog.Utils.makeAXResponseHandler)
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local WidgetListBreakPointSizeMapModule = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointSizeMap)
local FFlagAXPassScreenSizeToWidgetApi = require(Parent.AvatarExperienceFlags).FFlagAXPassScreenSizeToWidgetApi

return function(Callback, RequestId, Context, p1) --[[ Line: 22 | Named "getWidgetListInfo" ]]
	-- upvalues: Url (copy), FFlagAXPassScreenSizeToWidgetApi (copy), WidgetListBreakPointSizeMapModule (copy), MakeAXResponseHandlerModule (copy), NormalizeWidgetListInfoResponseToWidgetListInfoModule (copy), ConstantsModule (copy)
	local GET, GET2 = Callback(`{Url.APIS_URL}marketplace-widgets/v1/widgets?{Url:makeQueryString({
		requestId = RequestId,
		context = Context,
		screenSize = if FFlagAXPassScreenSizeToWidgetApi and p1 then WidgetListBreakPointSizeMapModule[p1] else nil
	})}`, "GET")
	
	return MakeAXResponseHandlerModule(GET, NormalizeWidgetListInfoResponseToWidgetListInfoModule, {
		modelMismatchCounter = ConstantsModule.FETCH_WIDGET_INFO_MODEL_MISMATCH_COUNTER_NAME,
		latencyCounter = ConstantsModule.FETCH_WIDGET_INFO_LATENCY_COUNTER_NAME
	}), GET2
end