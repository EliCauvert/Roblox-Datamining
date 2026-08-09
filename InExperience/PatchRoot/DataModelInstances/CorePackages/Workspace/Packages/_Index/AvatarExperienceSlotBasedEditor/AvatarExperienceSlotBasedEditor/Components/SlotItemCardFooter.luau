local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local responsiveModule = require(parent.Responsive)
local fFlagAXAddTextXAlignmentProp = require(parent.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp
local fFlagAXCustomizeMakeupSupport = require(parent.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport

return function(p0) --[[ line: 19 | named "SlotItemCardFooter" ]]
	-- upvalues: useTokens (ref), responsiveModule (ref), reactModule (ref), text (ref), fFlagAXCustomizeMakeupSupport (ref), fFlagAXAddTextXAlignmentProp (ref)
	local var8
	local var3 = useTokens()
	local var4 = responsiveModule.useOrientation() == responsiveModule.BreakpointConfig.Enum.Portrait
	local createElement = reactModule.createElement
	local var5 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.LayoutOrder
	}
	local t_1 = {
		ItemCardFooterLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, var3.Gap.XSmall)
		})
	}
	
	if p0.title then
		local createElement_1
		var8 = reactModule.createElement
		local var9 = "Frame"
		local t_2 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}
		local t_3 = {
			ItemCardFooterInfoLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, var3.Gap.XXSmall)
			})
		}
		
		if p0.title then
			createElement_1 = reactModule.createElement
			createElement_1 = createElement_1(text, {
				textStyle = var3.Color.Content.Emphasis,
				fontStyle = if var4 then var3.Typography.CaptionSmall elseif fFlagAXCustomizeMakeupSupport then var3.Typography.CaptionMedium else var3.Typography.LabelMedium,
				LayoutOrder = if fFlagAXCustomizeMakeupSupport then 1 else p0.LayoutOrder,
				Text = p0.title,
				TextXAlignment = if fFlagAXAddTextXAlignmentProp and p0.TextXAlignment then p0.TextXAlignment else Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextTruncate = Enum.TextTruncate.SplitWord
			})
		else
			createElement_1 = nil
		end
		t_3.ItemCardFooterInfoTitle = createElement_1
		var8 = var8(var9, t_2, t_3)
	else
		var8 = nil
	end
	t_1.ItemCardFooterInfo = var8
	
	return createElement(var5, t, t_1)
end