local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.ViewRecycler)
local FIntAppChatOsaAutoScrollDelayMsModule = require(AppChat.Flags.FIntAppChatOsaAutoScrollDelayMs)

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), FIntAppChatOsaAutoScrollDelayMsModule (copy)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseRefResult (copy), p1 (copy), FIntAppChatOsaAutoScrollDelayMsModule (upval), p3 (copy)
		if p2 then
			UseRefResult.current = false
			
			return nil
		elseif p1 and not UseRefResult.current then
			UseRefResult.current = true
			local DelayedThread = nil
			DelayedThread = task.delay(FIntAppChatOsaAutoScrollDelayMsModule / 1000, function()
				-- upvalues: DelayedThread (ref), p3 (upval)
				DelayedThread = nil
				local Current = p3.current
				
				if Current ~= nil then
					Current.scrollToStart()
				end
			end)
			
			return function()
				-- upvalues: DelayedThread (ref), UseRefResult (upval)
				if DelayedThread ~= nil then
					task.cancel(DelayedThread)
					DelayedThread = nil
					UseRefResult.current = false
				end
			end
		else
			return nil
		end
	end, { p1, p2 })
end