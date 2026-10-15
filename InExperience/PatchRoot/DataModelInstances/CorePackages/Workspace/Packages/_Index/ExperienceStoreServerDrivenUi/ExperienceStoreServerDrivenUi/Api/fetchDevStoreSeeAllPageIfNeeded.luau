local experienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local parent = experienceStoreServerDrivenUi.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getDevStoreSeeAllUrlModule = require(experienceStoreServerDrivenUi.Api.getDevStoreSeeAllUrl)
local getDevStoreSeeAllPageKeyModule = require(experienceStoreServerDrivenUi.Utils.getDevStoreSeeAllPageKey)

return function(p1, p2, p3)
	-- upvalues: getDevStoreSeeAllUrlModule (ref), getDevStoreSeeAllPageKeyModule (ref), parent (ref), getSduiApiStore (ref), sduiResponseType (ref), appPage (ref)
	local var1 = getDevStoreSeeAllUrlModule(p1)
	getSduiApiStore().fetchIfNeeded({
		responseType = sduiResponseType.Protobuf,
		url = var1,
		surfaceKey = appPage.DevStoreSeeAll,
		configKey = getDevStoreSeeAllPageKeyModule(p1),
		loadTimer = p2,
		apiProto = require(parent.ServiceContractsProto).apppageplatform.devstore.dev_store_see_all.DevStoreSeeAllResponse
	}, p3)
	
	return var1
end