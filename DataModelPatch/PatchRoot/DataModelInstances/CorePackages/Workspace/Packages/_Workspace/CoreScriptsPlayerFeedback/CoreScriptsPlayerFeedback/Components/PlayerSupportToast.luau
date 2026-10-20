local Parent = script:FindFirstAncestor("CoreScriptsPlayerFeedback").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BuilderIconsModule = require(Parent.BuilderIcons)

return (ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), BuilderIconsModule (copy), IconSize (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		local Flag = false
		task.delay(4, function()
			-- upvalues: Flag (ref), p1 (upval)
			if not Flag then
				p1.onDismiss()
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { p1.onDismiss })
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium auto-xy bg-system-contrast",
		Position = UDim2.new(0.5, 0, 1, -UseTokensResult.Padding.XLarge * 4),
		AnchorPoint = Vector2.new(0.5, 1),
		padding = {
			left = UDim.new(0, UseTokensResult.Padding.Large),
			right = UDim.new(0, UseTokensResult.Padding.Large),
			top = UDim.new(0, UseTokensResult.Padding.Medium),
			bottom = UDim.new(0, UseTokensResult.Padding.Medium)
		},
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Large)
	}, {
		CheckIcon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = BuilderIconsModule.Icon.CircleCheck,
			size = IconSize.Medium,
			style = UseTokensResult.Inverse.Content.Emphasis
		}),
		Label = ReactModule.createElement(Text, {
			tag = "auto-xy text-title-medium text-align-x-left",
			LayoutOrder = 2,
			Text = p1.text,
			textStyle = UseTokensResult.Inverse.Content.Emphasis
		})
	})
end))