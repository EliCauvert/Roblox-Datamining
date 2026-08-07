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

local function _(p0, p1) --[[ line: 28 | named "calculateBreakpointFromWidth" ]]
	local var6 = p0.order[#p0.order]
	
	for i, v in p0.order do
		if p1 <= p0.widths[v] then
			var6 = v
			
			return var6
		end
	end
	return var6
end

local _ = function(p2, p3) --[[ line: 41 | named "getBreakpointIndex" ]]
	-- upvalues: dashModule (ref)
	return dashModule.findIndex(p2.order, function(p4) --[[ line: 42 ]]
		-- upvalues: p3 (ref)
		return p4 == p3
	end)
end

local _ = function(p5, p6, p7, p8) --[[ line: 47 | named "shouldChangeBreakpoint" ]]
	-- upvalues: dashModule (ref)
	return if p8 then if p7 == p8 then false elseif dashModule.findIndex(p5.order, function(p9) --[[ line: 42 ]]
		-- upvalues: p8 (ref)
		return p9 == p8
	end) < dashModule.findIndex(p5.order, function(p10) --[[ line: 42 ]]
		-- upvalues: p7 (ref)
		return p10 == p7
	end) then p5.widths[p8] + 5 < p6 else p6 < p5.widths[p7] - 5 else true
end

return function(p11, p12) --[[ line: 74 | named "useBreakpoint" ]]
	-- upvalues: withDefaultsModule (ref), constantsModule (ref), useResponsiveModule (ref), reactModule (ref), usePrevious (ref), dashModule (ref), instance (ref)
	local var7 = withDefaultsModule(p12 or {}, { throttleTime = constantsModule.DEFAULT_DELAY_TIME })
	local breakpoint = useResponsiveModule().config.breakpoint
	local var8, var9 = reactModule.useState(Vector2.zero)
	local x = var8.X
	local var10 = breakpoint.order[#breakpoint.order]
	
	for i, v in breakpoint.order do
		if x <= breakpoint.widths[v] then
			var10 = v
			break
		end
	end
	var11, var10 = reactModule.useState(var10)
	local var12 = usePrevious(var11)
	local var13 = reactModule.useMemo(function() --[[ line: 87 ]]
		-- upvalues: dashModule (copy), var9 (ref), var7 (ref)
		return dashModule.throttle(var9, var7.throttleTime, { leading = true, trailing = true })
	end, { var7.throttleTime })
	reactModule.useEffect(function() --[[ line: 94 ]]
		-- upvalues: p11 (ref), instance (copy), var13 (ref), var9 (ref)
		local var14 = nil
		
		if p11 then
			var14 = instance.GetPropertyChangedSignal(p11, "AbsoluteSize"):Connect(function() --[[ line: 98 ]]
				-- upvalues: var13 (copy), p11 (copy)
				var13(p11.AbsoluteSize)
			end)
			var9(p11.AbsoluteSize)
		end
		return function() --[[ line: 104 ]]
			-- upvalues: var14 (write)
			if var14 then
				var14:Disconnect()
			end
		end
	end, { p11 })
	reactModule.useEffect(function() --[[ line: 111 ]]
		-- upvalues: breakpoint (ref), var8 (ref), var10 (ref), var12 (ref), dashModule (copy), var10 (ref)
		local var16
		local var15 = breakpoint
		local x = var8.X
		
		if not var12 then
			var16 = true
		elseif var10 == var12 then
			var16 = false
		elseif dashModule.findIndex(var15.order, function(p13) --[[ line: 42 ]]
			-- upvalues: var12 (ref)
			return p13 == var12
		end) < dashModule.findIndex(var15.order, function(p14) --[[ line: 42 ]]
			-- upvalues: var10 (ref)
			return p14 == var10
		end) then
			var16 = var15.widths[var12] + 5 < x
			var16 = nil
		else
			var16 = x < var15.widths[var10] - 5
		end
		if var16 then
			var10(var10)
		end
	end, { breakpoint, var8.X, var10, var12 })
	
	return var11, var8
end