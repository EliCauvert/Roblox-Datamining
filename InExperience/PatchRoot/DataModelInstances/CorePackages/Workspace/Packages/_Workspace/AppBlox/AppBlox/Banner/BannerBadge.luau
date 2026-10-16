local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local Text = FoundationModule.Text
local WithDefaultsFunction = FoundationModule.Utility.withDefaults
local WithCommonPropsFunction = FoundationModule.Utility.withCommonProps
local IconSize = FoundationModule.Enums.IconSize
local IconPosition = FoundationModule.Enums.IconPosition
local config = { testId = "--badge" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 54 | Named "BannerBadge" ]]
	-- upvalues: WithDefaultsFunction (copy), config (copy), UseTokensFunction (copy), IconSize (copy), ReactModule (copy), IconPosition (copy), Icon (copy), View (copy), WithCommonPropsFunction (copy), Text (copy)
	local WithDefaultsResult = WithDefaultsFunction(p1, config)
	local UseTokensResult = UseTokensFunction()
	local XSmall = IconSize.XSmall
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 61 ]]
		-- upvalues: WithDefaultsResult (copy), IconPosition (upval)
		return if typeof(WithDefaultsResult.icon) == "string" then {
			name = WithDefaultsResult.icon,
			position = IconPosition.Left
		} else WithDefaultsResult.icon
	end, { WithDefaultsResult.icon })
	local v1: boolean = WithDefaultsResult.text ~= nil and #WithDefaultsResult.text > 0
	local config1 = {
		container = {
			tag = "radius-circle row align-y-center align-x-center gap-xsmall",
			stroke = nil,
			backgroundStyle = UseTokensResult.Color.Shift.Shift_300
		},
		text = { tag = "auto-xy text-label-small" },
		content = { style = UseTokensResult.Color.Content.Emphasis }
	}
	
	if not v1 then
		config1.container.tag ..= " size-600"
	else
		config1.container.tag ..= " size-0-600 auto-x padding-x-small"
	end
	return ReactModule.createElement(View, WithCommonPropsFunction(WithDefaultsResult, {
		backgroundStyle = config1.container.backgroundStyle,
		tag = config1.container.tag,
		ref = Ref
	}), {
		Icon = if UseMemoResult == nil then nil else ReactModule.createElement(Icon, {
			name = UseMemoResult.name,
			variant = UseMemoResult.variant,
			size = XSmall,
			style = config1.content.style,
			LayoutOrder = if UseMemoResult.position == IconPosition.Left then 1 else 3,
			testId = `{WithDefaultsResult.testId}--icon`
		}),
		Text = if v1 then ReactModule.createElement(Text, {
			RichText = true,
			LayoutOrder = 2,
			Text = WithDefaultsResult.text,
			textStyle = config1.content.style,
			tag = config1.text.tag,
			testId = `{WithDefaultsResult.testId}--text`
		}) else nil
	})
end))