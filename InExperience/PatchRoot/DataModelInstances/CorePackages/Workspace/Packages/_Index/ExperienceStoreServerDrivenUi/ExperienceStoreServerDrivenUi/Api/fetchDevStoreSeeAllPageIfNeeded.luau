local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local Parent = ExperienceStoreServerDrivenUi.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetDevStoreSeeAllUrlModule = require(ExperienceStoreServerDrivenUi.Api.getDevStoreSeeAllUrl)
local GetDevStoreSeeAllPageKeyModule = require(ExperienceStoreServerDrivenUi.Utils.getDevStoreSeeAllPageKey)

return function(p1, LoadTimer, p2)
	-- upvalues: GetDevStoreSeeAllUrlModule (copy), GetDevStoreSeeAllPageKeyModule (copy), Parent (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), AppPage (copy)
	local DevStoreSeeAllUrlModule = GetDevStoreSeeAllUrlModule(p1)
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = SduiResponseType.Protobuf,
		url = DevStoreSeeAllUrlModule,
		surfaceKey = AppPage.DevStoreSeeAll,
		configKey = GetDevStoreSeeAllPageKeyModule(p1),
		loadTimer = LoadTimer,
		apiProto = require(Parent.ServiceContractsProto).apppageplatform.devstore.dev_store_see_all.DevStoreSeeAllResponse
	}, p2)
	
	return DevStoreSeeAllUrlModule
end