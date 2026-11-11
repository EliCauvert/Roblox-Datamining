local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameOnAxis = RoactFitComponents.FitFrameOnAxis
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local AppPageModule = require(Modules.LuaApp.AppPage)
local FitTextLabel = RoactFitComponents.FitTextLabel
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local AXMigrateResellersCardToAutofocus = SharedFlagsModule.FFlagAXMigrateAXToGlobalAutofocus and game:DefineFastFlag("AXMigrateResellersCardToAutofocus", false)
local AXResellersCardShouldRespectWebViewAvailability = game:DefineFastFlag("AXResellersCardShouldRespectWebViewAvailability", false)
local WithStyleFunction = UIBloxModule.Style.withStyle
local AVATARPLACEHOLDERIMAGE = require(Modules.LuaApp.Constants).AVATAR_PLACEHOLDER_IMAGE
local ComponentAssetsCircle17 = Images["component_assets/circle_17"]
local _Rect = nil
local ImageRectSize = ComponentAssetsCircle17.ImageRectSize
local ScaledImagesResolutionScale = 8 * Images.ImagesResolutionScale
local ScaledImagesResolutionScale1 = 8 * Images.ImagesResolutionScale
_Rect = Rect.new(ScaledImagesResolutionScale, ScaledImagesResolutionScale1, ImageRectSize.x - ScaledImagesResolutionScale, ImageRectSize.y - ScaledImagesResolutionScale1)
local IconsStatusItemLimited = Images["icons/status/item/limited"]
local IconsCommonRobux = Images["icons/common/robux"]
local AvatarHeadShot = UserLibModule.Utils.Constants.RbxthumbTypes.AvatarHeadShot
local ResellerCard = RoactModule.PureComponent:extend("ResellerCard")

function ResellerCard.init(p1)
	-- upvalues: AppPageModule (copy), UrlBuilderModule (copy), AvatarScreen (copy), LogOnOverlayClosedFunction (copy), AXMigrateResellersCardToAutofocus (copy)
	function p1.viewProfile()
		-- upvalues: p1 (copy), AppPageModule (upval), UrlBuilderModule (upval)
		p1.props.navigateDown({
			name = AppPageModule.GenericWebPage,
			detail = UrlBuilderModule.user.profile({ userId = p1.props.sellerId }),
			extraProps = { titleKey = "CommonUI.Features.Label.Profile" }
		})
	end
	
	function p1.openPurchasePrompt()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		local UserRobux = p1.props.userRobux
		local ItemId = p1.props.itemId
		local ItemType = p1.props.itemType
		local ProductId = p1.props.productId
		local ItemPrice = p1.props.itemPrice
		local SellerId = p1.props.sellerId
		local SellerName = p1.props.sellerName
		local UserAssetId = p1.props.userAssetId
		local CollectibleInstanceId = p1.props.collectibleInstanceId
		local Navigation = p1.props.navigation
		local OnOverlayClosedResult = p1.onOverlayClosed()
		local FromContentFeedParam = Navigation.getParam("fromContentFeed")
		local FromProfileParam = Navigation.getParam("fromProfile")
		
		if ItemPrice and UserRobux and ItemPrice <= UserRobux then
			Navigation.navigate(AvatarScreen.PurchaseCatalogItem, {
				itemId = ItemId,
				itemType = ItemType,
				productId = ProductId,
				priceInRobux = ItemPrice,
				sellerId = SellerId,
				sellerName = SellerName,
				userAssetId = UserAssetId,
				collectibleInstanceId = CollectibleInstanceId,
				onOverlayClosed = OnOverlayClosedResult,
				fromProfile = FromProfileParam,
				fromContentFeed = FromContentFeedParam
			})
			
			return
		else
			Navigation.navigate(AvatarScreen.InsufficientRobuxPrompt, { onOverlayClosed = OnOverlayClosedResult })
		end
	end
	
	function p1.onOverlayClosed()
		-- upvalues: LogOnOverlayClosedFunction (upval), AXMigrateResellersCardToAutofocus (upval), p1 (copy)
		return function()
			-- upvalues: LogOnOverlayClosedFunction (upval), AXMigrateResellersCardToAutofocus (upval), p1 (upval)
			LogOnOverlayClosedFunction("ResellerCard")
			
			if not AXMigrateResellersCardToAutofocus then
				p1.props.focusController.captureFocus()
			end
		end
	end
end

