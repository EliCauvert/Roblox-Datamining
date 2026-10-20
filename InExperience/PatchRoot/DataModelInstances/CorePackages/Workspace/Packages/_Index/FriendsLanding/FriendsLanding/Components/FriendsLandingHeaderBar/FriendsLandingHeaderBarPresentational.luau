local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local HeaderBar = DependenciesModule.UIBlox.App.Bar.HeaderBar
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local GetFFlagFixConnectTabSearchBarHeightFunction = DependenciesModule.GetFFlagFixConnectTabSearchBarHeight
local ReactModule = require(Parent.React)

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), HeaderBar (copy), GetFFlagFixConnectTabSearchBarHeightFunction (copy)
	local Size2400 = UseDesignTokensFunction().Size.Size_2400
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = -1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, Size2400)
	}, {
		headerBar = ReactModule.createElement(HeaderBar, {
			title = p1.title,
			barHeight = Size2400,
			renderLeft = p1.renderLeft,
			renderCenter = p1.renderCenter,
			renderRight = p1.renderRight,
			isSecondary = p1.isSecondary,
			shouldHideSecondaryLeftItem = p1.shouldHideSecondaryLeftItem,
			paddingTop = if GetFFlagFixConnectTabSearchBarHeightFunction() then UDim.new(0, 0) else nil,
			paddingBottom = if GetFFlagFixConnectTabSearchBarHeightFunction() then UDim.new(0, 0) else nil
		})
	})
end