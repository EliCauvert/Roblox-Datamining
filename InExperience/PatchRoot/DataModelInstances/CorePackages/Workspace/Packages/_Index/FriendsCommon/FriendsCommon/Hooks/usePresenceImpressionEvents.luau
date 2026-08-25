local parent = script:FindFirstAncestor("FriendsCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local fFlagFriendsSignalMigrationTelemetry = require(parent.SharedFlags).FFlagFriendsSignalMigrationTelemetry
local var3 = socialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = require(parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uj9vb188k-wC2u3U3-UX3fm7xLffIbbvF7BDq3hs2Ak",
		throttlingThousandths = game:DefineFastInt("PresenceImpressionLoggingThrottlePerMyriad", 10000)
	},
	getSharedInfo = function()
		return {}
	end
})
local var4 = socialLuaAnalyticsModule.Telemetry.new({
	name = "PresenceImpression",
	description = "Emitted when the presence status of a friend updates on the client",
	lastUpdated = { 2025, 4, 10 },
	backendsList = {
		{
			type = "EventIngest",
			format = function(p0, _)
				return p0
			end
		}
	}
})

function areEqual(p1, p2)
	return p1.userPresenceType == p2.userPresenceType and p1.placeId == p2.placeId
end

function usePresenceImpressionEvents(p3)
	-- upvalues: reactModule (ref), cryoModule (ref), var3 (ref), var4 (ref), fFlagFriendsSignalMigrationTelemetry (ref)
	local var5, var6 = reactModule.useState({})
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), cryoModule (copy), var5 (ref), var3 (copy), var4 (copy), fFlagFriendsSignalMigrationTelemetry (copy), var6 (ref)
		local t = {}
		
		for i, v in pairs(p3) do
			t[v.id] = v.presence
		end
		local var8 = false
		
		for i_1, v_1 in pairs(cryoModule.Dictionary.join(var5, t)) do
			if t[i_1] == nil then
				var3.emit(var4, {
					presenceType = "Offline",
					lastLocation = "Website",
					observedUserId = i_1,
					implementationVariant = if fFlagFriendsSignalMigrationTelemetry then "UniversalAppFriendsStore" else "UniversalAppGraphQL"
				})
				var8 = true
			elseif var5[i_1] == nil or not areEqual(var5[i_1], t[i_1]) then
				var3.emit(var4, {
					observedUserId = v_1.id,
					presenceType = v_1.userPresenceType,
					placeId = v_1.placeId,
					universeId = v_1.universeId,
					gameId = v_1.gameId,
					lastLocation = v_1.lastLocation,
					implementationVariant = if fFlagFriendsSignalMigrationTelemetry then "UniversalAppFriendsStore" else "UniversalAppGraphQL"
				})
				var8 = true
			end
		end
		if var8 then
			var6(t)
		end
	end, { p3 })
end

return usePresenceImpressionEvents