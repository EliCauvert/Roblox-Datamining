local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent
local messageBus = require(parent.MessageBus).MessageBus
local tModule = require(parent.t)
local cryoModule = require(parent.Cryo)
local default = require(parent.LoggingProtocol).default
local _ = require(script.Parent.GameProtocolTypes)
local getFFlagMoveLuaExpLaunchBeginModule = require(script.Parent.Flags.GetFFlagMoveLuaExpLaunchBegin)
local t = {
	GAME_LAUNCH_DESCRIPTOR = {
		mid = messageBus.getMessageId("Game", "launch"),
		validateParams = tModule.intersection(tModule.strictInterface({
			placeId = tModule.optional(tModule.number),
			userId = tModule.optional(tModule.number),
			accessCode = tModule.optional(tModule.string),
			gameInstanceId = tModule.optional(tModule.string),
			linkCode = tModule.optional(tModule.string),
			referralPage = tModule.optional(tModule.string),
			launchData = tModule.optional(tModule.string),
			eventId = tModule.optional(tModule.string),
			referredByPlayerId = tModule.optional(tModule.number),
			joinAttemptOrigin = tModule.optional(tModule.string),
			joinAttemptId = tModule.string
		}), function(p0) --[[ line: 45 | named "checkRequiredParams" ]]
			return p0.placeId or p0.userId
		end)
	}
}
t.__index = t

function t.new() --[[ line: 57 ]]
	-- upvalues: messageBus (ref), t (ref)
	return setmetatable({ subscriber = messageBus.Subscriber.new() }, t)
end

function t:launchGame(p1, p2, p3) --[[ line: 64 ]]
	-- upvalues: httpService (ref), cryoModule (ref), getFFlagMoveLuaExpLaunchBeginModule (ref), default (ref), messageBus (ref)
	if type(p1.placeId) == "string" then
		p1.placeId = tonumber(p1.placeId)
	end
	if type(p1.userId) == "string" then
		p1.userId = tonumber(p1.userId)
	end
	local var5 = if p1.joinAttemptId ~= nil then httpService:GenerateGUID(false) else p1.joinAttemptId
	local var6 = cryoModule.Dictionary.join(p1, {
		joinAttemptId = var5,
		joinAttemptOrigin = if p2 ~= nil then p1.joinAttemptOrigin else p2
	})
	
	if p3 then
		p3(var5)
	end
	if getFFlagMoveLuaExpLaunchBeginModule() then
		default:logEvent("experience_launch_begin")
	end
	messageBus.publish(self.GAME_LAUNCH_DESCRIPTOR, var6)
end

t.default = t.new()

return t