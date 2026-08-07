local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local reactModule = require(parent.React)
local useGetProfileShareUrlModule = require(profileQRCode.Networking.useGetProfileShareUrl)
local useAnalyticsModule = require(profileQRCode.Analytics.useAnalytics)
local useShortUrlModule = require(profileQRCode.Rodux.useShortUrl)
local useHasLoadedSuccessfullyModule = require(script.Parent.useHasLoadedSuccessfully)
local useLoadingStateModule = require(profileQRCode.Networking.useLoadingState)
local useRefreshQrSessionModule = require(profileQRCode.Networking.useRefreshQrSession)
local networkStatus = require(profileQRCode.Networking.configuredRoduxNetworking).Enum.NetworkStatus
local QRCodeFailedViewModule = require(script.Parent.QRCodeFailedView)
local QRCodeSucceededViewModule = require(script.Parent.QRCodeSucceededView)
local QRCodeLoadingViewModule = require(script.Parent.QRCodeLoadingView)
local useEffectOnce = require(parent.RoactUtils).Hooks.useEffectOnce
local eventNamesModule = require(profileQRCode.Analytics.EventNames)
local useHasFailedToLoadModule = require(script.Parent.useHasFailedToLoad)

return function(p0) --[[ line: 30 ]]
	-- upvalues: useAnalyticsModule (ref), useLoadingStateModule (ref), useGetProfileShareUrlModule (ref), useRefreshQrSessionModule (ref), useShortUrlModule (ref), networkStatus (ref), reactModule (ref), eventNamesModule (ref), useEffectOnce (ref), useHasLoadedSuccessfullyModule (ref), useHasFailedToLoadModule (ref), QRCodeSucceededViewModule (ref), QRCodeFailedViewModule (ref), QRCodeLoadingViewModule (ref)
	local var13 = useAnalyticsModule()
	local var14 = useLoadingStateModule()
	local var15 = useGetProfileShareUrlModule()
	local var16 = useRefreshQrSessionModule()
	local var17 = useShortUrlModule()
	local var18 = var17 ~= nil
	local var19 = var14 == networkStatus.Failed
	reactModule.useEffect(function() --[[ line: 40 ]]
		-- upvalues: var16 (ref), var13 (ref), eventNamesModule (copy)
		var16():andThen(function(p1) --[[ line: 41 ]]
			-- upvalues: var13 (copy), eventNamesModule (copy)
			var13.fireEvent(eventNamesModule.RefreshQrSession, {
				success = (if p1 then p1.responseBody else {}).Success,
				responseCode = p1 and p1.responseCode
			})
		end)
	end, {})
	useEffectOnce(var15, not var18)
	useHasLoadedSuccessfullyModule(var13, var18)
	useHasFailedToLoadModule(var13, var19)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 304, 0, if p0.isSmallScreen then 280 else 304),
		LayoutOrder = p0.layoutOrder
	}, {
		View = if var18 then reactModule.createElement(QRCodeSucceededViewModule, {
			qrCodeLength = 200,
			padding = 24,
			url = var17,
			isSmallScreen = p0.isSmallScreen
		}) elseif var19 then reactModule.createElement(QRCodeFailedViewModule, { padding = 24, onActivated = var15 }) else reactModule.createElement(QRCodeLoadingViewModule)
	})
end