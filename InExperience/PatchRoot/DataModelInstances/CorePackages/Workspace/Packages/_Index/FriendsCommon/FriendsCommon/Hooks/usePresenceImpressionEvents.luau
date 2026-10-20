local Parent = script:FindFirstAncestor("FriendsCommon").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local FFlagFriendsSignalMigrationTelemetry = require(Parent.SharedFlags).FFlagFriendsSignalMigrationTelemetry
local Emitter = SocialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = require(Parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uj9vb188k-wC2u3U3-UX3fm7xLffIbbvF7BDq3hs2Ak",
		throttlingThousandths = game:DefineFastInt("PresenceImpressionLoggingThrottlePerMyriad", 10000)
	},
	getSharedInfo = function()
		return {}
	end
})
local PresenceImpression = SocialLuaAnalyticsModule.Telemetry.new({
	name = "PresenceImpression",
	description = "Emitted when the presence status of a friend updates on the client",
	lastUpdated = { 2025, 4, 10 },
	backendsList = {
		{
			type = "EventIngest",
			format = function(p1, _)
				return p1
			end
		}
	}
})

function areEqual(p1, p2): boolean
	return p1.userPresenceType == p2.userPresenceType and p1.placeId == p2.placeId
end

function usePresenceImpressionEvents(p1)
	-- upvalues: ReactModule (copy), CryoModule (copy), Emitter (copy), PresenceImpression (copy), FFlagFriendsSignalMigrationTelemetry (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), CryoModule (upval), UseStateResult (copy), Emitter (upval), PresenceImpression (upval), FFlagFriendsSignalMigrationTelemetry (upval), UseStateResult2 (copy)
		local Presences = {}
		
		for _, value in pairs(p1) do
			Presences[value.id] = value.presence
		end
		local Flag = false
		
		for ObservedUserId, value1 in pairs((CryoModule.Dictionary.join(UseStateResult, Presences))) do
			if Presences[ObservedUserId] == nil then
				Emitter.emit(PresenceImpression, {
					presenceType = "Offline",
					lastLocation = "Website",
					observedUserId = ObservedUserId,
					implementationVariant = if FFlagFriendsSignalMigrationTelemetry then "UniversalAppFriendsStore" else "UniversalAppGraphQL"
				})
				Flag = true
			elseif UseStateResult[ObservedUserId] == nil or not areEqual(UseStateResult[ObservedUserId], Presences[ObservedUserId]) then
				Emitter.emit(PresenceImpression, {
					observedUserId = value1.id,
					presenceType = value1.userPresenceType,
					placeId = value1.placeId,
					universeId = value1.universeId,
					gameId = value1.gameId,
					lastLocation = value1.lastLocation,
					implementationVariant = if FFlagFriendsSignalMigrationTelemetry then "UniversalAppFriendsStore" else "UniversalAppGraphQL"
				})
				Flag = true
			end
		end
		if Flag then
			UseStateResult2(Presences)
		end
	end, { p1 })
end

return usePresenceImpressionEvents