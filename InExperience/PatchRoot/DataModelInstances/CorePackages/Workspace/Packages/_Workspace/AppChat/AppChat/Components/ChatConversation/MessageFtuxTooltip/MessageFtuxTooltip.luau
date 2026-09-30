local parent = script:FindFirstAncestor("AppChat").Parent
local text = require(parent.AppCommonLib).Text
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local getTextSize = require(parent.Style).GetTextSize
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local enums = foundationModule.Enums
local useMessageFtuxTooltipModule = require(script.Parent.useMessageFtuxTooltip)
local messageFtuxTooltipVariantModule = require(script.Parent.MessageFtuxTooltipVariant)
local t = {
	isReversed = false,
	variant = messageFtuxTooltipVariantModule.None
}

local var1 = function(p1)
	-- upvalues: cryoModule (ref), t (ref), foundationModule (ref), useMessageFtuxTooltipModule (ref), reactModule (ref), foundationFontFaceMigration (ref), getTextSize (ref), text (ref), enums (ref)
	local var2 = cryoModule.Dictionary.union(t, p1)
	local var3 = foundationModule.Hooks.useTokens()
	local var4 = useMessageFtuxTooltipModule(var2.variant)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), foundationFontFaceMigration (copy), getTextSize (copy), var4 (ref), text (copy), var6 (ref), var2 (ref), var8 (ref)
		local var9
		local titleSmall = var3.Typography.TitleSmall
		local var10 = if foundationFontFaceMigration then getTextSize(var4.text, titleSmall.FontSize, titleSmall.Font, Vector2.new(10000, 10000)).X + var3.Padding.Small * 2 else text.GetTextWidth(var4.text, titleSmall.Font, titleSmall.FontSize) + var3.Padding.Small * 2
		
		if var2.messageRef.current then
			var9 = var2.messageRef.current.AbsoluteSize.X < var10
			var9 = nil
		else
			var9 = false
		end
		var6(var9)
		var8(true)
	end, { var4.text, var3, var2.messageRef })
	local var9, var10 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), var2 (ref), enums (copy), var3 (ref)
		local var11 = if var5 then if var2.isReversed then enums.PopoverAlign.Start else enums.PopoverAlign.End elseif var2.isReversed then enums.PopoverAlign.End else enums.PopoverAlign.Start
		
		if var5 then
			return var11, 0
		elseif var2.isReversed then
			return var11, var3.Padding.Medium
		end
		return var11, -var3.Padding.Medium
	end, { var5, var2.isReversed, var3 })
	
	return if var4.isDismissed then nil else reactModule.createElement(foundationModule.Popover.Root, { isOpen = var7 }, {
		Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { anchorRef = var2.messageRef }),
		Content = reactModule.createElement(foundationModule.Popover.Content, {
			hasArrow = true,
			side = {
				position = foundationModule.Enums.PopoverSide.Bottom,
				offset = -var3.Padding.Small
			},
			align = { position = var9, offset = var10 },
			radius = foundationModule.Enums.Radius.Small,
			backgroundStyle = var3.Color.Content.Emphasis,
			onPressedOutside = var4.handleDismiss
		}, {
			TooltipText = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy padding-x-small padding-y-xsmall text-title-small content-inverse-emphasis",
				Text = var4.text
			})
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: t (ref), messageFtuxTooltipVariantModule (ref), reactModule (ref), var1 (ref)
	return if (p1.variant or t.variant) == messageFtuxTooltipVariantModule.None then nil else reactModule.createElement(var1, p1)
end)