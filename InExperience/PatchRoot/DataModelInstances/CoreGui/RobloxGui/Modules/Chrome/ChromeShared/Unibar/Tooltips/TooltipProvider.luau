local reactModule = require(game:GetService("CorePackages").Packages.React)
local tooltipContextModule = require(script.Parent.TooltipContext)

function TooltipProvider(p1)
	-- upvalues: reactModule (ref), tooltipContextModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef({})
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var3 (ref), var4 (ref)
		var2(p2)
		var3.current = p2
		
		if var3.current and var4.current and var3.current.id == var4.current.id then
			var4.current = nil
		end
	end, {})
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var7 (ref), var4 (ref), var6 (ref)
		if var3 and var3.current and var3.current.id == p2 then
			var7(nil)
		end
		if var4 and var4.current and var4.current.id == p2 then
			var4.current = nil
		end
		local var9 = nil
		
		for i, v in pairs(var6.current) do
			if v.id == p2 then
				var9 = v
				break
			end
		end
		if var9 and var9.priority and var6.current[var9.priority] then
			var6.current[var9.priority] = nil
		end
	end, { var1 })
	var5.current = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var4 (ref), var6 (ref), var7 (ref), var8 (ref), var5 (ref)
		if var3.current or var4.current then return end
		local t = {}
		
		for i, v in pairs(var6.current) do
			table.insert(t, v)
		end
		table.sort(t, function(p3, p4)
			return p4.priority < p3.priority
		end)
		local var10 = t[1]
		
		if var10 then
			var4.current = var10
			task.delay(var10.showDelay / 1000, function()
				-- upvalues: var7 (copy), var10 (ref), var8 (copy), var5 (copy)
				var7(var10)
				task.delay(var10.dismissDelay / 1000, function()
					-- upvalues: var8 (copy), var10 (copy), var5 (copy)
					var8(var10.id)
					
					if var5.current then
						var5.current()
					end
				end)
			end)
			
			return
		end
	end, { var1 })
	
	local _ = function()
		-- upvalues: var5 (ref)
		if var5.current then
			var5.current()
		end
	end
	
	return reactModule.createElement(tooltipContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var6 (ref), var5 (ref), var8 (ref), var1 (ref)
			return {
				registerTooltip = function(p3, p4, p5, p6)
					-- upvalues: var6 (copy), var5 (copy)
					if not var6.current[p4] then
						table.insert(var6.current, p4, {
							id = p3,
							priority = p4,
							showDelay = p5,
							dismissDelay = p6
						})
						
						if var5.current then
							var5.current()
						end
					end
				end,
				unregisterTooltip = function(p3)
					-- upvalues: var8 (copy), var5 (copy)
					var8(p3)
					
					if var5.current then
						var5.current()
					end
				end,
				dismissTooltip = function(p3, _)
					-- upvalues: var8 (copy), var5 (copy)
					var8(p3)
					
					if var5.current then
						var5.current()
					end
				end,
				isCurrentTooltip = function(p3)
					-- upvalues: var1 (copy)
					return var1 and var1.id == p3
				end
			}
		end, { var1 })
	}, p1.children)
end

return TooltipProvider