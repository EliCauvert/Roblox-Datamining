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

return reactModule.memo(function(p0) --[[ line: 25 ]]
	-- upvalues: cryoModule (ref), t (ref), foundationModule (ref), useMessageFtuxTooltipModule (ref), reactModule (ref), text (ref), enums (ref)
	local var5 = cryoModule.Dictionary.union(t, p0)
	local var6 = foundationModule.Hooks.useTokens()
	local var7 = useMessageFtuxTooltipModule(var5.variant)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 32 ]]
		-- upvalues: var6 (ref), text (copy), var7 (ref), var9 (ref), var5 (ref), var11 (ref)
		local var15
		local titleSmall = var6.Typography.TitleSmall
		local var14 = text.GetTextWidth(var7.text, titleSmall.Font, titleSmall.FontSize) + var6.Padding.Small * 2
		
		if var5.messageRef.current then
			var15 = var5.messageRef.current.AbsoluteSize.X < var14
			var15 = nil
		else
			var15 = false
		end
		var9(var15)
		var11(true)
	end, { var7.text, var6 })
	local var12, var13 = reactModule.useMemo(function() --[[ line: 43 ]]
		-- upvalues: var8 (ref), var5 (ref), enums (copy), var6 (ref)
		local var16 = if var8 then if var5.isReversed then enums.PopoverAlign.Start else enums.PopoverAlign.End elseif var5.isReversed then enums.PopoverAlign.End else enums.PopoverAlign.Start
		
		if var8 then
			return var16, 0
		elseif var5.isReversed then
			return var16, var6.Padding.Medium
		end
		return var16, -var6.Padding.Medium
	end, { var8, var5.isReversed, var6 })
	
	return if var7.isDismissed then nil else reactModule.createElement(foundationModule.Popover.Root, { isOpen = var10 }, {
		Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { anchorRef = var5.messageRef }),
		Content = reactModule.createElement(foundationModule.Popover.Content, {
			hasArrow = true,
			side = {
				position = foundationModule.Enums.PopoverSide.Bottom,
				offset = -var6.Padding.Small
			},
			align = { position = var12, offset = var13 },
			radius = foundationModule.Enums.Radius.Small,
			backgroundStyle = var6.Color.Content.Emphasis,
			onPressedOutside = var7.handleDismiss
		}, {
			TooltipText = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-small padding-x-small padding-y-xsmall content-inverse-emphasis",
				Text = var7.text
			})
		})
	})
end)