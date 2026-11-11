local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local Parent = FriendsLanding.Parent
local UseStyleFunction = DependenciesModule.UIBlox.Core.Style.useStyle
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local TenFootUiGridCarouselHeader = require(Parent.TenFootUiSharedComponents).TenFootUiGridCarouselHeader
local ReactModule = require(Parent.React)

return function(Frame)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), TenFootUiGridCarouselHeader (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseStyleFunction().Tokens.Size.Size_1000)
		}),
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		GridHeader = ReactModule.createElement(TenFootUiGridCarouselHeader, {
			text = `{UseLocalizationFunction({ friends = "CommonUI.Features.Label.Friends" }).friends} ({tostring(Frame.friendCount or 0)})`
		})
	})
end