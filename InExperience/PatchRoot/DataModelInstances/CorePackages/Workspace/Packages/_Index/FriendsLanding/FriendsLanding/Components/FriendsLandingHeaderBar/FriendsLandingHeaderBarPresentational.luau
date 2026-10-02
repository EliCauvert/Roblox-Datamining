local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local headerBar = dependenciesModule.UIBlox.App.Bar.HeaderBar
local useDesignTokens = require(parent.Style).useDesignTokens
local getFFlagFixConnectTabSearchBarHeight = dependenciesModule.GetFFlagFixConnectTabSearchBarHeight
local reactModule = require(parent.React)

return function(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), headerBar (ref), getFFlagFixConnectTabSearchBarHeight (ref)
	local size2400 = useDesignTokens().Size.Size_2400
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = -1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, size2400)
	}, {
		headerBar = reactModule.createElement(headerBar, {
			title = p1.title,
			barHeight = size2400,
			renderLeft = p1.renderLeft,
			renderCenter = p1.renderCenter,
			renderRight = p1.renderRight,
			isSecondary = p1.isSecondary,
			shouldHideSecondaryLeftItem = p1.shouldHideSecondaryLeftItem,
			paddingTop = if getFFlagFixConnectTabSearchBarHeight() then UDim.new(0, 0) else nil,
			paddingBottom = if getFFlagFixConnectTabSearchBarHeight() then UDim.new(0, 0) else nil
		})
	})
end