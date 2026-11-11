local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local Parent = ChallengeDialog.Parent
local ReactModule = require(Parent.React)
local HttpRequestModule = require(Parent.HttpRequest)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FullPageModalWrapperModule = require(ChallengeDialog.Common.FullPageModalWrapper)
local LockModule = require(ChallengeDialog.Common.Lock)
local ModalTextComponentModule = require(ChallengeDialog.Common.ModalTextComponent)
local ModalButtonConfigModule = require(ChallengeDialog.Common.ModalButtonConfig)
local ModalFooterModule = require(ChallengeDialog.Common.ModalFooter)
local ChallengeDialogActionModule = require(ChallengeDialog.Enum.ChallengeDialogAction)
local ChallengeDialogTypeModule = require(ChallengeDialog.Enum.ChallengeDialogType)
local FinishDialogModule = require(ChallengeDialog.Thunks.FinishDialog)
local EventServiceModule = require(ChallengeDialog.Analytics.EventService)
local ModalTextSizesModule = require(ChallengeDialog.Common.ModalTextSizes)
local ButtonType = require(Parent.UIBlox).App.Button.Enum.ButtonType
local ConfigResult = HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("ModalChallengeDialogExpiredHttpRetryCount", 4) else nil
})

local function v19(RawValue)
	-- upvalues: ChallengeDialogTypeModule (copy)
	return {
		okay = "Authentication.TwoStepVerification.Action.Okay",
		helpMessage = "Authentication.TwoStepVerification.Label.NeedHelpMessage",
		header = if RawValue == ChallengeDialogTypeModule.toRawValue(ChallengeDialogTypeModule.DIALOG_TYPE_APPROVAL_2SV_GENERIC) then "Authentication.TwoStepVerification.Header.AttemptExpired" else "Authentication.TwoStepVerification.Header.LoginAttemptExpired",
		loginExpired = if RawValue == ChallengeDialogTypeModule.toRawValue(ChallengeDialogTypeModule.DIALOG_TYPE_APPROVAL_2SV_GENERIC) then "Authentication.TwoStepVerification.Label.Expired" else "Authentication.TwoStepVerification.Label.LoginExpired"
	}
end

return require(Parent.RoactRodux).connect(function(_, _)
	return {}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FinishDialogModule (copy)
	return {
		navigateToPage = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownFunction(p1))
		end,
		finishDialog = function(ConfigResult, p1, Deny)
			-- upvalues: Callback (copy), FinishDialogModule (upval)
			return Callback(FinishDialogModule(ConfigResult, p1, Deny))
		end
	}
end)(function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), v19 (copy), ConfigResult (copy), ChallengeDialogActionModule (copy), EventServiceModule (copy), FullPageModalWrapperModule (copy), LockModule (copy), ModalTextComponentModule (copy), ModalButtonConfigModule (copy), ButtonType (copy), ModalFooterModule (copy), ModalTextSizesModule (copy), AppPage (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction((v19(p1.dialogItem.type)))
	
	local function OnActivated()
		-- upvalues: UseStateResult2 (copy), p1 (copy), ConfigResult (upval), ChallengeDialogActionModule (upval)
		UseStateResult2(true)
		p1.finishDialog(ConfigResult, {
			type = p1.dialogItem.type,
			typeInternalId = p1.dialogItem.typeInternalId
		}, ChallengeDialogActionModule.Deny):await()
		UseStateResult2(false)
		p1.closeModal()
	end
	
	return ReactModule.createElement(FullPageModalWrapperModule, {
		title = UseLocalizationResult.header,
		closeModal = function()
			-- upvalues: EventServiceModule (upval), p1 (copy), OnActivated (copy)
			EventServiceModule.sendDialogAbandonedEvent(p1.dialogItem.type, p1.dialogItem.typeInternalId)
			OnActivated()
		end,
		makeBodyFragment = function(ContentWidth)
			-- upvalues: ReactModule (upval), LockModule (upval), ModalTextComponentModule (upval), UseLocalizationResult (copy)
			return ReactModule.createElement(ReactModule.Fragment, nil, {
				Lock = ReactModule.createElement(LockModule, { layoutOrder = 1 }),
				ChangeYourPassword = ReactModule.createElement(ModalTextComponentModule, {
					layoutOrder = 2,
					useBold = true,
					useEmphasis = true,
					contentWidth = ContentWidth,
					text = UseLocalizationResult.loginExpired
				})
			})
		end,
		buttonConfig = ModalButtonConfigModule({
			{
				isDisabled = UseStateResult,
				isLoading = UseStateResult,
				onActivated = OnActivated,
				text = UseLocalizationResult.okay,
				type = ButtonType.PrimarySystem
			}
		}),
		footerContent = ModalFooterModule(function(ContentWidth)
			-- upvalues: ReactModule (upval), ModalTextComponentModule (upval), UseLocalizationResult (copy), ModalTextSizesModule (upval), p1 (copy), AppPage (upval)
			return ReactModule.createElement(ModalTextComponentModule, {
				BackgroundTransparency = 0,
				layoutOrder = 1,
				text = UseLocalizationResult.helpMessage,
				contentWidth = ContentWidth,
				size = ModalTextSizesModule.Footer,
				onActivated = function()
					-- upvalues: p1 (upval), AppPage (upval)
					p1.navigateToPage({
						detail = "https://en.help.roblox.com/hc/en-us/articles/212459863-Add-2-Step-Verification-to-Your-Account",
						name = AppPage.GenericWebPage,
						extraProps = { title = "" }
					})
				end
			})
		end)
	})
end)