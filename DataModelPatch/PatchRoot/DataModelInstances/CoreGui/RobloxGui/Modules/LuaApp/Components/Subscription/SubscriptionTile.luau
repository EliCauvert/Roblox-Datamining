local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useLocalUserId
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Button = UIBloxModule.App.Button.Button
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local FoundationModule = require(CorePackages.Packages.Foundation)
local Text = FoundationModule.Text
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local Enums = FoundationModule.Enums
local FetchExperienceStoreProductsModule = require(Modules.LuaApp.Thunks.Economy.FetchExperienceStoreProducts)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local SetSubscriptionStatusesModule = require(Modules.LuaApp.Actions.Subscription.SetSubscriptionStatuses)
local MoreMenuModule = require(Modules.LuaApp.Components.Subscription.MoreMenu)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local PostReportSubscriptionModule = require(Modules.LuaApp.Http.Requests.EconomyAPI.PostReportSubscription)
local NavigateDownToSubscriptionPurchaseModule = require(Modules.LuaApp.Thunks.Subscription.NavigateDownToSubscriptionPurchase)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local EdpStoreAnalyticsModule = require(CorePackages.Workspace.Packages.EdpStoreAnalytics)
local Constants = EdpStoreAnalyticsModule.Constants
local GetFFlagEnableEdpStoreClickLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging)
local GetFFlagEnableDevSubsInRobuxModule = require(Modules.LuaApp.Flags.GetFFlagEnableDevSubsInRobux)
local FFlagHideDevSubsPriceIfSubscribed = require(CorePackages.Workspace.Packages.SharedFlags).FFlagHideDevSubsPriceIfSubscribed
local OpenCentralOverlayForUnifiedPurchasePromptModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local ProductPurchaseSurface = require(CorePackages.Workspace.Packages.PurchasePromptLite).Enums.ProductPurchaseSurface
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagIntegrateDiscountsWithEDP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagIntegrateDiscountsWithEDP
local _ = require(Modules.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel)

