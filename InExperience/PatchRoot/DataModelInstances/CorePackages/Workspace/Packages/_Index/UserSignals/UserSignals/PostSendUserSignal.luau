local httpService = game:GetService("HttpService")
local sessionService = game:GetService("SessionService")
local userSignals = script:FindFirstAncestor("UserSignals")
local parent = userSignals.Parent
local sessionType = require(parent.RobloxAppSessionization).SessionType
local _ = require(parent.RobloxAppEnums)
local url = require(parent.Http).Url
local _ = require(userSignals.UserSignalTypes)
local fFlagLuaAppAddSessionIdToUserSignals = require(parent.SharedFlags).FFlagLuaAppAddSessionIdToUserSignals

return function(p1, p2, p3, p4, p5)
	-- upvalues: fFlagLuaAppAddSessionIdToUserSignals (ref), sessionService (ref), sessionType (ref), url (ref), httpService (ref)
	return p1(string.format("%suser-signal-http-gateway/v1/user-signal/ingest", url.APIS_URL), "POST", {
		postBody = httpService:JSONEncode({
			userSignalEvents = {
				{
					signalValue = p2,
					timestampMs = tostring(DateTime.now().UnixTimestampMillis),
					signalValueType = p4,
					signalEntity = p3,
					signalType = p5,
					omniSessionId = if fFlagLuaAppAddSessionIdToUserSignals then if fFlagLuaAppAddSessionIdToUserSignals then sessionService:GetMetadata(sessionType.StructuralIdentifier.HomePageSessionInfo, sessionType.Metadata.HomePageSessionInfo.OmniSessionId) else nil else nil
				}
			}
		})
	})
end