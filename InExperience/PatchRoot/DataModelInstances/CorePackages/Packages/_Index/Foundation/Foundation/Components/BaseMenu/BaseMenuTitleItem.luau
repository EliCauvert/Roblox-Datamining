local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local _ = require(foundation.Enums.ControlState)
local _ = require(foundation.Enums.InputSize)
local flagsModule = require(foundation.Utility.Flags)
local useBaseMenuItemVariantsModule = require(script.Parent.useBaseMenuItemVariants)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 32 | named "BaseMenuTitleItem" ]]
	-- upvalues: useTokensModule (ref), useBaseMenuItemVariantsModule (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), textModule (ref)
	local var8 = useBaseMenuItemVariantsModule(useTokensModule(), p0.size, false)
	
	return if flagsModule.FoundationBaseMenuBeta then reactModule.createElement(viewModule, withCommonPropsModule(p0, {
		tag = `row align-y-center {var8.container.tag}`,
		padding = {
			left = UDim.new(0, if p0.menuHasCheck == true then (var8.container.paddingLeftWithCheck or 0) + (var8.title.checkColumnWidth or 0) else var8.container.paddingLeftWithoutCheck or 0),
			right = UDim.new(0, var8.container.paddingRight or 0)
		},
		ref = p1
	}), reactModule.createElement(textModule, { Text = p0.text, tag = var8.title.tag })) else reactModule.createElement(viewModule, withCommonPropsModule(p0, { tag = var8.container.tag, ref = p1 }), reactModule.createElement(textModule, { Text = p0.text, tag = var8.title.tag }))
end))