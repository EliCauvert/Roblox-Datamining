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

return function(p0, p1, p2, p3, p4) --[[ line: 22 | named "getLooksFromWidgetListInfo" ]]
	-- upvalues: fFlagAXAvatarTabLooksYouMayAlsoLike (ref), url (ref), makeAXResponseHandlerModule (ref), normalizeWidgetListInfoResponseToWidgetListInfoModule (ref), constantsModule (ref)
	local var4 = if p3 and p3.LooksWidgetContextForOrganicContent then p3.LooksWidgetContextForOrganicContent else "avatarTab"
	
	if fFlagAXAvatarTabLooksYouMayAlsoLike and p4 then
		var4 = p4
	end
	local var5, var6 = p0(`{url.APIS_URL}marketplace-widgets/v1/widgets?{url:makeQueryString({ query = p2, context = var4, requestId = p1 })}`, "GET")
	
	return makeAXResponseHandlerModule(var5, normalizeWidgetListInfoResponseToWidgetListInfoModule, {
		modelMismatchCounter = constantsModule.FETCH_WIDGET_INFO_MODEL_MISMATCH_COUNTER_NAME,
		latencyCounter = constantsModule.FETCH_WIDGET_INFO_LATENCY_COUNTER_NAME
	}), var6
end