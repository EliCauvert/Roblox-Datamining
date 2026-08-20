local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local signal = require(parent.AppCommonLib).Signal

return function() --[[ line: 20 | named "useOnRequestImpressionsSignal" ]]
	-- upvalues: reactModule (ref), signal (ref)
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		var1.current = signal.new()
	end
	local current = var1.current
	reactModule.useEffect(function() --[[ line: 29 ]]
		-- upvalues: current (ref)
		current:fire()
		local var2 = false
		local delayedThread = nil
		
		local function scheduleNext() --[[ line: 37 ]]
			-- upvalues: var2 (write), delayedThread (write), current (copy), scheduleNext (ref)
			if var2 then
				return
			end
			delayedThread = task.delay(1, function() --[[ line: 41 ]]
				-- upvalues: var2 (copy), current (copy), scheduleNext (copy)
				if var2 then
					return
				end
				current:fire()
				scheduleNext()
			end)
		end
		
		delayedThread = task.delay(1, function() --[[ line: 41 ]]
			-- upvalues: var2 (write), current (copy), scheduleNext (ref)
			if var2 then
				return
			end
			current:fire()
			scheduleNext()
		end)
		
		return function() --[[ line: 51 ]]
			-- upvalues: var2 (write), delayedThread (write)
			var2 = true
			
			if delayedThread then
				task.cancel(delayedThread)
				delayedThread = nil
			end
		end
	end, {})
	
	return current
end