local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local parent = friendsLanding.Parent
local useStyle = dependenciesModule.UIBlox.Core.Style.useStyle
local useLocalization = dependenciesModule.Hooks.useLocalization
local tenFootUiGridCarouselHeader = require(parent.TenFootUiSharedComponents).TenFootUiGridCarouselHeader
local reactModule = require(parent.React)

return function(p0) --[[ line: 16 | named "FriendsListHeader" ]]
	-- upvalues: useStyle (ref), useLocalization (ref), reactModule (ref), tenFootUiGridCarouselHeader (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, useStyle().Tokens.Size.Size_1000)
		}),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		GridHeader = reactModule.createElement(tenFootUiGridCarouselHeader, {
			text = `{useLocalization({ friends = "CommonUI.Features.Label.Friends" }).friends} ({tostring(p0.friendCount or 0)})`
		})
	})
end