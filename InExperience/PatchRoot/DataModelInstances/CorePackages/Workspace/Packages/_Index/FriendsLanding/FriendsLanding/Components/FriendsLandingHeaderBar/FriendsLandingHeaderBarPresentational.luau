local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local headerBar = dependenciesModule.UIBlox.App.Bar.HeaderBar
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local uiMode = require(parent.RobloxAppEnums).UiMode
local useDesignTokens = require(parent.Style).useDesignTokens
local constantsModule = require(friendsLanding.Common.Constants)
local getFFlagFixConnectTabSearchBarHeight = dependenciesModule.GetFFlagFixConnectTabSearchBarHeight
local fFlagEnableLeftNavOnConsole = require(parent.SharedFlags).FFlagEnableLeftNavOnConsole
local reactModule = require(parent.React)

return function(p1)
	-- upvalues: useUiModeInfo (ref), uiMode (ref), fFlagEnableLeftNavOnConsole (ref), constantsModule (ref), useDesignTokens (ref), reactModule (ref), headerBar (ref), getFFlagFixConnectTabSearchBarHeight (ref)
	if useUiModeInfo().uiMode == uiMode.TenFoot and not fFlagEnableLeftNavOnConsole then
		return nil
	end
	local var1 = if fFlagEnableLeftNavOnConsole then useDesignTokens().Size.Size_2400 else constantsModule.TOP_BAR_HEIGHT
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = -1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, var1)
	}, {
		headerBar = reactModule.createElement(headerBar, {
			title = p1.title,
			barHeight = var1,
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