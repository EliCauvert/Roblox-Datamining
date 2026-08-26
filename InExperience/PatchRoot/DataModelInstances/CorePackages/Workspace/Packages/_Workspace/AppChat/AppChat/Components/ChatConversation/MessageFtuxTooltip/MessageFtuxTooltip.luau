local parent = script:FindFirstAncestor("AppChat").Parent
local text = require(parent.AppCommonLib).Text
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local enums = foundationModule.Enums
local useMessageFtuxTooltipModule = require(script.Parent.useMessageFtuxTooltip)
local t = {
	isReversed = false,
	variant = require(script.Parent.MessageFtuxTooltipVariant).None
}

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), foundationModule (ref), useMessageFtuxTooltipModule (ref), reactModule (ref), text (ref), enums (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = foundationModule.Hooks.useTokens()
	local var3 = useMessageFtuxTooltipModule(var1.variant)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), text (copy), var3 (ref), var5 (ref), var1 (ref), var7 (ref)
		local var8
		local titleSmall = var2.Typography.TitleSmall
		local var9 = text.GetTextWidth(var3.text, titleSmall.Font, titleSmall.FontSize) + var2.Padding.Small * 2
		
		if var1.messageRef.current then
			var8 = var1.messageRef.current.AbsoluteSize.X < var9
			var8 = nil
		else
			var8 = false
		end
		var5(var8)
		var7(true)
	end, { var3.text, var2 })
	local var8, var9 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), var1 (ref), enums (copy), var2 (ref)
		local var10 = if var4 then if var1.isReversed then enums.PopoverAlign.Start else enums.PopoverAlign.End elseif var1.isReversed then enums.PopoverAlign.End else enums.PopoverAlign.Start
		
		if var4 then
			return var10, 0
		elseif var1.isReversed then
			return var10, var2.Padding.Medium
		end
		return var10, -var2.Padding.Medium
	end, { var4, var1.isReversed, var2 })
	
	return if var3.isDismissed then nil else reactModule.createElement(foundationModule.Popover.Root, { isOpen = var6 }, {
		Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { anchorRef = var1.messageRef }),
		Content = reactModule.createElement(foundationModule.Popover.Content, {
			hasArrow = true,
			side = {
				position = foundationModule.Enums.PopoverSide.Bottom,
				offset = -var2.Padding.Small
			},
			align = { position = var8, offset = var9 },
			radius = foundationModule.Enums.Radius.Small,
			backgroundStyle = var2.Color.Content.Emphasis,
			onPressedOutside = var3.handleDismiss
		}, {
			TooltipText = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-small padding-x-small padding-y-xsmall content-inverse-emphasis",
				Text = var3.text
			})
		})
	})
end)