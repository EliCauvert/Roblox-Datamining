local parent = script:FindFirstAncestor("CoreScriptsPlayerFeedback").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local builderIconsModule = require(parent.BuilderIcons)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), builderIconsModule (ref), iconSize (ref), text (ref)
	local var1 = useTokens()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		local var2 = false
		task.delay(4, function()
			-- upvalues: var2 (write), p1 (copy)
			if not var2 then
				p1.onDismiss()
			end
		end)
		
		return function()
			-- upvalues: var2 (write)
			var2 = true
		end
	end, { p1.onDismiss })
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium auto-xy bg-system-contrast",
		Position = UDim2.new(0.5, 0, 1, -var1.Padding.XLarge * 4),
		AnchorPoint = Vector2.new(0.5, 1),
		padding = {
			left = UDim.new(0, var1.Padding.Large),
			right = UDim.new(0, var1.Padding.Large),
			top = UDim.new(0, var1.Padding.Medium),
			bottom = UDim.new(0, var1.Padding.Medium)
		},
		cornerRadius = UDim.new(0, var1.Radius.Large)
	}, {
		CheckIcon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = builderIconsModule.Icon.CircleCheck,
			size = iconSize.Medium,
			style = var1.Inverse.Content.Emphasis
		}),
		Label = reactModule.createElement(text, {
			tag = "auto-xy text-title-medium text-align-x-left",
			LayoutOrder = 2,
			Text = p1.text,
			textStyle = var1.Inverse.Content.Emphasis
		})
	})
end)