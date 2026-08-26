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

return function(p1)
	-- upvalues: useAnalyticsModule (ref), useLoadingStateModule (ref), useGetProfileShareUrlModule (ref), useRefreshQrSessionModule (ref), useShortUrlModule (ref), networkStatus (ref), reactModule (ref), eventNamesModule (ref), useEffectOnce (ref), useHasLoadedSuccessfullyModule (ref), useHasFailedToLoadModule (ref), QRCodeSucceededViewModule (ref), QRCodeFailedViewModule (ref), QRCodeLoadingViewModule (ref)
	local var1 = useAnalyticsModule()
	local var2 = useLoadingStateModule()
	local var3 = useGetProfileShareUrlModule()
	local var4 = useRefreshQrSessionModule()
	local var5 = useShortUrlModule()
	local var6 = var5 ~= nil
	local var7 = var2 == networkStatus.Failed
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var1 (ref), eventNamesModule (copy)
		var4():andThen(function(p2)
			-- upvalues: var1 (copy), eventNamesModule (copy)
			var1.fireEvent(eventNamesModule.RefreshQrSession, {
				success = (if p2 then p2.responseBody else {}).Success,
				responseCode = p2 and p2.responseCode
			})
		end)
	end, {})
	useEffectOnce(var3, not var6)
	useHasLoadedSuccessfullyModule(var1, var6)
	useHasFailedToLoadModule(var1, var7)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 304, 0, if p1.isSmallScreen then 280 else 304),
		LayoutOrder = p1.layoutOrder
	}, {
		View = if var6 then reactModule.createElement(QRCodeSucceededViewModule, {
			qrCodeLength = 200,
			padding = 24,
			url = var5,
			isSmallScreen = p1.isSmallScreen
		}) elseif var7 then reactModule.createElement(QRCodeFailedViewModule, { padding = 24, onActivated = var3 }) else reactModule.createElement(QRCodeLoadingViewModule)
	})
end