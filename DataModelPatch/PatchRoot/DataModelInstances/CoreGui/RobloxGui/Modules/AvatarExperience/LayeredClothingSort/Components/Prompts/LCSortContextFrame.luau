local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarRefinement.Constants)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local v1: number = if IsVRAppBuildFunction() then 120 else 0
local LCSortContextFrame = RoactModule.PureComponent:extend("LCSortContextFrame")
LCSortContextFrame.validateProps = TModule.strictInterface({
	navigation = TModule.table,
	asset = TModule.table,
	onUnequip = TModule.optional(TModule.callback),
	tilePositionY = TModule.number,
	avatarRoute = TModule.table,
	screenSize = TModule.Vector2,
	isPortrait = TModule.boolean,
	globalGuiInset = TModule.table,
	focusController = TModule.optional(TModule.table),
	defaultChildRef = TModule.optional(TModule.table)
})

function LCSortContextFrame.init(p1)
	-- upvalues: RoactModule (copy), NavigationUtilsModule (copy), AvatarScreen (copy)
	p1.contextMenuSize, p1.updateContextMenuSize = RoactModule.createBinding(UDim2.fromScale(1, 1))
	
	function p1.openUnequipPrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy), AvatarScreen (upval)
		NavigationUtilsModule.navigateToNextOverlay(p1.props.navigation, AvatarScreen.RemoveItemPrompt, { asset = p1.props.asset, onUnequip = p1.props.onUnequip })
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function LCSortContextFrame.renderLocalized(p1, p2)
	-- upvalues: ConstantsModule (copy), IsVRAppBuildFunction (copy), ConstantsModule1 (copy), v1 (copy), RoactModule (copy), ContextualMenu (copy), MenuDirection (copy)
	local ClosePrompt = p1.closePrompt
	local ScreenSize = p1.props.screenSize
	local ButtonProps = {}
	table.insert(ButtonProps, {
		icon = nil,
		text = p2.unequip,
		onActivated = function()
			-- upvalues: p1 (copy)
			p1.openUnequipPrompt()
		end
	})
	local IsPortrait = p1.props.isPortrait
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(if IsPortrait then 0 else ConstantsModule.LandscapeNavWidth, if IsVRAppBuildFunction() then ConstantsModule1.VerticalList.Width + ConstantsModule1.Tile.ContextWidth else 0, 0, 0),
		Size = UDim2.fromScale(if IsPortrait then 1 else ConstantsModule.LandscapeSceneWidth, 1)
	}, {
		SizeFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0),
			Size = p1.contextMenuSize
		}, {
			ContextMenu = RoactModule.createElement(ContextualMenu, {
				open = true,
				buttonProps = ButtonProps,
				menuDirection = MenuDirection.Up,
				openPositionY = UDim.new(1, p1.props.tilePositionY - p1.props.screenSize.Y + ConstantsModule1.Tile.SelectedSize + 56 + 11 + p1.props.globalGuiInset.bottom + v1),
				closeBackgroundVisible = not IsVRAppBuildFunction(),
				screenSize = ScreenSize,
				onDismiss = ClosePrompt
			})
		})
	})
end

function LCSortContextFrame.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({ unequip = "Feature.Avatar.Action.Unequip" })(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderLocalized(p2)
	end)
end

return (WithMappedNavigationParamsModule((WithAvatarRouteModule((WithOverlayFocusHandlingModule((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: SelectIsPortraitModule (copy)
	return {
		screenSize = p1.ScreenSize,
		globalGuiInset = p1.GlobalGuiInset,
		isPortrait = SelectIsPortraitModule(p1)
	}
end, nil)(LCSortContextFrame))))))))