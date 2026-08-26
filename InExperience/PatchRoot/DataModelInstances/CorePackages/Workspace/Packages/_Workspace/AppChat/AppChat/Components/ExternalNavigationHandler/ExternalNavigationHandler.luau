local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local memo = reactModule.memo
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local usePrevious = roactUtilsModule.Hooks.usePrevious

function ExternalNavigationHandler(p1)
	-- upvalues: useRef (ref), useEffect (ref), usePrevious (ref)
	local _ = function()
		-- upvalues: p1 (ref)
		return p1.requestId ~= p1.completedRequestId and p1.screen
	end
	
	local var1 = useRef({})
	
	local var2 = function()
		-- upvalues: p1 (ref), var1 (ref)
		local screen = p1.screen
		local var3 = p1.navigationByScreen[screen]
		
		if var3 then
			var3(p1.params)
		else
			assert(var1.current, "Queue for ExternalNavigationHandler can't be nil")
			local var4 = var1.current[screen] or {}
			table.insert(var4, p1.params)
			var1.current[screen] = var4
		end
		p1.completeExternalNavigation(p1.requestId)
	end
	
	useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		if p1.requestId ~= p1.completedRequestId and p1.screen then
			var2()
		end
	end, { p1.requestId, p1.completedRequestId, p1.screen })
	local var3 = usePrevious(p1.navigationByScreen)
	useEffect(function()
		-- upvalues: var1 (ref), var3 (ref), p1 (ref)
		assert(var1.current, "Queue for ExternalNavigationHandler can't be nil")
		
		if var3 == nil then return end
		for i, v in pairs(var1.current) do
			assert(var3, "")
			local var4 = p1.navigationByScreen[i]
			
			if var3[i] ~= var4 and var4 then
				for i_1, v_1 in ipairs(v) do
					var4(v_1)
				end
				var1.current[i] = nil
			end
		end
	end, { p1.navigationByScreen })
	
	return nil
end

return memo(ExternalNavigationHandler)