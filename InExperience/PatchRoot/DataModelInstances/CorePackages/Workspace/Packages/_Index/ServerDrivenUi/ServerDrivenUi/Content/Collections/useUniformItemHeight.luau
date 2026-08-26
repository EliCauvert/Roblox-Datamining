local reactModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useRef(false)
	local var3 = reactModule.useRef(0)
	local var4, var5 = reactModule.useState(nil)
	local var6, var7 = reactModule.useBinding(nil)
	
	return {
		measuredMaxHeight = if p1 then var4 else nil,
		measuredMaxHeightBinding = if p1 then var6 else nil,
		onItemSizeChanged = if p1 then reactModule.useCallback(function(p2, p3)
			-- upvalues: p1 (ref), var3 (ref), var1 (ref), var5 (ref), var7 (ref), var2 (ref)
			if not p1 then return end
			local x = p3.AbsoluteSize.X
			local y = p3.AbsoluteSize.Y
			
			if var3.current > 0 and math.abs(x - var3.current) > 1 then
				var3.current = x
				var1.current = {}
				var5(nil)
				var7(nil)
				
				return
			end
			var3.current = x
			
			if y <= 0 or var1.current[p2] == y then return end
			var1.current[p2] = y
			
			if not var2.current then
				var2.current = true
				task.defer(function()
					-- upvalues: var2 (copy), var1 (copy), var7 (copy), var5 (copy)
					var2.current = false
					local var8 = 0
					
					for i, v in var1.current do
						var8 = math.max(var8, v)
					end
					if var8 > 0 then
						var7(var8)
						var5(var8)
					end
				end)
			end
		end, { p1 }) else nil
	}
end