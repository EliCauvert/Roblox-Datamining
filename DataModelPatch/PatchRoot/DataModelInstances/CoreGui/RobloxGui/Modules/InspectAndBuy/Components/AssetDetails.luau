local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local DetailsTextModule = require(Parent.Components.DetailsText)
local DetailsThumbnailModule = require(Parent.Components.DetailsThumbnail)
local DetailsDescriptionModule = require(Parent.Components.DetailsDescription)
local DetailsButtonsModule = require(Parent.Components.DetailsButtons)
local TryOnViewportModule = require(Parent.Components.TryOnViewport)
local OpenOverlayModule = require(Parent.Actions.OpenOverlay)
local OverlayModule = require(Parent.Enums.Overlay)
local GetAssetBundlesModule = require(Parent.Thunks.GetAssetBundles)
local ReportOpenDetailsPageModule = require(Parent.Thunks.ReportOpenDetailsPage)
local GetEconomyProductInfoModule = require(Parent.Thunks.GetEconomyProductInfo)
local GetCollectibleResellableInstancesModule = require(Parent.Thunks.GetCollectibleResellableInstances)
local ColorsModule = require(Parent.Colors)
local ConstantsModule = require(Parent.Constants)
local UtilityFunctionsModule = require(Parent.UtilityFunctions)
local TutilsModule = require(CorePackages.Packages.tutils)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ItemInfoList = require(CorePackages.Workspace.Packages.ItemDetails).ItemInfoList
local AttributionConstantsModule = require(Parent.AttributionConstants)
local InspectAndBuyContextModule = require(Parent.Components.InspectAndBuyContext)
local GetFFlagDisplayCollectiblesIconModule = require(Parent.Flags.GetFFlagDisplayCollectiblesIcon)
local GetItemDetailsModule = require(Parent.Thunks.GetItemDetails)
local SetAssetFromBundleInfoModule = require(Parent.Actions.SetAssetFromBundleInfo)
local ThemeModule = require(CoreGui.RobloxGui.Modules.Settings.Theme)
local ControllerBarHeight = require(CoreGui.RobloxGui.Modules.InGameMenuConstants).ControllerBarHeight
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local AssetDetails = RoactModule.PureComponent:extend("AssetDetails")

function AssetDetails.setScrollingEnabled(p1, ScrollingEnabled)
	if p1.state.scrollingEnabled ~= ScrollingEnabled then
		p1:setState({ scrollingEnabled = ScrollingEnabled })
	end
end

function AssetDetails.getInfoRowProps(p1)
	-- upvalues: RobloxTranslatorModule (copy), AttributionConstantsModule (copy), OverlayModule (copy), RoactModule (copy), ConstantsModule (copy)
	local AssetInfo = p1.props.assetInfo or {}
	local Locale = p1.props.locale
	local HasParentBundleId = AssetInfo.parentBundleId ~= nil
	local config = {
		LayoutOrder = 1,
		Selectable = false,
		infoName = RobloxTranslatorModule:FormatByKeyForLocale("Feature.Catalog.Label.Filter.Creator", Locale),
		infoData = AssetInfo.creatorName or "",
		hasVerifiedBadge = AssetInfo.creatorHasVerifiedBadge
	}
	local v1 = nil
	local CreatingUniverseId = AssetInfo.creatingUniverseId
	
	if CreatingUniverseId then
		local CreatingExperience = p1.props.creatingExperiences[CreatingUniverseId]
		
		if CreatingExperience and AttributionConstantsModule.ShowPlayableAttributionMapper[CreatingExperience.playabilityStatus] then
			v1 = {
				infoName = RobloxTranslatorModule:FormatByKeyForLocale("Feature.Catalog.Label.Attribution", Locale),
				infoData = CreatingExperience.name or "",
				onActivate = function()
					-- upvalues: p1 (copy), OverlayModule (upval), CreatingExperience (copy)
					p1.props.openOverlay(OverlayModule.AttributionTraversal, CreatingExperience)
				end,
				LayoutOrder = 2,
				[RoactModule.Ref] = p1.attributionRef,
				Selectable = true
			}
		end
	end
	local FeatureCatalogLabelBundle = nil
	
	if HasParentBundleId then
		FeatureCatalogLabelBundle = RobloxTranslatorModule:FormatByKeyForLocale("Feature.Catalog.Label.Bundle", Locale)
	else
		local AssetCategoriesLocalizedEntry = ConstantsModule.AssetCategoriesLocalized[ConstantsModule.AssetTypeIdToCategory[AssetInfo.assetTypeId]]
		local AssetTypeIdToTypeLocalizedEntry = ConstantsModule.AssetTypeIdToTypeLocalized[AssetInfo.assetTypeId]
		
		if AssetCategoriesLocalizedEntry and AssetTypeIdToTypeLocalizedEntry then
			FeatureCatalogLabelBundle = RobloxTranslatorModule:FormatByKeyForLocale(AssetCategoriesLocalizedEntry, Locale) .. " | " .. RobloxTranslatorModule:FormatByKeyForLocale(AssetTypeIdToTypeLocalizedEntry, Locale)
		end
	end
	return {
		config,
		v1,
		{
			LayoutOrder = 3,
			Selectable = false,
			infoName = RobloxTranslatorModule:FormatByKeyForLocale("Feature.Catalog.Label.CategoryType", Locale),
			infoData = FeatureCatalogLabelBundle
		}
	}
