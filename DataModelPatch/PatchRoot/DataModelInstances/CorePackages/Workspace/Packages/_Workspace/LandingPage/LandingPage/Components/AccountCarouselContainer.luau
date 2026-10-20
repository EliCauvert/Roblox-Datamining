local LandingPage = script:FindFirstAncestor("LandingPage")
local Parent = LandingPage.Parent
local ReactModule = require(Parent.React)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local PeekViewState = require(Parent.PeekView).PeekViewState
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local AccountCarouselModule = require(LandingPage.Components.AccountCarousel)
local AccountCarouselMorePeekViewModule = require(LandingPage.Components.AccountCarouselMorePeekView)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LandingPageConstantsModule = require(LandingPage.Constants.LandingPageConstants)
local EditAccountPickerModule = require(LandingPage.Components.EditAccountPicker)
local GetAccountsListWithSignedOutAccountsFunction = require(Parent.AccountSwitching).GetAccountsListWithSignedOutAccounts
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local _ = require(LandingPage.Components.AccountCarouselAvatar)
local DisclaimerLinks = require(Parent.AuthCommon).Components.DisclaimerLinks
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local GetFFlagEnableAccountCarouselEventsFunction = require(Parent.SharedFlags).GetFFlagEnableAccountCarouselEvents
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick

