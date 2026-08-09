local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMigrateBuilderIcons = avatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local fFlagAXCustomizeMakeupSupport = avatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport

local function _(p0, p1, p2) --[[ line: 24 | named "getItemWidth" ]]
	return math.floor((p0 - (p1 - 1) * p2) / p1)
end

local _ = function(p3, p4, p5) --[[ line: 30 | named "getItemCardWidthParameters" ]]
	-- upvalues: responsiveModule (ref)
	return if p4 == responsiveModule.BreakpointConfig.Enum.Medium or p5 == responsiveModule.BreakpointConfig.Enum.Portrait then { visibleItemCount = 6, itemGap = p3 } else nil
end

return function(p6) --[[ line: 51 ]]
	-- upvalues: useTokens (ref), responsiveModule (ref), fFlagAXCustomizeMakeupSupport (ref), iconSize (ref), fFlagAXMigrateBuilderIcons (ref)
	local var3 = useTokens()
	local var4 = responsiveModule.useResponsive()
	local var5 = responsiveModule.useOrientation()
	local small = var3.Gap.Small
	local size1600 = var3.Size.Size_1600
	local size2100 = var3.Size.Size_2100
	local medium = var3.Padding.Medium
	local size1000 = var3.Size.Size_1000
	local var6 = var5 == responsiveModule.BreakpointConfig.Enum.Portrait
	local var7 = (if fFlagAXCustomizeMakeupSupport and not var6 then var3.Typography.CaptionMedium else var3.Typography.CaptionSmall).FontSize + var3.Gap.Small
	local var8 = if var5 == responsiveModule.BreakpointConfig.Enum.Portrait then size1600 else size2100
	local var9 = var8 + var7 + medium * 2
	local var10 = var9 + size1000
	local t = {
		text = {
			Size = UDim2.fromScale(1, 0),
			fontStyle = var3.Typography.CaptionMedium
		}
	}
	local t_1 = {
		iconFrameStyles = if var6 then {
			Size = UDim2.fromOffset(var3.Size.Size_500, var3.Size.Size_500),
			iconSize = iconSize.XSmall
		} else {
			Size = UDim2.fromOffset(if fFlagAXMigrateBuilderIcons then var3.Size.Size_600 else var3.Size.Size_800, if fFlagAXMigrateBuilderIcons then var3.Size.Size_600 else var3.Size.Size_800),
			iconSize = iconSize.Small
		}
	}
	local t_2 = {
		buttonPadding = var3.Padding.Medium,
		contentPadding = UDim.new(0, var3.Padding.Medium)
	}
	
	if p6 ~= nil then
		local x = p6.X
		local var14 = if var4 == responsiveModule.BreakpointConfig.Enum.Medium or var5 == responsiveModule.BreakpointConfig.Enum.Portrait then { visibleItemCount = 6, itemGap = small } else nil
		
		if var14 then
			local visibleItemCount = var14.visibleItemCount
			var8 = math.min(math.max(math.floor((x - (visibleItemCount - 1) * var14.itemGap) / visibleItemCount), size1600), size2100)
			
			if size1600 <= var8 and var8 < size2100 then
				t_1.iconFrameStyles = if var6 then {
					Size = UDim2.fromOffset(var3.Size.Size_500, var3.Size.Size_500),
					iconSize = iconSize.XSmall
				} else {
					Size = UDim2.fromOffset(if fFlagAXMigrateBuilderIcons then var3.Size.Size_600 else var3.Size.Size_800, if fFlagAXMigrateBuilderIcons then var3.Size.Size_600 else var3.Size.Size_800),
					iconSize = iconSize.Small
				}
				t_2 = {
					buttonPadding = var3.Padding.Small,
					contentPadding = UDim.new(0, var3.Padding.Small)
				}
				t.text.Size = UDim2.fromScale(0.8, 0)
				t.text.fontStyle = var3.Typography.CaptionSmall
			end
			var9 = var8 + var7 + medium * 2
			var10 = var9 + size1000
		end
	end
	return {
		navHeight = size1000,
		itemCardSize = UDim2.fromOffset(var8, var8),
		clearAllButtonStyles = t,
		navigationFrameHeight = var10,
		slotItemCardThumbnailStyles = t_1,
		scrollingFramePadding = t_2,
		enableSnapToSelectedSlot = var5 == responsiveModule.BreakpointConfig.Enum.Landscape,
		slotCardTotalHeight = var9
	}
end