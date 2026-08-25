local reactModule = require(script:FindFirstAncestor("GuiObjectUtils").Parent.React)

local function _(p0)
	return if typeof(p0) == "table" then p0.current else p0
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
		local var7 = nil
		local var8 = p1
		local var9 = if typeof(var8) == "table" then var8.current else var8
		
		if var9 then
			var7 = var9:GetPropertyChangedSignal(p2):Connect(var4)
			var4()
		end
		return function()
			-- upvalues: var7 (write)
			if var7 then
				var7:Disconnect()
			end
		end
	end, { var1, p2, var4 })
	
	return var2
end