return function(p1)
	-- upvalues: ReactModule (copy), PeekViewState (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), GetAccountsListWithSignedOutAccountsFunction (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), GetFFlagEnableAccountCarouselEventsFunction (copy), AuthPageloadFunction (copy), EventStreamConstants (copy), EditAccountPickerModule (copy), FullscreenPageWithSafeArea (copy), FoundationModule (copy), LandingPageConstantsModule (copy), AccountCarouselModule (copy), AuthButtonClickFunction (copy), ButtonVariant (copy), InputSize (copy), DisclaimerLinks (copy), AccountCarouselMorePeekViewModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(1)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(PeekViewState.Closed)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetAccountsListWithSignedOutAccountsFunction (upval), UseRoactServiceResult (copy), p1 (copy)
		GetAccountsListWithSignedOutAccountsFunction(UseRoactServiceResult, {
			isAuthenticated = false,
			filterUnauthenticatedSessionsForAccountPicker = true
		}):andThen(function(Result)
			-- upvalues: p1 (upval)
			p1.setAccountPickerAccounts(Result)
		end)
	end, {})
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		moreOptions = "Authentication.AccountPicker.Button.MoreOptions",
		chooseAnAccount = "Authentication.AccountSwitch.Header.ChooseAnAccount",
		signInAsAccount = {
			"Authentication.AccountPicker.Button.SignInAsAccount",
			displayName = p1.accounts and p1.accounts[UseStateResult] and p1.accounts[UseStateResult].username or ""
		},
		continueAs = {
			"Authentication.AccountPicker.Button.ContinueAsSignedIn",
			displayName = p1.accounts and p1.accounts[UseStateResult] and p1.accounts[UseStateResult].username or ""
		}
	})
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagEnableAccountCarouselEventsFunction (upval), AuthPageloadFunction (upval), EventStreamConstants (upval)
		if GetFFlagEnableAccountCarouselEventsFunction() then
			AuthPageloadFunction(EventStreamConstants.Context.AccountPickerLandingScreen)
		end
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		EditAccountPicker = if UseStateResult1 then ReactModule.createElement(EditAccountPickerModule, {
			accounts = p1.accounts,
			onClose = function()
				-- upvalues: UseStateResult2_1 (copy), UseResult (copy)
				UseStateResult2_1(false)
				UseResult()
			end
		}) else nil,
		AccountCarouselContainer = ReactModule.createElement(FullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
		}, {
			ReactModule.createElement(FoundationModule.View, {
				tag = "col auto-xy size-full-0",
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				LogoContainer = ReactModule.createElement(FoundationModule.View, {
					tag = "col auto-y size-full-full items-center align-x-center justify-center padding-top-xlarge",
					LayoutOrder = 0
				}, {
					Logo = ReactModule.createElement(FoundationModule.Image, {
						tag = "self-center",
						ZIndex = 1,
						Image = LandingPageConstantsModule.Common.RobloxLogo.IMAGE,
						ScaleType = Enum.ScaleType.Fit,
						Size = UDim2.new(0.7, 0, 0.7, 0),
						aspectRatio = LandingPageConstantsModule.Common.RobloxLogo.ASPECT_RATIO,
						sizeConstraint = {
							MaxSize = Vector2.new(LandingPageConstantsModule.Common.RobloxLogo.MAX_WIDTH_LARGE, LandingPageConstantsModule.Common.RobloxLogo.MAX_WIDTH_LARGE / LandingPageConstantsModule.Common.RobloxLogo.ASPECT_RATIO)
						}
					})
				}),
				ChooseAnAccountTextContainer = ReactModule.createElement(FoundationModule.View, {
					tag = "col auto-y size-full-0 items-center align-x-center padding-top-xlarge",
					LayoutOrder = 1
				}, {
					ChooseAnAccountText = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-heading-small content-emphasis text-align-x-center",
						Text = UseLocalizationResult.chooseAnAccount
					})
				}),
				AccountCarousel = ReactModule.createElement(AccountCarouselModule, {
					LayoutOrder = 2,
					accounts = p1.accounts,
					avatarSize = p1.avatarSize,
					setSelectedAvatarIndex = UseStateResult2
				}),
				ButtonContainer = ReactModule.createElement(FoundationModule.View, {
					tag = "auto-y size-full-0 gap-small col align-x-center padding-x-xlarge padding-y-medium",
					LayoutOrder = 3
				}, {
					PrimaryButton = ReactModule.createElement(FoundationModule.Button, {
						LayoutOrder = 2,
						onActivated = function()
							-- upvalues: GetFFlagEnableAccountCarouselEventsFunction (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), p1 (copy), UseStateResult (copy)
							if GetFFlagEnableAccountCarouselEventsFunction() then
								AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerLandingScreen, if p1.accounts[UseStateResult].has_valid_session then EventStreamConstants.Button.AccountPickerContinueAsAccount else EventStreamConstants.Button.AccountPickerSignInAccount, p1.accounts[UseStateResult].user_id, nil)
							end
							p1.onAvatarActivated(p1.accounts[UseStateResult].user_id, p1.accounts[UseStateResult].username, p1.accounts[UseStateResult].has_valid_session)
						end,
						text = if p1.accounts and p1.accounts[UseStateResult] and not p1.accounts[UseStateResult].has_valid_session then UseLocalizationResult.signInAsAccount else UseLocalizationResult.continueAs,
						variant = ButtonVariant.Emphasis,
						width = UDim.new(1, 0),
						size = InputSize.Large
					}),
					SecondaryButton = ReactModule.createElement(FoundationModule.Button, {
						LayoutOrder = 3,
						onActivated = function()
							-- upvalues: UseStateResult2_2 (copy), PeekViewState (upval), GetFFlagEnableAccountCarouselEventsFunction (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval)
							UseStateResult2_2(PeekViewState.Brief)
							
							if GetFFlagEnableAccountCarouselEventsFunction() then
								AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerLandingScreen, EventStreamConstants.Button.AccountPickerMoreOptions, nil, nil)
							end
						end,
						text = UseLocalizationResult.moreOptions,
						variant = ButtonVariant.Standard,
						size = InputSize.Large,
						width = UDim.new(1, 0)
					})
				}),
				DisclaimerLinksView = ReactModule.createElement(FoundationModule.View, {
					tag = "row auto-y size-full-0 align-x-center",
					LayoutOrder = 4
				}, {
					DisclaimerLinks = ReactModule.createElement(DisclaimerLinks, { fillDirection = Enum.FillDirection.Horizontal })
				})
			}),
			PeekViewContainer = if UseStateResult3 == PeekViewState.Closed then nil else ReactModule.createElement(AccountCarouselMorePeekViewModule, {
				navigateToLogin = p1.navigateToLogin,
				navigateToSignup = p1.navigateToSignup,
				peekViewState = UseStateResult3,
				setPeekViewState = UseStateResult2_2,
				navigateToManageAccounts = function()
					-- upvalues: UseStateResult2_1 (copy)
					UseStateResult2_1(true)
				end
			})
		})
	})
end