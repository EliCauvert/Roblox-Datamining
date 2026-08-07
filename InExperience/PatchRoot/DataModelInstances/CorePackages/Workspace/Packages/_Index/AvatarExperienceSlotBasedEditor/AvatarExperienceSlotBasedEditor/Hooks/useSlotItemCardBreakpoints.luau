local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local fFlagAXMigrateBuilderIcons = require(parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons

local function _(p0, p1, p2) --[[ line: 23 | named "getItemWidth" ]]
	return math.floor((p0 - (p1 - 1) * p2) / p1)
end

local _ = function(p3, p4, p5) --[[ line: 29 | named "getItemCardWidthParameters" ]]
	-- upvalues: responsiveModule (ref)
	return if p4 == responsiveModule.BreakpointConfig.Enum.Medium or p5 == responsiveModule.BreakpointConfig.Enum.Portrait then { visibleItemCount = 6, itemGap = p3 } else nil
end

return function(p6) --[[ line: 50 ]]
	-- upvalues: useTokens (ref), responsiveModule (ref), iconSize (ref), fFlagAXMigrateBuilderIcons (ref)
	local var2 = useTokens()
	local var3 = responsiveModule.useResponsive()
	local var4 = responsiveModule.useOrientation()
	local small = var2.Gap.Small
	local size1600 = var2.Size.Size_1600
	local size2100 = var2.Size.Size_2100
	local medium = var2.Padding.Medium
	local size1000 = var2.Size.Size_1000
	local var5 = var4 == responsiveModule.BreakpointConfig.Enum.Portrait
	local var6 = (if var5 then var2.Typography.CaptionSmall else var2.Typography.CaptionMedium).FontSize + var2.Gap.Small
	local var7 = if var4 == responsiveModule.BreakpointConfig.Enum.Portrait then size1600 else size2100
	local var8 = var7 + var6 + medium * 2
	local var9 = var8 + size1000
	local t = {
		text = {
			Size = UDim2.fromScale(1, 0),
			fontStyle = var2.Typography.CaptionMedium
		}
	}
	local t_1 = {
		iconFrameStyles = if var5 then {
			Size = UDim2.fromOffset(var2.Size.Size_500, var2.Size.Size_500),
			iconSize = iconSize.XSmall
		} else {
			Size = UDim2.fromOffset(if fFlagAXMigrateBuilderIcons then var2.Size.Size_600 else var2.Size.Size_800, if fFlagAXMigrateBuilderIcons then var2.Size.Size_600 else var2.Size.Size_800),
			iconSize = iconSize.Small
		}
	}
	local t_2 = {
		buttonPadding = var2.Padding.Medium,
		contentPadding = UDim.new(0, var2.Padding.Medium)
	}
	
	if p6 ~= nil then
		local x = p6.X
		local var13 = if var3 == responsiveModule.BreakpointConfig.Enum.Medium or var4 == responsiveModule.BreakpointConfig.Enum.Portrait then { visibleItemCount = 6, itemGap = small } else nil
		
		if var13 then
			local visibleItemCount = var13.visibleItemCount
			var7 = math.min(math.max(math.floor((x - (visibleItemCount - 1) * var13.itemGap) / visibleItemCount), size1600), size2100)
			
			if size1600 <= var7 and var7 < size2100 then
				t_1.iconFrameStyles = if var5 then {
					Size = UDim2.fromOffset(var2.Size.Size_500, var2.Size.Size_500),
					iconSize = iconSize.XSmall
				} else {
					Size = UDim2.fromOffset(if fFlagAXMigrateBuilderIcons then var2.Size.Size_600 else var2.Size.Size_800, if fFlagAXMigrateBuilderIcons then var2.Size.Size_600 else var2.Size.Size_800),
					iconSize = iconSize.Small
				}
				t_2 = {
					buttonPadding = var2.Padding.Small,
					contentPadding = UDim.new(0, var2.Padding.Small)
				}
				t.text.Size = UDim2.fromScale(0.8, 0)
				t.text.fontStyle = var2.Typography.CaptionSmall
			end
			var8 = var7 + var6 + medium * 2
			var9 = var8 + size1000
		end
	end
	return {
		navHeight = size1000,
		itemCardSize = UDim2.fromOffset(var7, var7),
		clearAllButtonStyles = t,
		navigationFrameHeight = var9,
		slotItemCardThumbnailStyles = t_1,
		scrollingFramePadding = t_2,
		enableSnapToSelectedSlot = var4 == responsiveModule.BreakpointConfig.Enum.Landscape,
		slotCardTotalHeight = var8
	}
end