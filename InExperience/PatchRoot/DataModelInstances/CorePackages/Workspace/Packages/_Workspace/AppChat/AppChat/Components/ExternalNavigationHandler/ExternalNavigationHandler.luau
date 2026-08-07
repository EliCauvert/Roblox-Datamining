local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local memo = reactModule.memo
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local usePrevious = roactUtilsModule.Hooks.usePrevious

function ExternalNavigationHandler(p0) --[[ line: 24 ]]
	-- upvalues: useRef (ref), useEffect (ref), usePrevious (ref)
	local _ = function() --[[ line: 25 ]]
		-- upvalues: p0 (ref)
		return p0.requestId ~= p0.completedRequestId and p0.screen
	end
	
	local var2 = useRef({})
	
	local var3 = function() --[[ line: 31 ]]
		-- upvalues: p0 (ref), var2 (ref)
		local screen = p0.screen
		local var5 = p0.navigationByScreen[screen]
		
		if var5 then
			var5(p0.params)
		else
			assert(var2.current, "Queue for ExternalNavigationHandler can't be nil")
			local var6 = var2.current[screen] or {}
			table.insert(var6, p0.params)
			var2.current[screen] = var6
		end
		p0.completeExternalNavigation(p0.requestId)
	end
	
	useEffect(function() --[[ line: 49 ]]
		-- upvalues: p0 (ref), var3 (ref)
		if p0.requestId ~= p0.completedRequestId and p0.screen then
			var3()
		end
	end, { p0.requestId, p0.completedRequestId, p0.screen })
	local var4 = usePrevious(p0.navigationByScreen)
	useEffect(function() --[[ line: 57 ]]
		-- upvalues: var2 (ref), var4 (ref), p0 (ref)
		assert(var2.current, "Queue for ExternalNavigationHandler can't be nil")
		
		if var4 == nil then return end
		for i, v in pairs(var2.current) do
			assert(var4, "")
			local var7 = p0.navigationByScreen[i]
			
			if var4[i] ~= var7 and var7 then
				for i_1, v_1 in ipairs(v) do
					var7(v_1)
				end
				var2.current[i] = nil
			end
		end
	end, { p0.navigationByScreen })
	
	return nil
end

return memo(ExternalNavigationHandler)