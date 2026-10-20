local CorePackages = game:GetService("CorePackages")
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local Parent = script.Parent.Parent
local LimitedLabelModule = require(Parent.Components.LimitedLabel)
local ConstantsModule = require(Parent.Constants)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UtilityFunctionsModule = require(Parent.UtilityFunctions)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local InspectAndBuyContextModule = require(Parent.Components.InspectAndBuyContext)
local GetFFlagDisplayCollectiblesIconModule = require(Parent.Flags.GetFFlagDisplayCollectiblesIcon)
local GetFFlagIBEnableCollectiblesSystemSupportModule = require(Parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local FixBundleThumbnailOnDetailPage = game:DefineFastFlag("FixBundleThumbnailOnDetailPage", false)
local DetailsThumbnail = RoactModule.PureComponent:extend("DetailsThumbnail")

local function _(p1): boolean
	return if p1 then p1.parentBundleId ~= nil else false
end

function DetailsThumbnail.getUrl(p1): string
	-- upvalues: UtilityFunctionsModule (copy), FixBundleThumbnailOnDetailPage (copy)
	local AssetInfo = p1.props.assetInfo
	local DetailsInformation = p1.props.detailsInformation
	local Bundles = p1.props.bundles
	local BundleId = UtilityFunctionsModule.getBundleId(AssetInfo)
	local HasParentBundleId: boolean = if AssetInfo then AssetInfo.parentBundleId ~= nil else false
	
	return if HasParentBundleId and Bundles[BundleId] and Bundles[BundleId].costumeId then if FixBundleThumbnailOnDetailPage then "rbxthumb://type=BundleThumbnail&id=" .. tostring(BundleId) .. "&w=420&h=420" else "rbxthumb://type=Outfit&id=" .. Bundles[BundleId].costumeId .. "&w=420&h=420" else "rbxthumb://type=Asset&id=" .. DetailsInformation.assetId .. "&w=420&h=420"
end

function DetailsThumbnail.render(p1)
	-- upvalues: Images (copy), RoactModule (copy), InspectAndBuyContextModule (copy), GetFFlagDisplayCollectiblesIconModule (copy), UtilityFunctionsModule (copy), GetFFlagIBEnableCollectiblesSystemSupportModule (copy), ConstantsModule (copy), RobloxTranslatorModule (copy), LimitedLabelModule (copy)
	local View = p1.props.view
	local DetailsInformation = p1.props.detailsInformation
	local TryingOnInfo = p1.props.tryingOnInfo
	local Locale = p1.props.locale
	local AssetInfo = p1.props.assetInfo
	local IconsStatusItemLimited = Images["icons/status/item/limited"]
	local ImageRectSizeRatio = IconsStatusItemLimited and IconsStatusItemLimited.ImageRectSize / Images.ImagesResolutionScale or Vector2.new(0, 0)
	
	return RoactModule.createElement(InspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: View (copy), GetFFlagDisplayCollectiblesIconModule (upval), UtilityFunctionsModule (upval), AssetInfo (copy), GetFFlagIBEnableCollectiblesSystemSupportModule (upval), ConstantsModule (upval), ImageRectSizeRatio (copy), RobloxTranslatorModule (upval), Locale (copy), RoactModule (upval), TryingOnInfo (copy), DetailsInformation (copy), p1 (copy), LimitedLabelModule (upval)
			local v1 = p2[View]
			local IsCollectibles = GetFFlagDisplayCollectiblesIconModule() and UtilityFunctionsModule.isCollectibles(AssetInfo)
			local HasLimitedQuantity = nil
			local v2: UDim2? = nil
			local v3: string? = nil
			
			if GetFFlagIBEnableCollectiblesSystemSupportModule() and AssetInfo then
				HasLimitedQuantity = UtilityFunctionsModule.hasLimitedQuantity(AssetInfo)
				local IsLimited1Point0_LimitedUnique = UtilityFunctionsModule.isLimited1Point0_LimitedUnique(AssetInfo) or UtilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(AssetInfo)
				v2 = UDim2.new(0, ImageRectSizeRatio.X + (if IsLimited1Point0_LimitedUnique then ConstantsModule.LimitedIconFrameSizeXOffset * 2 else ConstantsModule.LimitedIconFrameSizeXOffset), 0, ImageRectSizeRatio.Y + ConstantsModule.LimitedIconFrameSizeYOffset)
				v3 = if IsLimited1Point0_LimitedUnique then "#" .. "    " .. RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", Locale) else "    " .. RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", Locale)
			end
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Position = v1.DetailsThumbnailFramePosition,
				Size = UDim2.new(1, 0, 0, GetFFlagDisplayCollectiblesIconModule() and ConstantsModule.DetailsThumbnailFrameHeight or 300),
				Visible = not TryingOnInfo.tryingOn
			}, {
				Thumbnail = DetailsInformation.viewingDetails and RoactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Position = v1.DetailsThumbnailPosition,
					AnchorPoint = v1.DetailsThumbnailAnchorPoint,
					Size = UDim2.new(1, 0, 1, 0),
					Image = p1:getUrl()
				}, {
					AspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
						AspectRatio = 1,
						AspectType = Enum.AspectType.FitWithinMaxSize,
						DominantAxis = v1.DetailsThumbnailARDominantAxis
					})
				}),
				LimitedLabel = (if GetFFlagIBEnableCollectiblesSystemSupportModule() then HasLimitedQuantity else IsCollectibles) and RoactModule.createElement(LimitedLabelModule, {
					frameSize = if GetFFlagIBEnableCollectiblesSystemSupportModule() then v2 else UDim2.new(0, ImageRectSizeRatio.X + 18, 0, ImageRectSizeRatio.Y + 6),
					framePosition = UDim2.new(0, 0, 0, ConstantsModule.DetailsThumbnailFrameHeight - ImageRectSizeRatio.Y - 8),
					imageSize = UDim2.new(0, ImageRectSizeRatio.X, 0, ImageRectSizeRatio.Y),
					imagePosition = UDim2.new(0, 4, 0, 3),
					textSize = UDim2.new(0, 4 + ImageRectSizeRatio.X, 0, ImageRectSizeRatio.Y),
					textPosition = UDim2.new(0, 5 + ImageRectSizeRatio.X, 0, 3),
					text = if GetFFlagIBEnableCollectiblesSystemSupportModule() then v3 else "#" .. "    " .. RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", Locale)
				})
			})
		end
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		view = p1.view,
		tryingOnInfo = p1.tryingOnInfo,
		detailsInformation = p1.detailsInformation,
		assetInfo = p1.assets[p1.detailsInformation.assetId],
		locale = p1.locale,
		bundles = p1.bundles
	}
end)(DetailsThumbnail)