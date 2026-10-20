local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local Default = require(CorePackages.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseSendCounterModule = require(Modules.AvatarExperience.Common.Hooks.useSendCounter)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseCallbackFunction = require(CorePackages.Packages.React).useCallback
local UseSharePolicyModule = require(Modules.AvatarExperience.Common.Hooks.useSharePolicy)
local IconsActionsShare = Images["icons/actions/share"]
local IconsMenuLink = Images["icons/menu/link"]

return function(p1, p2, p3, Callback, Callback1)
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), UseSendCounterModule (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseCallbackFunction (copy), Default (copy), WebApiModule (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), ConstantsModule (copy), UseSharePolicyModule (copy), IconsActionsShare (copy), IconsMenuLink (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		copyLinkAction = "Feature.Catalog.Action.CopyLink",
		shareAction = "Feature.SocialShare.Action.Share",
		shareViaAction = "Feature.Catalog.Action.ShareVia"
	})
	local UseSendCounterModuleResult = UseSendCounterModule()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseCallbackResult = UseCallbackFunction(function(Url)
		-- upvalues: UseRoactServiceModuleResult (copy), p1 (copy), p2 (copy), Default (upval)
		UseRoactServiceModuleResult.clickShareItemButton(p1, p2)
		Default:shareUrl({ context = "MoreMenu", url = Url })
	end, { UseRoactServiceModuleResult, p1, p2, Default })
	local UseCallbackResult1 = UseCallbackFunction(function(p4)
		-- upvalues: p1 (copy), p2 (copy), UseDispatchResult (copy), WebApiModule (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), UseSendCounterModuleResult (copy), ConstantsModule (upval), UseCallbackResult (copy)
		if p1 and p2 then
			UseDispatchResult(WebApiModule.GetOrGenerateShortShareLink(p1, p2)):andThen(function(Result)
				-- upvalues: p4 (copy), UseDispatchResult (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), UseSendCounterModuleResult (upval), ConstantsModule (upval), UseCallbackResult (upval)
				if not Result or not Result.responseBody or not Result.responseBody.shortUrl then
					UseDispatchResult(SetCurrentToastMessageModule({
						toastMessage = "Feature.Catalog.Response.GenericError",
						toastType = ToastTypeModule.InformationMessage
					}))
					UseSendCounterModuleResult(ConstantsModule.Counter.GetOrGenerateShortShareLink.HookInvalid)
					
					return
				end
				if p4 then
					UseDispatchResult(SetCurrentToastMessageModule({
						toastMessage = "Feature.Catalog.Toast.LinkCopied",
						toastType = ToastTypeModule.SuccessConfirmation
					}))
				end
				UseSendCounterModuleResult(ConstantsModule.Counter.GetOrGenerateShortShareLink.HookSuccess)
				UseCallbackResult(Result.responseBody.shortUrl)
			end):catch(function(_)
				-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), UseSendCounterModuleResult (upval), ConstantsModule (upval)
				UseDispatchResult(SetCurrentToastMessageModule({
					toastMessage = "Feature.Catalog.Response.GenericError",
					toastType = ToastTypeModule.NetworkingError
				}))
				UseSendCounterModuleResult(ConstantsModule.Counter.GetOrGenerateShortShareLink.HookFailure)
			end)
			
			return
		end
	end, {
		p1, p2, UseSendCounterModuleResult, SetCurrentToastMessageModule,
		UseDispatchResult, UseCallbackResult
	})
	local UseCallbackResult2 = UseCallbackFunction(function(p4)
		-- upvalues: Callback (copy), UseCallbackResult1 (copy)
		if Callback then
			Callback(p4)
		end
		UseCallbackResult1(false)
	end, { Callback, UseCallbackResult1 })
	local UseCallbackResult3 = UseCallbackFunction(function(p4)
		-- upvalues: Callback (copy), UseCallbackResult1 (copy)
		if Callback then
			Callback(p4)
		end
		UseCallbackResult1(true)
	end, { Callback, UseCallbackResult1 })
	local UseSharePolicyModuleResult = UseSharePolicyModule()
	local SupportShareButton = UseSharePolicyModuleResult and UseSharePolicyModuleResult.supportShareButton or false
	local SupportCopyLinkButton = UseSharePolicyModuleResult and UseSharePolicyModuleResult.supportCopyLinkButton or false
	
	return if SupportShareButton then {
		icon = IconsActionsShare,
		text = if p3 then UseLocalizationResult.shareViaAction else UseLocalizationResult.shareAction,
		onActivated = if type(Callback1) == "function" then Callback1 else UseCallbackResult2
	} elseif SupportCopyLinkButton then {
		icon = IconsMenuLink,
		onActivated = if type(Callback1) == "function" then Callback1 else UseCallbackResult3,
		text = UseLocalizationResult.copyLinkAction
	} else nil
end