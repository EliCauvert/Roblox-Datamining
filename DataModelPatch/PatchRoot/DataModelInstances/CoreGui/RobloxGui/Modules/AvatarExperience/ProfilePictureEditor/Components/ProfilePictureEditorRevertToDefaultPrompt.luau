local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local UtilsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Utils)
local WritePPEConfigModule = require(Modules.AvatarExperience.ProfilePictureEditor.Thunks.WritePPEConfig)
local AnalyticsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Services.Analytics)

local function selectScreenSize(p1)
	return p1.ScreenSize
end

local function selectPpeState(p1)
	return p1.AvatarExperience.ProfilePictureEditor
end

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseSelectorFunction (copy), selectScreenSize (copy), selectPpeState (copy), NavigationUtilsModule (copy), UtilsModule (copy), WritePPEConfigModule (copy), PPEThumbnailTypeModule (copy), AvatarScreen (copy), UseLocalizationFunction (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local UseSelectorResult1 = UseSelectorFunction(selectPpeState)
	
	local function OnActivated()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.navigation)
	end
	
	local function v20()
		-- upvalues: UseSelectorResult1 (copy), UtilsModule (upval), UseDispatchResult (copy), WritePPEConfigModule (upval), UseRoactServiceModuleResult (copy), PPEThumbnailTypeModule (upval)
		local LastSuccessfulPoseEmoteAssetId = UseSelectorResult1.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId
		local YRotDegFromSliderValue = UtilsModule.getYRotDegFromSliderValue(UseSelectorResult1.CameraSliders.rotateSliderValue)
		local FieldOfViewDeg = UseSelectorResult1.ProfilePictureParams.fieldOfViewDeg or 30
		UseDispatchResult(WritePPEConfigModule(UseRoactServiceModuleResult, PPEThumbnailTypeModule.Closeup, LastSuccessfulPoseEmoteAssetId, -1, YRotDegFromSliderValue, FieldOfViewDeg))
		UseDispatchResult(WritePPEConfigModule(UseRoactServiceModuleResult, PPEThumbnailTypeModule.FullBody, LastSuccessfulPoseEmoteAssetId, -1, YRotDegFromSliderValue, FieldOfViewDeg))
	end
	
	local function OnActivated1()
		-- upvalues: v20 (copy), p1 (copy), AvatarScreen (upval)
		v20()
		
		if p1.onBack then
			p1.onBack()
			
			return
		else
			p1.navigation.navigate(AvatarScreen.Catalog)
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Feature.Avatar.Title.RevertToDefault",
		bodyText = "Feature.Avatar.Message.RevertToDefault",
		revertButtonText = "Feature.Avatar.Action.Revert",
		cancelButtonText = "Feature.Avatar.Action.Cancel"
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		title = UseLocalizationResult.titleText,
		bodyText = UseLocalizationResult.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = OnActivated,
						text = UseLocalizationResult.cancelButtonText
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = OnActivated1,
						text = UseLocalizationResult.revertButtonText
					}
				}
			}
		},
		screenSize = UseSelectorResult
	})
end))))