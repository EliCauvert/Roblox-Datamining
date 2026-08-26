local parent = script:FindFirstAncestor("DiscoveryAvailability").Parent
local appBloxModule = require(parent.AppBlox)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local collectionViewsModule = require(parent.CollectionViews)
local UIBloxModule = require(parent.UIBlox)
local _ = require(parent.LuauPolyfill)
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local usePageSideMargin = collectionViewsModule.usePageSideMargin
local banner = appBloxModule.Banner
local view = foundationModule.View
local enums = foundationModule.Enums
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), usePageSideMargin (ref), responsiveModule (ref), notificationModalsManagerModule (ref), UIBloxModule (ref), view (ref), banner (ref), enums (ref)
	local var1 = useTokens()
	local var2 = useLocalization({
		errorTitle = "Feature.Home.ClientCacheFallbackBanner.Label.Error",
		errorMessage = "Feature.Home.ClientCacheFallbackBanner.Label.RefreshPageToLoadContents",
		refreshButton = "Feature.Home.ClientCacheFallbackBanner.Action.Refresh",
		errorRefreshingToastTitle = "Feature.Home.ClientCacheFallbackBanner.Label.ErrorRefreshingToastTitle"
	})
	local var3 = reactModule.useRef(nil)
	local var4 = usePageSideMargin(var3.current)
	local var5 = responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local var6, var7 = reactModule.useState(false)
	
	return reactModule.createElement(view, {
		position = p1.Position,
		[reactModule.Change.AbsoluteSize] = p1[reactModule.Change.AbsoluteSize],
		ref = var3,
		tag = "size-full-0 auto-y"
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var4),
			PaddingRight = UDim.new(0, var4),
			PaddingTop = UDim.new(0, var1.Padding.Large),
			PaddingBottom = UDim.new(0, if var5 then 0 else var1.Padding.Large)
		}),
		BannerContent = reactModule.createElement(banner, {
			icon = enums.IconName.CircleX,
			iconVariant = enums.IconVariant.Filled,
			iconStyle = var1.Color.System.Alert,
			title = var2.errorTitle,
			body = var2.errorMessage,
			buttons = {
				{
					text = var2.refreshButton,
					isLoading = var6,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var7 (ref), p1 (ref), notificationModalsManagerModule (copy), UIBloxModule (copy), var2 (ref)
						var7(true)
						p1.onRefreshButtonClick():andThen(function(_)
							-- upvalues: var7 (copy)
							var7(false)
						end):catch(function(_)
							-- upvalues: var7 (copy), notificationModalsManagerModule (copy), UIBloxModule (copy), var2 (copy)
							var7(false)
							notificationModalsManagerModule.SetUIBloxToast({
								iconImage = UIBloxModule.App.ImageSet.Images["icons/status/alert"],
								toastTitle = var2.errorRefreshingToastTitle,
								sequenceNumber = DateTime.now().UnixTimestamp
							})
						end)
					end, { p1.onRefreshButtonClick, var2.errorRefreshingToastTitle })
				}
			}
		})
	})
end