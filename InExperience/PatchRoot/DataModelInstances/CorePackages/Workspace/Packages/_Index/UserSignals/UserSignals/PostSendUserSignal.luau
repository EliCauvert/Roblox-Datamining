local httpService = game:GetService("HttpService")
local sessionService = game:GetService("SessionService")
local userSignals = script:FindFirstAncestor("UserSignals")
local parent = userSignals.Parent
local sessionType = require(parent.RobloxAppSessionization).SessionType
local _ = require(parent.RobloxAppEnums)
local url = require(parent.Http).Url
local _ = require(userSignals.UserSignalTypes)
local fFlagLuaAppAddSessionIdToUserSignals = require(parent.SharedFlags).FFlagLuaAppAddSessionIdToUserSignals

return function(p0, p1, p2, p3, p4)
	-- upvalues: fFlagLuaAppAddSessionIdToUserSignals (ref), sessionService (ref), sessionType (ref), url (ref), httpService (ref)
	return p0(string.format("%suser-signal-http-gateway/v1/user-signal/ingest", url.APIS_URL), "POST", {
		postBody = httpService:JSONEncode({
			userSignalEvents = {
				{
					signalValue = p1,
					timestampMs = tostring(DateTime.now().UnixTimestampMillis),
					signalValueType = p3,
					signalEntity = p2,
					signalType = p4,
					omniSessionId = if fFlagLuaAppAddSessionIdToUserSignals then if fFlagLuaAppAddSessionIdToUserSignals then sessionService:GetMetadata(sessionType.StructuralIdentifier.HomePageSessionInfo, sessionType.Metadata.HomePageSessionInfo.OmniSessionId) else nil else nil
				}
			}
		})
	})
end