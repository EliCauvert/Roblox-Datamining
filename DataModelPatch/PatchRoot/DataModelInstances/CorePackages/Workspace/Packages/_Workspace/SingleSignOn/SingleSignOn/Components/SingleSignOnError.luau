local Parent = script:FindFirstAncestor("SingleSignOn").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local TelemetryConfigs = require(Parent.AuthAnalytics).TelemetryConfigs
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local Progress = FoundationModule.Progress
local ProgressShape = FoundationModule.Enums.ProgressShape
local ProgressSize = FoundationModule.Enums.ProgressSize
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local ThirdPartySwitchAccountComponent = require(Parent.AuthCommon).Components.ThirdPartySwitchAccountComponent
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local SingleSignOnErrorAntiSpamDelaySeconds = game:DefineFastInt("SingleSignOnErrorAntiSpamDelaySeconds", 5)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseRoactServiceFunction (copy), AppLogging (copy), UseDesignTokensFunction (copy), ReactModule (copy), UseNavigationFunction (copy), SingleSignOnErrorAntiSpamDelaySeconds (copy), ThirdPartyUserService (copy), TelemetryConfigs (copy), View (copy), Text (copy), Progress (copy), ProgressShape (copy), ProgressSize (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy), AppPage (copy), ThirdPartySwitchAccountComponent (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		message = "CommonUI.Features.Labels.ServerCommunicationError",
		retry = "CommonUI.Features.Labels.Retry"
	})
	local UseRoactServiceResult = UseRoactServiceFunction(AppLogging)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseNavigationResult = UseNavigationFunction()
	local IsAccountSwitchingSupported = if p1.isAccountSwitchingSupported == nil then ThirdPartyUserService and ThirdPartyUserService:IsAccountSwitchingSupported() else p1.isAccountSwitchingSupported
	local UserPlatformName = if p1.thirdPartyUserName == nil then ThirdPartyUserService and ThirdPartyUserService:GetUserPlatformName() else p1.thirdPartyUserName
	ReactModule.useEffect(function()
		-- upvalues: SingleSignOnErrorAntiSpamDelaySeconds (copy), UseStateResult2 (copy)
		if SingleSignOnErrorAntiSpamDelaySeconds > 0 then
			task.delay(SingleSignOnErrorAntiSpamDelaySeconds, function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(true)
			end)
			
			return
		else
			UseStateResult2(true)
		end
	end, { UseStateResult2, SingleSignOnErrorAntiSpamDelaySeconds })
	ReactModule.useEffect(function()
		-- upvalues: UseRoactServiceResult (copy), TelemetryConfigs (upval)
		UseRoactServiceResult:logEventOnce("single_sign_on_error_did_mount")
		UseRoactServiceResult:logRobloxTelemetryCounter(TelemetryConfigs.SingleSignOnErrorMountTelemetryConfig, 1)
	end, { UseRoactServiceResult })
	
	return ReactModule.createElement(View, { tag = "size-full" }, {
		Background = if p1.renderBackground then p1.renderBackground() else nil,
		Content = ReactModule.createElement(View, {
			tag = "col anchor-center-center position-center-center gap-xxlarge align-x-center auto-y",
			Size = UDim2.fromOffset(UseDesignTokensResult.LuaApps.LandingPage.buttonWidth, 0)
		}, {
			ErrorMessage = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 text-align-x-center auto-y",
				Text = UseLocalizationResult.message
			}),
			ActionContainer = ReactModule.createElement(View, { tag = "size-full-0 auto-xy", LayoutOrder = 2 }, {
				ProgressIndicator = if UseStateResult then nil else ReactModule.createElement(View, {
					tag = "col size-full auto-xy align-x-center align-y-center"
				}, {
					Progress = ReactModule.createElement(Progress, { shape = ProgressShape.Circle, size = ProgressSize.Large })
				}),
				ButtonContainer = ReactModule.createElement(View, { tag = "col size-full-0 auto-y gap-xxlarge" }, {
					LogInButton = ReactModule.createElement(Button, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y",
						isDisabled = not UseStateResult,
						variant = ButtonVariant.Standard,
						size = ButtonSize.Large,
						text = UseLocalizationResult.retry,
						onActivated = function()
							-- upvalues: UseRoactServiceResult (copy), TelemetryConfigs (upval), UseNavigationResult (copy), AppPage (upval)
							UseRoactServiceResult:logEventOnce("single_sign_on_error_retry")
							UseRoactServiceResult:logRobloxTelemetryCounter(TelemetryConfigs.SingleSignOnErrorRetryButtonClickedConfig, 1)
							UseNavigationResult.replace(AppPage.SingleSignOnContainer)
						end,
						width = UDim.new(1, 0)
					}),
					ThirdPartySwitchAccountComponent = if IsAccountSwitchingSupported then ReactModule.createElement(ThirdPartySwitchAccountComponent, {
						layoutOrder = 2,
						dividerTextKey = "CommonUI.Features.Labels.With",
						isDisabled = not UseStateResult,
						thirdPartyUserName = UserPlatformName
					}) else nil
				})
			})
		})
	})
end