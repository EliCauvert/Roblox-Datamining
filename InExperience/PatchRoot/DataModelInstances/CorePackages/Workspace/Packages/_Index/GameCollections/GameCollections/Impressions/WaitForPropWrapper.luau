local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local usePrevious = require(parent.RoactUtils).Hooks.usePrevious
local argCheckModule = require(parent.ArgCheck)
local luaAppEnableWaitForPropWrapperAssert = game:DefineFastFlag("LuaAppEnableWaitForPropWrapperAssert", false)

return function(p0)
	-- upvalues: usePrevious (ref), reactModule (ref), luaAppEnableWaitForPropWrapperAssert (ref), argCheckModule (ref)
	local waitForProp = p0.waitForProp
	local maxUpdatesToDelay = p0.maxUpdatesToDelay
	local wrappedComponent = p0.wrappedComponent
	local var3 = usePrevious(waitForProp)
	local var4, var5 = reactModule.useState(maxUpdatesToDelay)
	local var6 = var3 ~= nil and (waitForProp == nil and (maxUpdatesToDelay ~= nil and var4 < maxUpdatesToDelay))
	reactModule.useEffect(function()
		-- upvalues: maxUpdatesToDelay (ref), waitForProp (ref), var6 (ref), var5 (ref), var4 (ref)
		if not maxUpdatesToDelay then return end
		if waitForProp ~= nil then return end
		if var6 then
			task.delay(0, function()
				-- upvalues: var5 (copy), maxUpdatesToDelay (copy)
				var5(maxUpdatesToDelay)
			end)
			
			return
		elseif var4 and var4 > 0 then
			task.delay(0, function()
				-- upvalues: var5 (copy), var4 (copy)
				var5(var4 - 1)
			end)
		end
	end, { waitForProp, maxUpdatesToDelay, var4, var6 })
	local var7 = true
	
	if waitForProp == nil and maxUpdatesToDelay ~= nil then
		if var6 then
			var7 = false
		elseif var4 and var4 > 0 then
			var7 = false
		elseif luaAppEnableWaitForPropWrapperAssert then
			argCheckModule.assert(waitForProp, `Missing data for prop for this game collection, after waiting {maxUpdatesToDelay} updates`)
		end
	end
	return if var7 then wrappedComponent else nil
end