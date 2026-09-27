local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local controlStateModule = require(foundation.Enums.ControlState)
local inputSizeModule = require(foundation.Enums.InputSize)
local linkVariantModule = require(foundation.Enums.LinkVariant)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local escapeRichTextModule = require(foundation.Utility.escapeRichText)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useLinkVariantsModule = require(script.Parent.useLinkVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local t = {
	[controlStateModule.Hover] = true,
	[controlStateModule.Pressed] = true,
	[controlStateModule.Selected] = true,
	[controlStateModule.SelectedPressed] = true
}
local t_1 = {
	hasUnderline = false,
	testId = "--foundation-link",
	variant = linkVariantModule.Standard,
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTokensModule (ref), useLinkVariantsModule (ref), reactModule (ref), t (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), textModule (ref), escapeRichTextModule (ref)
	local var1 = withDefaultsModule(p1, t_1)
	local var2 = useTokensModule()
	local var3 = useLinkVariantsModule(var2, var1.size, var1.variant)
	local style = var3.content.style
	local var4, var5 = reactModule.useState(false)
	local hasUnderline = var1.hasUnderline or var4
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = var3.container.tag,
		cursor = reactModule.useMemo(function()
			-- upvalues: var2 (ref)
			return {
				radius = UDim.new(0, var2.Radius.XSmall),
				offset = var2.Size.Size_50,
				borderWidth = var2.Stroke.Standard
			}
		end, { var2 }),
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		onActivated = var1.onActivated,
		onStateChanged = reactModule.useCallback(function(p3)
			-- upvalues: var5 (ref), t (copy)
			var5(t[p3] == true)
		end, {}),
		selection = {
			Selectable = var1.Selectable,
			NextSelectionUp = var1.NextSelectionUp,
			NextSelectionDown = var1.NextSelectionDown,
			NextSelectionLeft = var1.NextSelectionLeft,
			NextSelectionRight = var1.NextSelectionRight
		},
		ref = p2
	}), {
		Text = reactModule.createElement(textModule, {
			LayoutOrder = 1,
			Text = if hasUnderline then `<u>{escapeRichTextModule(var1.text)}</u>` else var1.text,
			RichText = hasUnderline,
			tag = var3.text.tag,
			textStyle = { Color3 = style.Color3, Transparency = style.Transparency },
			testId = `{var1.testId}--text`
		})
	})
end))