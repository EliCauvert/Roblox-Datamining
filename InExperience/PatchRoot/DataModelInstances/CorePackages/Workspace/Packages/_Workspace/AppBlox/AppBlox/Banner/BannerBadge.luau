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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 54 | named "BannerBadge" ]]
	-- upvalues: withDefaults (ref), t (ref), useTokens (ref), iconSize (ref), reactModule (ref), iconPosition (ref), icon (ref), view (ref), withCommonProps (ref), text (ref)
	local var3 = withDefaults(p0, t)
	local var4 = useTokens()
	local xSmall = iconSize.XSmall
	local var5 = reactModule.useMemo(function() --[[ line: 61 ]]
		-- upvalues: var3 (ref), iconPosition (copy)
		return if typeof(var3.icon) == "string" then { name = var3.icon, position = iconPosition.Left } else var3.icon
	end, { var3.icon })
	local var6 = var3.text ~= nil and #var3.text > 0
	local t_1 = {
		container = {
			tag = "radius-circle row align-y-center align-x-center gap-xsmall",
			stroke = nil,
			backgroundStyle = var4.Color.Shift.Shift_300
		},
		text = { tag = "auto-xy text-label-small" },
		content = { style = var4.Color.Content.Emphasis }
	}
	
	if var6 then
		t_1.container.tag ..= " size-600"
	else
		t_1.container.tag ..= " size-0-600 auto-x padding-x-small"
	end
	return reactModule.createElement(view, withCommonProps(var3, {
		backgroundStyle = t_1.container.backgroundStyle,
		tag = t_1.container.tag,
		ref = p1
	}), {
		Icon = if var5 ~= nil then reactModule.createElement(icon, {
			name = var5.name,
			variant = var5.variant,
			size = xSmall,
			style = t_1.content.style,
			LayoutOrder = if var5.position == iconPosition.Left then 1 else 3,
			testId = `{var3.testId}--icon`
		}) else nil,
		Text = if var6 then reactModule.createElement(text, {
			RichText = true,
			LayoutOrder = 2,
			Text = var3.text,
			textStyle = t_1.content.style,
			tag = t_1.text.tag,
			testId = `{var3.testId}--text`
		}) else nil
	})
end))