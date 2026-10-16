local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local Signal = require(Parent.AppCommonLib).Signal

return function() --[[ Line: 20 | Named "useOnRequestImpressionsSignal" ]]
	-- upvalues: ReactModule (copy), Signal (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = Signal.new()
	end
	local Current = UseRefResult.current
	ReactModule.useEffect(function() --[[ Line: 29 ]]
		-- upvalues: Current (copy)
		Current:fire()
		local Flag = false
		local DelayedThread = nil
		
		local function scheduleNext() --[[ Line: 37 ]]
			-- upvalues: Flag (ref), DelayedThread (ref), Current (upval), scheduleNext (copy)
			if not Flag then
				DelayedThread = task.delay(1, function() --[[ Line: 41 ]]
					-- upvalues: Flag (upval), Current (upval), scheduleNext (upval)
					if not Flag then
						Current:fire()
						scheduleNext()
						
						return
					end
				end)
				
				return
			end
		end
		
		if not Flag then
			DelayedThread = task.delay(1, function() --[[ Line: 41 ]]
				-- upvalues: Flag (ref), Current (upval), scheduleNext (copy)
				if not Flag then
					Current:fire()
					scheduleNext()
					
					return
				end
			end)
		end
		return function() --[[ Line: 51 ]]
			-- upvalues: Flag (ref), DelayedThread (ref)
			Flag = true
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end
	end, {})
	
	return Current
end