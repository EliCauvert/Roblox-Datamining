local AccountLockModal = script:FindFirstAncestor("AccountLockModal")
local Parent = AccountLockModal.Parent
local EnumsModule = require(AccountLockModal.Common.Enums)
local GetFIntAccountUnlockDelayMsModule = require(AccountLockModal.Flags.GetFIntAccountUnlockDelayMs)
local AccountLockContextModule = require(AccountLockModal.Contexts.AccountLockContext)
local AccountLockEventContextEnum = require(AccountLockModal.Common.Enums).AccountLockEventContextEnum
local AccountLockClientEventModule = require(AccountLockModal.Common.AccountLockClientEvent)
local UnlockAccountModule = require(AccountLockModal.Utils.unlockAccount)
local UseLogoutModule = require(AccountLockModal.Utils.useLogout)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseStateFunction = ReactModule.useState
local UseCallbackFunction = ReactModule.useCallback
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local AppPage = require(Parent.RobloxAppEnums).AppPage

return ReactModule.memo(function(p1)
	-- upvalues: AccountLockContextModule (copy), UseDispatchFunction (copy), UseLogoutModule (copy), UseStateFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppLogging (copy), UseLocalizationFunction (copy), UseCallbackFunction (copy), AccountLockClientEventModule (copy), AccountLockEventContextEnum (copy), UnlockAccountModule (copy), GetFIntAccountUnlockDelayMsModule (copy), AppPage (copy), EnumsModule (copy), ReactModule (copy), View (copy), Button (copy), ButtonVariant (copy), InputSize (copy), FillBehavior (copy)
	local UseAccountLockContextResult = AccountLockContextModule.useAccountLockContext()
	local State = UseAccountLockContextResult.state
	local ReducerFunction = UseAccountLockContextResult.reducer
	local UseDispatchResult = UseDispatchFunction()
	local UseLogoutModuleResult = UseLogoutModule(p1.Logout)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppLogging)
	local UseLocalizationResult = UseLocalizationFunction({
		signOutButton = "Feature.AccountLock.Action.Signout",
		continueButton = "Feature.AccountLock.Action.Continue"
	})
	
	return ReactModule.createElement(View, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = 3
	}, {
		LogoutButton = ReactModule.createElement(Button, {
			LayoutOrder = 1,
			text = UseLocalizationResult.signOutButton,
			onActivated = UseCallbackFunction(function()
				-- upvalues: UseStateResult2_1 (copy), UseRoactServiceResult1 (copy), AccountLockClientEventModule (upval), AccountLockEventContextEnum (upval), UseLogoutModuleResult (copy)
				UseStateResult2_1(true)
				UseRoactServiceResult1:logRobloxTelemetryEvent(AccountLockClientEventModule, {}, { context = AccountLockEventContextEnum.Logout })
				UseLogoutModuleResult()
			end, { UseRoactServiceResult }),
			variant = ButtonVariant.Standard,
			size = InputSize.Medium,
			fillBehavior = FillBehavior.Fill,
			isLoading = UseStateResult1
		}),
		UnlockButton = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			text = UseLocalizationResult.continueButton,
			onActivated = UseCallbackFunction(function()
				-- upvalues: UseStateResult2 (copy), UseRoactServiceResult1 (copy), AccountLockClientEventModule (upval), AccountLockEventContextEnum (upval), UnlockAccountModule (upval), UseRoactServiceResult (copy), GetFIntAccountUnlockDelayMsModule (upval), UseDispatchResult (copy), p1 (copy), AppPage (upval), ReducerFunction (copy), EnumsModule (upval)
				UseStateResult2(true)
				UseRoactServiceResult1:logRobloxTelemetryEvent(AccountLockClientEventModule, {}, { context = AccountLockEventContextEnum.Unlock })
				UnlockAccountModule(UseRoactServiceResult):andThen(function(_)
					-- upvalues: UseRoactServiceResult1 (upval), AccountLockClientEventModule (upval), AccountLockEventContextEnum (upval), GetFIntAccountUnlockDelayMsModule (upval), UseDispatchResult (upval), p1 (upval), UseRoactServiceResult (upval), AppPage (upval)
					task.spawn(function()
						-- upvalues: UseRoactServiceResult1 (upval), AccountLockClientEventModule (upval), AccountLockEventContextEnum (upval), GetFIntAccountUnlockDelayMsModule (upval), UseDispatchResult (upval), p1 (upval), UseRoactServiceResult (upval), AppPage (upval)
						UseRoactServiceResult1:logRobloxTelemetryEvent(AccountLockClientEventModule, {}, { context = AccountLockEventContextEnum.Success })
						task.wait(GetFIntAccountUnlockDelayMsModule() / 1000)
						UseDispatchResult(p1.ApiFetchAccessStatus(UseRoactServiceResult))
						UseDispatchResult(p1.ResetNavigationHistory({ { name = AppPage.Home } }))
						UseDispatchResult(p1.closeCentralOverlayThunk())
					end)
				end):catch(function(Err)
					-- upvalues: p1 (upval), ReducerFunction (upval), EnumsModule (upval), UseRoactServiceResult1 (upval), AccountLockClientEventModule (upval), AccountLockEventContextEnum (upval), UseStateResult2 (upval)
					local MatchRateLimitedResult = p1.ChallengeError.matchRateLimited(Err)
					
					if MatchRateLimitedResult then
						ReducerFunction({
							status = EnumsModule.AccountLockStatusEnum.RateLimited,
							retryTime = MatchRateLimitedResult
						})
						UseRoactServiceResult1:logRobloxTelemetryEvent(AccountLockClientEventModule, {}, { context = AccountLockEventContextEnum.RateLimited })
					elseif p1.ChallengeError.matchAbandoned(Err) then
						UseRoactServiceResult1:logRobloxTelemetryEvent(AccountLockClientEventModule, {}, { context = AccountLockEventContextEnum.Abandoned })
					else
						ReducerFunction({ status = EnumsModule.AccountLockStatusEnum.Error })
						UseRoactServiceResult1:logRobloxTelemetryEvent(AccountLockClientEventModule, {}, { context = AccountLockEventContextEnum.Error })
					end
					UseStateResult2(false)
				end)
			end, { UseRoactServiceResult }),
			variant = ButtonVariant.Emphasis,
			size = InputSize.Medium,
			fillBehavior = FillBehavior.Fill,
			isLoading = UseStateResult,
			isDisabled = State.timeUntilRetry and State.timeUntilRetry > 0
		})
	})
end)