return function(p1)
	-- upvalues: ReactModule (copy), UseDesignTokensFunction (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), GetFFlagEnableDevSubsInRobuxModule (copy), UseLocalUserIdFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), PostReportSubscriptionModule (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), CloseCentralOverlayModule (copy), OpenCentralOverlayForUnifiedPurchasePromptModule (copy), SetSubscriptionStatusesModule (copy), FFlagIntegrateDiscountsWithEDP (copy), FetchExperienceStoreProductsModule (copy), ProductPurchaseSurface (copy), GetFFlagEnableEdpStoreClickLoggingModule (copy), EdpStoreAnalyticsModule (copy), Constants (copy), NavigateDownToSubscriptionPurchaseModule (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), StyledTextLabel (copy), FFlagHideDevSubsPriceIfSubscribed (copy), Text (copy), GetIconRichTextFunction (copy), Enums (copy), Button (copy), MoreMenuModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Semantic = UseDesignTokensResult.Semantic
	local Subheader = Semantic.Typography.Subheader
	local CaptionBody = Semantic.Typography.CaptionBody
	local Color = Semantic.Color
	local Medium = Semantic.Radius.Medium
	local XLarge = Semantic.Icon.Size.XLarge
	local Global = UseDesignTokensResult.Global
	local Size450 = Global.Size_450
	local Space300 = Global.Space_300
	local Space300_1 = Global.Space_300
	local Space150 = Global.Space_150
	local Space150_1 = Global.Space_150
	local ScaledLineHeight = Subheader.LineHeight * Subheader.FontSize
	local Y = ScaledLineHeight * 2
	local ScaledLineHeight1 = CaptionBody.LineHeight * CaptionBody.FontSize
	local SubscriptionProduct = p1.subscriptionProduct
	local ThumbnailString = p1.thumbnailString
	local IsSubscribed = p1.isSubscribed
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		subscribed = "Feature.Subscription.Text.Subscribed",
		seeMore = "Feature.Subscription.Action.SeeMore",
		reportSubscription = "Feature.Subscription.Action.ReportSubscription",
		reportSubscriptionSubmitted = "Feature.Subscription.Message.ReportSubmitted",
		somethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong",
		subscribe = "Feature.Subscription.Action.Subscribe",
		pricePerMonth = {
			"Feature.Subscription.Email.PricePerMonthLabel",
			purchasePrice = SubscriptionProduct.displayPrice
		},
		pricePerMonthRobux = if GetFFlagEnableDevSubsInRobuxModule() and SubscriptionProduct.priceInRobux ~= nil then {
			"Feature.Subscription.Email.PricePerMonthLabel",
			purchasePrice = tostring(SubscriptionProduct.priceInRobux)
		} else nil
	})
	local Subscribed = if IsSubscribed then UseLocalizationResult.subscribed else UseLocalizationResult.pricePerMonth
	local Subscribed1 = if IsSubscribed then UseLocalizationResult.subscribed else UseLocalizationResult.subscribe
	local IsPriceInRobuxAbove: boolean = GetFFlagEnableDevSubsInRobuxModule() and (SubscriptionProduct.priceInRobux ~= nil and SubscriptionProduct.priceInRobux > 0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local ButtonProps = {
		{
			text = UseLocalizationResult.reportSubscription,
			onActivated = function()
				-- upvalues: PostReportSubscriptionModule (upval), UseRoactServiceModuleResult (copy), SubscriptionProduct (copy), UseLocalUserIdResult (copy), UseDispatchResult (copy), SetCurrentToastMessageModule (upval), UseLocalizationResult (copy), ToastTypeModule (upval), UseStateResult2_2 (copy)
				PostReportSubscriptionModule(UseRoactServiceModuleResult, SubscriptionProduct.subscriptionTargetKey, UseLocalUserIdResult):andThen(function(_)
					-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageModule (upval), UseLocalizationResult (upval), ToastTypeModule (upval)
					UseDispatchResult(SetCurrentToastMessageModule({
						isLocalized = true,
						toastMessage = UseLocalizationResult.reportSubscriptionSubmitted,
						toastType = ToastTypeModule.SuccessConfirmation
					}))
				end, function(_)
					-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageModule (upval), UseLocalizationResult (upval), ToastTypeModule (upval)
					UseDispatchResult(SetCurrentToastMessageModule({
						isLocalized = true,
						toastMessage = UseLocalizationResult.somethingIsWrong,
						toastType = ToastTypeModule.NetworkingError
					}))
				end)
				UseStateResult2_2(false)
			end,
			fontStyle = {
				RelativeSize = 0.625,
				RelativeMinSize = 0.625,
				Font = CaptionBody.Font
			},
			textOnlyPadding = Space150
		}
	}
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayModule (upval), OpenCentralOverlayForUnifiedPurchasePromptModule (upval), SubscriptionProduct (copy), IsPriceInRobuxAbove (copy), SetSubscriptionStatusesModule (upval), FFlagIntegrateDiscountsWithEDP (upval), FetchExperienceStoreProductsModule (upval), UseRoactServiceModuleResult (copy), ProductPurchaseSurface (upval)
		UseDispatchResult(OpenCentralOverlayForUnifiedPurchasePromptModule({
			productPayload = {
				kind = "DeveloperSubscription",
				subscriptionId = SubscriptionProduct.subscriptionTargetKey,
				name = SubscriptionProduct.name,
				expectedPrice = SubscriptionProduct.priceInRobux or 0,
				iconImageAssetId = SubscriptionProduct.iconImageAssetId,
				isSubscriptionInRobux = IsPriceInRobuxAbove,
				displayPrice = if IsPriceInRobuxAbove then nil else SubscriptionProduct.displayPrice
			},
			purchaseCallbacks = {
				onFlowComplete = function()
					-- upvalues: UseDispatchResult (upval), CloseCentralOverlayModule (upval)
					UseDispatchResult(CloseCentralOverlayModule())
				end,
				onPurchaseSuccess = function()
					-- upvalues: UseDispatchResult (upval), SetSubscriptionStatusesModule (upval), SubscriptionProduct (upval)
					UseDispatchResult(SetSubscriptionStatusesModule({
						[SubscriptionProduct.subscriptionTargetKey] = { isSubscribed = true, isRenewing = true }
					}))
				end,
				onRobloxSubscriptionUpsellSuccess = if FFlagIntegrateDiscountsWithEDP then function()
					-- upvalues: UseDispatchResult (upval), FetchExperienceStoreProductsModule (upval), UseRoactServiceModuleResult (upval), SubscriptionProduct (upval)
					UseDispatchResult(FetchExperienceStoreProductsModule(UseRoactServiceModuleResult, SubscriptionProduct.subscriptionProviderId))
				end else nil
			},
			purchaseAnalyticsMetadata = {
				surface = ProductPurchaseSurface.EDP,
				productUniverseId = SubscriptionProduct.subscriptionProviderId
			}
		}))
	end, { SubscriptionProduct, IsPriceInRobuxAbove })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: GetFFlagEnableEdpStoreClickLoggingModule (upval), EdpStoreAnalyticsModule (upval), Constants (upval), SubscriptionProduct (copy), UseDispatchResult (copy), NavigateDownToSubscriptionPurchaseModule (upval), ThumbnailString (copy), IsSubscribed (copy), p1 (copy)
		if GetFFlagEnableEdpStoreClickLoggingModule() then
			EdpStoreAnalyticsModule.EdpStoreAnalyticsLogger.logEvent(Constants.StoreEnums.ActionType.PurchaseAttemptClick, Constants.StoreEnums.ProductType.Subscriptions, Constants.StoreEnums.LocationType.Store, tonumber(SubscriptionProduct.subscriptionProviderId), nil, (tostring(SubscriptionProduct.subscriptionTargetKey)))
		end
		UseDispatchResult(NavigateDownToSubscriptionPurchaseModule(SubscriptionProduct, ThumbnailString, IsSubscribed, p1.creatorName, p1.creatorVerified))
	end, { SubscriptionProduct, ThumbnailString, IsSubscribed })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), UseResult (copy), UseResult1 (copy)
		if FFlagEnableUnifiedPurchaseFlowForDevSubs then
			UseResult()
			
			return
		else
			UseResult1()
		end
	end, { UseResult1, UseResult })
	
	if GetFFlagEnableDevSubsInRobuxModule() then
		local PricePerMonthRobux = if IsPriceInRobuxAbove then UseLocalizationResult.pricePerMonthRobux else UseLocalizationResult.pricePerMonth
		
		return ReactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color.BackgroundUi.Default.Color3,
			BackgroundTransparency = Color.BackgroundUi.Default.Transparency
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 0),
				PaddingLeft = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12)
			}),
			UICorners = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			TileContent = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 12)
				}),
				TopSection = ReactModule.createElement("TextButton", {
					Size = UDim2.new(1, 0, 0, 72),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Text = "",
					AutoButtonColor = false,
					LayoutOrder = 0,
					[ReactModule.Event.Activated] = UseResult1
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, 12),
						VerticalAlignment = Enum.VerticalAlignment.Top
					}),
					Thumbnail = ReactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 0,
						Size = UDim2.fromOffset(72, 72),
						Image = ThumbnailString
					}, {
						UICorners = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
					}),
					TextContent = ReactModule.createElement("Frame", {
						Size = UDim2.new(1, -84, 1, 0),
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						[ReactModule.Change.AbsoluteSize] = function(Frame)
							-- upvalues: UseStateResult2 (copy)
							UseStateResult2(Frame.AbsoluteSize.X)
						end
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Vertical,
							Padding = UDim.new(0, 6)
						}),
						SubscriptionTitle = ReactModule.createElement(StyledTextLabel, {
							fluidSizing = false,
							richText = false,
							textWrapped = false,
							layoutOrder = 0,
							maxSize = Vector2.new(UseStateResult, ScaledLineHeight),
							fontStyle = Subheader,
							colorStyle = Color.Text.Emphasis,
							lineHeight = Subheader.LineHeight,
							textTruncate = Enum.TextTruncate.AtEnd,
							text = SubscriptionProduct.name,
							onAbsoluteSizeChange = function(Frame)
								-- upvalues: UseStateResult2_1 (copy), ScaledLineHeight (copy)
								UseStateResult2_1(Frame.AbsoluteSize.Y / ScaledLineHeight)
							end
						}),
						Description = ReactModule.createElement(StyledTextLabel, {
							fluidSizing = false,
							richText = false,
							textWrapped = true,
							layoutOrder = 1,
							maxSize = Vector2.new(UseStateResult, if IsSubscribed and FFlagHideDevSubsPriceIfSubscribed then ScaledLineHeight1 * 2 else ScaledLineHeight1),
							fontStyle = CaptionBody,
							colorStyle = Color.Text.Muted,
							textTruncate = Enum.TextTruncate.AtEnd,
							lineHeight = CaptionBody.LineHeight,
							text = SubscriptionProduct.description
						}),
						PriceText = if IsSubscribed and FFlagHideDevSubsPriceIfSubscribed then nil else ReactModule.createElement(Text, {
							tag = "auto-xy content-emphasis text-body-medium",
							LayoutOrder = 2,
							Text = if IsPriceInRobuxAbove then GetIconRichTextFunction(Enums.IconName.Robux) .. " " .. PricePerMonthRobux else PricePerMonthRobux,
							RichText = IsPriceInRobuxAbove
						})
					})
				}),
				SubscribeButton = ReactModule.createElement(Button, {
					layoutOrder = 1,
					size = UDim2.new(1, 0, 0, 32),
					text = Subscribed1,
					isDisabled = IsSubscribed,
					onActivated = UseResult2
				})
			})
		})
	else
		return ReactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color.BackgroundUi.Default.Color3,
			BackgroundTransparency = Color.BackgroundUi.Default.Transparency
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, Space300_1),
				PaddingBottom = UDim.new(0, Space300_1),
				PaddingLeft = UDim.new(0, Space300_1),
				PaddingRight = UDim.new(0, Space300_1)
			}),
			UICorners = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Medium) }),
			TileContent = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, Space150_1)
				}),
				SubscriptionInfoFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 0,
					Size = UDim2.new(1, 0, 0, 128)
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, Space300)
					}),
					Thumbnail = ReactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.fromOffset(XLarge, XLarge),
						Image = ThumbnailString
					}, {
						UICorners = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Medium) })
					}),
					TextContent = ReactModule.createElement("Frame", {
						Size = UDim2.new(1, -XLarge - Space300, 0, 0),
						BackgroundTransparency = 1,
						[ReactModule.Change.AbsoluteSize] = function(Frame)
							-- upvalues: UseStateResult2 (copy)
							UseStateResult2(Frame.AbsoluteSize.X)
						end
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Vertical,
							Padding = UDim.new(0, Space150)
						}),
						SubscriptionTitle = ReactModule.createElement(StyledTextLabel, {
							fluidSizing = false,
							richText = false,
							textWrapped = true,
							layoutOrder = 0,
							maxSize = Vector2.new(UseStateResult, Y),
							fontStyle = Subheader,
							colorStyle = Color.Text.Emphasis,
							lineHeight = Subheader.LineHeight,
							textTruncate = Enum.TextTruncate.AtEnd,
							text = SubscriptionProduct.name,
							onAbsoluteSizeChange = function(Frame)
								-- upvalues: UseStateResult2_1 (copy), ScaledLineHeight (copy)
								UseStateResult2_1(Frame.AbsoluteSize.Y / ScaledLineHeight)
							end
						}),
						Description = ReactModule.createElement(StyledTextLabel, {
							fluidSizing = false,
							richText = false,
							textWrapped = true,
							layoutOrder = 1,
							maxSize = Vector2.new(UseStateResult, ScaledLineHeight1 * (5 - UseStateResult1)),
							fontStyle = CaptionBody,
							colorStyle = Color.Text.Emphasis,
							textTruncate = Enum.TextTruncate.AtEnd,
							lineHeight = CaptionBody.LineHeight,
							text = SubscriptionProduct.description
						}),
						SeeMore = ReactModule.createElement("TextButton", {
							Size = UDim2.new(1, 0, 0, 0),
							Text = UseLocalizationResult.seeMore,
							AutomaticSize = Enum.AutomaticSize.Y,
							TextXAlignment = Enum.TextXAlignment.Left,
							BackgroundTransparency = 1,
							TextColor3 = Color.Text.Emphasis.Color,
							TextSize = CaptionBody.FontSize,
							Font = CaptionBody.Font,
							LayoutOrder = 2,
							[ReactModule.Event.Activated] = UseResult1
						})
					})
				}),
				PurchaseButton = ReactModule.createElement(Button, {
					layoutOrder = 1,
					size = UDim2.new(1, 0, 0, Size450),
					text = Subscribed,
					isDisabled = IsSubscribed,
					onActivated = UseResult2
				})
			}),
			MoreMenuButton = ReactModule.createElement(MoreMenuModule, {
				screenSize = p1.screenSize,
				buttonProps = ButtonProps,
				showMenu = UseStateResult3,
				onDismiss = function()
					-- upvalues: UseStateResult2_2 (copy)
					UseStateResult2_2(false)
				end,
				onActivated = function()
					-- upvalues: UseStateResult2_2 (copy), UseStateResult3 (copy)
					UseStateResult2_2(not UseStateResult3)
				end
			})
		})
	end
end