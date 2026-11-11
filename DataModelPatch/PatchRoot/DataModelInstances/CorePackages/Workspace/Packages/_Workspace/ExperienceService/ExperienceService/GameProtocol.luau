local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent
local MessageBus = require(Parent.MessageBus).MessageBus
local TModule = require(Parent.t)
local CryoModule = require(Parent.Cryo)
local Default = require(Parent.LoggingProtocol).default
local _ = require(script.Parent.GameProtocolTypes)
local GetFFlagMoveLuaExpLaunchBeginModule = require(script.Parent.Flags.GetFFlagMoveLuaExpLaunchBegin)
local GameProtocolModule = {
	GAME_LAUNCH_DESCRIPTOR = {
		mid = MessageBus.getMessageId("Game", "launch"),
		validateParams = TModule.intersection(TModule.strictInterface({
			placeId = TModule.optional(TModule.number),
			userId = TModule.optional(TModule.number),
			accessCode = TModule.optional(TModule.string),
			gameInstanceId = TModule.optional(TModule.string),
			linkCode = TModule.optional(TModule.string),
			referralPage = TModule.optional(TModule.string),
			launchData = TModule.optional(TModule.string),
			eventId = TModule.optional(TModule.string),
			referredByPlayerId = TModule.optional(TModule.number),
			joinAttemptOrigin = TModule.optional(TModule.string),
			joinAttemptId = TModule.string
		}), function(p1)
			return p1.placeId or p1.userId
		end)
	}
}
GameProtocolModule.__index = GameProtocolModule

function GameProtocolModule.new()
	-- upvalues: MessageBus (copy), GameProtocolModule (copy)
	return (setmetatable({ subscriber = MessageBus.Subscriber.new() }, GameProtocolModule))
end

function GameProtocolModule:launchGame(p1, p2, Callback: (any) -> ())
	-- upvalues: HttpService (copy), CryoModule (copy), GetFFlagMoveLuaExpLaunchBeginModule (copy), Default (copy), MessageBus (copy)
	if type(p1.placeId) == "string" then
		p1.placeId = tonumber(p1.placeId)
	end
	if type(p1.userId) == "string" then
		p1.userId = tonumber(p1.userId)
	end
	local Guid = if p1.joinAttemptId == nil then HttpService:GenerateGUID(false) else p1.joinAttemptId
	local JoinResult = CryoModule.Dictionary.join(p1, {
		joinAttemptId = Guid,
		joinAttemptOrigin = if p2 == nil then p1.joinAttemptOrigin else p2
	})
	
	if Callback then
		Callback(Guid)
	end
	if GetFFlagMoveLuaExpLaunchBeginModule() then
		Default:logEvent("experience_launch_begin")
	end
	MessageBus.publish(self.GAME_LAUNCH_DESCRIPTOR, JoinResult)
end

GameProtocolModule.default = GameProtocolModule.new()

return GameProtocolModule