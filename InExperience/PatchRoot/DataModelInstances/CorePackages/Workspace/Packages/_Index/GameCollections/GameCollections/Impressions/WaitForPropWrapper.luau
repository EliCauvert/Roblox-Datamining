local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local usePrevious = require(parent.RoactUtils).Hooks.usePrevious
local argCheckModule = require(parent.ArgCheck)
local luaAppEnableWaitForPropWrapperAssert = game:DefineFastFlag("LuaAppEnableWaitForPropWrapperAssert", false)

return function(p1)
	-- upvalues: usePrevious (ref), reactModule (ref), luaAppEnableWaitForPropWrapperAssert (ref), argCheckModule (ref)
	local waitForProp = p1.waitForProp
	local maxUpdatesToDelay = p1.maxUpdatesToDelay
	local wrappedComponent = p1.wrappedComponent
	local var1 = usePrevious(waitForProp)
	local var2, var3 = reactModule.useState(maxUpdatesToDelay)
	local var4 = var1 ~= nil and (waitForProp == nil and (maxUpdatesToDelay ~= nil and var2 < maxUpdatesToDelay))
	reactModule.useEffect(function()
		-- upvalues: maxUpdatesToDelay (ref), waitForProp (ref), var4 (ref), var3 (ref), var2 (ref)
		if not maxUpdatesToDelay then return end
		if waitForProp ~= nil then return end
		if var4 then
			task.delay(0, function()
				-- upvalues: var3 (copy), maxUpdatesToDelay (copy)
				var3(maxUpdatesToDelay)
			end)
			
			return
		elseif var2 and var2 > 0 then
			task.delay(0, function()
				-- upvalues: var3 (copy), var2 (copy)
				var3(var2 - 1)
			end)
		end
	end, { waitForProp, maxUpdatesToDelay, var2, var4 })
	local var5 = true
	
	if waitForProp == nil and maxUpdatesToDelay ~= nil then
		if var4 then
			var5 = false
		elseif var2 and var2 > 0 then
			var5 = false
		elseif luaAppEnableWaitForPropWrapperAssert then
			argCheckModule.assert(waitForProp, `Missing data for prop for this game collection, after waiting {maxUpdatesToDelay} updates`)
		end
	end
	return if var5 then wrappedComponent else nil
end