local CoreGui = game:GetService("CoreGui")
local Modules = CoreGui.RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local UseCommunityAvatarEntryButtonTooltipModule = require(Modules.AvatarExperience.Common.Components.TopBar.useCommunityAvatarEntryButtonTooltip)
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local FFlagEnableAppNavGamepadRemoval = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAppNavGamepadRemoval
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: TopBarModule (copy), UseStyleFunction (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), FFlagEnableAppNavGamepadRemoval (copy), ReactModule (copy), UseCommunityAvatarEntryButtonTooltipModule (copy), AvatarScreen (copy), NavigateWithLockFunction (copy), UseLocalizationFunction (copy), CoreGui (copy), TooltipOrientation (copy), WithTooltipFunction (copy), IconButton (copy), Images (copy), IconSize (copy), RoactModule (copy)
	local IconButtonSize = TopBarModule.getIconButtonSize(p1.formFactor)
	local UseStyleResult = UseStyleFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local Theme = UseStyleResult.Theme
	local UseRefResult = if FFlagEnableAppNavGamepadRemoval then ReactModule.useRef(nil) else nil
	local UseCommunityAvatarEntryButtonTooltipModuleResult, UseCommunityAvatarEntryButtonTooltipModuleResult2 = UseCommunityAvatarEntryButtonTooltipModule({})
	local UseResult = if FFlagEnableAppNavGamepadRemoval then ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseCommunityAvatarEntryButtonTooltipModuleResult2 (copy), UseNavigationResult (copy), AvatarScreen (upval), UseDispatchResult (copy), NavigateWithLockFunction (upval)
		if UseRefResult and UseRefResult.current then
			UseCommunityAvatarEntryButtonTooltipModuleResult2({ saveDismissTime = true })
			local Current = UseRefResult.current
			local NewAbsolutePosition = Current.AbsolutePosition + Current.AbsoluteSize * Vector2.new(0.5, 0.5)
			UseDispatchResult(NavigateWithLockFunction(function()
				-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), NewAbsolutePosition (copy)
				UseNavigationResult.navigate(AvatarScreen.CommunityAvatarEntryMenu, { entryButtonPosition = NewAbsolutePosition })
			end))
			
			return
		end
	end, {
		UseRefResult,
		UseCommunityAvatarEntryButtonTooltipModuleResult2
	}) else ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseCommunityAvatarEntryButtonTooltipModuleResult2 (copy), UseNavigationResult (copy), AvatarScreen (upval), UseDispatchResult (copy), NavigateWithLockFunction (upval)
		if p1.buttonRef and p1.buttonRef.current then
			UseCommunityAvatarEntryButtonTooltipModuleResult2({ saveDismissTime = true })
			local Current = p1.buttonRef.current
			local NewAbsolutePosition = Current.AbsolutePosition + Current.AbsoluteSize * Vector2.new(0.5, 0.5)
			UseDispatchResult(NavigateWithLockFunction(function()
				-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), NewAbsolutePosition (copy)
				UseNavigationResult.navigate(AvatarScreen.CommunityAvatarEntryMenu, { entryButtonPosition = NewAbsolutePosition })
			end))
			
			return
		end
	end, {
		p1.buttonRef,
		UseCommunityAvatarEntryButtonTooltipModuleResult2
	})
	
	return WithTooltipFunction({
		useLargeDropShadow = true,
		bodyText = UseLocalizationFunction({
			sharePublicAvatarTooltip = "Feature.Avatar.Label.SharePublicAvatar.Tooltip"
		}).sharePublicAvatarTooltip
	}, {
		DisplayOrder = 10,
		guiTarget = CoreGui,
		active = UseCommunityAvatarEntryButtonTooltipModuleResult,
		preferredOrientation = TooltipOrientation.Bottom
	}, function(OnAbsolutePositionChanged)
		-- upvalues: ReactModule (upval), IconButton (upval), IconButtonSize (copy), Images (upval), IconSize (upval), Theme (copy), RoactModule (upval), UseResult (copy), FFlagEnableAppNavGamepadRemoval (upval), UseRefResult (copy), p1 (copy)
		return ReactModule.createElement(IconButton, {
			size = UDim2.new(0, IconButtonSize, 1, 0),
			icon = Images["icons/actions/edit/add"],
			iconSize = IconSize.Medium,
			iconColor3 = Theme.SystemPrimaryDefault.Color,
			iconTransparency = Theme.SystemPrimaryDefault.Transparency,
			onAbsolutePositionChanged = OnAbsolutePositionChanged,
			[RoactModule.Change.AbsoluteSize] = OnAbsolutePositionChanged,
			onActivated = UseResult,
			buttonRef = if FFlagEnableAppNavGamepadRemoval then UseRefResult else p1.buttonRef
		})
	end)
end