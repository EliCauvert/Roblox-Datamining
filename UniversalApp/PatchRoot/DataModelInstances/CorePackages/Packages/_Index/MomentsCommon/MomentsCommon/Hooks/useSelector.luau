local reactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)
local useStoreModule = require(script.Parent.useStore)

local var2 = function(p0, p1) --[[ line: 12 ]]
	return p0 == p1
end

function useSelectorWithStore(p2, p3, p4) --[[ line: 16 ]]
	-- upvalues: reactModule (ref)
	local _, var3 = reactModule.useReducer(function(p5) --[[ line: 21 ]]
		return p5 + 1
	end, 0)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local state = p4:getState()
	local var9 = nil
	local ok, status = pcall(function() --[[ line: 33 ]]
		-- upvalues: p2 (ref), var5 (ref), state (ref), var6 (ref), var4 (ref), var7 (ref), p3 (ref), var9 (write)
		if p2 == var5.current and state == var6.current and not var4.current then
			var9 = var7.current
			
			return
		end
		local var10 = p2(state)
		
		if var7.current == nil or not p3(var10, var7.current) then
			var9 = var10
			
			return
		end
		var9 = var7.current
	end)
	
	if not ok then
		if var4.current then
			status = string.format("%s\nThe error may be correlated with this previous error:\n%s\n\n", tostring(status), tostring(var4.current))
		end
		error(status)
	end
	reactModule.useLayoutEffect(function() --[[ line: 63 ]]
		-- upvalues: var5 (ref), p2 (ref), var6 (ref), state (ref), var7 (ref), var9 (write), var4 (ref)
		var5.current = p2
		var6.current = state
		var7.current = var9
		var4.current = nil
	end)
	reactModule.useLayoutEffect(function() --[[ line: 70 ]]
		-- upvalues: var6 (ref), var5 (ref), p3 (ref), var7 (ref), var4 (ref), var3 (ref), p4 (ref)
		local changedConnection = p4.changed:connect(function(p6) --[[ line: 71 | named "checkForUpdates" ]]
			-- upvalues: var6 (copy), var5 (copy), p3 (copy), var7 (copy), var4 (copy), var3 (copy)
			local ok, status = pcall(function() --[[ line: 72 ]]
				-- upvalues: p6 (ref), var6 (copy), var5 (copy), p3 (copy), var7 (copy)
				if p6 == var6.current then
					return false
				end
				assert(var5.current, "latestSelector")
				local var13 = var5.current(p6)
				
				if p3(var13, var7.current) then
					return false
				end
				var7.current = var13
				var6.current = p6
				
				return true
			end)
			
			if not ok then
				status = status or "Error"
				var4.current = status
			end
			if status then
				var3(nil)
			end
		end)
		local state = p4:getState()
		local ok, status = pcall(function() --[[ line: 72 ]]
			-- upvalues: state (ref), var6 (copy), var5 (copy), p3 (copy), var7 (copy)
			if state == var6.current then
				return false
			end
			assert(var5.current, "latestSelector")
			local var13 = var5.current(state)
			
			if p3(var13, var7.current) then
				return false
			end
			var7.current = var13
			var6.current = state
			
			return true
		end)
		
		if not ok then
			status = status or "Error"
			var4.current = status
		end
		if status then
			var3(nil)
		end
		return function() --[[ line: 106 ]]
			-- upvalues: changedConnection (ref)
			changedConnection.disconnect()
		end
	end, { p4 })
	
	return var9
end

function useSelector(p7, p8) --[[ line: 114 ]]
	-- upvalues: var2 (ref), useStoreModule (ref)
	return useSelectorWithStore(p7, p8 or var2, useStoreModule())
end

return useSelector