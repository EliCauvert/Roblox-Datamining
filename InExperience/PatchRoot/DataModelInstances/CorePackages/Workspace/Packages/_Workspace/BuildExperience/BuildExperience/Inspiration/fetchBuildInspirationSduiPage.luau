local Parent = script:FindFirstAncestor("BuildExperience").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiApiStorePostConfigContentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local BuildInspirationSessionModule = require(script.Parent.BuildInspirationSession)

return function(p1, LoadTimer, p2)
	-- upvalues: GetSduiApiStoreFunction (copy), BuildInspirationSessionModule (copy), SduiResponseType (copy), AppPage (copy), SduiApiStorePostConfigContentType (copy)
	local ConfigKey = p1.configKey
	local SduiApiStore = GetSduiApiStoreFunction()
	local _, Data2 = SduiApiStore.getData(ConfigKey)
	
	if p1.ownsSession and (p2 or Data2) and not SduiApiStore.isInFlight(ConfigKey) then
		BuildInspirationSessionModule:Refresh()
	end
	return SduiApiStore.fetchIfNeeded({
		responseType = SduiResponseType.Protobuf,
		url = p1.url,
		surfaceKey = AppPage.Build,
		configKey = ConfigKey,
		loadTimer = LoadTimer,
		apiProto = p1.responseProto,
		postConfig = {
			contentType = SduiApiStorePostConfigContentType.Proto,
			protoMessage = p1.requestProto,
			body = p1.buildBody(BuildInspirationSessionModule:Get())
		},
		buildRefreshUrl = if p1.ownsSession then function()
			-- upvalues: SduiApiStore (copy), ConfigKey (copy), BuildInspirationSessionModule (upval), p1 (copy)
			if not SduiApiStore.isInFlight(ConfigKey) then
				BuildInspirationSessionModule:Refresh()
			end
			return p1.url
		end else nil,
		buildRefreshPostBody = function()
			-- upvalues: p1 (copy), BuildInspirationSessionModule (upval)
			return (p1.buildBody(BuildInspirationSessionModule:Get()))
		end
	}, p2)
end