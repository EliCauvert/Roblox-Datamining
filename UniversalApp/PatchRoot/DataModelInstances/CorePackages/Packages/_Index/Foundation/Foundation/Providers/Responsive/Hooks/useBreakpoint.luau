local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local usePrevious = require(parent.ReactUtils).usePrevious
local instance = require(foundation.Utility.Wrappers).Instance
local _ = require(foundation.Enums.Breakpoint)
local constantsModule = require(foundation.Constants)
local _ = require(foundation.Providers.Responsive.ResponsiveContext)
local useResponsiveModule = require(foundation.Providers.Responsive.useResponsive)
local withDefaultsModule = require(foundation.Utility.withDefaults)

local function _(p1, p2)
	local var1 = p1.order[#p1.order]
	
	for i, v in p1.order do
		if p2 <= p1.widths[v] then
			var1 = v
			
			return var1
		end
	end
	return var1
end

local _ = function(p3, p4)
	-- upvalues: dashModule (ref)
	return dashModule.findIndex(p3.order, function(p5)
		-- upvalues: p4 (ref)
		return p5 == p4
	end)
end

local _ = function(p3, p4, p5, p6)
	-- upvalues: dashModule (ref)
	return if p6 then if p5 == p6 then false elseif dashModule.findIndex(p3.order, function(p7)
		-- upvalues: p6 (ref)
		return p7 == p6
	end) < dashModule.findIndex(p3.order, function(p7)
		-- upvalues: p5 (ref)
		return p7 == p5
	end) then p3.widths[p6] + 5 < p4 else p4 < p3.widths[p5] - 5 else true
end

return function(p3, p4)
	-- upvalues: withDefaultsModule (ref), constantsModule (ref), useResponsiveModule (ref), reactModule (ref), usePrevious (ref), dashModule (ref), instance (ref)
	local var2 = withDefaultsModule(p4 or {}, { throttleTime = constantsModule.DEFAULT_DELAY_TIME })
	local breakpoint = useResponsiveModule().config.breakpoint
	local var3, var4 = reactModule.useState(Vector2.zero)
	local x = var3.X
	local var5 = breakpoint.order[#breakpoint.order]
	
	for i, v in breakpoint.order do
		if x <= breakpoint.widths[v] then
			var5 = v
			break
		end
	end
	var11, var10 = reactModule.useState(var5)
	local var6 = usePrevious(var11)
	local var7 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), var4 (ref), var2 (ref)
		return dashModule.throttle(var4, var2.throttleTime, { leading = true, trailing = true })
	end, { var2.throttleTime })
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), instance (copy), var7 (ref), var4 (ref)
		local var8 = nil
		
		if p3 then
			var8 = instance.GetPropertyChangedSignal(p3, "AbsoluteSize"):Connect(function()
				-- upvalues: var7 (copy), p3 (copy)
				var7(p3.AbsoluteSize)
			end)
			var4(p3.AbsoluteSize)
		end
		return function()
			-- upvalues: var8 (write)
			if var8 then
				var8:Disconnect()
			end
		end
	end, { p3 })
	reactModule.useEffect(function()
		-- upvalues: breakpoint (ref), var3 (ref), var5 (ref), var6 (ref), dashModule (copy), var5 (ref)
		local var8
		local var9 = breakpoint
		local x = var3.X
		
		if not var6 then
			var8 = true
		elseif var5 == var6 then
			var8 = false
		elseif dashModule.findIndex(var9.order, function(p5)
			-- upvalues: var6 (ref)
			return p5 == var6
		end) < dashModule.findIndex(var9.order, function(p5)
			-- upvalues: var5 (ref)
			return p5 == var5
		end) then
			var8 = var9.widths[var6] + 5 < x
			var8 = nil
		else
			var8 = x < var9.widths[var5] - 5
		end
		if var8 then
			var5(var5)
		end
	end, { breakpoint, var3.X, var5, var6 })
	
	return var11, var3
end