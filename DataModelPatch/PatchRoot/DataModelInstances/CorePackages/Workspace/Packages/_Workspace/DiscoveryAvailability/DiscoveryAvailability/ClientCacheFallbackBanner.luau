local Parent = script:FindFirstAncestor("DiscoveryAvailability").Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local _ = require(Parent.LuauPolyfill)
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local UsePageSideMarginFunction = require(Parent.CollectionViews).usePageSideMargin
local Banner = require(Parent.AppBlox).Banner
local View = FoundationModule.View
local Enums = FoundationModule.Enums
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), UsePageSideMarginFunction (copy), ResponsiveModule (copy), NotificationModalsManagerModule (copy), UIBloxModule (copy), View (copy), Banner (copy), Enums (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		errorTitle = "Feature.Home.ClientCacheFallbackBanner.Label.Error",
		errorMessage = "Feature.Home.ClientCacheFallbackBanner.Label.RefreshPageToLoadContents",
		refreshButton = "Feature.Home.ClientCacheFallbackBanner.Action.Refresh",
		errorRefreshingToastTitle = "Feature.Home.ClientCacheFallbackBanner.Label.ErrorRefreshingToastTitle"
	})
	local UseRefResult = ReactModule.useRef(nil)
	local UsePageSideMarginResult = UsePageSideMarginFunction(UseRefResult.current)
	local UseBreakpointXOrSmallerResult = ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Small)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement(View, {
		position = p1.Position,
		[ReactModule.Change.AbsoluteSize] = p1[ReactModule.Change.AbsoluteSize],
		ref = UseRefResult,
		tag = "size-full-0 auto-y"
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, UsePageSideMarginResult),
			PaddingRight = UDim.new(0, UsePageSideMarginResult),
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Large),
			PaddingBottom = UDim.new(0, if UseBreakpointXOrSmallerResult then 0 else UseTokensResult.Padding.Large)
		}),
		BannerContent = ReactModule.createElement(Banner, {
			icon = Enums.IconName.CircleX,
			iconVariant = Enums.IconVariant.Filled,
			iconStyle = UseTokensResult.Color.System.Alert,
			title = UseLocalizationResult.errorTitle,
			body = UseLocalizationResult.errorMessage,
			buttons = {
				{
					text = UseLocalizationResult.refreshButton,
					isLoading = UseStateResult,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: UseStateResult2 (copy), p1 (copy), NotificationModalsManagerModule (upval), UIBloxModule (upval), UseLocalizationResult (copy)
						UseStateResult2(true)
						p1.onRefreshButtonClick():andThen(function(_)
							-- upvalues: UseStateResult2 (upval)
							UseStateResult2(false)
						end):catch(function(_)
							-- upvalues: UseStateResult2 (upval), NotificationModalsManagerModule (upval), UIBloxModule (upval), UseLocalizationResult (upval)
							UseStateResult2(false)
							NotificationModalsManagerModule.SetUIBloxToast({
								iconImage = UIBloxModule.App.ImageSet.Images["icons/status/alert"],
								toastTitle = UseLocalizationResult.errorRefreshingToastTitle,
								sequenceNumber = DateTime.now().UnixTimestamp
							})
						end)
					end, {
						p1.onRefreshButtonClick,
						UseLocalizationResult.errorRefreshingToastTitle
					})
				}
			}
		})
	})
end