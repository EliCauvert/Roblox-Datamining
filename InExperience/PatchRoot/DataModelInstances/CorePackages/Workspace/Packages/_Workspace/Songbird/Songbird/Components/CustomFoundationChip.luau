local parent = script:FindFirstAncestor("Songbird").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useCursor = foundationModule.Hooks.useCursor
local icon = foundationModule.Icon
local view = foundationModule.View
local text = foundationModule.Text
local withDefaults = foundationModule.Utility.withDefaults
local withCommonProps = foundationModule.Utility.withCommonProps
local iconSize = foundationModule.Enums.IconSize
local iconPosition = foundationModule.Enums.IconPosition
local stateLayerMode = foundationModule.Enums.StateLayerMode
local cursorType = foundationModule.Enums.CursorType
local t = { isDisabled = false, isChecked = false }

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaults (ref), t (ref), useTokens (ref), useCursor (ref), cursorType (ref), reactModule (ref), iconPosition (ref), view (ref), withCommonProps (ref), stateLayerMode (ref), icon (ref), iconSize (ref), text (ref)
	local var1 = withDefaults(p1, t)
	local var2 = useTokens()
	local var3 = useCursor(cursorType.SmallPill)
	local var4 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), iconPosition (copy)
		return if typeof(var1.icon) == "string" then { name = var1.icon, position = iconPosition.Left } else var1.icon
	end, { var1.icon })
	local var5 = if var1.isChecked then var2.Color.ActionSubEmphasis.Foreground else var2.Color.Content.Emphasis
	
	return reactModule.createElement(view, withCommonProps(var1, {
		GroupTransparency = if var1.isDisabled then 0.5 else nil,
		selection = {
			Selectable = not var1.isDisabled,
			SelectionImageObject = var3
		},
		onActivated = var1.onActivated,
		isDisabled = var1.isDisabled,
		stateLayer = { mode = stateLayerMode.Inverse },
		tag = {
			["row gap-xsmall size-0-800 padding-medium auto-x align-y-center align-x-center clip radius-circle"] = true,
			["bg-action-sub-emphasis"] = var1.isChecked,
			["bg-shift-200"] = not var1.isChecked
		},
		ref = p2
	}), {
		Icon = if var4 then reactModule.createElement(icon, {
			name = var4.name,
			size = iconSize.Small,
			style = var5,
			LayoutOrder = if var4.position == iconPosition.Left then 1 else 3
		}) else nil,
		Text = if var1.text and var1.text ~= "" then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-x size-0-full shrink text-caption-large text-truncate-end",
			Text = var1.text,
			textStyle = var5
		}) else nil
	})
end))