end

function AssetDetails.init(p1)
	-- upvalues: RoactModule (copy)
	p1.state = { scrollingEnabled = true }
	p1.attributionRef = RoactModule.createRef()
end

function AssetDetails.willUpdate(p1, p2)
	-- upvalues: UtilityFunctionsModule (copy), TutilsModule (copy)
	if UtilityFunctionsModule.isCollectibles(p1.props.assetInfo) then
		local CollectibleItemId = p1.props.assetInfo.collectibleItemId
		local ResellableInstances = p1.props.resellableInstances
		local ResellableInstances1 = p2.resellableInstances
		
		if ResellableInstances and (ResellableInstances[CollectibleItemId] and (ResellableInstances1 and ResellableInstances1[CollectibleItemId])) and TutilsModule.fieldCount(ResellableInstances[CollectibleItemId]) ~= TutilsModule.fieldCount(ResellableInstances1[CollectibleItemId]) then
			p1:setState({})
		end
	end
	local ParentBundleId = p1.props.assetInfo and p1.props.assetInfo.parentBundleId
	local Bundles = p1.props.bundles
	local Bundles1 = p2.bundles
	
	if ParentBundleId and Bundles and Bundles[ParentBundleId] and Bundles1 and Bundles1[ParentBundleId] and Bundles1[ParentBundleId] ~= Bundles[ParentBundleId] then
		p1.props.setAssetFromBundleInfo(p1.props.assetInfo.assetId, Bundles1[ParentBundleId])
	end
end

function AssetDetails.didUpdate(p1, p2)
	-- upvalues: UtilityFunctionsModule (copy)
	local ReportOpenDetailsPageFunction: (any) -> () = p1.props.reportOpenDetailsPage
	local AssetInfo = p1.props.assetInfo
	local AssetInfo1 = p2.assetInfo
	
	if AssetInfo and AssetInfo ~= AssetInfo1 then
		local Bundles = p1.props.bundles
		local HasParentBundleId = AssetInfo.parentBundleId ~= nil
		local BundleId = HasParentBundleId and UtilityFunctionsModule.getBundleId(AssetInfo)
		
		if not HasParentBundleId and AssetInfo.owned == nil or HasParentBundleId and Bundles[BundleId].owned == nil then
			local AssetId = AssetInfo.assetId
			local Asset = Enum.AvatarItemType.Asset
			
			if HasParentBundleId then
				AssetId = BundleId
				Asset = Enum.AvatarItemType.Bundle
			end
			p1.props.getItemDetails(AssetId, Asset)
		end
	end
	if p1.props.detailsInformation.viewingDetails and not p2.detailsInformation.viewingDetails then
		ReportOpenDetailsPageFunction(AssetInfo)
	end
