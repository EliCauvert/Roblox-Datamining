local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local sduiV2OmniFeedConstantsModule = require(serverDrivenUi.Migration.SduiV2OmniFeedConstants)

return function(p1, p2, p3)
	-- upvalues: sduiLoadTimer (ref), parent (ref), getSduiApiStore (ref), sduiV2OmniFeedConstantsModule (ref)
	local homePageResponse = require(parent.ServiceContractsProto).apppageplatform.home.home_page.HomePageResponse
	getSduiApiStore().seedFromDecodedResponse({
		surfaceKey = p2,
		configKey = sduiV2OmniFeedConstantsModule.HomeConfigKey,
		decodedResponse = homePageResponse.jsonDecode(p1),
		loadTimer = p3 or sduiLoadTimer.createLoadTimer(p2),
		apiProto = homePageResponse
	})
end