local reactModule = require(script:FindFirstAncestor("GuiObjectUtils").Parent.React)

local function _(p1)
	return if typeof(p1) == "table" then p1.current else p1
end

return function(p1, p2)
	-- upvalues: reactModule (ref)
	local var1 = if typeof(p1) == "table" then p1.current else p1
	local var2, var3 = reactModule.useState(function()
		-- upvalues: var1 (ref), p2 (ref)
		return if var1 then var1[p2] else nil
	end)
	local var4 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), p2 (ref), var3 (ref)
		local var5 = p1
		local var6 = if typeof(var5) == "table" then var5.current else var5
		
		if var6 then
			var3(var6[p2])
		end
	end, { p1, p2 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), var4 (ref)
		local var5 = nil
		local var6 = p1
		local var7 = if typeof(var6) == "table" then var6.current else var6
		
		if var7 then
			var5 = var7:GetPropertyChangedSignal(p2):Connect(var4)
			var4()
		end
		return function()
			-- upvalues: var5 (write)
			if var5 then
				var5:Disconnect()
			end
		end
	end, { var1, p2, var4 })
	
	return var2
end