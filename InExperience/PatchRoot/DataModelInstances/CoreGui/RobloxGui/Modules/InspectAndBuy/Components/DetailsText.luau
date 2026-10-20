local CorePackages = game:GetService("CorePackages")
local Parent = script.Parent.Parent
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local IconSize = UIBloxModule.App.Constant.IconSize
local NotificationModule = require(Parent.Components.Notification)
local FavoritesModule = require(Parent.Components.Favorites)
local UtilityFunctionsModule = require(Parent.UtilityFunctions)
local ColorsModule = require(Parent.Colors)
local ConstantsModule = require(Parent.Constants)
local GetSelectionImageObjectRegularModule = require(Parent.getSelectionImageObjectRegular)
local InspectAndBuyContextModule = require(Parent.Components.InspectAndBuyContext)
local IconsStatusPremium = UIBloxModule.App.ImageSet.Images["icons/status/premium"]
local DetailsText = RoactModule.PureComponent:extend("DetailsText")

function DetailsText.init(p1)
	-- upvalues: GetSelectionImageObjectRegularModule (copy)
	p1.name = ""
	p1.creator = ""
	p1.selectedImage = GetSelectionImageObjectRegularModule()
end

function DetailsText.setText(p1)
	-- upvalues: UtilityFunctionsModule (copy)
	local AssetInfo = p1.props.assetInfo or {}
	local BundleInfo = p1.props.bundleInfo or {}
	
	if AssetInfo.parentBundleId ~= nil then
		local BundleId = UtilityFunctionsModule.getBundleId(AssetInfo)
		
		if BundleInfo[BundleId] then
			p1.name = BundleInfo[BundleId].name or ""
			p1.creator = BundleInfo[BundleId].creatorName or ""
			
			return
		end
	elseif AssetInfo then
		p1.name = AssetInfo.name or ""
		p1.creator = AssetInfo.creatorName or ""
	end
end

function DetailsText.render(p1)
	-- upvalues: IconSize (copy), ConstantsModule (copy), UtilityFunctionsModule (copy), RoactModule (copy), InspectAndBuyContextModule (copy), NotificationModule (copy), CryoModule (copy), IconsStatusPremium (copy), AppFonts (copy), ColorsModule (copy), FavoritesModule (copy)
	p1:setText()
	local View = p1.props.view
	local ShowFavoritesCount = p1.props.showFavoritesCount
	local AssetInfo = p1.props.assetInfo or {}
	local HasParentBundleId = AssetInfo.parentBundleId ~= nil
	local AssetBundle = p1.props.assetBundles[AssetInfo.assetId]
	local v1: boolean = HasParentBundleId and #AssetBundle > 1
	local HasPremiumPricing = AssetInfo.premiumPricing ~= nil
	local NewRegular: number = HasPremiumPricing and IconSize.Regular + 5 or 0
	local IsRigTypeMatch: boolean = ConstantsModule.LayeredAssetTypes[AssetInfo.assetTypeId] ~= nil and (p1.props.localPlayerModel and p1.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6)
	local IsLimited1Point0 = UtilityFunctionsModule.isLimited1Point0(AssetInfo)
	local MultipleBundleNoticeKey = if v1 then ConstantsModule.NotificationKeys.MultipleBundleNoticeKey elseif HasParentBundleId then ConstantsModule.NotificationKeys.SingleBundleNoticeKey elseif IsLimited1Point0 then ConstantsModule.NotificationKeys.LimitedItemNoticeKey elseif IsRigTypeMatch then ConstantsModule.NotificationKeys.LayeredClothingOnR6Key else nil
	
	return RoactModule.createElement(InspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: View (copy), RoactModule (upval), MultipleBundleNoticeKey (ref), NotificationModule (upval), HasPremiumPricing (copy), CryoModule (upval), IconsStatusPremium (upval), IconSize (upval), NewRegular (copy), p1 (copy), AppFonts (upval), ColorsModule (upval), ShowFavoritesCount (copy), FavoritesModule (upval)
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Position = p2[View].DetailsFramePosition,
				Size = UDim2.new(1, 0, 0, 131)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					FillDirection = Enum.FillDirection.Vertical
				}),
				Notification = MultipleBundleNoticeKey and RoactModule.createElement(NotificationModule, { noticeKey = MultipleBundleNoticeKey }),
				AssetName = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, -10, 0, 50)
				}, {
					PremiumIcon = HasPremiumPricing and RoactModule.createElement("ImageLabel", CryoModule.Dictionary.join(IconsStatusPremium, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 0, 0.5, 0),
						Size = UDim2.new(0, IconSize.Regular, 0, IconSize.Regular),
						ImageColor3 = Color3.new(1, 1, 1)
					})) or nil,
					PlayerName = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						TextScaled = true,
						TextSize = 20,
						Position = UDim2.new(0, NewRegular, 0, 0),
						Size = UDim2.new(1, NewRegular, 0, 50),
						Text = p1.name or "",
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						Font = AppFonts.default:getBold(),
						TextColor3 = ColorsModule.White
					}, {
						UITextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = 32 })
					})
				}) or RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					TextScaled = true,
					TextSize = 20,
					Size = UDim2.new(1, -10, 0, 50),
					Text = p1.name or "",
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = AppFonts.default:getBold(),
					TextColor3 = ColorsModule.White
				}, {
					UITextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = 32 })
				}),
				FavoriteContainer = ShowFavoritesCount and RoactModule.createElement(FavoritesModule)
			})
		end
	})
end

return RoactRoduxModule.connect(function(p1, _)
	return {
		view = p1.view,
		locale = p1.locale,
		assetInfo = p1.assets[p1.detailsInformation.assetId],
		bundleInfo = p1.bundles,
		assetBundles = p1.assetBundles,
		showFavoritesCount = not p1.isSubjectToChinaPolicies
	}
end)(DetailsText)