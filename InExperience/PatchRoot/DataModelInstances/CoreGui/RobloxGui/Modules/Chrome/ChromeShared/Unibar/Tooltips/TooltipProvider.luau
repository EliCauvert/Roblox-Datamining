local reactModule = require(game:GetService("CorePackages").Packages.React)
local tooltipContextModule = require(script.Parent.TooltipContext)

function TooltipProvider(p0) --[[ line: 29 ]]
	-- upvalues: reactModule (ref), tooltipContextModule (ref)
	local var2, var3 = reactModule.useState(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef({})
	local var8 = reactModule.useCallback(function(p1) --[[ line: 40 ]]
		-- upvalues: var3 (ref), var4 (ref), var5 (ref)
		var3(p1)
		var4.current = p1
		
		if var4.current and var5.current and var4.current.id == var5.current.id then
			var5.current = nil
		end
	end, {})
	local var9 = reactModule.useCallback(function(p2) --[[ line: 52 ]]
		-- upvalues: var4 (ref), var8 (ref), var5 (ref), var7 (ref)
		if var4 and var4.current and var4.current.id == p2 then
			var8(nil)
		end
		if var5 and var5.current and var5.current.id == p2 then
			var5.current = nil
		end
		local var10 = nil
		
		for i, v in pairs(var7.current) do
			if v.id == p2 then
				var10 = v
				break
			end
		end
		if var10 and var10.priority and var7.current[var10.priority] then
			var7.current[var10.priority] = nil
		end
	end, { var2 })
	var6.current = reactModule.useCallback(function() --[[ line: 73 ]]
		-- upvalues: var4 (ref), var5 (ref), var7 (ref), var8 (ref), var9 (ref), var6 (ref)
		if var4.current or var5.current then return end
		local t = {}
		
		for i, v in pairs(var7.current) do
			table.insert(t, v)
		end
		table.sort(t, function(p3, p4) --[[ line: 85 ]]
			return p4.priority < p3.priority
		end)
		local var12 = t[1]
		
		if var12 then
			var5.current = var12
			task.delay(var12.showDelay / 1000, function() --[[ line: 96 ]]
				-- upvalues: var8 (copy), var12 (ref), var9 (copy), var6 (copy)
				var8(var12)
				task.delay(var12.dismissDelay / 1000, function() --[[ line: 99 ]]
					-- upvalues: var9 (copy), var12 (copy), var6 (copy)
					var9(var12.id)
					
					if var6.current then
						var6.current()
					end
				end)
			end)
			
			return
		end
	end, { var2 })
	
	local _ = function() --[[ line: 108 ]]
		-- upvalues: var6 (ref)
		if var6.current then
			var6.current()
		end
	end
	
	return reactModule.createElement(tooltipContextModule.Provider, {
		value = reactModule.useMemo(function() --[[ line: 114 ]]
			-- upvalues: var7 (ref), var6 (ref), var9 (ref), var2 (ref)
			return {
				registerTooltip = function(p5, p6, p7, p8) --[[ line: 116 ]]
					-- upvalues: var7 (copy), var6 (copy)
					if not var7.current[p6] then
						table.insert(var7.current, p6, {
							id = p5,
							priority = p6,
							showDelay = p7,
							dismissDelay = p8
						})
						
						if var6.current then
							var6.current()
						end
					end
				end,
				unregisterTooltip = function(p9) --[[ line: 127 ]]
					-- upvalues: var9 (copy), var6 (copy)
					var9(p9)
					
					if var6.current then
						var6.current()
					end
				end,
				dismissTooltip = function(p10, _) --[[ line: 131 ]]
					-- upvalues: var9 (copy), var6 (copy)
					var9(p10)
					
					if var6.current then
						var6.current()
					end
				end,
				isCurrentTooltip = function(p11) --[[ line: 135 ]]
					-- upvalues: var2 (copy)
					return var2 and var2.id == p11
				end
			}
		end, { var2 })
	}, p0.children)
end

return TooltipProvider