local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local sduiV2OmniFeedConstantsModule = require(serverDrivenUi.Migration.SduiV2OmniFeedConstants)

return function(p0, p1, p2)
	-- upvalues: sduiLoadTimer (ref), parent (ref), getSduiApiStore (ref), sduiV2OmniFeedConstantsModule (ref)
	local homePageResponse = require(parent.ServiceContractsProto).apppageplatform.home.home_page.HomePageResponse
	getSduiApiStore().seedFromDecodedResponse({
		surfaceKey = p1,
		configKey = sduiV2OmniFeedConstantsModule.HomeConfigKey,
		decodedResponse = homePageResponse.jsonDecode(p0),
		loadTimer = p2 or sduiLoadTimer.createLoadTimer(p1),
		apiProto = homePageResponse
	})
end