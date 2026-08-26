local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local divider = foundationModule.Divider
local dividerOrientation = foundationModule.Enums.DividerOrientation
local buyActionBarModule = require(avatarExperienceInspectAndBuy.Components.Common.BuyActionBar)

return function(p1)
	-- upvalues: reactModule (ref), divider (ref), dividerOrientation (ref), buyActionBarModule (ref)
	return reactModule.createElement("TextButton", {
		Size = p1.Size,
		Position = p1.Position,
		AnchorPoint = p1.AnchorPoint,
		BackgroundTransparency = 1,
		LayoutOrder = p1.LayoutOrder or 2,
		BorderSizePixel = 0,
		ZIndex = p1.ZIndex,
		Selectable = false,
		Text = "",
		AutoButtonColor = false,
		[reactModule.Event.Activated] = function() end
	}, {
		TopBorder = if p1.enableTopBorder then reactModule.createElement(divider, {
			orientation = dividerOrientation.Horizontal,
			Position = UDim2.new(0, 0, 0, 0)
		}) else nil,
		BuyActionBar = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = p1.padding,
				PaddingBottom = p1.padding,
				PaddingLeft = p1.padding,
				PaddingRight = p1.padding
			}),
			BuyActionBar = reactModule.createElement(buyActionBarModule, p1.buyActionBarProps)
		})
	})
end