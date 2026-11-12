local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(script.Parent.NavigationBarTab)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseAnimatedHighlightModule = require(Foundation.Utility.useAnimatedHighlight)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: UseTokensModule (copy), UseAnimatedHighlightModule (copy), ReactModule (copy), ViewModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseAnimatedHighlightModuleResult = UseAnimatedHighlightModule(p1.activeItemId, p1.containerRef, p1.tabRefs, p1.items, p1.hasLabels)
	
	return if p1.isCapsule then ReactModule.createElement(ViewModule, {
		tag = "radius-circle bg-shift-200",
		Size = ReactModule.joinBindings({
			UseAnimatedHighlightModuleResult.highlightWidth,
			UseAnimatedHighlightModuleResult.activeItemHeight
		}):map(function(Entry): UDim2
			-- upvalues: UseTokensModuleResult (copy)
			return UDim2.fromOffset(Entry[1] + 2 * UseTokensModuleResult.Size.Size_200, Entry[2])
		end),
		Position = UseAnimatedHighlightModuleResult.highlightPosition:map(function(p2): UDim2
			-- upvalues: UseTokensModuleResult (copy)
			return UDim2.fromOffset(p2 - UseTokensModuleResult.Size.Size_200, 0)
		end),
		Visible = p1.isVisible,
		testId = p1.testId
	}) else ReactModule.createElement(ViewModule, {
		tag = "radius-circle bg-system-contrast",
		ZIndex = 3,
		Size = UseAnimatedHighlightModuleResult.highlightWidth:map(function(XOffset): UDim2
			-- upvalues: UseTokensModuleResult (copy)
			return UDim2.fromOffset(XOffset, UseTokensModuleResult.Size.Size_50)
		end),
		Position = UseAnimatedHighlightModuleResult.highlightPosition:map(function(XOffset): UDim2
			return UDim2.fromOffset(XOffset, 0)
		end),
		Visible = p1.isVisible,
		testId = p1.testId
	})
end