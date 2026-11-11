local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local Signal = require(Parent.AppCommonLib).Signal

return function()
	-- upvalues: ReactModule (copy), Signal (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = Signal.new()
	end
	local Current = UseRefResult.current
	ReactModule.useEffect(function()
		-- upvalues: Current (copy)
		Current:fire()
		local Flag = false
		local DelayedThread = nil
		
		local function scheduleNext()
			-- upvalues: Flag (ref), DelayedThread (ref), Current (upval), scheduleNext (copy)
			if not Flag then
				DelayedThread = task.delay(1, function()
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
			DelayedThread = task.delay(1, function()
				-- upvalues: Flag (ref), Current (upval), scheduleNext (copy)
				if not Flag then
					Current:fire()
					scheduleNext()
					
					return
				end
			end)
		end
		return function()
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