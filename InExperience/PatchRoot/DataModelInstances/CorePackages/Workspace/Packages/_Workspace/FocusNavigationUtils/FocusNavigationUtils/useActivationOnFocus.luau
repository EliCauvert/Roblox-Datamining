local Parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local v1 = nil
local v2 = nil

return function(p1, p2, Current, Current1, Current2, Enabled) --[[ Line: 15 | Named "useActivationOnFocus" ]]
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), v1 (ref), v2 (ref)
	local HasCurrent = Current ~= nil
	local IsEnabled = Enabled == true
	local UseRefResult = ReactModule.useRef(Current)
	local UseRefResult1 = ReactModule.useRef(Current1)
	local UseRefResult2 = ReactModule.useRef(Current2)
	UseRefResult.current = Current
	UseRefResult1.current = Current1
	UseRefResult2.current = Current2
	local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
	ReactModule.useEffect(function() --[[ Line: 35 ]]
		-- upvalues: p1 (copy), HasCurrent (copy), UseContextResult (copy), p2 (copy), UseRefResult1 (copy), IsEnabled (copy), UseRefResult2 (copy), v1 (upval), v2 (upval), UseRefResult (copy)
		if p1 and HasCurrent and UseContextResult then
			local SubscribeResult = UseContextResult.focusedGuiObject:subscribe(function(p3) --[[ Line: 40 ]]
				-- upvalues: p2 (upval), UseRefResult1 (upval), IsEnabled (upval), UseRefResult2 (upval), v1 (upval), v2 (upval), UseRefResult (upval)
				local Current = p2.current
				local CurrentFunction = UseRefResult1.current
				local CurrentResult = if CurrentFunction then CurrentFunction(Current) else Current
				
				if CurrentResult ~= nil and p3 == CurrentResult then
					if not IsEnabled then
						local CurrentFunction1 = UseRefResult2.current
						local CurrentResult1 = if CurrentFunction1 then CurrentFunction1() else nil
						
						if v1 == CurrentResult and v2 == CurrentResult1 then return end
						v1 = CurrentResult
						v2 = CurrentResult1
					end
					local CurrentFunction2: () -> () = UseRefResult.current
					
					if CurrentFunction2 then
						CurrentFunction2()
					end
				end
			end)
			
			return function() --[[ Line: 61 ]]
				-- upvalues: SubscribeResult (copy)
				SubscribeResult:unsubscribe()
			end
		else
			return function() --[[ Line: 37 ]] end
		end
	end, {
		p1,
		HasCurrent,
		IsEnabled,
		UseContextResult,
		p2
	})
end