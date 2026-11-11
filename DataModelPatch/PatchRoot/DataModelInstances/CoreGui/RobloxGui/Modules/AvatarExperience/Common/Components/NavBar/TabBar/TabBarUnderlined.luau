local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local TabBarMainNavigationModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.NavBar.TabBar.TabBarMainNavigation)

return function(Gui)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), Focusable (copy), FFlagRenameDeprecatedUIBloxTokens (copy), TabBarMainNavigationModule (copy)
	local UseStyleResult = UseStyleFunction()
	local LayoutOrderMain = Gui.layoutOrderMain
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = LayoutOrderMain
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_300 else UseStyleResult.Tokens.Global.Space_150)
		}),
		TabBarUnderlinedMainNavigation = ReactModule.createElement(TabBarMainNavigationModule, {
			zIndex = 1,
			layoutOrder = LayoutOrderMain,
			navHeight = Gui.navHeightMain,
			tabs = Gui.tabs,
			selectedTabIndex = Gui.selectedTabIndex,
			selectTab = Gui.selectTab,
			mainNavigationRef = ReactModule.useRef(nil),
			NextSelectionDown = Gui.NextSelectionDown,
			NextSelectionUp = Gui.NextSelectionUp
		})
	})
end