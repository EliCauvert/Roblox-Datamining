local Parent = script:FindFirstAncestor("GameCollections").Parent
local ReactModule = require(Parent.React)
local UsePreviousFunction = require(Parent.RoactUtils).Hooks.usePrevious
local ArgCheckModule = require(Parent.ArgCheck)
local LuaAppEnableWaitForPropWrapperAssert = game:DefineFastFlag("LuaAppEnableWaitForPropWrapperAssert", false)

return function(p1)
	-- upvalues: UsePreviousFunction (copy), ReactModule (copy), LuaAppEnableWaitForPropWrapperAssert (copy), ArgCheckModule (copy)
	local WaitForProp = p1.waitForProp
	local MaxUpdatesToDelay = p1.maxUpdatesToDelay
	local WrappedComponent = p1.wrappedComponent
	local UsePreviousResult = UsePreviousFunction(WaitForProp)
	local UseStateResult, UseStateResult2 = ReactModule.useState(MaxUpdatesToDelay)
	local IsUseStateResultBelow: boolean = UsePreviousResult ~= nil and (WaitForProp == nil and (MaxUpdatesToDelay ~= nil and UseStateResult < MaxUpdatesToDelay))
	ReactModule.useEffect(function()
		-- upvalues: MaxUpdatesToDelay (copy), WaitForProp (copy), IsUseStateResultBelow (copy), UseStateResult2 (copy), UseStateResult (copy)
		if not MaxUpdatesToDelay then return end
		if WaitForProp ~= nil then return end
		if IsUseStateResultBelow then
			task.delay(0, function()
				-- upvalues: UseStateResult2 (upval), MaxUpdatesToDelay (upval)
				UseStateResult2(MaxUpdatesToDelay)
			end)
			
			return
		end
		if UseStateResult and UseStateResult > 0 then
			task.delay(0, function()
				-- upvalues: UseStateResult2 (upval), UseStateResult (upval)
				UseStateResult2(UseStateResult - 1)
			end)
		end
	end, {
		WaitForProp,
		MaxUpdatesToDelay,
		UseStateResult,
		IsUseStateResultBelow
	})
	local Flag = true
	
	if WaitForProp == nil and MaxUpdatesToDelay ~= nil then
		if IsUseStateResultBelow then
			Flag = false
		elseif UseStateResult and UseStateResult > 0 then
			Flag = false
		elseif LuaAppEnableWaitForPropWrapperAssert then
			ArgCheckModule.assert(WaitForProp, `Missing data for prop for this game collection, after waiting {MaxUpdatesToDelay} updates`)
		end
	end
	return if Flag then WrappedComponent else nil
end