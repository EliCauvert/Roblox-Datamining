local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Logger = require(Parent.Loggers).Logger
local GetUserByIdFunction = require(Parent.AuthCommon).Thunks.GetUserById
local GetFFlagEnable2SVRecoveryModule = require(AccountRecovery.Flags.GetFFlagEnable2SVRecovery)
local GetModalModule = require(AccountRecovery.Components.getModal)
local GetFFlagEnableSkipPasswordResetModule = require(AccountRecovery.Flags.GetFFlagEnableSkipPasswordReset)
local RecoveryHeaderModule = require(AccountRecovery.Components.RecoveryHeader)
local UserHeaderModule = require(AccountRecovery.Components.UserHeader)
local AccountRecoveryPageStateModule = require(AccountRecovery.Enums.AccountRecoveryPageState)
local UseClearFocusOnUnmountFunction = require(AccountRecovery.Hooks).useClearFocusOnUnmount
local AccountRecoveryContextModule = require(AccountRecovery.Store.AccountRecoveryContext)
local ConstantsModule = require(AccountRecovery.Components.Constants)

return function(p1)
	-- upvalues: ReactModule (copy), AccountRecoveryContextModule (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseDesignTokensFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseClearFocusOnUnmountFunction (copy), GetUserByIdFunction (copy), Logger (copy), UseLocalizationFunction (copy), GetFFlagEnable2SVRecoveryModule (copy), FullscreenPageWithSafeArea (copy), RecoveryHeaderModule (copy), UserHeaderModule (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy), GetFFlagEnableSkipPasswordResetModule (copy), ConstantsModule (copy), AccountRecoveryPageStateModule (copy), GetModalModule (copy)
	local UseContextResult = ReactModule.useContext(AccountRecoveryContextModule)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local UserIDParam = p1.navigation.getParam("userID")
	local CloseRecoveryOnBackParam = p1.navigation.getParam("closeRecoveryOnBack") or false
	UseClearFocusOnUnmountFunction()
	ReactModule.useEffect(function()
		-- upvalues: UserIDParam (copy), GetUserByIdFunction (upval), UseRoactServiceResult (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), Logger (upval)
		if UserIDParam and UserIDParam ~= 0 then
			GetUserByIdFunction(UseRoactServiceResult, UserIDParam):andThen(function(Result)
				-- upvalues: UseStateResult2_1 (upval), UseStateResult2 (upval)
				UseStateResult2_1(Result.name)
				UseStateResult2(Result.displayName)
			end):catch(function(Err)
				-- upvalues: Logger (upval)
				Logger:warning("Error getting user info: {}", Err)
			end)
		end
	end, {})
	local UseLocalizationResult = UseLocalizationFunction({
		recoveryHeadingText = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery",
		continueButtonText = "Authentication.AccountRecovery.Action.Continue",
		resetPasswordButtonText = "Authentication.AccountRecovery.Action.ResetPassword",
		trustedLocationResetPasswordText = {
			"Authentication.AccountRecovery.Description.TrustedLocationResetPassword",
			username = `@{UseStateResult1}`
		},
		trustedLocationResetPasswordSkip2svText = {
			"Authentication.AccountRecovery.Description.TrustedLocationResetPasswordSkip2SV",
			username = `@{UseStateResult1}`
		},
		trustedLocationSkip2svText = {
			"Authentication.AccountRecovery.Description.TrustedLocationSkip2SV",
			username = `@{UseStateResult1}`
		},
		requestErrorText = if UseStateResult4 == "" then nil else UseStateResult4
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
				FillDirection = Enum.FillDirection.Vertical
			}),
			Header = ReactModule.createElement(RecoveryHeaderModule, {
				LayoutOrder = 1,
				backButtonDisabled = false,
				currentComponent = "accountVerifiedConfirmation",
				onBackActivated = function()
					-- upvalues: CloseRecoveryOnBackParam (copy), UseContextResult (copy), p1 (copy)
					if CloseRecoveryOnBackParam then
						UseContextResult.parentNavigation.goBack()
						
						return
					else
						p1.navigation.goBack()
					end
				end,
				recoveryHeadingText = UseLocalizationResult.recoveryHeadingText,
				recoverySessionId = UseContextResult.state.recoverySessionId
			}),
			Content = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
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
				RecoveryHeadingSpacing = ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_500)
				}),
				UserHeader = ReactModule.createElement(UserHeaderModule, {
					LayoutOrder = 2,
					userId = UserIDParam or 0,
					displayName = UseStateResult,
					username = UseStateResult1
				}),
				UserHeaderSpacing = ReactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_400)
				}),
				BodyText = ReactModule.createElement(Text, {
					LayoutOrder = 4,
					TextWrapped = true,
					Text = if GetFFlagEnable2SVRecoveryModule() and UseContextResult.state.recover2sv and UseContextResult.state.recoverPassword then UseLocalizationResult.trustedLocationResetPasswordSkip2svText elseif GetFFlagEnable2SVRecoveryModule() and UseContextResult.state.recover2sv then UseLocalizationResult.trustedLocationSkip2svText else UseLocalizationResult.trustedLocationResetPasswordText,
					fontStyle = UseTokensResult.Typography.BodyMedium,
					textStyle = UseTokensResult.Color.Content.Default,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center
				}),
				BodyTextSpacing = ReactModule.createElement("Frame", {
					LayoutOrder = 5,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_300)
				}),
				ResetPasswordButton = ReactModule.createElement(Button, {
					LayoutOrder = 6,
					variant = ButtonVariant.Emphasis,
					size = InputSize.Medium,
					text = if GetFFlagEnable2SVRecoveryModule() and UseContextResult.state.recover2sv then UseLocalizationResult.continueButtonText else UseLocalizationResult.resetPasswordButtonText,
					width = UDim.new(1, 0),
					isLoading = UseStateResult3,
					onActivated = function()
						-- upvalues: GetFFlagEnableSkipPasswordResetModule (upval), UseContextResult (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), ConstantsModule (upval), UserIDParam (copy), UseStateResult1 (copy), p1 (copy), AccountRecoveryPageStateModule (upval)
						if GetFFlagEnableSkipPasswordResetModule() and UseContextResult.state.recover2sv and not UseContextResult.state.recoverPassword then
							UseStateResult2_2(true)
							UseStateResult2_3("")
							UseContextResult.utils.handleUpdatePassword(UseContextResult.state.recoverySessionId, UserIDParam, UseStateResult1, "", "", function(p2)
								-- upvalues: UseStateResult2_3 (upval), ConstantsModule (upval), UseStateResult2_2 (upval)
								UseStateResult2_3(p2 or ConstantsModule.UnknownErrorKey)
								UseStateResult2_2(false)
							end, UseContextResult.utils.launchAppOrGoBack)
							
							return
						else
							p1.navigation.navigate(AccountRecoveryPageStateModule.ChooseAccountScreen, { userID = UserIDParam })
						end
					end
				}),
				RequestErrorTextLabel = UseStateResult4 ~= "" and ReactModule.createElement(Text, {
					LayoutOrder = 7,
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