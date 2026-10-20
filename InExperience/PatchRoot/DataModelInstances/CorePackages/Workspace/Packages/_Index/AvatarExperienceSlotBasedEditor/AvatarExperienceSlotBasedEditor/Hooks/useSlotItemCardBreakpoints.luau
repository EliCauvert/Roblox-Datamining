local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagAXMigrateBuilderIcons = require(Parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons

local function _(p1, p2: number, p3): number
	return (math.floor((p1 - (p2 - 1) * p3) / p2))
end

local _ = function(ItemGap, Medium, Portrait)
	-- upvalues: ResponsiveModule (copy)
	return if Medium == ResponsiveModule.BreakpointConfig.Enum.Medium or Portrait == ResponsiveModule.BreakpointConfig.Enum.Portrait then { visibleItemCount = 6, itemGap = ItemGap } else nil
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ResponsiveModule (copy), IconSize (copy), FFlagAXMigrateBuilderIcons (copy)
	local UseTokensResult = UseTokensFunction()
	local UseResponsiveResult = ResponsiveModule.useResponsive()
	local UseOrientationResult = ResponsiveModule.useOrientation()
	local Small = UseTokensResult.Gap.Small
	local Size1600: number = UseTokensResult.Size.Size_1600
	local Size2100: number = UseTokensResult.Size.Size_2100
	local Medium: number = UseTokensResult.Padding.Medium
	local Size1000 = UseTokensResult.Size.Size_1000
	local IsUseOrientationResultMatch = UseOrientationResult == ResponsiveModule.BreakpointConfig.Enum.Portrait
	local NewFontSize = (if IsUseOrientationResultMatch then UseTokensResult.Typography.CaptionSmall else UseTokensResult.Typography.CaptionMedium).FontSize + UseTokensResult.Gap.Small
	local XOffset = if UseOrientationResult == ResponsiveModule.BreakpointConfig.Enum.Portrait then Size1600 else Size2100
	local NewXOffset = XOffset + NewFontSize + Medium * 2
	local NewNewXOffset = NewXOffset + Size1000
	local ClearAllButtonStyles = {
		text = {
			Size = UDim2.fromScale(1, 0),
			fontStyle = UseTokensResult.Typography.CaptionMedium
		}
	}
	local SlotItemCardThumbnailStyles = {
		iconFrameStyles = if IsUseOrientationResultMatch then {
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_500, UseTokensResult.Size.Size_500),
			iconSize = IconSize.XSmall
		} else {
			Size = UDim2.fromOffset(if FFlagAXMigrateBuilderIcons then UseTokensResult.Size.Size_600 else UseTokensResult.Size.Size_800, if FFlagAXMigrateBuilderIcons then UseTokensResult.Size.Size_600 else UseTokensResult.Size.Size_800),
			iconSize = IconSize.Small
		}
	}
	local ScrollingFramePadding = {
		buttonPadding = UseTokensResult.Padding.Medium,
		contentPadding = UDim.new(0, UseTokensResult.Padding.Medium)
	}
	
	if p1 ~= nil then
		local X = p1.X
		local Config = if UseResponsiveResult == ResponsiveModule.BreakpointConfig.Enum.Medium or UseOrientationResult == ResponsiveModule.BreakpointConfig.Enum.Portrait then { visibleItemCount = 6, itemGap = Small } else nil
		
		if Config then
			local VisibleItemCount: number = Config.visibleItemCount
			XOffset = math.min(math.max(math.floor((X - (VisibleItemCount - 1) * Config.itemGap) / VisibleItemCount), Size1600), Size2100)
			
			if Size1600 <= XOffset and XOffset < Size2100 then
				SlotItemCardThumbnailStyles.iconFrameStyles = if IsUseOrientationResultMatch then {
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_500, UseTokensResult.Size.Size_500),
					iconSize = IconSize.XSmall
				} else {
					Size = UDim2.fromOffset(if FFlagAXMigrateBuilderIcons then UseTokensResult.Size.Size_600 else UseTokensResult.Size.Size_800, if FFlagAXMigrateBuilderIcons then UseTokensResult.Size.Size_600 else UseTokensResult.Size.Size_800),
					iconSize = IconSize.Small
				}
				ScrollingFramePadding = {
					buttonPadding = UseTokensResult.Padding.Small,
					contentPadding = UDim.new(0, UseTokensResult.Padding.Small)
				}
				ClearAllButtonStyles.text.Size = UDim2.fromScale(0.8, 0)
				ClearAllButtonStyles.text.fontStyle = UseTokensResult.Typography.CaptionSmall
			end
			NewXOffset = XOffset + NewFontSize + Medium * 2
			NewNewXOffset = NewXOffset + Size1000
		end
	end
	return {
		navHeight = Size1000,
		itemCardSize = UDim2.fromOffset(XOffset, XOffset),
		clearAllButtonStyles = ClearAllButtonStyles,
		navigationFrameHeight = NewNewXOffset,
		slotItemCardThumbnailStyles = SlotItemCardThumbnailStyles,
		scrollingFramePadding = ScrollingFramePadding,
		enableSnapToSelectedSlot = UseOrientationResult == ResponsiveModule.BreakpointConfig.Enum.Landscape,
		slotCardTotalHeight = NewXOffset
	}
end