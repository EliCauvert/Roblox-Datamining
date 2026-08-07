-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local useForwardRef = require(parent.ReactUtils).useForwardRef
local styleRuleModule = require(foundation.StyleSheet.StyleRule)
local useStyleSheet = require(foundation.Providers.Style.StyleSheetContext).useStyleSheet
local _ = require(foundation.Enums.Breakpoint)
local _ = require(foundation.Enums.BreakpointShortName)
local useResponsiveModule = require(foundation.Providers.Responsive.useResponsive)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 19 | named "GridDebugStyleSheet" ]]
	-- upvalues: useResponsiveModule (ref), useStyleSheet (ref), reactModule (ref), useForwardRef (ref), styleRuleModule (ref)
	local var4 = useResponsiveModule()
	local var5 = useStyleSheet()
	local var6, var7 = reactModule.useState(nil)
	local var8 = useForwardRef(p1, var7)
	local breakpoint = var4.config.breakpoint
	local grid = var4.config.grid
	local breakpoint_1 = p0.breakpoint or breakpoint.order[#breakpoint.order]
	local var10 = reactModule.useMemo(function() --[[ line: 31 ]]
		-- upvalues: breakpoint (ref), breakpoint_1 (ref), grid (ref), reactModule (copy), styleRuleModule (copy)
		local var11 = breakpoint.shortNames[breakpoint_1]
		local var12 = grid.columns[breakpoint_1]
		local t = {}
		
		for i = 0, var12 do
			t[`DebugColColor${i}`] = reactModule.createElement(styleRuleModule, {
				Selector = if var11 then `.{var11}-col-{i}` else `.col-{i}`,
				properties = {
					BackgroundColor3 = Color3.fromRGB(math.floor(i / math.max(1, var12) * 255), math.floor((1 - i / math.max(1, var12)) * 255), math.floor(i % 3 / 2 * 255))
				}
			})
		end
		return t
	end, { breakpoint_1, breakpoint, grid })
	reactModule.useLayoutEffect(function() --[[ line: 54 ]]
		-- upvalues: var6 (ref), var5 (ref)
		if var6 then
			var6:SetDerives({ var5 })
		end
	end, { var6, var5 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		GridDebugStyleSheet = reactModule.createElement("StyleSheet", { ref = var8 }, var10),
		GridDebugStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var6 })
	})
end))