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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaults (ref), t (ref), useTokens (ref), useCursor (ref), cursorType (ref), reactModule (ref), iconPosition (ref), view (ref), withCommonProps (ref), stateLayerMode (ref), icon (ref), iconSize (ref), text (ref)
	local var3 = withDefaults(p0, t)
	local var4 = useTokens()
	local var5 = useCursor(cursorType.SmallPill)
	local var6 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), iconPosition (copy)
		return if typeof(var3.icon) == "string" then { name = var3.icon, position = iconPosition.Left } else var3.icon
	end, { var3.icon })
	local var7 = if var3.isChecked then var4.Color.ActionSubEmphasis.Foreground else var4.Color.Content.Emphasis
	
	return reactModule.createElement(view, withCommonProps(var3, {
		GroupTransparency = if var3.isDisabled then 0.5 else nil,
		selection = {
			Selectable = not var3.isDisabled,
			SelectionImageObject = var5
		},
		onActivated = var3.onActivated,
		isDisabled = var3.isDisabled,
		stateLayer = { mode = stateLayerMode.Inverse },
		tag = {
			["row gap-xsmall size-0-800 padding-medium auto-x align-y-center align-x-center clip radius-circle"] = true,
			["bg-action-sub-emphasis"] = var3.isChecked,
			["bg-shift-200"] = not var3.isChecked
		},
		ref = p1
	}), {
		Icon = if var6 then reactModule.createElement(icon, {
			name = var6.name,
			size = iconSize.Small,
			style = var7,
			LayoutOrder = if var6.position == iconPosition.Left then 1 else 3
		}) else nil,
		Text = if var3.text and var3.text ~= "" then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-x size-0-full shrink text-caption-large text-truncate-end",
			Text = var3.text,
			textStyle = var7
		}) else nil
	})
end))