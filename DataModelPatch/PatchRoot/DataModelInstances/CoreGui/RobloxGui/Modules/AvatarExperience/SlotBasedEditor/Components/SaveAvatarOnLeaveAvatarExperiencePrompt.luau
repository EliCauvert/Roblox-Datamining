local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseCallbackFunction = ReactModule.useCallback
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local Actions = require(CorePackages.Packages.RoactNavigation).Actions
local SlotBasedEditorAnalytics = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local AXEnableCloseButtonOnBlockingSavePrompt = game:DefineFastFlag("AXEnableCloseButtonOnBlockingSavePrompt", false)
local AXEnableBackgroundCloseBlockingSavePrompt = game:DefineFastFlag("AXEnableBackgroundCloseBlockingSavePrompt", false)

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return (require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(_)
	-- upvalues: UseNavigationFunction (copy), UseSelectorFunction (copy), selectScreenSize (copy), UseLocalizationFunction (copy), UseCallbackFunction (copy), Actions (copy), SlotBasedEditorAnalytics (copy), ReactModule (copy), AXEnableBackgroundCloseBlockingSavePrompt (copy), InteractiveAlert (copy), ButtonType (copy), AXEnableCloseButtonOnBlockingSavePrompt (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local SaveAndContinueParam = UseNavigationResult.getParam("saveAndContinue")
	local ContinueWithoutSaveParam = UseNavigationResult.getParam("continueWithoutSave")
	local UseLocalizationResult = UseLocalizationFunction({
		saveButtonLabel = "Feature.Avatar.Action.Save",
		leaveButtonLabel = "Feature.Avatar.Action.Leave",
		saveTitle = "Feature.Avatar.Label.Title.BlockingSavePrompt",
		saveBodyText = "Feature.Avatar.Label.Message.BlockingSavePrompt"
	})
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseNavigationResult (copy), Actions (upval)
		UseNavigationResult.dispatch(Actions.back({ immediate = true }))
	end, { UseNavigationResult })
	
	return ReactModule.createElement("TextButton", {
		Text = "",
		AutoButtonColor = false,
		Selectable = false,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		[ReactModule.Event.Activated] = function()
			-- upvalues: AXEnableBackgroundCloseBlockingSavePrompt (upval), UseCallbackResult (copy)
			if AXEnableBackgroundCloseBlockingSavePrompt then
				UseCallbackResult()
			end
		end,
		ZIndex = 3
	}, {
		SaveOnLeavePrompt = ReactModule.createElement(InteractiveAlert, {
			title = UseLocalizationResult.saveTitle,
			bodyText = UseLocalizationResult.saveBodyText,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = {
							onActivated = UseCallbackFunction(function()
								-- upvalues: ContinueWithoutSaveParam (copy), SlotBasedEditorAnalytics (upval), UseCallbackResult (copy)
								if ContinueWithoutSaveParam then
									ContinueWithoutSaveParam()
								end
								SlotBasedEditorAnalytics.trackSaveBlockPromptLeaveClick()
								UseCallbackResult()
							end, { ContinueWithoutSaveParam, UseCallbackResult }),
							text = UseLocalizationResult.leaveButtonLabel
						}
					},
					{
						buttonType = ButtonType.PrimaryContextual,
						props = {
							onActivated = UseCallbackFunction(function()
								-- upvalues: SaveAndContinueParam (copy), SlotBasedEditorAnalytics (upval), UseCallbackResult (copy)
								if SaveAndContinueParam then
									SaveAndContinueParam()
								end
								SlotBasedEditorAnalytics.trackSaveBlockPromptSaveClick()
								UseCallbackResult()
							end, { SaveAndContinueParam, UseCallbackResult }),
							text = UseLocalizationResult.saveButtonLabel
						}
					}
				}
			},
			screenSize = UseSelectorResult,
			onCloseClicked = if AXEnableCloseButtonOnBlockingSavePrompt then UseCallbackResult else nil
		})
	})
end))