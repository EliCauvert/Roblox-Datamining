local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.LuauPolyfill)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local SduiApiStorePostConfigContentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local FFlagAXFetchCatalogPageReturnsPromise = require(Parent.AvatarExperienceFlags).FFlagAXFetchCatalogPageReturnsPromise
local GetCatalogPageUrlModule = require(script.Parent.Utils.getCatalogPageUrl)
local GetCatalogConfigKeyModule = require(script.Parent.Utils.getCatalogConfigKey)
local NormalizeScreenSizeForWireModule = require(script.Parent.Utils.normalizeScreenSizeForWire)

return function(Tbl, LoadTimer, p1)
	-- upvalues: Parent (copy), NormalizeScreenSizeForWireModule (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), GetCatalogPageUrlModule (copy), AvatarScreen (copy), GetCatalogConfigKeyModule (copy), SduiApiStorePostConfigContentType (copy), FFlagAXFetchCatalogPageReturnsPromise (copy), PromiseModule (copy)
	local MarketplaceCatalogPage = require(Parent.ServiceContractsProto).apppageplatform.marketplacecatalog.marketplace_catalog_page
	local Copy = table.clone(Tbl)
	Copy.screenSize = NormalizeScreenSizeForWireModule(Tbl.screenSize)
	local IfNeeded = GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = SduiResponseType.Protobuf,
		url = GetCatalogPageUrlModule(),
		surfaceKey = AvatarScreen.Catalog,
		configKey = GetCatalogConfigKeyModule(Copy.context, Copy.screenSize),
		loadTimer = LoadTimer,
		apiProto = MarketplaceCatalogPage.MarketplaceCatalogPageResponse,
		postConfig = {
			body = Copy,
			contentType = SduiApiStorePostConfigContentType.Json
		}
	}, p1 ~= nil and p1.forceRefresh == true)
	
	return if FFlagAXFetchCatalogPageReturnsPromise then IfNeeded or PromiseModule.resolve() else nil
end