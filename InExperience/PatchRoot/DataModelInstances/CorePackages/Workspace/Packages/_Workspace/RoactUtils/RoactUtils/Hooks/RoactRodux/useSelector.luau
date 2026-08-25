local parent = script:FindFirstAncestor("RoactUtils").Parent
local argCheckModule = require(parent.ArgCheck)
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useStoreModule = require(script.Parent.useStore)

local var4 = function(p0, p1)
	return p0 == p1
end

function useSelectorWithStore(p2, p3, p4)
	-- upvalues: reactModule (ref)
	local _, var5 = reactModule.useReducer(function(p5)
		return p5 + 1
	end, 0)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local state = p4:getState()
	local var11 = nil
	local ok, status = pcall(function()
		-- upvalues: p2 (ref), var7 (ref), state (ref), var8 (ref), var6 (ref), var9 (ref), p3 (ref), var11 (write)
		if p2 == var7.current and state == var8.current and not var6.current then
			var11 = var9.current
			
			return
		end
		local var12 = p2(state)
		
		if var9.current == nil or not p3(var12, var9.current) then
			var11 = var12
			
			return
		end
		var11 = var9.current
	end)
	
	if not ok then
		if var6.current then
			status = string.format("%s\nThe error may be correlated with this previous error:\n%s\n\n", tostring(status), tostring(var6.current))
		end
		error(status)
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var7 (ref), p2 (ref), var8 (ref), state (ref), var9 (ref), var11 (write), var6 (ref)
		var7.current = p2
		var8.current = state
		var9.current = var11
		var6.current = nil
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var8 (ref), var7 (ref), p3 (ref), var9 (ref), var6 (ref), var5 (ref), p4 (ref)
		local changedConnection = p4.changed:connect(function(p6)
			-- upvalues: var8 (copy), var7 (copy), p3 (copy), var9 (copy), var6 (copy), var5 (copy)
			local ok, status = pcall(function()
				-- upvalues: p6 (ref), var8 (copy), var7 (copy), p3 (copy), var9 (copy)
				if p6 == var8.current then
					return false
				end
				assert(var7.current, "latestSelector")
				local var15 = var7.current(p6)
				
				if p3(var15, var9.current) then
					return false
				end
				var9.current = var15
				var8.current = p6
				
				return true
			end)
			
			if not ok then
				status = status or "Error"
				var6.current = status
			end
			if status then
				var5(nil)
			end
		end)
		local state = p4:getState()
		local ok, status = pcall(function()
			-- upvalues: state (ref), var8 (copy), var7 (copy), p3 (copy), var9 (copy)
			if state == var8.current then
				return false
			end
			assert(var7.current, "latestSelector")
			local var15 = var7.current(state)
			
			if p3(var15, var9.current) then
				return false
			end
			var9.current = var15
			var8.current = state
			
			return true
		end)
		
		if not ok then
			status = status or "Error"
			var6.current = status
		end
		if status then
			var5(nil)
		end
		return function()
			-- upvalues: changedConnection (ref)
			changedConnection:disconnect()
		end
	end, { p4 })
	
	return var11
end

function useSelector(p7, p8)
	-- upvalues: argCheckModule (ref), dashModule (ref), var4 (ref), useStoreModule (ref)
	argCheckModule.isNotNil(p7, "selector")
	argCheckModule.assert(dashModule.isCallable(p7), "useSelector expects 'selector' to be callable")
	argCheckModule.isTypeOrNil(p8, "function", "equalityFn")
	
	return useSelectorWithStore(p7, p8 or var4, useStoreModule())
end

return useSelector