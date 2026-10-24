local Parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local PendingActivationOnFocusModule = require(script.Parent.PendingActivationOnFocus)
local v1 = nil
local v2 = nil

return function(p1, p2, Current, Current1, Current2, Enabled, p3: number)
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), v1 (ref), v2 (ref), PendingActivationOnFocusModule (copy)
	local HasCurrent = Current ~= nil
	local IsEnabled = Enabled == true
	local Delay = if p3 == nil or p3 <= 0 then nil else p3
	local UseRefResult = ReactModule.useRef(Current)
	local UseRefResult1 = ReactModule.useRef(Current1)
	local UseRefResult2 = ReactModule.useRef(Current2)
	UseRefResult.current = Current
	UseRefResult1.current = Current1
	UseRefResult2.current = Current2
	local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), HasCurrent (copy), UseContextResult (copy), UseRefResult2 (copy), IsEnabled (copy), v1 (upval), v2 (upval), PendingActivationOnFocusModule (upval), UseRefResult (copy), p2 (copy), UseRefResult1 (copy), Delay (copy)
		if p1 and HasCurrent and UseContextResult then
			local Owner = {}
			
			local function _()
				-- upvalues: UseRefResult2 (upval)
				local CurrentFunction = UseRefResult2.current
				
				return if CurrentFunction then CurrentFunction() else nil
			end
			
			local _ = function(p4, p5): boolean
				-- upvalues: IsEnabled (upval), v1 (upval), v2 (upval)
				return not IsEnabled and (v1 == p4 and v2 == p5)
			end
			
			local _ = function(): boolean
				-- upvalues: PendingActivationOnFocusModule (upval), Owner (copy)
				local GetResult = PendingActivationOnFocusModule.get()
				
				return GetResult ~= nil and GetResult.owner == Owner
			end
			
			local _ = function(p4, p5)
				-- upvalues: IsEnabled (upval), v1 (upval), v2 (upval), UseRefResult (upval)
				if not IsEnabled then
					v1 = p4
					v2 = p5
				end
				local CurrentFunction: () -> () = UseRefResult.current
				
				if CurrentFunction then
					CurrentFunction()
				end
			end
			
			local SubscribeResult = UseContextResult.focusedGuiObject:subscribe(function(p4)
				-- upvalues: p2 (upval), UseRefResult1 (upval), PendingActivationOnFocusModule (upval), IsEnabled (upval), UseRefResult2 (upval), v1 (upval), v2 (upval), Delay (upval), UseRefResult (upval), Owner (copy)
				local Current = p2.current
				local CurrentFunction1 = UseRefResult1.current
				local CurrentResult = if CurrentFunction1 then CurrentFunction1(Current) else Current
				
				if CurrentResult == nil or p4 ~= CurrentResult then
					local GetResult = PendingActivationOnFocusModule.get()
					
					if GetResult ~= nil and GetResult.owner == Owner then
						if p4 == nil then
							PendingActivationOnFocusModule.cancel()
							
							return
						end
						local GetResult1 = PendingActivationOnFocusModule.get()
						task.defer(function()
							-- upvalues: PendingActivationOnFocusModule (upval), GetResult1 (copy)
							if PendingActivationOnFocusModule.get() == GetResult1 then
								PendingActivationOnFocusModule.flush()
							end
						end)
					end
					return
				else
					PendingActivationOnFocusModule.cancel()
					local v3 = nil
					
					if IsEnabled then
						v3 = nil
					else
						local CurrentFunction2 = UseRefResult2.current
						v3 = if CurrentFunction2 then CurrentFunction2() else nil
					end
					if not IsEnabled and (v1 == CurrentResult and v2 == v3) then return end
					if Delay ~= nil then
						PendingActivationOnFocusModule.set({
							owner = Owner,
							thread = task.delay(Delay, function()
								-- upvalues: PendingActivationOnFocusModule (upval), UseRefResult2 (upval), CurrentResult (copy), IsEnabled (upval), v1 (upval), v2 (upval), UseRefResult (upval)
								PendingActivationOnFocusModule.set(nil)
								local CurrentFunction = UseRefResult2.current
								local CurrentResult1 = if CurrentFunction then CurrentFunction() else nil
								
								if not IsEnabled and (v1 == CurrentResult and v2 == CurrentResult1) then return end
								if not IsEnabled then
									v1 = CurrentResult
									v2 = CurrentResult1
								end
								local CurrentFunction1: () -> () = UseRefResult.current
								
								if CurrentFunction1 then
									CurrentFunction1()
								end
							end),
							activate = function()
								-- upvalues: UseRefResult2 (upval), CurrentResult (copy), IsEnabled (upval), v1 (upval), v2 (upval), UseRefResult (upval)
								local CurrentFunction = UseRefResult2.current
								local CurrentResult1 = if CurrentFunction then CurrentFunction() else nil
								
								if not IsEnabled and (v1 == CurrentResult and v2 == CurrentResult1) then
									return nil
								end
								if not IsEnabled then
									v1 = CurrentResult
									v2 = CurrentResult1
								end
								local CurrentFunction1: () -> () = UseRefResult.current
								
								if CurrentFunction1 then
									CurrentFunction1()
								end
								return CurrentResult1
							end
						})
						
						return
					end
					if not IsEnabled then
						v1 = CurrentResult
						v2 = v3
					end
					local CurrentFunction: () -> () = UseRefResult.current
					
					if CurrentFunction then
						CurrentFunction()
					end
				end
			end)
			
			return function()
				-- upvalues: SubscribeResult (copy), PendingActivationOnFocusModule (upval), Owner (copy)
				SubscribeResult:unsubscribe()
				local GetResult = PendingActivationOnFocusModule.get()
				
				if GetResult ~= nil and GetResult.owner == Owner then
					PendingActivationOnFocusModule.cancel()
				end
			end
		else
			return function() end
		end
	end, {
		p1, HasCurrent, IsEnabled, Delay, UseContextResult, p2
	})
end