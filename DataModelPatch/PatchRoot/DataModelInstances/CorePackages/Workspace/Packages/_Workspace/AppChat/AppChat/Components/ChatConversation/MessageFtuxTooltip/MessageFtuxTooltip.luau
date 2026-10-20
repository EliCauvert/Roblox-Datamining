local Parent = script:FindFirstAncestor("AppChat").Parent
local Text = require(Parent.AppCommonLib).Text
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local Enums = FoundationModule.Enums
local UseMessageFtuxTooltipModule = require(script.Parent.useMessageFtuxTooltip)
local config = {
	isReversed = false,
	variant = require(script.Parent.MessageFtuxTooltipVariant).None
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), FoundationModule (copy), UseMessageFtuxTooltipModule (copy), ReactModule (copy), Text (copy), Enums (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMessageFtuxTooltipModuleResult = UseMessageFtuxTooltipModule(UnionResult.variant)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseTokensResult (copy), Text (upval), UseMessageFtuxTooltipModuleResult (copy), UseStateResult2 (copy), UnionResult (copy), UseStateResult2_1 (copy)
		local TitleSmall = UseTokensResult.Typography.TitleSmall
		local NewTextWidth = Text.GetTextWidth(UseMessageFtuxTooltipModuleResult.text, TitleSmall.Font, TitleSmall.FontSize) + UseTokensResult.Padding.Small * 2
		UseStateResult2(if UnionResult.messageRef.current then UnionResult.messageRef.current.AbsoluteSize.X < NewTextWidth else false)
		UseStateResult2_1(true)
	end, { UseMessageFtuxTooltipModuleResult.text, UseTokensResult })
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), UnionResult (copy), Enums (upval), UseTokensResult (copy)
		local Start = if UseStateResult then if UnionResult.isReversed then Enums.PopoverAlign.Start else Enums.PopoverAlign.End elseif UnionResult.isReversed then Enums.PopoverAlign.End else Enums.PopoverAlign.Start
		
		if UseStateResult then
			return Start, 0
		elseif UnionResult.isReversed then
			return Start, UseTokensResult.Padding.Medium
		else
			return Start, -UseTokensResult.Padding.Medium
		end
	end, { UseStateResult, UnionResult.isReversed, UseTokensResult })
	
	return if UseMessageFtuxTooltipModuleResult.isDismissed then nil else ReactModule.createElement(FoundationModule.Popover.Root, { isOpen = UseStateResult1 }, {
		Anchor = ReactModule.createElement(FoundationModule.Popover.Anchor, { anchorRef = UnionResult.messageRef }),
		Content = ReactModule.createElement(FoundationModule.Popover.Content, {
			hasArrow = true,
			side = {
				position = FoundationModule.Enums.PopoverSide.Bottom,
				offset = -UseTokensResult.Padding.Small
			},
			align = { position = UseMemoResult, offset = UseMemoResult2 },
			radius = FoundationModule.Enums.Radius.Small,
			backgroundStyle = UseTokensResult.Color.Content.Emphasis,
			onPressedOutside = UseMessageFtuxTooltipModuleResult.handleDismiss
		}, {
			TooltipText = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-title-small padding-x-small padding-y-xsmall content-inverse-emphasis",
				Text = UseMessageFtuxTooltipModuleResult.text
			})
		})
	})
end)