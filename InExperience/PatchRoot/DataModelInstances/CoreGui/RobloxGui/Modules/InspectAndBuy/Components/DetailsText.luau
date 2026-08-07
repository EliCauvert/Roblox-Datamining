local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local images = UIBloxModule.App.ImageSet.Images
local iconSize = UIBloxModule.App.Constant.IconSize
local notificationModule = require(parent.Components.Notification)
local favoritesModule = require(parent.Components.Favorites)
local utilityFunctionsModule = require(parent.UtilityFunctions)
local colorsModule = require(parent.Colors)
local constantsModule = require(parent.Constants)
local getSelectionImageObjectRegularModule = require(parent.getSelectionImageObjectRegular)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local premium = images["icons/status/premium"]
local detailsText = roactModule.PureComponent:extend("DetailsText")

function detailsText.init(p0) --[[ line: 29 ]]
	-- upvalues: getSelectionImageObjectRegularModule (ref)
	p0.name = ""
	p0.creator = ""
	p0.selectedImage = getSelectionImageObjectRegularModule()
end

function detailsText.setText(value) --[[ line: 39 ]]
	-- upvalues: utilityFunctionsModule (ref)
	local assetInfo = value.props.assetInfo or {}
	local bundleInfo = value.props.bundleInfo or {}
	
	if assetInfo.parentBundleId ~= nil then
		local bundleId = utilityFunctionsModule.getBundleId(assetInfo)
		
		if bundleInfo[bundleId] then
			value.name = bundleInfo[bundleId].name or ""
			value.creator = bundleInfo[bundleId].creatorName or ""
			
			return
		end
	elseif assetInfo then
		value.name = assetInfo.name or ""
		value.creator = assetInfo.creatorName or ""
	end
end

function detailsText.render(p1) --[[ line: 58 ]]
	-- upvalues: iconSize (ref), constantsModule (ref), utilityFunctionsModule (ref), roactModule (ref), inspectAndBuyContextModule (ref), notificationModule (ref), cryoModule (ref), premium (ref), appFonts (ref), colorsModule (ref), favoritesModule (ref)
	p1:setText()
	local view = p1.props.view
	local showFavoritesCount = p1.props.showFavoritesCount
	local assetInfo = p1.props.assetInfo or {}
	local var17 = assetInfo.parentBundleId ~= nil
	local var18 = var17 and #p1.props.assetBundles[assetInfo.assetId] > 1
	local var19 = assetInfo.premiumPricing ~= nil
	local var20 = if var19 then iconSize.Regular + 5 else 0
	local var21 = constantsModule.LayeredAssetTypes[assetInfo.assetTypeId] ~= nil and (p1.props.localPlayerModel and p1.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6)
	local var22 = utilityFunctionsModule.isLimited1Point0(assetInfo)
	local layeredClothingOnR6Key = nil
	
	if var18 then
		layeredClothingOnR6Key = constantsModule.NotificationKeys.MultipleBundleNoticeKey
	elseif var17 then
		layeredClothingOnR6Key = constantsModule.NotificationKeys.SingleBundleNoticeKey
	elseif var22 then
		layeredClothingOnR6Key = constantsModule.NotificationKeys.LimitedItemNoticeKey
	elseif var21 then
		layeredClothingOnR6Key = constantsModule.NotificationKeys.LayeredClothingOnR6Key
	end
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p2) --[[ line: 87 ]]
			-- upvalues: view (ref), roactModule (copy), layeredClothingOnR6Key (write), notificationModule (copy), var19 (ref), cryoModule (copy), premium (copy), iconSize (copy), var20 (ref), p1 (ref), appFonts (copy), colorsModule (copy), showFavoritesCount (ref), favoritesModule (copy)
			return roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Position = p2[view].DetailsFramePosition,
				Size = UDim2.new(1, 0, 0, 131)
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					FillDirection = Enum.FillDirection.Vertical
				}),
				Notification = layeredClothingOnR6Key and roactModule.createElement(notificationModule, { noticeKey = layeredClothingOnR6Key }),
				AssetName = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, -10, 0, 50)
				}, {
					PremiumIcon = var19 and roactModule.createElement("ImageLabel", cryoModule.Dictionary.join(premium, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 0, 0.5, 0),
						Size = UDim2.new(0, iconSize.Regular, 0, iconSize.Regular),
						ImageColor3 = Color3.new(1, 1, 1)
					})) or nil,
					PlayerName = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						TextScaled = true,
						TextSize = 20,
						Position = UDim2.new(0, var20, 0, 0),
						Size = UDim2.new(1, var20, 0, 50),
						Text = p1.name or "",
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						Font = appFonts.default:getBold(),
						TextColor3 = colorsModule.White
					}, {
						UITextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = 32 })
					})
				}) or roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					TextScaled = true,
					TextSize = 20,
					Size = UDim2.new(1, -10, 0, 50),
					Text = p1.name or "",
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = appFonts.default:getBold(),
					TextColor3 = colorsModule.White
				}, {
					UITextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = 32 })
				}),
				FavoriteContainer = showFavoritesCount and roactModule.createElement(favoritesModule)
			})
		end
	})
end

return roactRoduxModule.connect(function(p3, _) --[[ line: 158 ]]
	return {
		view = p3.view,
		locale = p3.locale,
		assetInfo = p3.assets[p3.detailsInformation.assetId],
		bundleInfo = p3.bundles,
		assetBundles = p3.assetBundles,
		showFavoritesCount = not p3.isSubjectToChinaPolicies
	}
end)(detailsText)