function ResellerCard.render(p1)
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), AvatarHeadShot (copy), NumberLocalization (copy), WithSelectionCursorProviderFunction (copy), RoactModule (copy), FitFrameVertical (copy), RoactFitComponents (copy), AXResellersCardShouldRespectWebViewAvailability (copy), ImageSetLabel (copy), AVATARPLACEHOLDERIMAGE (copy), FitFrameOnAxis (copy), VerifiedBadgesModule (copy), ComponentAssetsCircle17 (copy), _Rect (ref), IconsStatusItemLimited (copy), FitTextLabel (copy), AXMigrateResellersCardToAutofocus (copy), ImageSetButton (copy), Focusable (copy), CursorKind (copy), IconsCommonRobux (copy), WithStyleFunction (copy)
	local SerialNumber = p1.props.serialNumber
	local SellerName = p1.props.sellerName
	local ItemPrice = p1.props.itemPrice
	local LayoutOrder = p1.props.LayoutOrder
	local Localization = p1.props.localization
	local RbxthumbWithTypeSizeAndOptions = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.props.sellerId, AvatarHeadShot, 48)
	
	return WithStyleFunction(function(p2)
		-- upvalues: ItemPrice (copy), NumberLocalization (upval), Localization (copy), WithSelectionCursorProviderFunction (upval), RoactModule (upval), FitFrameVertical (upval), RoactFitComponents (upval), LayoutOrder (copy), AXResellersCardShouldRespectWebViewAvailability (upval), p1 (copy), SerialNumber (copy), ImageSetLabel (upval), RbxthumbWithTypeSizeAndOptions (copy), AVATARPLACEHOLDERIMAGE (upval), FitFrameOnAxis (upval), VerifiedBadgesModule (upval), SellerName (copy), ComponentAssetsCircle17 (upval), _Rect (upval), IconsStatusItemLimited (upval), FitTextLabel (upval), AXMigrateResellersCardToAutofocus (upval), ImageSetButton (upval), Focusable (upval), CursorKind (upval), IconsCommonRobux (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local Color = Theme.BackgroundDefault.Color
		local Footer = _Font.Footer
		local ScaledRelativeSize = Footer.RelativeSize * _Font.BaseSize
		local LocalizeResult = NumberLocalization.localize(string.format("%.0f", ItemPrice), Localization:GetLocale())
		
		return WithSelectionCursorProviderFunction(function(Callback)
			-- upvalues: RoactModule (upval), FitFrameVertical (upval), RoactFitComponents (upval), LayoutOrder (upval), Theme (copy), AXResellersCardShouldRespectWebViewAvailability (upval), p1 (upval), SerialNumber (upval), ImageSetLabel (upval), RbxthumbWithTypeSizeAndOptions (upval), AVATARPLACEHOLDERIMAGE (upval), Color (copy), FitFrameOnAxis (upval), VerifiedBadgesModule (upval), _Font (copy), SellerName (upval), ComponentAssetsCircle17 (upval), _Rect (upval), ScaledRelativeSize (copy), IconsStatusItemLimited (upval), FitTextLabel (upval), Footer (copy), AXMigrateResellersCardToAutofocus (upval), ImageSetButton (upval), Focusable (upval), CursorKind (upval), IconsCommonRobux (upval), LocalizeResult (copy)
			return RoactModule.createElement(FitFrameVertical, {
				BorderSizePixel = 0,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 8),
				margin = RoactFitComponents.Rect.rectangle(24, 0),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				LayoutOrder = LayoutOrder,
				BackgroundColor3 = Theme.BackgroundDefault.Color
			}, {
				ProfileButton = RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					width = UDim.new(1, 0),
					onActivated = if AXResellersCardShouldRespectWebViewAvailability then if p1.props.isWebViewSupported then p1.viewProfile else nil else p1.viewProfile,
					Selectable = if AXResellersCardShouldRespectWebViewAvailability then p1.props.isWebViewSupported else nil
				}, {
					UserAndStatsFrame = RoactModule.createElement(FitFrameVertical, {
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						contentPadding = UDim.new(0, 12),
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = SerialNumber and Enum.VerticalAlignment.Bottom or Enum.VerticalAlignment.Center,
						AnchorPoint = Vector2.new(0.5, 0),
						Position = UDim2.new(0.5, 0, 0, 0)
					}, {
						UserThumbnail = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(0, 48, 0, 48),
							Image = RbxthumbWithTypeSizeAndOptions or AVATARPLACEHOLDERIMAGE
						}, {
							MaskFrame = RoactModule.createElement(ImageSetLabel, {
								BackgroundTransparency = 1,
								Image = "rbxasset://textures/ui/LuaApp/graphic/profilemask.png",
								Size = UDim2.new(1, 0, 1, 0),
								ImageColor3 = Color
							})
						}),
						SerialAndUsernameFrame = RoactModule.createElement(FitFrameOnAxis, {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							axis = FitFrameOnAxis.Axis.Both,
							contentPadding = UDim.new(0, 3),
							FillDirection = Enum.FillDirection.Vertical
						}, {
							Username = RoactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
								emoji = if p1.props.sellerHasVerifiedBadge then VerifiedBadgesModule.emoji.verified else ""
							}, {
								UsernameLabel = RoactModule.createElement("TextLabel", {
									BackgroundTransparency = 1,
									LayoutOrder = 1,
									AutomaticSize = Enum.AutomaticSize.XY,
									Font = _Font.Header2.Font,
									TextColor3 = Theme.TextEmphasis.Color,
									TextSize = _Font.Header2.RelativeSize * _Font.BaseSize,
									Text = SellerName
								})
							}),
							SerialNumberLabel = SerialNumber and RoactModule.createElement(FitFrameOnAxis, {
								BackgroundTransparency = 1,
								LayoutOrder = 2,
								axis = FitFrameOnAxis.Axis.Both,
								contentPadding = UDim.new(0, 1),
								margin = RoactFitComponents.Rect.square(4),
								FillDirection = Enum.FillDirection.Horizontal,
								VerticalAlignment = Enum.VerticalAlignment.Center,
								ImageSet = ComponentAssetsCircle17,
								ImageColor3 = Theme.UIDefault.Color,
								ImageTransparency = Theme.UIDefault.Transparency,
								ScaleType = Enum.ScaleType.Slice,
								SliceCenter = _Rect
							}, {
								LimitedIcon = RoactModule.createElement(ImageSetLabel, {
									BackgroundTransparency = 1,
									LayoutOrder = 1,
									Size = UDim2.new(0, ScaledRelativeSize, 0, ScaledRelativeSize),
									Image = IconsStatusItemLimited,
									ImageColor3 = Theme.TextEmphasis.Color
								}),
								SerialNumberText = RoactModule.createElement(FitTextLabel, {
									BackgroundTransparency = 1,
									LayoutOrder = 2,
									width = FitTextLabel.Width.FitToText,
									Size = UDim2.new(0, 0, 0, ScaledRelativeSize),
									Font = Footer.Font,
									TextColor3 = Theme.TextEmphasis.Color,
									TextSize = ScaledRelativeSize,
									Text = "#" .. SerialNumber
								})
							})
						})
					})
				}),
				BuyButton = RoactModule.createElement(if AXMigrateResellersCardToAutofocus then ImageSetButton else Focusable[ImageSetButton], {
					Size = UDim2.new(1, 0, 0, 44),
					BackgroundTransparency = 1,
					Image = ComponentAssetsCircle17,
					ImageColor3 = Theme.ContextualPrimaryDefault.Color,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(8, 8, 9, 9),
					LayoutOrder = 2,
					SelectionImageObject = Callback(CursorKind.RoundedRectNoInset),
					[RoactModule.Event.Activated] = p1.openPurchasePrompt
				}, {
					PriceFrame = RoactModule.createElement(FitFrameOnAxis, {
						BackgroundTransparency = 1,
						axis = FitFrameOnAxis.Axis.Both,
						contentPadding = UDim.new(0, 4),
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					}, {
						RobuxIcon = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(0, 25, 0, 25),
							Image = IconsCommonRobux,
							ImageColor3 = Theme.ContextualPrimaryContent.Color,
							ImageTransparency = Theme.ContextualPrimaryContent.Transparency
						}),
						Price = RoactModule.createElement(FitTextLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							width = FitTextLabel.Width.FitToText,
							Font = _Font.Header2.Font,
							TextColor3 = Theme.ContextualPrimaryContent.Color,
							TextTransparency = Theme.ContextualPrimaryContent.Transparency,
							TextSize = _Font.Header2.RelativeSize * _Font.BaseSize,
							Text = LocalizeResult
						})
					})
				})
			})
		end)
	end)
end

local WithNavigationResult = WithNavigationFunction((RoactServices.connect({ localization = RoactLocalizationModule })((RoactRoduxModule.connect(function(p1, p2)
	local User = p1.Users[p2.sellerId]
	
	return {
		userRobux = p1.UserRobux[p1.LocalUserId],
		userName = User and User.name
	}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
				
				return
			else
				Callback(NavigateDownModule(p1))
			end
		end
	}
end or nil)(ResellerCard)))))

return if AXResellersCardShouldRespectWebViewAvailability then function(Tbl)
	-- upvalues: UseAppPolicyFunction (copy), ReactModule (copy), WithNavigationResult (ref)
	local Copy = table.clone(Tbl)
	Tbl.isWebViewSupported = UseAppPolicyFunction(function(p1)
		return p1.getWebViewSupport()
	end)
	
	return ReactModule.createElement(WithNavigationResult, Copy)
end else WithNavigationResult