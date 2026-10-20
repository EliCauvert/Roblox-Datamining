local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("FriendsCommon").Parent
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local Emitter = SocialLuaAnalyticsModule.Telemetry.createEmitter({
	telemetryImpl = require(Parent.LoggingProtocol).default,
	defaultTelemetryConfig = {
		links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4",
		throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000)
	},
	getSharedInfo = function()
		return {}
	end
})
local FriendsSortFeRtnMessage = SocialLuaAnalyticsModule.Telemetry.new({
	name = "FriendsSortFeRtnMessage",
	description = "User received an rtn message v2",
	lastUpdated = { 2026, 6, 18 },
	backendsList = {
		{
			type = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
			format = function(p1, _)
				return p1
			end
		}
	}
})

return function(MessageId, p1)
	-- upvalues: Emitter (copy), FriendsSortFeRtnMessage (copy), Players (copy)
	if MessageId ~= nil and p1 then
		pcall(function()
			-- upvalues: p1 (copy), Emitter (upval), FriendsSortFeRtnMessage (upval), MessageId (copy), Players (upval)
			local List = {}
			
			for _, value in pairs(p1) do
				table.insert(List, (tostring(value.userId)))
			end
			Emitter.emit(FriendsSortFeRtnMessage, {
				sortType = "Carousel",
				messageId = MessageId,
				userId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil,
				friendIds = table.concat(List, ",")
			})
		end)
		
		return
	end
end