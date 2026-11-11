local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local FoundationModule = require(Parent.Foundation)
local List = FoundationModule.List
local SystemBanner = FoundationModule.SystemBanner
local AlertVariant = FoundationModule.Enums.AlertVariant
local AlertSeverity = FoundationModule.Enums.AlertSeverity
local IconName = FoundationModule.Enums.IconName
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local UseClearFocusOnUnmountFunction = require(AccountRecovery.Hooks).useClearFocusOnUnmount
local AccountRecoveryContextModule = require(AccountRecovery.Store.AccountRecoveryContext)
local RecoveryHeaderModule = require(AccountRecovery.Components.RecoveryHeader)
local AccountRecoveryPageStateModule = require(AccountRecovery.Enums.AccountRecoveryPageState)
local RecoveryMethodInputTypeModule = require(AccountRecovery.Enums.RecoveryMethodInputType)
local EventServiceModule = require(AccountRecovery.Analytics.EventService)

return function(p1)
	-- upvalues: ReactModule (copy), AccountRecoveryContextModule (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseDesignTokensFunction (copy), UseLocalizationFunction (copy), UseClearFocusOnUnmountFunction (copy), EventServiceModule (copy), AccountRecoveryPageStateModule (copy), CryoModule (copy), FullscreenPageWithSafeArea (copy), RecoveryHeaderModule (copy), ScrollView (copy), Visibility (copy), SystemBanner (copy), AlertSeverity (copy), AlertVariant (copy), List (copy), IconName (copy), RecoveryMethodInputTypeModule (copy)
	local UseContextResult = ReactModule.useContext(AccountRecoveryContextModule)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local SendCodeRouteParamsParam = p1.navigation.getParam("sendCodeRouteParams")
	local UseLocalizationResult = UseLocalizationFunction({
		chooseVerificationMethodHeadingText = "Authentication.AccountRecovery.Heading.ChooseVerificationMethod",
		phoneText = "Authentication.AccountRecovery.LabelPhone",
		emailText = "Authentication.AccountRecovery.LabelEmail",
		backupCodeText = "Authentication.AccountRecovery.Label.BackupCode",
		enterPhoneBackupCodeOrAnotherEmailText = "Authentication.AccountRecovery.Description.EnterPhoneBackupCodeOrAnotherEmail",
		previousMethodVerifiedText = {
			"Authentication.AccountRecovery.Label.PreviousContactMethodVerification",
			contactMethod = SendCodeRouteParamsParam and SendCodeRouteParamsParam.previousRecoveryMethod or ""
		}
	})
	UseClearFocusOnUnmountFunction()
	
	local function v26(RecoveryMethodInputTypeOverride)
		-- upvalues: SendCodeRouteParamsParam (copy), EventServiceModule (upval), UseContextResult (copy), p1 (copy), AccountRecoveryPageStateModule (upval), CryoModule (upval)
		if SendCodeRouteParamsParam then
			EventServiceModule.sendRecoveryMethodInputSwitchEvent(UseContextResult.state.recoverySessionId, RecoveryMethodInputTypeOverride, "chooseVerificationMethod")
			p1.navigation.navigate(AccountRecoveryPageStateModule.SendCodeScreen, CryoModule.Dictionary.join(SendCodeRouteParamsParam, {
				recoveryMethodInputTypeOverride = RecoveryMethodInputTypeOverride
			}))
			
			return
		else
			p1.navigation.goBack()
		end
	end
	
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
				currentComponent = "chooseVerificationMethod",
				onBackActivated = function()
					-- upvalues: p1 (copy)
					p1.navigation.goBack()
				end,
				recoveryHeadingText = UseLocalizationResult.chooseVerificationMethodHeadingText,
				recoverySessionId = UseContextResult.state.recoverySessionId
			}),
			Content = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				PreScrollContent = ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0),
					[ReactModule.Change.AbsoluteSize] = function(Frame: Frame)
						-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
						if UseStateResult ~= Frame.AbsoluteSize then
							UseStateResult2(Frame.AbsoluteSize)
						end
					end
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
					HeadingToScrollSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_500)
					})
				}),
				ContentScrollView = ReactModule.createElement(ScrollView, {
					LayoutOrder = 2,
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.new(1, 0, 0, 0),
						ScrollingDirection = Enum.ScrollingDirection.Y,
						scrollBarVisibility = Visibility.Always
					},
					Size = UDim2.new(1, 0, 1, -UseStateResult.Y)
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
					VerifiedBanner = ReactModule.createElement(SystemBanner, {
						LayoutOrder = 1,
						severity = AlertSeverity.Info,
						variant = AlertVariant.Standard,
						title = UseLocalizationResult.previousMethodVerifiedText,
						description = UseLocalizationResult.enterPhoneBackupCodeOrAnotherEmailText
					}),
					BannerSpacing = ReactModule.createElement("Frame", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_400)
					}),
					MethodList = ReactModule.createElement(List.Root, {
						LayoutOrder = 3,
						hasDivider = { hasDivider = true, isInset = false },
						isContained = { isContained = false, hasMargin = false }
					}, {
						PhoneItem = ReactModule.createElement(List.Item, {
							LayoutOrder = 1,
							leading = IconName.SmartphonePortrait,
							title = UseLocalizationResult.phoneText,
							onActivated = {
								onActivated = function()
									-- upvalues: v26 (copy), RecoveryMethodInputTypeModule (upval)
									v26(RecoveryMethodInputTypeModule.Phone)
								end
							}
						}),
						EmailItem = ReactModule.createElement(List.Item, {
							LayoutOrder = 2,
							leading = IconName.Envelope,
							title = UseLocalizationResult.emailText,
							onActivated = {
								onActivated = function()
									-- upvalues: v26 (copy), RecoveryMethodInputTypeModule (upval)
									v26(RecoveryMethodInputTypeModule.Email)
								end
							}
						}),
						BackupCodeItem = ReactModule.createElement(List.Item, {
							LayoutOrder = 3,
							leading = IconName.ClockSpinReverseDashed,
							title = UseLocalizationResult.backupCodeText,
							onActivated = {
								onActivated = function()
									-- upvalues: v26 (copy), RecoveryMethodInputTypeModule (upval)
									v26(RecoveryMethodInputTypeModule.BackupCode)
								end
							}
						})
					})
				})
			})
		})
	})
end