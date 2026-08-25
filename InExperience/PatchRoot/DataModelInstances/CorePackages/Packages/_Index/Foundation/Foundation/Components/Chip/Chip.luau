local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local iconVariant = require(parent.BuilderIcons).IconVariant
local constantsModule = require(foundation.Constants)
local flagsModule = require(foundation.Utility.Flags)
local presentationContextModule = require(foundation.Providers.Style.PresentationContext)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local accessoryModule = require(script.Parent.Accessory)
local iconPositionModule = require(foundation.Enums.IconPosition)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local stateLayerModeModule = require(foundation.Enums.StateLayerMode)
local _ = require(foundation.Enums.CursorType)
local useChipVariantsModule = require(script.Parent.useChipVariants)
local t = {
	isChecked = false,
	Selectable = true,
	isDisabled = false,
	testId = "--foundation-chip",
	size = require(foundation.Enums.ChipSize).Medium,
	variant = require(foundation.Enums.ChipVariant).Standard
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), iconPositionModule (ref), iconVariant (ref), useChipVariantsModule (ref), flagsModule (ref), colorNamespaceModule (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerModeModule (ref), constantsModule (ref), presentationContextModule (ref), accessoryModule (ref), textModule (ref)
	local var16 = withDefaultsModule(p0, t)
	local var17 = useTokensModule()
	local var18, var19 = reactModule.useMemo(function()
		-- upvalues: var16 (ref), iconPositionModule (copy), iconVariant (copy)
		local leading = var16.leading
		local trailing = var16.trailing
		
		if var16.icon ~= nil then
			if typeof(var16.icon) == "string" then
				leading = { iconName = var16.icon }
			else
				local t = { iconName = var16.icon.name }
				
				if var16.icon.position == iconPositionModule.Left then
					leading = t
				else
					trailing = t
				end
			end
		end
		if typeof(leading) == "table" and leading.isCircular then
			leading.iconVariant = iconVariant.Filled
		end
		if typeof(trailing) == "table" and trailing.isCircular then
			trailing.iconVariant = iconVariant.Filled
		end
		return leading, trailing
	end, { var16.leading, var16.icon, var16.trailing })
	local var20 = useChipVariantsModule(var17, var16.size, var16.variant, var16.isChecked, var18 ~= nil, var19 ~= nil)
	local floored = math.floor(var17.Stroke.Thicker)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var16, {
		isDisabled = var16.isDisabled,
		selection = {
			Selectable = if var16.isDisabled then false else var16.Selectable,
			NextSelectionUp = var16.NextSelectionUp,
			NextSelectionDown = var16.NextSelectionDown,
			NextSelectionLeft = var16.NextSelectionLeft,
			NextSelectionRight = var16.NextSelectionRight
		},
		onActivated = var16.onActivated,
		stateLayer = if var16.isChecked then { mode = stateLayerModeModule.Inverse } else nil,
		backgroundStyle = var20.chip.backgroundStyle,
		padding = var20.chip.padding,
		cursor = {
			radius = UDim.new(0, var17.Radius.Circle),
			offset = floored * 2,
			borderWidth = floored
		},
		tag = var20.chip.tag,
		ref = p1,
		GroupTransparency = if var16.isDisabled then constantsModule.DISABLED_TRANSPARENCY else 0
	}), reactModule.createElement(presentationContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: var16 (ref), colorNamespaceModule (copy)
			return {
				isIconSize = true,
				colorNamespace = if var16.isChecked then colorNamespaceModule.Inverse else colorNamespaceModule.Color
			}
		end, { var16.isChecked }) else nil else {
			isIconSize = true,
			colorNamespace = if var16.isChecked then colorNamespaceModule.Inverse else colorNamespaceModule.Color
		}
	}, {
		Leading = if var18 then reactModule.createElement(accessoryModule, {
			isLeading = true,
			config = var18,
			size = var16.size,
			chipBackgroundStyle = var20.chip.backgroundStyle,
			contentStyle = var20.text.contentStyle,
			isDisabled = var16.isDisabled,
			testId = `{var16.testId}--leading-accessory`
		}) else nil,
		Text = if var16.text and var16.text ~= "" then reactModule.createElement(textModule, {
			LayoutOrder = 2,
			Text = var16.text,
			textStyle = var20.text.contentStyle,
			tag = var20.text.tag,
			padding = var20.text.padding,
			testId = `{var16.testId}--text`
		}) else nil,
		Trailing = if var19 then reactModule.createElement(accessoryModule, {
			isLeading = false,
			config = var19,
			size = var16.size,
			chipBackgroundStyle = var20.chip.backgroundStyle,
			contentStyle = var20.text.contentStyle,
			isDisabled = var16.isDisabled,
			testId = `{var16.testId}--trailing-accessory`
		}) else nil
	}))
end))