-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:01 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local iconVariant = require(parent.BuilderIcons).IconVariant
local constantsModule = require(foundation.Constants)
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 71 | named "Chip" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), iconPositionModule (ref), iconVariant (ref), useChipVariantsModule (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerModeModule (ref), constantsModule (ref), presentationContextModule (ref), colorNamespaceModule (ref), accessoryModule (ref), textModule (ref)
	local var15 = withDefaultsModule(p0, t)
	local var16 = useTokensModule()
	local var17, var18 = reactModule.useMemo(function() --[[ line: 75 ]]
		-- upvalues: var15 (ref), iconPositionModule (copy), iconVariant (copy)
		local leading = var15.leading
		local trailing = var15.trailing
		
		if var15.icon ~= nil then
			if typeof(var15.icon) == "string" then
				leading = { iconName = var15.icon }
			else
				local t = { iconName = var15.icon.name }
				
				if var15.icon.position == iconPositionModule.Left then
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
	end, { var15.leading, var15.icon, var15.trailing })
	local var19 = useChipVariantsModule(var16, var15.size, var15.variant, var15.isChecked, var17 ~= nil, var18 ~= nil)
	local floored = math.floor(var16.Stroke.Thicker)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var15, {
		isDisabled = var15.isDisabled,
		selection = {
			Selectable = if var15.isDisabled then false else var15.Selectable,
			NextSelectionUp = var15.NextSelectionUp,
			NextSelectionDown = var15.NextSelectionDown,
			NextSelectionLeft = var15.NextSelectionLeft,
			NextSelectionRight = var15.NextSelectionRight
		},
		onActivated = var15.onActivated,
		stateLayer = if var15.isChecked then { mode = stateLayerModeModule.Inverse } else nil,
		backgroundStyle = var19.chip.backgroundStyle,
		padding = var19.chip.padding,
		cursor = {
			radius = UDim.new(0, var16.Radius.Circle),
			offset = floored * 2,
			borderWidth = floored
		},
		tag = var19.chip.tag,
		ref = p1,
		GroupTransparency = if var15.isDisabled then constantsModule.DISABLED_TRANSPARENCY else 0
	}), reactModule.createElement(presentationContextModule.Provider, {
		value = {
			isIconSize = true,
			colorNamespace = if var15.isChecked then colorNamespaceModule.Inverse else colorNamespaceModule.Color
		}
	}, {
		Leading = if var17 then reactModule.createElement(accessoryModule, {
			isLeading = true,
			config = var17,
			size = var15.size,
			chipBackgroundStyle = var19.chip.backgroundStyle,
			contentStyle = var19.text.contentStyle,
			isDisabled = var15.isDisabled,
			testId = `{var15.testId}--leading-accessory`
		}) else nil,
		Text = if var15.text and var15.text ~= "" then reactModule.createElement(textModule, {
			LayoutOrder = 2,
			Text = var15.text,
			textStyle = var19.text.contentStyle,
			tag = var19.text.tag,
			padding = var19.text.padding,
			testId = `{var15.testId}--text`
		}) else nil,
		Trailing = if var18 then reactModule.createElement(accessoryModule, {
			isLeading = false,
			config = var18,
			size = var15.size,
			chipBackgroundStyle = var19.chip.backgroundStyle,
			contentStyle = var19.text.contentStyle,
			isDisabled = var15.isDisabled,
			testId = `{var15.testId}--trailing-accessory`
		}) else nil
	}))
end))