local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local sduiApiStorePostConfigContentType = sduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local fFlagAXFetchCatalogPageReturnsPromise = require(parent.AvatarExperienceFlags).FFlagAXFetchCatalogPageReturnsPromise
local getCatalogPageUrlModule = require(script.Parent.Utils.getCatalogPageUrl)
local getCatalogConfigKeyModule = require(script.Parent.Utils.getCatalogConfigKey)
local normalizeScreenSizeForWireModule = require(script.Parent.Utils.normalizeScreenSizeForWire)

return function(p1, p2, p3)
	-- upvalues: parent (ref), normalizeScreenSizeForWireModule (ref), getSduiApiStore (ref), sduiResponseType (ref), getCatalogPageUrlModule (ref), avatarScreen (ref), getCatalogConfigKeyModule (ref), sduiApiStorePostConfigContentType (ref), fFlagAXFetchCatalogPageReturnsPromise (ref), promiseModule (ref)
	local marketplaceCatalogPage = require(parent.ServiceContractsProto).apppageplatform.marketplacecatalog.marketplace_catalog_page
	local cloned = table.clone(p1)
	cloned.screenSize = normalizeScreenSizeForWireModule(p1.screenSize)
	
	return if fFlagAXFetchCatalogPageReturnsPromise then getSduiApiStore().fetchIfNeeded({
		responseType = sduiResponseType.Protobuf,
		url = getCatalogPageUrlModule(),
		surfaceKey = avatarScreen.Catalog,
		configKey = getCatalogConfigKeyModule(cloned.context, cloned.screenSize),
		loadTimer = p2,
		apiProto = marketplaceCatalogPage.MarketplaceCatalogPageResponse,
		postConfig = {
			body = cloned,
			contentType = sduiApiStorePostConfigContentType.Json
		}
	}, p3 ~= nil and p3.forceRefresh == true) or promiseModule.resolve() else nil
end