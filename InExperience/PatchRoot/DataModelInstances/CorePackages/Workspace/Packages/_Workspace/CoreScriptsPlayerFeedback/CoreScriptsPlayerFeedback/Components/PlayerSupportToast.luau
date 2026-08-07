local parent = script:FindFirstAncestor("CoreScriptsPlayerFeedback").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local builderIconsModule = require(parent.BuilderIcons)

return reactModule.memo(function(p0) --[[ line: 29 ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), builderIconsModule (ref), iconSize (ref), text (ref)
	local var3 = useTokens()
	reactModule.useEffect(function() --[[ line: 32 ]]
		-- upvalues: p0 (ref)
		local var4 = false
		task.delay(4, function() --[[ line: 34 ]]
			-- upvalues: var4 (write), p0 (copy)
			if not var4 then
				p0.onDismiss()
			end
		end)
		
		return function() --[[ line: 39 ]]
			-- upvalues: var4 (write)
			var4 = true
		end
	end, { p0.onDismiss })
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium auto-xy bg-system-contrast",
		Position = UDim2.new(0.5, 0, 1, -var3.Padding.XLarge * 4),
		AnchorPoint = Vector2.new(0.5, 1),
		padding = {
			left = UDim.new(0, var3.Padding.Large),
			right = UDim.new(0, var3.Padding.Large),
			top = UDim.new(0, var3.Padding.Medium),
			bottom = UDim.new(0, var3.Padding.Medium)
		},
		cornerRadius = UDim.new(0, var3.Radius.Large)
	}, {
		CheckIcon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = builderIconsModule.Icon.CircleCheck,
			size = iconSize.Medium,
			style = var3.Inverse.Content.Emphasis
		}),
		Label = reactModule.createElement(text, {
			tag = "auto-xy text-title-medium text-align-x-left",
			LayoutOrder = 2,
			Text = p0.text,
			textStyle = var3.Inverse.Content.Emphasis
		})
	})
end)