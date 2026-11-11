local LandingPage = script:FindFirstAncestor("LandingPage")
local Parent = LandingPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UserLibModule = require(Parent.UserLib)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = UserLibModule.Utils.Constants
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LandingPageConstantsModule = require(LandingPage.Constants.LandingPageConstants)
local DisclaimerLinks = require(Parent.AuthCommon).Components.DisclaimerLinks
local EditAccountPickerModule = require(LandingPage.Components.EditAccountPicker)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local GetAccountsListWithSignedOutAccountsFunction = require(Parent.AccountSwitching).GetAccountsListWithSignedOutAccounts
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local EnableAccountPickerListViewEvents = game:DefineFastFlag("EnableAccountPickerListViewEvents", false)
local FixAccountPickerListViewScrollAndAlignment = game:DefineFastFlag("FixAccountPickerListViewScrollAndAlignment", false)

return function(p1)
	-- upvalues: ReactModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), AuthPageloadFunction (copy), EventStreamConstants (copy), EnableAccountPickerListViewEvents (copy), GetAccountsListWithSignedOutAccountsFunction (copy), AuthButtonClickFunction (copy), FoundationModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), EditAccountPickerModule (copy), FullscreenPageWithSafeArea (copy), LandingPageConstantsModule (copy), FixAccountPickerListViewScrollAndAlignment (copy), ButtonVariant (copy), InputSize (copy), DisclaimerLinks (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(p1.accounts)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		allAccounts = "Authentication.AccountPicker.Label.AllAccounts",
		manage = "Authentication.AccountPicker.Label.Manage",
		signInAsAccount = "Authentication.AccountPicker.Button.SignIntoAnotherAccount",
		createAccount = "Authentication.AccountPicker.Button.CreateAccount",
		signedOut = "Authentication.AccountPicker.Label.SignedOut"
	})
	ReactModule.useEffect(function()
		-- upvalues: AuthPageloadFunction (upval), EventStreamConstants (upval)
		AuthPageloadFunction(EventStreamConstants.Context.AccountPickerLandingScreenListView)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), p1 (copy), EnableAccountPickerListViewEvents (upval), AuthPageloadFunction (upval), EventStreamConstants (upval)
		UseStateResult2_1(p1.accounts)
		
		if EnableAccountPickerListViewEvents then
			AuthPageloadFunction(EventStreamConstants.Context.AccountPickerListViewAccountsDisplayed, tostring(#p1.accounts), nil)
		end
	end, { p1.accounts })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetAccountsListWithSignedOutAccountsFunction (upval), UseRoactServiceResult (copy), p1 (copy)
		GetAccountsListWithSignedOutAccountsFunction(UseRoactServiceResult, {
			isAuthenticated = false,
			filterUnauthenticatedSessionsForAccountPicker = true
		}):andThen(function(Result)
			-- upvalues: p1 (upval)
			p1.setAccountPickerAccounts(Result)
		end)
	end, { UseRoactServiceResult, p1.setAccountPickerAccounts })
	
	local function _(p2)
		-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), p1 (copy)
		AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerLandingScreenListView, EventStreamConstants.Button.AccountPickerAccountSelected, p2.user_id, nil)
		p1.onAvatarActivated(p2.user_id, p2.username, p2.has_valid_session)
	end
	
	local function OnActivated()
		-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), UseStateResult2 (copy)
		AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerLandingScreenListView, EventStreamConstants.Button.AccountPickerManageAccountsOpened, nil, nil)
		UseStateResult2(true)
	end
	
	local function OnActivated1()
		-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), p1 (copy)
		AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerLandingScreenListView, EventStreamConstants.Button.AccountPickerSignInAnotherAccount, nil, nil)
		p1.navigateToLogin()
	end
	
	local function OnActivated2()
		-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), p1 (copy)
		AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerLandingScreenListView, EventStreamConstants.Button.AccountPickerCreateAccount, nil, nil)
		p1.navigateToSignup()
	end
	
	local Elements = {}
	
	for LayoutOrder, value in ipairs(UseStateResult1) do
		local Username = value.username or ""
		Elements["AccountCard_" .. tostring(LayoutOrder)] = ReactModule.createElement(FoundationModule.View, {
			tag = "row items-center size-full-0 auto-y padding-x-small",
			LayoutOrder = LayoutOrder
		}, {
			AccountCard = ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center gap-none size-full-0 auto-y padding-medium padding-right-small radius-medium",
				BackgroundTransparency = 1,
				onActivated = function()
					-- upvalues: value (copy), AuthButtonClickFunction (upval), EventStreamConstants (upval), p1 (copy)
					AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerLandingScreenListView, EventStreamConstants.Button.AccountPickerAccountSelected, value.user_id, nil)
					p1.onAvatarActivated(value.user_id, value.username, value.has_valid_session)
				end,
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.None
				}
			}, {
				Avatar = ReactModule.createElement(FoundationModule.View, {
					tag = "radius-full col self-center",
					LayoutOrder = 0,
					Size = UDim2.new(0, 56, 0, 56)
				}, {
					AvatarContainer = ReactModule.createElement(FoundationModule.View, {
						tag = "radius-circle bg-surface-200",
						Size = UDim2.new(0, 56, 0, 56)
					}, {
						AvatarImage = ReactModule.createElement(FoundationModule.Image, {
							tag = "radius-circle",
							Size = UDim2.new(1, 0, 1, 0),
							Image = GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(value.user_id), Constants.RbxthumbTypes.AvatarHeadShot, 150)
						})
					})
				}),
				AccountInfo = ReactModule.createElement(FoundationModule.View, {
					tag = "col items-start fill auto-xy padding-left-small",
					LayoutOrder = 1
				}, {
					DisplayName = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-title-large text-align-x-left text-truncate-end content-emphasis",
						LayoutOrder = 0,
						Text = value.display_name or Username
					}),
					Username = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-body-small text-align-x-left text-truncate-end content-muted",
						LayoutOrder = 1,
						Text = "@" .. Username
					})
				}),
				SignedOutPill = if value.has_valid_session then nil else ReactModule.createElement(FoundationModule.View, {
					tag = "col auto-xy padding-x-small padding-y-xsmall radius-small bg-surface-300",
					LayoutOrder = 2
				}, {
					PillText = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-title-medium text-caption-large text-align-x-center",
						Text = UseLocalizationResult.signedOut
					})
				})
			})
		})
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		EditAccountPicker = if UseStateResult then ReactModule.createElement(EditAccountPickerModule, {
			accounts = p1.accounts,
			onClose = function()
				-- upvalues: UseStateResult2 (copy), UseResult (copy)
				UseStateResult2(false)
				UseResult()
			end
		}) else nil,
		MainContainer = ReactModule.createElement(FullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
		}, {
			OuterContainer = ReactModule.createElement(FoundationModule.View, {
				tag = "col size-full-0 auto-xy",
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				LogoContainer = ReactModule.createElement(FoundationModule.View, {
					tag = "justify-center col align-x-center items-center size-full-full auto-y padding-bottom-xxlarge padding-top-xlarge",
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
				HeaderContainer = ReactModule.createElement(FoundationModule.View, {
					tag = "row items-center size-full-0 auto-y padding-x-small padding-bottom-large padding-top-xxlarge",
					LayoutOrder = 1
				}, {
					Title = ReactModule.createElement(FoundationModule.Text, {
						LayoutOrder = 1,
						tag = "align-x-left fill auto-xy padding-left-medium text-heading-small text-align-x-left content-emphasis",
						Text = UseLocalizationResult.allAccounts
					}),
					EditButton = ReactModule.createElement(FoundationModule.View, {
						LayoutOrder = 2,
						tag = "col size-0 auto-xy padding-x-small",
						onActivated = OnActivated
					}, {
						EditIcon = ReactModule.createElement(FoundationModule.Text, {
							tag = "auto-xy text-title-medium text-align-x-right content-action-link",
							Text = UseLocalizationResult.manage
						})
					})
				}),
				ScrollViewContainer = ReactModule.createElement(FoundationModule.View, {
					LayoutOrder = 2,
					tag = if FixAccountPickerListViewScrollAndAlignment then "col fill size-full-0 padding-x-xlarge" else "col fill size-full-0 padding-x-large"
				}, {
					AccountListWrapper = if FixAccountPickerListViewScrollAndAlignment then ReactModule.createElement(FoundationModule.View, {
						tag = "col fill size-full-0 radius-large bg-surface-100",
						ClipsDescendants = true
					}, {
						ScrollView = ReactModule.createElement(FoundationModule.ScrollView, {
							scroll = {
								AutomaticCanvasSize = Enum.AutomaticSize.XY,
								CanvasSize = UDim2.fromOffset(0, 0),
								ScrollingDirection = Enum.ScrollingDirection.Y,
								scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.None
							},
							Size = UDim2.new(1, 0, 1, 0)
						}, {
							AccountElements = ReactModule.createElement(FoundationModule.View, { tag = "col gap-xxsmall auto-xy" }, Elements)
						})
					}) else ReactModule.createElement(FoundationModule.ScrollView, {
						scroll = {
							AutomaticCanvasSize = Enum.AutomaticSize.XY,
							CanvasSize = UDim2.fromOffset(0, 0),
							ScrollingDirection = Enum.ScrollingDirection.Y,
							scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.None
						},
						Size = UDim2.new(1, 0, 1, 0)
					}, {
						AccountElements = ReactModule.createElement(FoundationModule.View, {
							tag = "col gap-xxsmall auto-xy radius-large bg-surface-100"
						}, Elements)
					})
				}),
				ButtonContainer = ReactModule.createElement(FoundationModule.View, {
					tag = "col align-x-center gap-small size-full-0 auto-y padding-x-xlarge padding-y-medium",
					LayoutOrder = 3
				}, {
					SignInButton = ReactModule.createElement(FoundationModule.Button, {
						LayoutOrder = 1,
						onActivated = OnActivated1,
						text = UseLocalizationResult.signInAsAccount,
						variant = ButtonVariant.Standard,
						size = InputSize.Large,
						width = UDim.new(1, 0)
					}),
					CreateAccountButton = ReactModule.createElement(FoundationModule.Button, {
						LayoutOrder = 2,
						onActivated = OnActivated2,
						text = UseLocalizationResult.createAccount,
						variant = ButtonVariant.Standard,
						size = InputSize.Large,
						width = UDim.new(1, 0)
					})
				}),
				DisclaimerLinksView = ReactModule.createElement(FoundationModule.View, {
					tag = "row align-x-center size-full-0 auto-y",
					LayoutOrder = 4
				}, {
					DisclaimerLinks = ReactModule.createElement(DisclaimerLinks, { fillDirection = Enum.FillDirection.Horizontal })
				})
			})
		})
	})
end