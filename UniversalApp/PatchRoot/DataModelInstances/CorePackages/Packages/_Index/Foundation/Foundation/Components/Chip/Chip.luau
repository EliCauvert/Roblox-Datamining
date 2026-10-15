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
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), iconPositionModule (ref), iconVariant (ref), flagsModule (ref), useChipVariantsModule (ref), colorNamespaceModule (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerModeModule (ref), constantsModule (ref), presentationContextModule (ref), accessoryModule (ref), textModule (ref)
	local var1
	local var2 = withDefaultsModule(p1, t)
	local var3 = useTokensModule()
	local var4, var5 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), iconPositionModule (copy), iconVariant (copy)
		local leading = var2.leading
		local trailing = var2.trailing
		
		if var2.icon ~= nil then
			if typeof(var2.icon) == "string" then
				leading = { iconName = var2.icon }
			else
				local t = { iconName = var2.icon.name }
				
				if var2.icon.position == iconPositionModule.Left then
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
	end, { var2.leading, var2.icon, var2.trailing })
	local var6 = var2.text ~= nil and var2.text ~= ""
	
	if flagsModule.FoundationFixChipAccessoryLayout then
		var1 = not var6
		
		if var1 then
			var1 = var4 == nil ~= (var5 == nil)
			var1 = nil
		end
	else
		var1 = nil
	end
	local var7 = useChipVariantsModule(var3, var2.size, var2.variant, var2.isChecked, var4 ~= nil, var5 ~= nil)
	local floored = math.floor(var3.Stroke.Thicker)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var2, {
		isDisabled = var2.isDisabled,
		selection = {
			Selectable = if var2.isDisabled then false else var2.Selectable,
			NextSelectionUp = var2.NextSelectionUp,
			NextSelectionDown = var2.NextSelectionDown,
			NextSelectionLeft = var2.NextSelectionLeft,
			NextSelectionRight = var2.NextSelectionRight
		},
		onActivated = var2.onActivated,
		stateLayer = if var2.isChecked then { mode = stateLayerModeModule.Inverse } else nil,
		backgroundStyle = var7.chip.backgroundStyle,
		padding = var7.chip.padding,
		cursor = {
			radius = UDim.new(0, var3.Radius.Circle),
			offset = floored * 2,
			borderWidth = floored
		},
		tag = var7.chip.tag,
		ref = p2,
		GroupTransparency = if var2.isDisabled then constantsModule.DISABLED_TRANSPARENCY else 0
	}), reactModule.createElement(presentationContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var2 (ref), colorNamespaceModule (copy)
			return {
				isIconSize = true,
				colorNamespace = if var2.isChecked then colorNamespaceModule.Inverse else colorNamespaceModule.Color
			}
		end, { var2.isChecked })
	}, {
		Leading = if var4 then reactModule.createElement(accessoryModule, {
			isLeading = true,
			config = var4,
			size = var2.size,
			chipBackgroundStyle = var7.chip.backgroundStyle,
			contentStyle = var7.text.contentStyle,
			isDisabled = var2.isDisabled,
			isIconOnly = var1,
			testId = `{var2.testId}--leading-accessory`
		}) else nil,
		Text = if var6 then reactModule.createElement(textModule, {
			LayoutOrder = 2,
			Text = var2.text,
			textStyle = var7.text.contentStyle,
			tag = var7.text.tag,
			padding = var7.text.padding,
			testId = `{var2.testId}--text`
		}) else nil,
		Trailing = if var5 then reactModule.createElement(accessoryModule, {
			isLeading = false,
			config = var5,
			size = var2.size,
			chipBackgroundStyle = var7.chip.backgroundStyle,
			contentStyle = var7.text.contentStyle,
			isDisabled = var2.isDisabled,
			isIconOnly = var1,
			testId = `{var2.testId}--trailing-accessory`
		}) else nil
	}))
end))