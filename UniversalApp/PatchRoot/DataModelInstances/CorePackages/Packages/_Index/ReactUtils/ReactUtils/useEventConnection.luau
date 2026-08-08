local parent = script:FindFirstAncestor("ReactUtils").Parent
local reactModule = require(parent.React)
local _ = require(parent.GoodSignal)

return function(p0, p1, p2) --[[ line: 8 | named "useEventConnection" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useMemo(function() --[[ line: 13 ]]
		-- upvalues: p1 (ref)
		return p1
	end, p2)
	reactModule.useEffect(function() --[[ line: 17 ]]
		-- upvalues: p0 (ref), var1 (ref)
		if p0 == nil then
			return nil
		elseif typeof(p0) == "RBXScriptSignal" then
			local var2 = p0:Connect(var1)
			
			return function() --[[ line: 26 ]]
				-- upvalues: var2 (ref)
				var2:Disconnect()
			end
		end
		local var3 = p0:Connect(var1)
		
		return function() --[[ line: 33 ]]
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, { p0, var1 })
end