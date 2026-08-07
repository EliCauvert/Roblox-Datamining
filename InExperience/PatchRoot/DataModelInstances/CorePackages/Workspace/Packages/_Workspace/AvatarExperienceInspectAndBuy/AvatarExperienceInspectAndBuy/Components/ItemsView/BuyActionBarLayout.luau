local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local divider = foundationModule.Divider
local dividerOrientation = foundationModule.Enums.DividerOrientation
local buyActionBarModule = require(avatarExperienceInspectAndBuy.Components.Common.BuyActionBar)

return function(p0) --[[ line: 34 | named "BuyActionBarLayout" ]]
	-- upvalues: reactModule (ref), divider (ref), dividerOrientation (ref), buyActionBarModule (ref)
	return reactModule.createElement("TextButton", {
		Size = p0.Size,
		Position = p0.Position,
		AnchorPoint = p0.AnchorPoint,
		BackgroundTransparency = 1,
		LayoutOrder = p0.LayoutOrder or 2,
		BorderSizePixel = 0,
		ZIndex = p0.ZIndex,
		Selectable = false,
		Text = "",
		AutoButtonColor = false,
		[reactModule.Event.Activated] = function() --[[ line: 46 ]] end
	}, {
		TopBorder = if p0.enableTopBorder then reactModule.createElement(divider, {
			orientation = dividerOrientation.Horizontal,
			Position = UDim2.new(0, 0, 0, 0)
		}) else nil,
		BuyActionBar = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = p0.padding,
				PaddingBottom = p0.padding,
				PaddingLeft = p0.padding,
				PaddingRight = p0.padding
			}),
			BuyActionBar = reactModule.createElement(buyActionBarModule, p0.buyActionBarProps)
		})
	})
end