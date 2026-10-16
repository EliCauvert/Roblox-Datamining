local HttpService = game:GetService("HttpService")
local SessionService = game:GetService("SessionService")
local UserSignals = script:FindFirstAncestor("UserSignals")
local Parent = UserSignals.Parent
local SessionType = require(Parent.RobloxAppSessionization).SessionType
local _ = require(Parent.RobloxAppEnums)
local Url = require(Parent.Http).Url
local _ = require(UserSignals.UserSignalTypes)
local FFlagLuaAppAddSessionIdToUserSignals = require(Parent.SharedFlags).FFlagLuaAppAddSessionIdToUserSignals

return function(Callback, SignalValue, SignalEntity, SignalValueType, SignalType) --[[ Line: 82 ]]
	-- upvalues: FFlagLuaAppAddSessionIdToUserSignals (copy), SessionService (copy), SessionType (copy), Url (copy), HttpService (copy)
	local Metadata = if FFlagLuaAppAddSessionIdToUserSignals then SessionService:GetMetadata(SessionType.StructuralIdentifier.HomePageSessionInfo, SessionType.Metadata.HomePageSessionInfo.OmniSessionId) else nil
	
	return Callback(string.format("%suser-signal-http-gateway/v1/user-signal/ingest", Url.APIS_URL), "POST", {
		postBody = HttpService:JSONEncode({
			userSignalEvents = {
				{
					signalValue = SignalValue,
					timestampMs = tostring(DateTime.now().UnixTimestampMillis),
					signalValueType = SignalValueType,
					signalEntity = SignalEntity,
					signalType = SignalType,
					omniSessionId = if FFlagLuaAppAddSessionIdToUserSignals then Metadata else nil
				}
			}
		})
	})
end