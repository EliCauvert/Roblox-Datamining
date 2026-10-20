local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local Url = require(Parent.Http).Url
local _ = require(Parent.LuauPolyfill)
local NormalizeWidgetListInfoResponseToWidgetListInfoModule = require(script.Parent.normalizeWidgetListInfoResponseToWidgetListInfo)
local ConstantsModule = require(script.Parent.constants)
local _ = require(AvatarExperienceCatalog.Models.WidgetListInfo)
local MakeAXResponseHandlerModule = require(AvatarExperienceCatalog.Utils.makeAXResponseHandler)
local _ = require(Parent.AvatarExperienceCommon)
local FFlagAXAvatarTabLooksYouMayAlsoLike = require(Parent.AvatarExperienceFlags).FFlagAXAvatarTabLooksYouMayAlsoLike

return function(Callback, RequestId, Query, p1, p2)
	-- upvalues: FFlagAXAvatarTabLooksYouMayAlsoLike (copy), Url (copy), MakeAXResponseHandlerModule (copy), NormalizeWidgetListInfoResponseToWidgetListInfoModule (copy), ConstantsModule (copy)
	local GET, GET2 = Callback(`{Url.APIS_URL}marketplace-widgets/v1/widgets?{Url:makeQueryString({
		query = Query,
		context = if p1 and p1.LooksWidgetContextForOrganicContent then if FFlagAXAvatarTabLooksYouMayAlsoLike and p2 then p2 else p1.LooksWidgetContextForOrganicContent elseif FFlagAXAvatarTabLooksYouMayAlsoLike and p2 then p2 else "avatarTab",
		requestId = RequestId
	})}`, "GET")
	
	return MakeAXResponseHandlerModule(GET, NormalizeWidgetListInfoResponseToWidgetListInfoModule, {
		modelMismatchCounter = ConstantsModule.FETCH_WIDGET_INFO_MODEL_MISMATCH_COUNTER_NAME,
		latencyCounter = ConstantsModule.FETCH_WIDGET_INFO_LATENCY_COUNTER_NAME
	}), GET2
end