end

function AssetDetails.render(p1)
	-- upvalues: Images (copy), RoactModule (copy), InspectAndBuyContextModule (copy), GetFFlagDisplayCollectiblesIconModule (copy), UtilityFunctionsModule (copy), Players (copy), TutilsModule (copy), ControllerBarHeight (copy), ThemeModule (copy), ColorsModule (copy), DetailsButtonsModule (copy), DetailsThumbnailModule (copy), IsInExperienceUIVREnabled (copy), TryOnViewportModule (copy), DetailsTextModule (copy), ImageSetLabel (copy), RobloxTranslatorModule (copy), AppFonts (copy), DetailsDescriptionModule (copy), ItemInfoList (copy)
	local View = p1.props.view
	local DetailsInformation = p1.props.detailsInformation
	local AssetInfo = p1.props.assetInfo or {}
	local LocalPlayerModel = p1.props.localPlayerModel
	local ScrollingEnabled = p1.state.scrollingEnabled
	local Locale = p1.props.locale
	local IconsStatusItemOwned = Images["icons/status/item/owned"]
	local ImageRectSizeRatio = IconsStatusItemOwned and IconsStatusItemOwned.ImageRectSize / Images.ImagesResolutionScale or Vector2.new(0, 0)
	
	return RoactModule.createElement(InspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: View (copy), GetFFlagDisplayCollectiblesIconModule (upval), UtilityFunctionsModule (upval), AssetInfo (copy), p1 (copy), Players (upval), TutilsModule (upval), ControllerBarHeight (upval), ThemeModule (upval), RoactModule (upval), ColorsModule (upval), DetailsInformation (copy), DetailsButtonsModule (upval), LocalPlayerModel (copy), ScrollingEnabled (copy), DetailsThumbnailModule (upval), IsInExperienceUIVREnabled (upval), TryOnViewportModule (upval), DetailsTextModule (upval), ImageRectSizeRatio (copy), ImageSetLabel (upval), IconsStatusItemOwned (copy), RobloxTranslatorModule (upval), Locale (copy), AppFonts (upval), DetailsDescriptionModule (upval), ItemInfoList (upval)
			local v1 = p2[View]
			local v2 = 0
			local FieldCountResult = 0
			
			if GetFFlagDisplayCollectiblesIconModule() and UtilityFunctionsModule.isCollectibles(AssetInfo) then
				local ResellableInstances = p1.props.resellableInstances
				p1.props.getCollectibleResellableInstances(AssetInfo.collectibleItemId, Players.LocalPlayer and Players.LocalPlayer.UserId)
				FieldCountResult = ResellableInstances and ResellableInstances[AssetInfo.collectibleItemId] and TutilsModule.fieldCount(ResellableInstances[AssetInfo.collectibleItemId]) or 0
			end
			local IsLimited2Point0_Or_LimitedCollectible = UtilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(AssetInfo)
			
			if p1.props.gamepadEnabled then
				v2 = -1 * ControllerBarHeight
			end
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Position = UDim2.new(0, v1.BorderPaddingSize, 0, 0),
				Size = UDim2.new(1, -(2 * v1.BorderPaddingSize), 1, v2 + -ThemeModule.DefaultCornerRadius.Offset),
				BackgroundColor3 = ColorsModule.Carbon,
				Visible = DetailsInformation.viewingDetails
			}, {
				DetailsButtons = RoactModule.createElement(DetailsButtonsModule, { localPlayerModel = LocalPlayerModel }),
				Container = RoactModule.createElement("ScrollingFrame", {
					BackgroundTransparency = 1,
					ScrollBarThickness = 0,
					Selectable = false,
					Size = UDim2.new(1, 0, 1, -55),
					ScrollingEnabled = ScrollingEnabled,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 10)
					}),
					DetailsThumbnail = RoactModule.createElement(DetailsThumbnailModule),
					TryOnViewport = if IsInExperienceUIVREnabled then if DetailsInformation.viewingDetails and LocalPlayerModel then RoactModule.createElement(TryOnViewportModule, {
						localPlayerModel = LocalPlayerModel,
						setScrollingEnabled = function(p3)
							-- upvalues: p1 (upval)
							p1:setScrollingEnabled(p3)
						end
					}) else nil else LocalPlayerModel and RoactModule.createElement(TryOnViewportModule, {
						localPlayerModel = LocalPlayerModel,
						setScrollingEnabled = function(p3)
							-- upvalues: p1 (upval)
							p1:setScrollingEnabled(p3)
						end
					}),
					DetailsText = RoactModule.createElement(DetailsTextModule, { localPlayerModel = LocalPlayerModel }),
					ItemOwnedLabelContainer = IsLimited2Point0_Or_LimitedCollectible and RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, ImageRectSizeRatio.Y + 20),
						BackgroundColor3 = Color3.fromRGB(57, 59, 61)
					}, {
						Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
						OwnedIcon = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							Size = UDim2.new(0, ImageRectSizeRatio.X, 0, ImageRectSizeRatio.Y),
							Position = UDim2.new(0, 12, 0, 10),
							Image = IconsStatusItemOwned
						}),
						ItemOwnedLabel = RoactModule.createElement("TextLabel", {
							TextSize = 12,
							BackgroundTransparency = 1,
							Size = UDim2.new(0, ImageRectSizeRatio.X, 0, ImageRectSizeRatio.Y),
							Position = UDim2.new(0, ImageRectSizeRatio.X + 60, 0, 10),
							Text = RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.OwnedItems", Locale, { QUANTITY = tostring(FieldCountResult) }),
							Font = AppFonts.default:getDefault(),
							TextColor3 = Color3.new(1, 1, 1)
						})
					}),
					DetailsDescription = RoactModule.createElement(DetailsDescriptionModule),
					ItemInfoList = RoactModule.createElement(ItemInfoList, { LayoutOrder = 5, rowData = p1:getInfoRowProps() })
				})
			})
		end
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		view = p1.view,
		detailsInformation = p1.detailsInformation,
		assetInfo = p1.assets[p1.detailsInformation.assetId],
		bundles = p1.bundles,
		gamepadEnabled = p1.gamepadEnabled,
		locale = p1.locale,
		resellableInstances = p1.collectibleResellableInstances,
		creatingExperiences = p1.creatingExperiences
	}
