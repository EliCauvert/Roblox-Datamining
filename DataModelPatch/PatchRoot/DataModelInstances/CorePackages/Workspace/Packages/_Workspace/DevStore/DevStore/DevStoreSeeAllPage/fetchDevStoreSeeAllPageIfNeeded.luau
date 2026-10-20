local DevStore = script:FindFirstAncestor("DevStore")
local Parent = DevStore.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetDevStoreSeeAllUrlModule = require(DevStore.DevStoreSeeAllPage.getDevStoreSeeAllUrl)
local GetDevStoreSeeAllPageKeyModule = require(DevStore.DevStoreSeeAllPage.getDevStoreSeeAllPageKey)
local FFlagSduiProtobufJsonDecode = require(Parent.SharedFlags).FFlagSduiProtobufJsonDecode

return function(p1, LoadTimer, p2)
	-- upvalues: GetDevStoreSeeAllUrlModule (copy), GetDevStoreSeeAllPageKeyModule (copy), Parent (copy), GetSduiApiStoreFunction (copy), FFlagSduiProtobufJsonDecode (copy), SduiResponseType (copy), AppPage (copy)
	local DevStoreSeeAllUrlModule = GetDevStoreSeeAllUrlModule(p1)
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = if FFlagSduiProtobufJsonDecode then SduiResponseType.Protobuf else nil,
		url = DevStoreSeeAllUrlModule,
		surfaceKey = AppPage.DevStoreSeeAll,
		configKey = GetDevStoreSeeAllPageKeyModule(p1),
		loadTimer = LoadTimer,
		apiProto = require(Parent.ServiceContractsProto).apppageplatform.devstore.dev_store_see_all.DevStoreSeeAllResponse
	}, p2)
	
	return DevStoreSeeAllUrlModule
end