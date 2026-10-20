local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local InputSize = FoundationModule.Enums.InputSize
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseClearFocusOnUnmountFunction = require(AccountRecovery.Hooks).useClearFocusOnUnmount
local AccountRecoveryContextModule = require(AccountRecovery.Store.AccountRecoveryContext)
local RecoveryStateModule = require(AccountRecovery.Enums.RecoveryState)
local RecoveryHeaderModule = require(AccountRecovery.Components.RecoveryHeader)
local UserHeaderModule = require(AccountRecovery.Components.UserHeader)
local AccountRecoveryPageStateModule = require(AccountRecovery.Enums.AccountRecoveryPageState)
local ConstantsModule = require(AccountRecovery.Components.Constants)
local GetModalModule = require(AccountRecovery.Components.getModal)
local GetFFlagEnableSkipPasswordResetModule = require(AccountRecovery.Flags.GetFFlagEnableSkipPasswordReset)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)

return function(p1)
	-- upvalues: ReactModule (copy), AccountRecoveryContextModule (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseDesignTokensFunction (copy), UseClearFocusOnUnmountFunction (copy), ConstantsModule (copy), RecoveryStateModule (copy), AccountRecoveryPageStateModule (copy), GetFFlagEnableSkipPasswordResetModule (copy), UseLocalizationFunction (copy), FullscreenPageWithSafeArea (copy), RecoveryHeaderModule (copy), ScrollView (copy), Visibility (copy), UserHeaderModule (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy), GetModalModule (copy)
	local UseContextResult = ReactModule.useContext(AccountRecoveryContextModule)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UserIDParam = p1.navigation.getParam("userID")
	local DisplayNameParam = p1.navigation.getParam("displayName")
	local UsernameParam = p1.navigation.getParam("username")
	local DidAbandon2SVParam = p1.navigation.getParam("didAbandon2SV")
	local ContactMethodNumberParam = p1.navigation.getParam("contactMethodNumber")
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Vector2.new(0, 0))
	UseClearFocusOnUnmountFunction()
	
	local function v35(UserID, p2, Callback: (any) -> ())
		-- upvalues: ConstantsModule (upval), RecoveryStateModule (upval), p1 (copy), AccountRecoveryPageStateModule (upval), ContactMethodNumberParam (copy), UseContextResult (copy), GetFFlagEnableSkipPasswordResetModule (upval), UsernameParam (copy)
		if p2 == nil then
			Callback(ConstantsModule.UnknownErrorKey)
			
			return
		end
		if p2.recoveryState == RecoveryStateModule.RECOVERY_STATE_CONTACT_METHOD_VERIFICATION_REQUIRED then
			p1.navigation.navigate(AccountRecoveryPageStateModule.SendCodeScreen, {
				isSecondContactMethodVerification = true,
				userID = UserID,
				previousRecoveryMethod = p2.previousRecoveryMethod,
				previousRecoveryMethodTypes = p2.previousRecoveryMethodTypes,
				nextRecoveryMethodTypes = p2.nextRecoveryMethodTypes
			})
			
			return
		end
		if p2.recoveryState == RecoveryStateModule.RECOVERY_STATE_ACCOUNT_VERIFIED then
			if ContactMethodNumberParam == 0 and UseContextResult.state.recover2sv then
				p1.navigation.replace(AccountRecoveryPageStateModule.AccountVerifiedConfirmationScreen, { userID = UserID })
				
				return
			end
			if GetFFlagEnableSkipPasswordResetModule() and UseContextResult.state.recover2sv and not UseContextResult.state.recoverPassword then
				UseContextResult.utils.handleUpdatePassword(UseContextResult.state.recoverySessionId, UserID, UsernameParam, "", "", Callback, UseContextResult.utils.launchAppOrGoBack)
				
				return
			else
				p1.navigation.replace(AccountRecoveryPageStateModule.ChooseAccountScreen, { userID = UserID })
				
				return
			end
		elseif p2.recoveryState == RecoveryStateModule.RECOVERY_STATE_AWAITING_REEVALUATION then
			p1.navigation.navigate(AccountRecoveryPageStateModule.CannotRecoverAccountScreen, { userID = UserID })
			
			return
		else
			Callback(ConstantsModule.UnknownErrorKey)
		end
	end
	
	local function v36(Frame: Frame)
		-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy)
		if UseStateResult3 ~= Frame.AbsoluteSize then
			UseStateResult2_2(Frame.AbsoluteSize)
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		recoveryHeadingText = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery",
		verifyAgainBodyText = "Authentication.AccountRecovery.Description.VerifyAgain",
		somethingWentWrongVerifyAgainText = "Authentication.AccountRecovery.Description.SomethingWentWrongVerifyAgain",
		continueButtonText = "Authentication.AccountRecovery.Action.Continue",
		requestErrorText = if UseStateResult == "" then nil else UseStateResult
	})
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_200),
			PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_300),
			PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_300),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_200)
		}),
		Wrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_500)
			}),
			PreScrollContent = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				[ReactModule.Change.AbsoluteSize] = v36
			}, {
				Header = ReactModule.createElement(RecoveryHeaderModule, {
					LayoutOrder = 1,
					currentComponent = "continueFallback",
					onBackActivated = function()
						-- upvalues: p1 (copy)
						p1.navigation.goBack()
					end,
					backButtonDisabled = UseStateResult1,
					recoveryHeadingText = UseLocalizationResult.recoveryHeadingText,
					recoverySessionId = UseContextResult.state.recoverySessionId
				})
			}),
			ContentScrollView = ReactModule.createElement(ScrollView, {
				LayoutOrder = 2,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = Visibility.Auto
				},
				Size = UDim2.new(1, 0, 1, -UseStateResult3.Y)
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_200),
					PaddingRight = UDim.new(0, UseDesignTokensResult.Size.Size_200)
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, UseDesignTokensResult.Size.Size_50)
				}),
				UserHeader = ReactModule.createElement(UserHeaderModule, {
					LayoutOrder = 1,
					userId = UserIDParam,
					displayName = DisplayNameParam,
					username = UsernameParam
				}),
				BodyText = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					TextWrapped = true,
					Text = DidAbandon2SVParam and UseLocalizationResult.verifyAgainBodyText or UseLocalizationResult.somethingWentWrongVerifyAgainText,
					fontStyle = UseTokensResult.Typography.BodyMedium,
					textStyle = UseTokensResult.Color.Content.Default,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					padding = {
						top = UDim.new(0, UseTokensResult.Size.Size_300),
						bottom = UDim.new(0, UseTokensResult.Size.Size_300)
					}
				}),
				ContinueButton = ReactModule.createElement(Button, {
					LayoutOrder = 3,
					variant = ButtonVariant.Emphasis,
					size = InputSize.Medium,
					text = UseLocalizationResult.continueButtonText,
					width = UDim.new(1, 0),
					onActivated = function()
						-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy), ConstantsModule (upval), UseContextResult (copy), UserIDParam (copy), v35 (copy)
						UseStateResult2_1(true)
						UseStateResult2("")
						
						local function v38(p2)
							-- upvalues: UseStateResult2 (upval), ConstantsModule (upval), UseStateResult2_1 (upval)
							UseStateResult2(p2 or ConstantsModule.UnknownErrorKey)
							UseStateResult2_1(false)
						end
						
						UseContextResult.utils.handleContinueRecovery(UseContextResult.state.recoverySessionId, UserIDParam, function(p2)
							-- upvalues: v35 (upval), UserIDParam (upval), v38 (copy)
							v35(UserIDParam, p2, v38)
						end, v38, function()
							-- upvalues: UseStateResult2_1 (upval)
							UseStateResult2_1(false)
						end)
					end,
					isLoading = UseStateResult1
				}),
				RequestErrorTextLabel = ReactModule.createElement(Text, {
					LayoutOrder = 4,
					Text = UseLocalizationResult.requestErrorText or "",
					fontStyle = UseTokensResult.Typography.CaptionSmall,
					textStyle = UseTokensResult.Color.System.Alert,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					padding = { top = UDim.new(0, UseTokensResult.Size.Size_200) }
				}),
				Modal = GetFFlagEnableSkipPasswordResetModule() and GetModalModule(UseContextResult.state.modalStateAndProps)
			})
		})
	})
end