local reactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)
local useStoreModule = require(script.Parent.useStore)

local var1 = function(p1, p2)
	return p1 == p2
end

function useSelectorWithStore(p1, p2, p3)
	-- upvalues: reactModule (ref)
	local _, var2 = reactModule.useReducer(function(p4)
		return p4 + 1
	end, 0)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local state = p3:getState()
	local var7 = nil
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), var4 (ref), state (ref), var5 (ref), var3 (ref), var6 (ref), p2 (ref), var7 (write)
		if p1 == var4.current and state == var5.current and not var3.current then
			var7 = var6.current
			
			return
		end
		local var8 = p1(state)
		
		if var6.current == nil or not p2(var8, var6.current) then
			var7 = var8
			
			return
		end
		var7 = var6.current
	end)
	
	if not ok then
		if var3.current then
			status = string.format("%s\nThe error may be correlated with this previous error:\n%s\n\n", tostring(status), tostring(var3.current))
		end
		error(status)
	end
	reactModule.useLayoutEffect(function()
		-- upvalues: var4 (ref), p1 (ref), var5 (ref), state (ref), var6 (ref), var7 (write), var3 (ref)
		var4.current = p1
		var5.current = state
		var6.current = var7
		var3.current = nil
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var5 (ref), var4 (ref), p2 (ref), var6 (ref), var3 (ref), var2 (ref), p3 (ref)
		local changedConnection = p3.changed:connect(function(p4)
			-- upvalues: var5 (copy), var4 (copy), p2 (copy), var6 (copy), var3 (copy), var2 (copy)
			local ok, status = pcall(function()
				-- upvalues: p4 (ref), var5 (copy), var4 (copy), p2 (copy), var6 (copy)
				if p4 == var5.current then
					return false
				end
				assert(var4.current, "latestSelector")
				local var8 = var4.current(p4)
				
				if p2(var8, var6.current) then
					return false
				end
				var6.current = var8
				var5.current = p4
				
				return true
			end)
			
			if not ok then
				status = status or "Error"
				var3.current = status
			end
			if status then
				var2(nil)
			end
		end)
		local state = p3:getState()
		local ok, status = pcall(function()
			-- upvalues: state (ref), var5 (copy), var4 (copy), p2 (copy), var6 (copy)
			if state == var5.current then
				return false
			end
			assert(var4.current, "latestSelector")
			local var8 = var4.current(state)
			
			if p2(var8, var6.current) then
				return false
			end
			var6.current = var8
			var5.current = state
			
			return true
		end)
		
		if not ok then
			status = status or "Error"
			var3.current = status
		end
		if status then
			var2(nil)
		end
		return function()
			-- upvalues: changedConnection (ref)
			changedConnection.disconnect()
		end
	end, { p3 })
	
	return var7
end

function useSelector(p1, p2)
	-- upvalues: var1 (ref), useStoreModule (ref)
	return useSelectorWithStore(p1, p2 or var1, useStoreModule())
end

return useSelector