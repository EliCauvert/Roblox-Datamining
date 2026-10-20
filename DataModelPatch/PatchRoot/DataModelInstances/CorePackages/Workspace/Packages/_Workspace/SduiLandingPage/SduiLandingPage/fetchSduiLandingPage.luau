local Parent = script:FindFirstAncestor("SduiLandingPage").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiLandingPageKeyModule = require(script.Parent.getSduiLandingPageKey)
local GetSduiLandingPageUrlModule = require(script.Parent.getSduiLandingPageUrl)

return function(p1, p2, LoadTimer, p3)
	-- upvalues: GetSduiLandingPageUrlModule (copy), GetSduiLandingPageKeyModule (copy), Parent (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), AppPage (copy)
	local SduiLandingPageUrlModule = GetSduiLandingPageUrlModule(p1, p2)
	local SduiLandingPageKeyModule = GetSduiLandingPageKeyModule(p1)
	local SpotlightCollectionPageResponse = require(Parent.ServiceContractsProto).apppageplatform.spotlightcollection.spotlight_collection_page.SpotlightCollectionPageResponse
	local t = {}
	
	local function _(p4)
		-- upvalues: t (copy), SpotlightCollectionPageResponse (copy)
		return t[p4] or SpotlightCollectionPageResponse
	end
	
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = SduiResponseType.ProtobufJson,
		url = SduiLandingPageUrlModule,
		surfaceKey = AppPage.SduiLandingPage,
		configKey = SduiLandingPageKeyModule,
		loadTimer = LoadTimer,
		apiProto = t[p1] or SpotlightCollectionPageResponse
	}, p3)
	
	return SduiLandingPageKeyModule
end