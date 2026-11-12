local Parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return function(Callback, Current, Current1)
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef(Current1)
	UseRefResult1.current = Current1
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy), UseRefResult2 (copy), UseRefResult1 (copy), SignalsModule (upval), UseRefResult (copy)
		local function readChange(p1)
			-- upvalues: Callback (upval), UseRefResult2 (upval), UseRefResult1 (upval)
			local CallbackResult = Callback(p1)
			local Current = UseRefResult2.current
			local CurrentFunction = UseRefResult1.current
			local IsValueMatch = false
			
			if Current ~= nil then
				if CurrentFunction then
					return CallbackResult, (CurrentFunction(Current.value, CallbackResult))
				end
				IsValueMatch = Current.value == CallbackResult
			end
			return CallbackResult, IsValueMatch
		end
		
		return SignalsModule.createEffect(function(p1)
			-- upvalues: readChange (copy), UseRefResult2 (upval), UseRefResult (upval)
			local Success, Result, Result3 = xpcall(readChange, debug.traceback, p1)
			
			if not Success then
				task.spawn(error, Result, 0)
				
				return
			end
			if not Result3 then
				UseRefResult2.current = { value = Result }
				local CurrentFunction = UseRefResult.current
				task.spawn(function()
					-- upvalues: CurrentFunction (copy), Result (copy)
					CurrentFunction(Result)
				end)
				
				return
			end
		end)
	end, { Callback })
end