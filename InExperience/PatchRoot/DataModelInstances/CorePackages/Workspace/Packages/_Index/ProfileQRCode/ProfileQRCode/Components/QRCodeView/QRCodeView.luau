local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ReactModule = require(Parent.React)
local UseGetProfileShareUrlModule = require(ProfileQRCode.Networking.useGetProfileShareUrl)
local UseAnalyticsModule = require(ProfileQRCode.Analytics.useAnalytics)
local UseShortUrlModule = require(ProfileQRCode.Rodux.useShortUrl)
local UseHasLoadedSuccessfullyModule = require(script.Parent.useHasLoadedSuccessfully)
local UseLoadingStateModule = require(ProfileQRCode.Networking.useLoadingState)
local UseRefreshQrSessionModule = require(ProfileQRCode.Networking.useRefreshQrSession)
local NetworkStatus = require(ProfileQRCode.Networking.configuredRoduxNetworking).Enum.NetworkStatus
local QRCodeFailedViewModule = require(script.Parent.QRCodeFailedView)
local QRCodeSucceededViewModule = require(script.Parent.QRCodeSucceededView)
local QRCodeLoadingViewModule = require(script.Parent.QRCodeLoadingView)
local UseEffectOnceFunction = require(Parent.RoactUtils).Hooks.useEffectOnce
local EventNamesModule = require(ProfileQRCode.Analytics.EventNames)
local UseHasFailedToLoadModule = require(script.Parent.useHasFailedToLoad)

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseLoadingStateModule (copy), UseGetProfileShareUrlModule (copy), UseRefreshQrSessionModule (copy), UseShortUrlModule (copy), NetworkStatus (copy), ReactModule (copy), EventNamesModule (copy), UseEffectOnceFunction (copy), UseHasLoadedSuccessfullyModule (copy), UseHasFailedToLoadModule (copy), QRCodeSucceededViewModule (copy), QRCodeFailedViewModule (copy), QRCodeLoadingViewModule (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseLoadingStateModuleResult = UseLoadingStateModule()
	local UseGetProfileShareUrlModuleResult = UseGetProfileShareUrlModule()
	local UseRefreshQrSessionModuleResult = UseRefreshQrSessionModule()
	local UseShortUrlModuleResult = UseShortUrlModule()
	local HasUseShortUrlModuleResult = UseShortUrlModuleResult ~= nil
	local IsUseLoadingStateModuleResultMatch = UseLoadingStateModuleResult == NetworkStatus.Failed
	ReactModule.useEffect(function()
		-- upvalues: UseRefreshQrSessionModuleResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		UseRefreshQrSessionModuleResult():andThen(function(Result)
			-- upvalues: UseAnalyticsModuleResult (upval), EventNamesModule (upval)
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.RefreshQrSession, {
				success = (Result and Result.responseBody or {}).Success,
				responseCode = Result and Result.responseCode
			})
		end)
	end, {})
	UseEffectOnceFunction(UseGetProfileShareUrlModuleResult, not HasUseShortUrlModuleResult)
	UseHasLoadedSuccessfullyModule(UseAnalyticsModuleResult, HasUseShortUrlModuleResult)
	UseHasFailedToLoadModule(UseAnalyticsModuleResult, IsUseLoadingStateModuleResultMatch)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 304, 0, if p1.isSmallScreen then 280 else 304),
		LayoutOrder = p1.layoutOrder
	}, {
		View = if HasUseShortUrlModuleResult then ReactModule.createElement(QRCodeSucceededViewModule, {
			qrCodeLength = 200,
			padding = 24,
			url = UseShortUrlModuleResult,
			isSmallScreen = p1.isSmallScreen
		}) elseif IsUseLoadingStateModuleResultMatch then ReactModule.createElement(QRCodeFailedViewModule, {
			padding = 24,
			onActivated = UseGetProfileShareUrlModuleResult
		}) else ReactModule.createElement(QRCodeLoadingViewModule)
	})
end