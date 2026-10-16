local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local SduiV2OmniFeedConstantsModule = require(ServerDrivenUi.Migration.SduiV2OmniFeedConstants)

return function(p1, SurfaceKey, p2) --[[ Line: 11 | Named "seedHomeOmniSduiV2Payload" ]]
	-- upvalues: SduiLoadTimer (copy), Parent (copy), GetSduiApiStoreFunction (copy), SduiV2OmniFeedConstantsModule (copy)
	local HomePageResponse = require(Parent.ServiceContractsProto).apppageplatform.home.home_page.HomePageResponse
	GetSduiApiStoreFunction().seedFromDecodedResponse({
		surfaceKey = SurfaceKey,
		configKey = SduiV2OmniFeedConstantsModule.HomeConfigKey,
		decodedResponse = HomePageResponse.jsonDecode(p1),
		loadTimer = p2 or SduiLoadTimer.createLoadTimer(SurfaceKey),
		apiProto = HomePageResponse
	})
end