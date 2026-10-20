local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSharePolicyModule = require(Modules.AvatarExperience.Common.Hooks.useSharePolicy)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local SetTryOnManagerPeekViewStateFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState
local CreateLookModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.CreateLook)
local FetchMySharedAvatarsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.FetchMySharedAvatars)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local ActionBar = UIBloxModule.App.Button.ActionBar
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local GetFFlagAXLooksTranslationAuditModule = require(Modules.AvatarExperience.Flags.GetFFlagAXLooksTranslationAudit)
local AXFixCommunityAvatarsPeekViewClose = game:DefineFastFlag("AXFixCommunityAvatarsPeekViewClose", false)

return function()
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseNavigationFunction (copy), ReactModule (copy), UseSharePolicyModule (copy), GetFFlagAXLooksTranslationAuditModule (copy), UseLocalizationModule (copy), SetTryOnManagerPeekViewStateFunction (copy), PeekViewState (copy), ButtonType (copy), CreateLookModule (copy), AXFixCommunityAvatarsPeekViewClose (copy), NavigationUtilsModule (copy), FetchMySharedAvatarsModule (copy), AvatarScreen (copy), NavigateWithLockFunction (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), ActionBar (copy), ButtonStack (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseNavigationResult = UseNavigationFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseSharePolicyModuleResult = UseSharePolicyModule()
	local SupportShareButton = UseSharePolicyModuleResult and (UseSharePolicyModuleResult.supportShareButton or UseSharePolicyModuleResult.supportCopyLinkButton)
	local UseLocalizationModuleResult = if GetFFlagAXLooksTranslationAuditModule() then UseLocalizationModule({
		goBack = "Feature.Avatar.Action.GoBack",
		post = "Feature.Avatar.Action.ComposerPost"
	}) else nil
	
	return ReactModule.createElement(ActionBar, {}, {
		ButtonStack = ReactModule.createElement(ButtonStack, {
			buttons = {
				ReactModule.useMemo(function()
					-- upvalues: UseDispatchResult (copy), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), GetFFlagAXLooksTranslationAuditModule (upval), UseLocalizationModuleResult (copy)
					return {
						props = {
							isLoading = false,
							onActivated = function()
								-- upvalues: UseDispatchResult (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval)
								UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Closed))
							end,
							text = if GetFFlagAXLooksTranslationAuditModule() then UseLocalizationModuleResult.goBack else "Go Back"
						}
					}
				end, { UseDispatchResult }),
				(ReactModule.useMemo(function()
					-- upvalues: ButtonType (upval), UseStateResult (copy), UseStateResult2 (copy), UseDispatchResult (copy), CreateLookModule (upval), UseRoactServiceModuleResult (copy), AXFixCommunityAvatarsPeekViewClose (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), NavigationUtilsModule (upval), UseNavigationResult (copy), FetchMySharedAvatarsModule (upval), AvatarScreen (upval), SupportShareButton (copy), NavigateWithLockFunction (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), GetFFlagAXLooksTranslationAuditModule (upval), UseLocalizationModuleResult (copy)
					return {
						isDefaultChild = true,
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = function()
								-- upvalues: UseStateResult (upval), UseStateResult2 (upval), UseDispatchResult (upval), CreateLookModule (upval), UseRoactServiceModuleResult (upval), AXFixCommunityAvatarsPeekViewClose (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), NavigationUtilsModule (upval), UseNavigationResult (upval), FetchMySharedAvatarsModule (upval), AvatarScreen (upval), SupportShareButton (upval), NavigateWithLockFunction (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
								if not UseStateResult then
									UseStateResult2(true)
									UseDispatchResult(CreateLookModule(UseRoactServiceModuleResult)):andThen(function(Result)
										-- upvalues: UseStateResult2 (upval), AXFixCommunityAvatarsPeekViewClose (upval), UseDispatchResult (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), NavigationUtilsModule (upval), UseNavigationResult (upval), FetchMySharedAvatarsModule (upval), UseRoactServiceModuleResult (upval), AvatarScreen (upval), SupportShareButton (upval), NavigateWithLockFunction (upval)
										UseStateResult2(false)
										
										if not Result then return end
										if AXFixCommunityAvatarsPeekViewClose then
											UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Closed))
										end
										NavigationUtilsModule.closeLookComposer(UseNavigationResult)
										UseDispatchResult(FetchMySharedAvatarsModule(UseRoactServiceModuleResult))
										NavigationUtilsModule.navigateFromOverlay(UseNavigationResult, AvatarScreen.MySharedAvatars)
										
										if SupportShareButton then
											UseDispatchResult(NavigateWithLockFunction(function()
												-- upvalues: AvatarScreen (upval), Result (copy), UseNavigationResult (upval)
												UseNavigationResult.navigate(AvatarScreen.CommunityAvatarSharePrompt, { lookId = Result })
											end))
										end
									end):catch(function(_)
										-- upvalues: UseStateResult2 (upval), UseDispatchResult (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
										UseStateResult2(false)
										UseDispatchResult(SetCurrentToastMessageModule({
											toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
											toastType = ToastTypeModule.NetworkingError
										}))
									end)
									
									return
								end
							end,
							text = if GetFFlagAXLooksTranslationAuditModule() then UseLocalizationModuleResult.post else "Share",
							isLoading = UseStateResult
						}
					}
				end, { UseDispatchResult, UseStateResult, SupportShareButton }))
			}
		})
	})
end