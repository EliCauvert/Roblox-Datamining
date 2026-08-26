local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local responsiveModule = require(parent.Responsive)
local fFlagAXAddTextXAlignmentProp = require(parent.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp

return function(p1)
	-- upvalues: useTokens (ref), responsiveModule (ref), reactModule (ref), text (ref), fFlagAXAddTextXAlignmentProp (ref)
	local var1
	local var2 = useTokens()
	local var3 = responsiveModule.useOrientation() == responsiveModule.BreakpointConfig.Enum.Portrait
	local createElement = reactModule.createElement
	local var4 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.LayoutOrder
	}
	local t_1 = {
		ItemCardFooterLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, var2.Gap.XSmall)
		})
	}
	
	if p1.title then
		local createElement_1
		var1 = reactModule.createElement
		local var5 = "Frame"
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
				Padding = UDim.new(0, var2.Gap.XXSmall)
			})
		}
		
		if p1.title then
			createElement_1 = reactModule.createElement
			createElement_1 = createElement_1(text, {
				LayoutOrder = 1,
				textStyle = var2.Color.Content.Emphasis,
				fontStyle = if var3 then var2.Typography.CaptionSmall else var2.Typography.CaptionMedium,
				Text = p1.title,
				TextXAlignment = if fFlagAXAddTextXAlignmentProp and p1.TextXAlignment then p1.TextXAlignment else Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextTruncate = Enum.TextTruncate.SplitWord
			})
		else
			createElement_1 = nil
		end
		t_3.ItemCardFooterInfoTitle = createElement_1
		var1 = var1(var5, t_2, t_3)
	else
		var1 = nil
	end
	t_1.ItemCardFooterInfo = var1
	
	return createElement(var4, t, t_1)
end