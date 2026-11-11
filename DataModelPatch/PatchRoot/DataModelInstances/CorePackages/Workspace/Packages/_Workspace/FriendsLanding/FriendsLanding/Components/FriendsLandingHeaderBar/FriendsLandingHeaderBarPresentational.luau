local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local HeaderBar = DependenciesModule.UIBlox.App.Bar.HeaderBar
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent.RobloxAppEnums).UiMode
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local ConstantsModule = require(FriendsLanding.Common.Constants)
local GetFFlagFixConnectTabSearchBarHeightFunction = DependenciesModule.GetFFlagFixConnectTabSearchBarHeight
local FFlagEnableLeftNavOnConsole = require(Parent.SharedFlags).FFlagEnableLeftNavOnConsole
local ReactModule = require(Parent.React)

return function(p1)
	-- upvalues: UseUiModeInfoFunction (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), ConstantsModule (copy), UseDesignTokensFunction (copy), ReactModule (copy), HeaderBar (copy), GetFFlagFixConnectTabSearchBarHeightFunction (copy)
	if UseUiModeInfoFunction().uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole then
		return nil
	else
		local Size2400 = if FFlagEnableLeftNavOnConsole then UseDesignTokensFunction().Size.Size_2400 else ConstantsModule.TOP_BAR_HEIGHT
		
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
end