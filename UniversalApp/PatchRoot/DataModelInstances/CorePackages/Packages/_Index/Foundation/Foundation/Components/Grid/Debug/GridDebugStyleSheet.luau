local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local useForwardRef = require(parent.ReactUtils).useForwardRef
local styleRuleModule = require(foundation.StyleSheet.StyleRule)
local useStyleSheet = require(foundation.Providers.Style.StyleSheetContext).useStyleSheet
local _ = require(foundation.Enums.Breakpoint)
local _ = require(foundation.Enums.BreakpointShortName)
local useResponsiveModule = require(foundation.Providers.Responsive.useResponsive)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useResponsiveModule (ref), useStyleSheet (ref), reactModule (ref), useForwardRef (ref), styleRuleModule (ref)
	local var1 = useResponsiveModule()
	local var2 = useStyleSheet()
	local var3, var4 = reactModule.useState(nil)
	local var5 = useForwardRef(p2, var4)
	local breakpoint = var1.config.breakpoint
	local grid = var1.config.grid
	local breakpoint_1 = p1.breakpoint or breakpoint.order[#breakpoint.order]
	local var6 = reactModule.useMemo(function()
		-- upvalues: breakpoint (ref), breakpoint_1 (ref), grid (ref), reactModule (copy), styleRuleModule (copy)
		local var7 = breakpoint.shortNames[breakpoint_1]
		local var8 = grid.columns[breakpoint_1]
		local t = {}
		
		for i = 0, var8 do
			t[`DebugColColor${i}`] = reactModule.createElement(styleRuleModule, {
				Selector = if var7 then `.{var7}-col-{i}` else `.col-{i}`,
				properties = {
					BackgroundColor3 = Color3.fromRGB(math.floor(i / math.max(1, var8) * 255), math.floor((1 - i / math.max(1, var8)) * 255), math.floor(i % 3 / 2 * 255))
				}
			})
		end
		return t
	end, { breakpoint_1, breakpoint, grid })
	reactModule.useLayoutEffect(function()
		-- upvalues: var3 (ref), var2 (ref)
		if var3 then
			var3:SetDerives({ var2 })
		end
	end, { var3, var2 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		GridDebugStyleSheet = reactModule.createElement("StyleSheet", { ref = var5 }, var6),
		GridDebugStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var3 })
	})
end))