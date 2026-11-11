local ReactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)
local UseStoreModule = require(script.Parent.useStore)

local function v2(p1, p2): boolean
	return p1 == p2
end

function useSelectorWithStore(Callback, Callback1, p1)
	-- upvalues: ReactModule (copy)
	local _, UseReducerResult2 = ReactModule.useReducer(function(p2: number): number
		return p2 + 1
	end, 0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local State = p1:getState()
	local Current = nil
	local Success, Result = pcall(function()
		-- upvalues: Callback (copy), UseRefResult1 (copy), State (copy), UseRefResult2 (copy), UseRefResult (copy), UseRefResult3 (copy), Callback1 (copy), Current (ref)
		if Callback == UseRefResult1.current and State == UseRefResult2.current and not UseRefResult.current then
			Current = UseRefResult3.current
			
			return
		end
		local CallbackResult = Callback(State)
		
		if UseRefResult3.current == nil or not Callback1(CallbackResult, UseRefResult3.current) then
			Current = CallbackResult
			
			return
		else
			Current = UseRefResult3.current
		end
	end)
	
	if not Success then
		if UseRefResult.current then
			Result = string.format("%s\nThe error may be correlated with this previous error:\n%s\n\n", tostring(Result), (tostring(UseRefResult.current)))
		end
		error(Result)
	end
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult1 (copy), Callback (copy), UseRefResult2 (copy), State (copy), UseRefResult3 (copy), Current (ref), UseRefResult (copy)
		UseRefResult1.current = Callback
		UseRefResult2.current = State
		UseRefResult3.current = Current
		UseRefResult.current = nil
	end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), Callback1 (copy), UseRefResult3 (copy), UseRefResult (copy), UseReducerResult2 (copy), p1 (copy)
		local ChangedConnection = p1.changed:connect(function(Current)
			-- upvalues: UseRefResult2 (upval), UseRefResult1 (upval), Callback1 (upval), UseRefResult3 (upval), UseRefResult (upval), UseReducerResult2 (upval)
			local Success, Result = pcall(function(): boolean
				-- upvalues: Current (copy), UseRefResult2 (upval), UseRefResult1 (upval), Callback1 (upval), UseRefResult3 (upval)
				if Current == UseRefResult2.current then
					return false
				end
				assert(UseRefResult1.current, "latestSelector")
				local CurrentResult = UseRefResult1.current(Current)
				
				if Callback1(CurrentResult, UseRefResult3.current) then
					return false
				else
					UseRefResult3.current = CurrentResult
					UseRefResult2.current = Current
					
					return true
				end
			end)
			
			if not Success then
				Result = Result or "Error"
				UseRefResult.current = Result
			end
			if Result then
				UseReducerResult2(nil)
			end
		end)
		local State = p1:getState()
		local Success, Result = pcall(function(): boolean
			-- upvalues: State (copy), UseRefResult2 (upval), UseRefResult1 (upval), Callback1 (upval), UseRefResult3 (upval)
			if State == UseRefResult2.current then
				return false
			end
			assert(UseRefResult1.current, "latestSelector")
			local CurrentResult = UseRefResult1.current(State)
			
			if Callback1(CurrentResult, UseRefResult3.current) then
				return false
			else
				UseRefResult3.current = CurrentResult
				UseRefResult2.current = State
				
				return true
			end
		end)
		
		if not Success then
			Result = Result or "Error"
			UseRefResult.current = Result
		end
		if Result then
			UseReducerResult2(nil)
		end
		return function()
			-- upvalues: ChangedConnection (copy)
			ChangedConnection.disconnect()
		end
	end, { p1 })
	
	return Current
end

function useSelector(p1, p2)
	-- upvalues: v2 (copy), UseStoreModule (copy)
	return (useSelectorWithStore(p1, p2 or v2, (UseStoreModule())))
end

return useSelector