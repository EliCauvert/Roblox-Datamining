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

return function(p0) --[[ line: 28 ]]
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), usePageSideMargin (ref), responsiveModule (ref), notificationModalsManagerModule (ref), UIBloxModule (ref), view (ref), banner (ref), enums (ref)
	local var7 = useTokens()
	local var8 = useLocalization({
		errorTitle = "Feature.Home.ClientCacheFallbackBanner.Label.Error",
		errorMessage = "Feature.Home.ClientCacheFallbackBanner.Label.RefreshPageToLoadContents",
		refreshButton = "Feature.Home.ClientCacheFallbackBanner.Action.Refresh",
		errorRefreshingToastTitle = "Feature.Home.ClientCacheFallbackBanner.Label.ErrorRefreshingToastTitle"
	})
	local var9 = reactModule.useRef(nil)
	local var10 = usePageSideMargin(var9.current)
	local var11 = responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local var12, var13 = reactModule.useState(false)
	
	return reactModule.createElement(view, {
		position = p0.Position,
		[reactModule.Change.AbsoluteSize] = p0[reactModule.Change.AbsoluteSize],
		ref = var9,
		tag = "size-full-0 auto-y"
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var10),
			PaddingRight = UDim.new(0, var10),
			PaddingTop = UDim.new(0, var7.Padding.Large),
			PaddingBottom = UDim.new(0, if var11 then 0 else var7.Padding.Large)
		}),
		BannerContent = reactModule.createElement(banner, {
			icon = enums.IconName.CircleX,
			iconVariant = enums.IconVariant.Filled,
			iconStyle = var7.Color.System.Alert,
			title = var8.errorTitle,
			body = var8.errorMessage,
			buttons = {
				{
					text = var8.refreshButton,
					isLoading = var12,
					onActivated = reactModule.useCallback(function() --[[ line: 45 ]]
						-- upvalues: var13 (ref), p0 (ref), notificationModalsManagerModule (copy), UIBloxModule (copy), var8 (ref)
						var13(true)
						p0.onRefreshButtonClick():andThen(function(_) --[[ line: 49 ]]
							-- upvalues: var13 (copy)
							var13(false)
						end):catch(function(_) --[[ line: 52 ]]
							-- upvalues: var13 (copy), notificationModalsManagerModule (copy), UIBloxModule (copy), var8 (copy)
							var13(false)
							notificationModalsManagerModule.SetUIBloxToast({
								iconImage = UIBloxModule.App.ImageSet.Images["icons/status/alert"],
								toastTitle = var8.errorRefreshingToastTitle,
								sequenceNumber = DateTime.now().UnixTimestamp
							})
						end)
					end, { p0.onRefreshButtonClick, var8.errorRefreshingToastTitle })
				}
			}
		})
	})
end