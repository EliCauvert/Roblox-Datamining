local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return function(Callback, Callback1, Callback2)
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(Callback2)
	UseRefResult2.current = Callback2
	ReactModule.useEffect(function()
		-- upvalues: Callback1 (copy), Callback (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult (copy), SignalsModule (upval)
		if Callback1 == nil then
			return nil
		else
			local Effect = SignalsModule.createEffect(function(p1)
				-- upvalues: Callback (upval), Callback1 (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult (upval)
				local CallbackResult = Callback(p1)
				local IsCallbackResultMatch: boolean = CallbackResult ~= nil and CallbackResult == Callback1(p1)
				local Current = UseRefResult1.current
				UseRefResult1.current = IsCallbackResultMatch
				local CurrentFunction: (any) -> () = UseRefResult2.current
				
				if CurrentFunction == nil then return end
				if IsCallbackResultMatch and not Current then
					CurrentFunction(UseRefResult.current)
				end
			end)
			
			return function()
				-- upvalues: Effect (copy), UseRefResult1 (upval), UseRefResult2 (upval)
				Effect()
				
				if UseRefResult1.current then
					UseRefResult1.current = false
					local CurrentFunction: (any) -> () = UseRefResult2.current
					
					if CurrentFunction ~= nil then
						CurrentFunction(nil)
					end
				end
			end
		end
	end, { Callback, Callback1 })
	local UseRefResult3 = ReactModule.useRef(Callback2)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), Callback2 (copy), UseRefResult1 (copy), UseRefResult (copy)
		local CurrentFunction: (any) -> () = UseRefResult3.current
		UseRefResult3.current = Callback2
		
		if CurrentFunction == Callback2 or not UseRefResult1.current then return end
		if CurrentFunction ~= nil then
			CurrentFunction(nil)
		end
		if Callback2 ~= nil then
			Callback2(UseRefResult.current)
		end
	end, { Callback2 })
	
	return (ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy), UseRefResult1 (copy)
		UseRefResult.current = Current
		local CurrentFunction: (any) -> () = UseRefResult2.current
		
		if UseRefResult1.current and CurrentFunction ~= nil then
			CurrentFunction(Current)
		end
	end, {}))
end