local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local messageBus = require(parent.MessageBus).MessageBus
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)

local function gameLeaveMessageValidator(p1)
	return typeof(p1) == "table"
end

return function()
	-- upvalues: reactModule (ref), messageBus (ref), gameLeaveMessageValidator (ref), getMomentsPreferencesStoreModule (ref)
	reactModule.useEffect(function()
		-- upvalues: messageBus (copy), gameLeaveMessageValidator (copy), getMomentsPreferencesStoreModule (copy)
		local var1 = messageBus.Subscriber.new()
		local game = messageBus.getMessageId("Game", "onGameLeave")
		var1:subscribe({ mid = game, validateParams = gameLeaveMessageValidator }, function(_)
			-- upvalues: getMomentsPreferencesStoreModule (copy)
			getMomentsPreferencesStoreModule(false).setTeleporting(false)
		end)
		
		return function()
			-- upvalues: var1 (ref), game (ref)
			var1:unsubscribeWithMsgId(game)
		end
	end, {})
end