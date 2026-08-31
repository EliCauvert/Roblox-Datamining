local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local url = require(parent.Http).Url
local _ = require(parent.LuauPolyfill)
local normalizeWidgetListInfoResponseToWidgetListInfoModule = require(script.Parent.normalizeWidgetListInfoResponseToWidgetListInfo)
local constantsModule = require(script.Parent.constants)
local _ = require(avatarExperienceCatalog.Models.WidgetListInfo)
local makeAXResponseHandlerModule = require(avatarExperienceCatalog.Utils.makeAXResponseHandler)
local _ = require(parent.AvatarExperienceCommon)
local fFlagAXAvatarTabLooksYouMayAlsoLike = require(parent.AvatarExperienceFlags).FFlagAXAvatarTabLooksYouMayAlsoLike

return function(p1, p2, p3, p4, p5)
	-- upvalues: fFlagAXAvatarTabLooksYouMayAlsoLike (ref), url (ref), makeAXResponseHandlerModule (ref), normalizeWidgetListInfoResponseToWidgetListInfoModule (ref), constantsModule (ref)
	local var1 = if p4 and p4.LooksWidgetContextForOrganicContent then p4.LooksWidgetContextForOrganicContent else "avatarTab"
	
	if fFlagAXAvatarTabLooksYouMayAlsoLike and p5 then
		var1 = p5
	end
	local var2, var3 = p1(`{url.APIS_URL}marketplace-widgets/v1/widgets?{url:makeQueryString({ query = p3, context = var1, requestId = p2 })}`, "GET")
	
	return makeAXResponseHandlerModule(var2, normalizeWidgetListInfoResponseToWidgetListInfoModule, {
		modelMismatchCounter = constantsModule.FETCH_WIDGET_INFO_MODEL_MISMATCH_COUNTER_NAME,
		latencyCounter = constantsModule.FETCH_WIDGET_INFO_LATENCY_COUNTER_NAME
	}), var3
end