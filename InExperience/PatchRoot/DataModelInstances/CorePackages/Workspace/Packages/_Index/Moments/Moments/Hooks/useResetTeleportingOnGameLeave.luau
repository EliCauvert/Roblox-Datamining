local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local messageBus = require(parent.MessageBus).MessageBus
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local getFFlagMomentsPauseAudioThroughTeleportModule = require(moments.Flags.GetFFlagMomentsPauseAudioThroughTeleport)

local function gameLeaveMessageValidator(p0)
	return typeof(p0) == "table"
end

return function()
	-- upvalues: reactModule (ref), getFFlagMomentsPauseAudioThroughTeleportModule (ref), messageBus (ref), gameLeaveMessageValidator (ref), getMomentsPreferencesStoreModule (ref)
	reactModule.useEffect(function()
		-- upvalues: getFFlagMomentsPauseAudioThroughTeleportModule (copy), messageBus (copy), gameLeaveMessageValidator (copy), getMomentsPreferencesStoreModule (copy)
		if getFFlagMomentsPauseAudioThroughTeleportModule() then
			local var5 = messageBus.Subscriber.new()
			local game = messageBus.getMessageId("Game", "onGameLeave")
			var5:subscribe({ mid = game, validateParams = gameLeaveMessageValidator }, function(_)
				-- upvalues: getMomentsPreferencesStoreModule (copy)
				getMomentsPreferencesStoreModule(false).setTeleporting(false)
			end)
			
			return function()
				-- upvalues: var5 (ref), game (ref)
				var5:unsubscribeWithMsgId(game)
			end
		end
	end, {})
end