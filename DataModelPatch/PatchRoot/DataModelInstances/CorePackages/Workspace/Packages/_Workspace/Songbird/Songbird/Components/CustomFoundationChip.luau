local Parent = script:FindFirstAncestor("Songbird").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCursorFunction = FoundationModule.Hooks.useCursor
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local Text = FoundationModule.Text
local WithDefaultsFunction = FoundationModule.Utility.withDefaults
local WithCommonPropsFunction = FoundationModule.Utility.withCommonProps
local IconSize = FoundationModule.Enums.IconSize
local IconPosition = FoundationModule.Enums.IconPosition
local StateLayerMode = FoundationModule.Enums.StateLayerMode
local CursorType = FoundationModule.Enums.CursorType
local config = { isDisabled = false, isChecked = false }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsFunction (copy), config (copy), UseTokensFunction (copy), UseCursorFunction (copy), CursorType (copy), ReactModule (copy), IconPosition (copy), View (copy), WithCommonPropsFunction (copy), StateLayerMode (copy), Icon (copy), IconSize (copy), Text (copy)
	local WithDefaultsResult = WithDefaultsFunction(p1, config)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsResult (copy), IconPosition (upval)
		return if typeof(WithDefaultsResult.icon) == "string" then {
			name = WithDefaultsResult.icon,
			position = IconPosition.Left
		} else WithDefaultsResult.icon
	end, { WithDefaultsResult.icon })
	local Foreground = if WithDefaultsResult.isChecked then UseTokensResult.Color.ActionSubEmphasis.Foreground else UseTokensResult.Color.Content.Emphasis
	
	return ReactModule.createElement(View, WithCommonPropsFunction(WithDefaultsResult, {
		GroupTransparency = if WithDefaultsResult.isDisabled then 0.5 else nil,
		selection = {
			Selectable = not WithDefaultsResult.isDisabled,
			SelectionImageObject = UseCursorFunction(CursorType.SmallPill)
		},
		onActivated = WithDefaultsResult.onActivated,
		isDisabled = WithDefaultsResult.isDisabled,
		stateLayer = { mode = StateLayerMode.Inverse },
		tag = {
			["row gap-xsmall size-0-800 padding-medium auto-x align-y-center align-x-center clip radius-circle"] = true,
			["bg-action-sub-emphasis"] = WithDefaultsResult.isChecked,
			["bg-shift-200"] = not WithDefaultsResult.isChecked
		},
		ref = Ref
	}), {
		Icon = if UseMemoResult then ReactModule.createElement(Icon, {
			name = UseMemoResult.name,
			size = IconSize.Small,
			style = Foreground,
			LayoutOrder = if UseMemoResult.position == IconPosition.Left then 1 else 3
		}) else nil,
		Text = if WithDefaultsResult.text and WithDefaultsResult.text ~= "" then ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-x size-0-full shrink text-caption-large text-truncate-end",
			Text = WithDefaultsResult.text,
			textStyle = Foreground
		}) else nil
	})
end))