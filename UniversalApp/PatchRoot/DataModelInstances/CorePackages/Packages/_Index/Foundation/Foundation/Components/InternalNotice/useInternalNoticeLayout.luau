local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local breakpointModule = require(foundation.Enums.Breakpoint)
local breakpointConfigModule = require(foundation.Utility.Responsive.BreakpointConfig)
local _ = require(foundation.Components.Types)
local useAbsoluteSizeModule = require(foundation.Utility.useAbsoluteSize)
local xSmall = breakpointConfigModule.widths[breakpointModule.XSmall]

return function(p1)
	-- upvalues: useAbsoluteSizeModule (ref), reactModule (ref), xSmall (ref)
	local var1, var2 = useAbsoluteSizeModule(p1)
	local var3, var4 = reactModule.useState(0)
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref)
		var4(p2.AbsoluteSize.X)
	end, {})
	local var6, var7 = reactModule.useState(0)
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		var7(p2.AbsoluteSize.X)
	end, {})
	local var9 = var1.X * 0.3
	local var10 = (var1.X > 0 and var1.X <= xSmall) or (var9 > 0 and var9 < var3)
	
	return {
		isStacked = var10,
		onNoticeAbsoluteSizeChanged = var2,
		onStackedColumnAbsoluteSizeChanged = var8,
		measureInlineLink = if not var10 then var5 else nil,
		stackedLinkConstraint = if var10 and var6 > 0 then { MaxSize = Vector2.new(var6, 1e999) } else nil
	}
end