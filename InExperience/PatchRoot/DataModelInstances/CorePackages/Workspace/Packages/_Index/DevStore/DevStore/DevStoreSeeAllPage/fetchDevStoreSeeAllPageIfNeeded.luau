local devStore = script:FindFirstAncestor("DevStore")
local parent = devStore.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getDevStoreSeeAllUrlModule = require(devStore.DevStoreSeeAllPage.getDevStoreSeeAllUrl)
local getDevStoreSeeAllPageKeyModule = require(devStore.DevStoreSeeAllPage.getDevStoreSeeAllPageKey)
local fFlagSduiProtobufJsonDecode = require(parent.SharedFlags).FFlagSduiProtobufJsonDecode

return function(p1, p2, p3)
	-- upvalues: getDevStoreSeeAllUrlModule (ref), getDevStoreSeeAllPageKeyModule (ref), parent (ref), getSduiApiStore (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), appPage (ref)
	local var1 = getDevStoreSeeAllUrlModule(p1)
	getSduiApiStore().fetchIfNeeded({
		responseType = if fFlagSduiProtobufJsonDecode then sduiResponseType.Protobuf else nil,
		url = var1,
		surfaceKey = appPage.DevStoreSeeAll,
		configKey = getDevStoreSeeAllPageKeyModule(p1),
		loadTimer = p2,
		apiProto = require(parent.ServiceContractsProto).apppageplatform.devstore.dev_store_see_all.DevStoreSeeAllResponse
	}, p3)
	
	return var1
end