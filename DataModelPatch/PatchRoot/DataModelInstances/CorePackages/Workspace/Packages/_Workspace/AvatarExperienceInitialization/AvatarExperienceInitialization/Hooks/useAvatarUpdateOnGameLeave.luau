local Parent = script:FindFirstAncestor("AvatarExperienceInitialization").Parent
local ReactModule = require(Parent.React)
local MessageBus = require(Parent.MessageBus).MessageBus
local AXAvatarUpdateOnGameLeaveDelay = game:DefineFastInt("AXAvatarUpdateOnGameLeaveDelay", 0)

local function gameLeaveMessageValidator(p1): boolean
	return typeof(p1) == "table"
end

return function(Callback)
	-- upvalues: ReactModule (copy), MessageBus (copy), gameLeaveMessageValidator (copy), AXAvatarUpdateOnGameLeaveDelay (copy)
	ReactModule.useEffect(function()
		-- upvalues: MessageBus (upval), gameLeaveMessageValidator (upval), AXAvatarUpdateOnGameLeaveDelay (upval), Callback (copy)
		local NewResult = MessageBus.Subscriber.new()
		local GameMessageId = MessageBus.getMessageId("Game", "onGameLeave")
		local DelayedThread = nil
		NewResult:subscribe({
			mid = GameMessageId,
			validateParams = gameLeaveMessageValidator
		}, function(_)
			-- upvalues: DelayedThread (ref), AXAvatarUpdateOnGameLeaveDelay (upval), Callback (upval)
			DelayedThread = task.delay(AXAvatarUpdateOnGameLeaveDelay / 1000, function()
				-- upvalues: Callback (upval)
				Callback()
			end)
		end)
		
		return function()
			-- upvalues: NewResult (copy), GameMessageId (copy), DelayedThread (ref)
			NewResult:unsubscribeWithMsgId(GameMessageId)
			
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end
	end, { Callback })
end