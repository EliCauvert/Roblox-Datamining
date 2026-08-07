local devStore = script:FindFirstAncestor("DevStore")
local parent = devStore.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getDevStoreSeeAllUrlModule = require(devStore.DevStoreSeeAllPage.getDevStoreSeeAllUrl)
local getDevStoreSeeAllPageKeyModule = require(devStore.DevStoreSeeAllPage.getDevStoreSeeAllPageKey)
local fFlagSduiProtobufJsonDecode = require(parent.SharedFlags).FFlagSduiProtobufJsonDecode

return function(p0, p1, p2) --[[ line: 15 | named "fetchDevStoreSeeAllPageIfNeeded" ]]
	-- upvalues: getDevStoreSeeAllUrlModule (ref), getDevStoreSeeAllPageKeyModule (ref), parent (ref), getSduiApiStore (ref), fFlagSduiProtobufJsonDecode (ref), sduiResponseType (ref), appPage (ref)
	local var4 = getDevStoreSeeAllUrlModule(p0)
	getSduiApiStore().fetchIfNeeded({
		responseType = if fFlagSduiProtobufJsonDecode then sduiResponseType.Protobuf else nil,
		url = var4,
		surfaceKey = appPage.DevStoreSeeAll,
		configKey = getDevStoreSeeAllPageKeyModule(p0),
		loadTimer = p1,
		apiProto = require(parent.ServiceContractsProto).apppageplatform.devstore.dev_store_see_all.DevStoreSeeAllResponse
	}, p2)
	
	return var4
end