end, function(Callback)
	-- upvalues: GetAssetBundlesModule (copy), GetEconomyProductInfoModule (copy), ReportOpenDetailsPageModule (copy), GetCollectibleResellableInstancesModule (copy), OpenOverlayModule (copy), GetItemDetailsModule (copy), SetAssetFromBundleInfoModule (copy)
	return {
		getAssetBundles = function(p1)
			-- upvalues: Callback (copy), GetAssetBundlesModule (upval)
			Callback(GetAssetBundlesModule(p1))
		end,
		getEconomyProductInfo = function(p1, p2, p3)
			-- upvalues: Callback (copy), GetEconomyProductInfoModule (upval)
			Callback(GetEconomyProductInfoModule(p1, p2, p3))
		end,
		reportOpenDetailsPage = function(p1)
			-- upvalues: Callback (copy), ReportOpenDetailsPageModule (upval)
			Callback(ReportOpenDetailsPageModule(p1))
		end,
		getCollectibleResellableInstances = function(p1, p2)
			-- upvalues: Callback (copy), GetCollectibleResellableInstancesModule (upval)
			Callback(GetCollectibleResellableInstancesModule(p1, p2))
		end,
		openOverlay = function(p1, p2)
			-- upvalues: Callback (copy), OpenOverlayModule (upval)
			Callback(OpenOverlayModule(p1, p2))
		end,
		getItemDetails = function(p1, p2)
			-- upvalues: Callback (copy), GetItemDetailsModule (upval)
			Callback(GetItemDetailsModule(p1, p2))
		end,
		setAssetFromBundleInfo = function(p1, p2)
			-- upvalues: Callback (copy), SetAssetFromBundleInfoModule (upval)
			Callback(SetAssetFromBundleInfoModule(p1, p2))
		end
	}
end)(AssetDetails)