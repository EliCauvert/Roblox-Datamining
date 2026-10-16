local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Divider = FoundationModule.Divider
local DividerOrientation = FoundationModule.Enums.DividerOrientation
local BuyActionBarModule = require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)

return function(Frame: Frame) --[[ Line: 34 | Named "BuyActionBarLayout" ]]
	-- upvalues: ReactModule (copy), Divider (copy), DividerOrientation (copy), BuyActionBarModule (copy)
	return ReactModule.createElement("TextButton", {
		Size = Frame.Size,
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint,
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder or 2,
		BorderSizePixel = 0,
		ZIndex = Frame.ZIndex,
		Selectable = false,
		Text = "",
		AutoButtonColor = false,
		[ReactModule.Event.Activated] = function() --[[ Line: 46 ]] end
	}, {
		TopBorder = if Frame.enableTopBorder then ReactModule.createElement(Divider, {
			orientation = DividerOrientation.Horizontal,
			Position = UDim2.new(0, 0, 0, 0)
		}) else nil,
		BuyActionBar = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = Frame.padding,
				PaddingBottom = Frame.padding,
				PaddingLeft = Frame.padding,
				PaddingRight = Frame.padding
			}),
			BuyActionBar = ReactModule.createElement(BuyActionBarModule, Frame.buyActionBarProps)
		})
	})
end