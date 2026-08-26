local parent = script:FindFirstAncestor("ReactUtils").Parent
local reactModule = require(parent.React)
local _ = require(parent.GoodSignal)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p2 (ref)
		return p2
	end, p3)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		if p1 == nil then
			return nil
		elseif typeof(p1) == "RBXScriptSignal" then
			local var2 = p1:Connect(var1)
			
			return function()
				-- upvalues: var2 (ref)
				var2:Disconnect()
			end
		end
		local var3 = p1:Connect(var1)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, { p1, var1 })
end