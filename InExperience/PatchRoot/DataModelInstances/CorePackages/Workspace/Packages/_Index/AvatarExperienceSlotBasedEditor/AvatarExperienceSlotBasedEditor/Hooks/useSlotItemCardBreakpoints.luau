local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local fFlagAXMigrateBuilderIcons = require(parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons

local function _(p1, p2, p3)
	return math.floor((p1 - (p2 - 1) * p3) / p2)
end

local _ = function(p1, p2, p3)
	-- upvalues: responsiveModule (ref)
	return if p2 == responsiveModule.BreakpointConfig.Enum.Medium or p3 == responsiveModule.BreakpointConfig.Enum.Portrait then { visibleItemCount = 6, itemGap = p1 } else nil
end

return function(p1)
	-- upvalues: useTokens (ref), responsiveModule (ref), iconSize (ref), fFlagAXMigrateBuilderIcons (ref)
	local var1 = useTokens()
	local var2 = responsiveModule.useResponsive()
	local var3 = responsiveModule.useOrientation()
	local small = var1.Gap.Small
	local size1600 = var1.Size.Size_1600
	local size2100 = var1.Size.Size_2100
	local medium = var1.Padding.Medium
	local size1000 = var1.Size.Size_1000
	local var4 = var3 == responsiveModule.BreakpointConfig.Enum.Portrait
	local var5 = (if var4 then var1.Typography.CaptionSmall else var1.Typography.CaptionMedium).FontSize + var1.Gap.Small
	local var6 = if var3 == responsiveModule.BreakpointConfig.Enum.Portrait then size1600 else size2100
	local var7 = var6 + var5 + medium * 2
	local var8 = var7 + size1000
	local t = {
		text = {
			Size = UDim2.fromScale(1, 0),
			fontStyle = var1.Typography.CaptionMedium
		}
	}
	local t_1 = {
		iconFrameStyles = if var4 then {
			Size = UDim2.fromOffset(var1.Size.Size_500, var1.Size.Size_500),
			iconSize = iconSize.XSmall
		} else {
			Size = UDim2.fromOffset(if fFlagAXMigrateBuilderIcons then var1.Size.Size_600 else var1.Size.Size_800, if fFlagAXMigrateBuilderIcons then var1.Size.Size_600 else var1.Size.Size_800),
			iconSize = iconSize.Small
		}
	}
	local t_2 = {
		buttonPadding = var1.Padding.Medium,
		contentPadding = UDim.new(0, var1.Padding.Medium)
	}
	
	if p1 ~= nil then
		local x = p1.X
		local var9 = if var2 == responsiveModule.BreakpointConfig.Enum.Medium or var3 == responsiveModule.BreakpointConfig.Enum.Portrait then { visibleItemCount = 6, itemGap = small } else nil
		
		if var9 then
			local visibleItemCount = var9.visibleItemCount
			var6 = math.min(math.max(math.floor((x - (visibleItemCount - 1) * var9.itemGap) / visibleItemCount), size1600), size2100)
			
			if size1600 <= var6 and var6 < size2100 then
				t_1.iconFrameStyles = if var4 then {
					Size = UDim2.fromOffset(var1.Size.Size_500, var1.Size.Size_500),
					iconSize = iconSize.XSmall
				} else {
					Size = UDim2.fromOffset(if fFlagAXMigrateBuilderIcons then var1.Size.Size_600 else var1.Size.Size_800, if fFlagAXMigrateBuilderIcons then var1.Size.Size_600 else var1.Size.Size_800),
					iconSize = iconSize.Small
				}
				t_2 = {
					buttonPadding = var1.Padding.Small,
					contentPadding = UDim.new(0, var1.Padding.Small)
				}
				t.text.Size = UDim2.fromScale(0.8, 0)
				t.text.fontStyle = var1.Typography.CaptionSmall
			end
			var7 = var6 + var5 + medium * 2
			var8 = var7 + size1000
		end
	end
	return {
		navHeight = size1000,
		itemCardSize = UDim2.fromOffset(var6, var6),
		clearAllButtonStyles = t,
		navigationFrameHeight = var8,
		slotItemCardThumbnailStyles = t_1,
		scrollingFramePadding = t_2,
		enableSnapToSelectedSlot = var3 == responsiveModule.BreakpointConfig.Enum.Landscape,
		slotCardTotalHeight = var7
	}
end