local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local url = require(parent.Http).Url
local _ = require(parent.LuauPolyfill)
local normalizeWidgetListInfoResponseToWidgetListInfoModule = require(script.Parent.normalizeWidgetListInfoResponseToWidgetListInfo)
local constantsModule = require(script.Parent.constants)
local _ = require(avatarExperienceCatalog.Models.WidgetListInfo)
local makeAXResponseHandlerModule = require(avatarExperienceCatalog.Utils.makeAXResponseHandler)
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local widgetListBreakPointSizeMapModule = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointSizeMap)
local fFlagAXPassScreenSizeToWidgetApi = require(parent.AvatarExperienceFlags).FFlagAXPassScreenSizeToWidgetApi

return function(p0, p1, p2, p3) --[[ line: 22 | named "getWidgetListInfo" ]]
	-- upvalues: url (ref), fFlagAXPassScreenSizeToWidgetApi (ref), widgetListBreakPointSizeMapModule (ref), makeAXResponseHandlerModule (ref), normalizeWidgetListInfoResponseToWidgetListInfoModule (ref), constantsModule (ref)
	local t = {
		requestId = p1,
		context = p2,
		screenSize = if fFlagAXPassScreenSizeToWidgetApi and p3 then widgetListBreakPointSizeMapModule[p3] else nil
	}
	var6, t = p0(`{url.APIS_URL}marketplace-widgets/v1/widgets?{url:makeQueryString(t)}`, "GET")
	
	return makeAXResponseHandlerModule(var6, normalizeWidgetListInfoResponseToWidgetListInfoModule, {
		modelMismatchCounter = constantsModule.FETCH_WIDGET_INFO_MODEL_MISMATCH_COUNTER_NAME,
		latencyCounter = constantsModule.FETCH_WIDGET_INFO_LATENCY_COUNTER_NAME
	}), t
end