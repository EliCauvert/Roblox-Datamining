local Parent = script:FindFirstAncestor("PlatformRestricted").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Avatar = FoundationModule.Avatar
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthCommonModule = require(Parent.AuthCommon)
local LogoutReasonNames = AuthCommonModule.Enums.LogoutReasonNames
local ConsoleDisconnectFunction = AuthCommonModule.Thunks.ConsoleDisconnect
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppGuiService = require(Parent.RoactServiceTags).AppGuiService
local ResponsiveModule = require(Parent.Responsive)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppGuiService (copy), ResponsiveModule (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), ReactModule (copy), AuthPageloadFunction (copy), EventStreamConstants (copy), AuthButtonClickFunction (copy), ConsoleDisconnectFunction (copy), LogoutReasonNames (copy), FullscreenPageWithSafeArea (copy), View (copy), Text (copy), Avatar (copy), InputSize (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy), FillBehavior (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppGuiService)
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local IsUseOrientationResultMatch = ResponsiveModule.useOrientation() == ResponsiveModule.Keys.Landscape
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.PlatformRestriction.Title.AskParent",
		description = "Feature.PlatformRestriction.Content.NeedPermission",
		continueButton = "Feature.PlatformRestriction.Action.Continue",
		signOutButton = "Feature.PlatformRestriction.Action.Signout"
	})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.LocalUserId
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return if p2.Users and p2.LocalUserId then p2.Users[p2.LocalUserId] else nil
	end)
	local DisplayName = if UseSelectorResult1 then UseSelectorResult1.displayName else nil
	local Name = if UseSelectorResult1 then UseSelectorResult1.name else nil
	ReactModule.useEffect(function()
		-- upvalues: AuthPageloadFunction (upval), EventStreamConstants (upval)
		AuthPageloadFunction(EventStreamConstants.Context.PlatformRestrictedPage)
	end, {})
	local _UDim: UDim = if IsUseOrientationResultMatch then UDim.new(0, 0) else UDim.new(0, UseTokensResult.Padding.XXLarge)
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = false,
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_100.Color3,
		useFullScalePage = IsUsePreferredInputResultMatch
	}, {
		ReactModule.createElement(View, {
			tag = "col align-x-center size-full-full",
			padding = {
				top = UDim.new(0.1, 0),
				bottom = UDim.new(0, UseTokensResult.Padding.XXLarge),
				left = _UDim,
				right = _UDim
			}
		}, {
			InnerColumn = ReactModule.createElement(View, {
				tag = "col flex-y-between",
				Size = UDim2.new(if IsUseOrientationResultMatch then 0.35 else 1, 0, 1, 0)
			}, {
				ContentArea = ReactModule.createElement(View, {
					tag = "col gap-large size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					Title = ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y text-heading-large text-align-x-left content-emphasis",
						LayoutOrder = 1,
						Text = UseLocalizationResult.title
					}),
					UserInfoRow = DisplayName and ReactModule.createElement(View, {
						tag = "row align-y-center gap-medium size-full-0 auto-y",
						LayoutOrder = 2
					}, {
						Avatar = UseSelectorResult and ReactModule.createElement(Avatar, {
							LayoutOrder = 1,
							userId = UseSelectorResult,
							size = InputSize.Large
						}),
						NameStack = ReactModule.createElement(View, { tag = "col fill gap-xxsmall auto-y", LayoutOrder = 2 }, {
							DisplayName = ReactModule.createElement(Text, {
								tag = "size-full-0 auto-y text-label-large text-align-x-left content-emphasis",
								LayoutOrder = 1,
								Text = DisplayName
							}),
							Username = Name and ReactModule.createElement(Text, {
								tag = "size-full-0 auto-y text-body-medium text-align-x-left content-muted",
								LayoutOrder = 2,
								Text = "@" .. Name
							})
						})
					}),
					Description = ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-default",
						LayoutOrder = 3,
						Text = UseLocalizationResult.description
					})
				}),
				ButtonArea = ReactModule.createElement(View, {
					tag = "col align-x-center gap-small size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					ContinueButton = ReactModule.createElement(Button, {
						LayoutOrder = 1,
						text = UseLocalizationResult.continueButton,
						variant = ButtonVariant.Emphasis,
						size = ButtonSize.Large,
						fillBehavior = FillBehavior.Fill,
						width = UDim.new(1, 0),
						onActivated = function()
							-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval)
							AuthButtonClickFunction(EventStreamConstants.Context.PlatformRestrictedPage, EventStreamConstants.Button.Continue)
						end
					}),
					SignOutButton = ReactModule.createElement(Button, {
						LayoutOrder = 2,
						text = UseLocalizationResult.signOutButton,
						variant = ButtonVariant.Utility,
						size = ButtonSize.Large,
						fillBehavior = FillBehavior.Fill,
						width = UDim.new(1, 0),
						onActivated = function()
							-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), IsUsePreferredInputResultMatch (copy), UseDispatchResult (copy), ConsoleDisconnectFunction (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), p1 (copy), LogoutReasonNames (upval)
							AuthButtonClickFunction(EventStreamConstants.Context.PlatformRestrictedPage, EventStreamConstants.Button.Logout)
							
							if IsUsePreferredInputResultMatch then
								UseDispatchResult(ConsoleDisconnectFunction(UseRoactServiceResult, UseRoactServiceResult1, p1.LogoutThunk))
								
								return
							else
								UseDispatchResult(p1.LogoutThunk(UseRoactServiceResult, UseRoactServiceResult1, LogoutReasonNames.Moderation))
							end
						end
					})
				})
			})
		})
	})
end