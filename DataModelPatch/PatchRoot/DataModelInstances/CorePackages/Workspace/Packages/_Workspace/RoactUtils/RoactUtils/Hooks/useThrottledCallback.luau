local Parent = script:FindFirstAncestor("RoactUtils").Parent
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)

return function(Current, Current1)
	-- upvalues: ReactModule (copy), PromiseModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	local UseRefResult1 = ReactModule.useRef(Current1)
	UseRefResult.current = Current
	UseRefResult1.current = Current1
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(0)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult (copy), PromiseModule (upval)
		if UseRefResult2.current then return end
		local CurrentDelta = UseRefResult3.current + (UseRefResult1.current or 0) - tick()
		
		local function runCallback()
			-- upvalues: UseRefResult (upval), UseRefResult3 (upval), UseRefResult2 (upval)
			UseRefResult.current()
			UseRefResult3.current = tick()
			UseRefResult2.current = nil
		end
		
		if CurrentDelta > 0 then
			UseRefResult2.current = PromiseModule.delay(CurrentDelta):andThen(runCallback)
			
			return
		else
			UseRefResult.current()
			UseRefResult3.current = tick()
			UseRefResult2.current = nil
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult2 (upval), UseRefResult (upval)
			local Current = UseRefResult2.current
			
			if Current then
				Current:cancel()
				UseRefResult.current()
			end
		end
	end, {})
	
	return UseResult
end