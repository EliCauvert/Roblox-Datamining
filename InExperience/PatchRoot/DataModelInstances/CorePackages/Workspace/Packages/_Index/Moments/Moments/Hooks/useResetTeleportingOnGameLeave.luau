local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local messageBus = require(parent.MessageBus).MessageBus
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local getFFlagMomentsPauseAudioThroughTeleportModule = require(moments.Flags.GetFFlagMomentsPauseAudioThroughTeleport)

local function gameLeaveMessageValidator(p0) --[[ line: 30 ]]
	return typeof(p0) == "table"
end

return function() --[[ line: 34 | named "useResetTeleportingOnGameLeave" ]]
	-- upvalues: reactModule (ref), getFFlagMomentsPauseAudioThroughTeleportModule (ref), messageBus (ref), gameLeaveMessageValidator (ref), getMomentsPreferencesStoreModule (ref)
	reactModule.useEffect(function() --[[ line: 35 ]]
		-- upvalues: getFFlagMomentsPauseAudioThroughTeleportModule (copy), messageBus (copy), gameLeaveMessageValidator (copy), getMomentsPreferencesStoreModule (copy)
		if getFFlagMomentsPauseAudioThroughTeleportModule() then
			local var5 = messageBus.Subscriber.new()
			local game = messageBus.getMessageId("Game", "onGameLeave")
			var5:subscribe({ mid = game, validateParams = gameLeaveMessageValidator }, function(_) --[[ line: 45 ]]
				-- upvalues: getMomentsPreferencesStoreModule (copy)
				getMomentsPreferencesStoreModule(false).setTeleporting(false)
			end)
			
			return function() --[[ line: 51 ]]
				-- upvalues: var5 (ref), game (ref)
				var5:unsubscribeWithMsgId(game)
			end
		end
	end, {})
end