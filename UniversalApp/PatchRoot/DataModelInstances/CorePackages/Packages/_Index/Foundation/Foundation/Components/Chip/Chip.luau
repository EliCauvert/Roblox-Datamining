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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), iconPositionModule (ref), iconVariant (ref), useChipVariantsModule (ref), flagsModule (ref), colorNamespaceModule (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerModeModule (ref), constantsModule (ref), presentationContextModule (ref), accessoryModule (ref), textModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3, var4 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), iconPositionModule (copy), iconVariant (copy)
		local leading = var1.leading
		local trailing = var1.trailing
		
		if var1.icon ~= nil then
			if typeof(var1.icon) == "string" then
				leading = { iconName = var1.icon }
			else
				local t = { iconName = var1.icon.name }
				
				if var1.icon.position == iconPositionModule.Left then
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
	end, { var1.leading, var1.icon, var1.trailing })
	local var5 = useChipVariantsModule(var2, var1.size, var1.variant, var1.isChecked, var3 ~= nil, var4 ~= nil)
	local floored = math.floor(var2.Stroke.Thicker)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		isDisabled = var1.isDisabled,
		selection = {
			Selectable = if var1.isDisabled then false else var1.Selectable,
			NextSelectionUp = var1.NextSelectionUp,
			NextSelectionDown = var1.NextSelectionDown,
			NextSelectionLeft = var1.NextSelectionLeft,
			NextSelectionRight = var1.NextSelectionRight
		},
		onActivated = var1.onActivated,
		stateLayer = if var1.isChecked then { mode = stateLayerModeModule.Inverse } else nil,
		backgroundStyle = var5.chip.backgroundStyle,
		padding = var5.chip.padding,
		cursor = {
			radius = UDim.new(0, var2.Radius.Circle),
			offset = floored * 2,
			borderWidth = floored
		},
		tag = var5.chip.tag,
		ref = p2,
		GroupTransparency = if var1.isDisabled then constantsModule.DISABLED_TRANSPARENCY else 0
	}), reactModule.createElement(presentationContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: var1 (ref), colorNamespaceModule (copy)
			return {
				isIconSize = true,
				colorNamespace = if var1.isChecked then colorNamespaceModule.Inverse else colorNamespaceModule.Color
			}
		end, { var1.isChecked }) else nil else {
			isIconSize = true,
			colorNamespace = if var1.isChecked then colorNamespaceModule.Inverse else colorNamespaceModule.Color
		}
	}, {
		Leading = if var3 then reactModule.createElement(accessoryModule, {
			isLeading = true,
			config = var3,
			size = var1.size,
			chipBackgroundStyle = var5.chip.backgroundStyle,
			contentStyle = var5.text.contentStyle,
			isDisabled = var1.isDisabled,
			testId = `{var1.testId}--leading-accessory`
		}) else nil,
		Text = if var1.text and var1.text ~= "" then reactModule.createElement(textModule, {
			LayoutOrder = 2,
			Text = var1.text,
			textStyle = var5.text.contentStyle,
			tag = var5.text.tag,
			padding = var5.text.padding,
			testId = `{var1.testId}--text`
		}) else nil,
		Trailing = if var4 then reactModule.createElement(accessoryModule, {
			isLeading = false,
			config = var4,
			size = var1.size,
			chipBackgroundStyle = var5.chip.backgroundStyle,
			contentStyle = var5.text.contentStyle,
			isDisabled = var1.isDisabled,
			testId = `{var1.testId}--trailing-accessory`
		}) else nil
	}))
end))