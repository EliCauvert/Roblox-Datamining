local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local icon = foundationModule.Icon
local view = foundationModule.View
local text = foundationModule.Text
local withDefaults = foundationModule.Utility.withDefaults
local withCommonProps = foundationModule.Utility.withCommonProps
local iconSize = foundationModule.Enums.IconSize
local iconPosition = foundationModule.Enums.IconPosition
local t = { testId = "--badge" }

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaults (ref), t (ref), useTokens (ref), iconSize (ref), reactModule (ref), iconPosition (ref), icon (ref), view (ref), withCommonProps (ref), text (ref)
	local var1 = withDefaults(p1, t)
	local var2 = useTokens()
	local xSmall = iconSize.XSmall
	local var3 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), iconPosition (copy)
		return if typeof(var1.icon) == "string" then { name = var1.icon, position = iconPosition.Left } else var1.icon
	end, { var1.icon })
	local var4 = var1.text ~= nil and #var1.text > 0
	local t_1 = {
		container = {
			tag = "radius-circle row align-y-center align-x-center gap-xsmall",
			stroke = nil,
			backgroundStyle = var2.Color.Shift.Shift_300
		},
		text = { tag = "auto-xy text-label-small" },
		content = { style = var2.Color.Content.Emphasis }
	}
	
	if var4 then
		t_1.container.tag ..= " size-600"
	else
		t_1.container.tag ..= " size-0-600 auto-x padding-x-small"
	end
	return reactModule.createElement(view, withCommonProps(var1, {
		backgroundStyle = t_1.container.backgroundStyle,
		tag = t_1.container.tag,
		ref = p2
	}), {
		Icon = if var3 ~= nil then reactModule.createElement(icon, {
			name = var3.name,
			variant = var3.variant,
			size = xSmall,
			style = t_1.content.style,
			LayoutOrder = if var3.position == iconPosition.Left then 1 else 3,
			testId = `{var1.testId}--icon`
		}) else nil,
		Text = if var4 then reactModule.createElement(text, {
			RichText = true,
			LayoutOrder = 2,
			Text = var1.text,
			textStyle = t_1.content.style,
			tag = t_1.text.tag,
			testId = `{var1.testId}--text`
		}) else nil
	})
end))