local corePackagesService = game:GetService("CorePackages")
local images = require(corePackagesService.Packages.UIBlox).App.ImageSet.Images
local parent = script.Parent.Parent
local limitedLabelModule = require(parent.Components.LimitedLabel)
local constantsModule = require(parent.Constants)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local utilityFunctionsModule = require(parent.UtilityFunctions)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local getFFlagDisplayCollectiblesIconModule = require(parent.Flags.GetFFlagDisplayCollectiblesIcon)
local getFFlagIBEnableCollectiblesSystemSupportModule = require(parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local fixBundleThumbnailOnDetailPage = game:DefineFastFlag("FixBundleThumbnailOnDetailPage", false)
local detailsThumbnail = roactModule.PureComponent:extend("DetailsThumbnail")

local function _(p0) --[[ line: 24 | named "isPartOfBundleAndOffsale" ]]
	local var12
	if p0 then
		var12 = p0.parentBundleId ~= nil
	end
	return var12
end

function detailsThumbnail.getUrl(p1) --[[ line: 28 ]]
	-- upvalues: utilityFunctionsModule (ref), fixBundleThumbnailOnDetailPage (ref)
	local var14
	local assetInfo = p1.props.assetInfo
	local detailsInformation = p1.props.detailsInformation
	local bundles = p1.props.bundles
	local bundleId = utilityFunctionsModule.getBundleId(assetInfo)
	
	if assetInfo then
		var14 = assetInfo.parentBundleId ~= nil
	end
	local _ = ""
	
	return if not (not var14 or not bundles[bundleId] or not bundles[bundleId].costumeId) then if fixBundleThumbnailOnDetailPage then "rbxthumb://type=BundleThumbnail&id=" .. tostring(bundleId) .. "&w=420&h=420" else "rbxthumb://type=Outfit&id=" .. bundles[bundleId].costumeId .. "&w=420&h=420" else "rbxthumb://type=Asset&id=" .. detailsInformation.assetId .. "&w=420&h=420"
end

function detailsThumbnail.render(p2) --[[ line: 53 ]]
	-- upvalues: images (ref), roactModule (ref), inspectAndBuyContextModule (ref), getFFlagDisplayCollectiblesIconModule (ref), utilityFunctionsModule (ref), getFFlagIBEnableCollectiblesSystemSupportModule (ref), constantsModule (ref), robloxTranslatorModule (ref), limitedLabelModule (ref)
	local view = p2.props.view
	local detailsInformation = p2.props.detailsInformation
	local tryingOnInfo = p2.props.tryingOnInfo
	local locale = p2.props.locale
	local assetInfo = p2.props.assetInfo
	local limited = images["icons/status/item/limited"]
	local var15 = if limited then limited.ImageRectSize / images.ImagesResolutionScale else Vector2.new(0, 0)
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p3) --[[ line: 63 ]]
			-- upvalues: view (ref), getFFlagDisplayCollectiblesIconModule (copy), utilityFunctionsModule (copy), assetInfo (ref), getFFlagIBEnableCollectiblesSystemSupportModule (copy), constantsModule (copy), var15 (ref), robloxTranslatorModule (copy), locale (ref), roactModule (copy), tryingOnInfo (ref), detailsInformation (ref), p2 (ref), limitedLabelModule (copy)
			local var16 = p3[view]
			local var17 = getFFlagDisplayCollectiblesIconModule() and utilityFunctionsModule.isCollectibles(assetInfo)
			local var18 = nil
			local _ = nil
			local uDim2 = nil
			local var20 = nil
			
			if getFFlagIBEnableCollectiblesSystemSupportModule() and assetInfo then
				var18 = utilityFunctionsModule.hasLimitedQuantity(assetInfo)
				local var21 = utilityFunctionsModule.isLimited1Point0_LimitedUnique(assetInfo) or utilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(assetInfo)
				uDim2 = UDim2.new(0, var15.X + (if var21 then constantsModule.LimitedIconFrameSizeXOffset * 2 else constantsModule.LimitedIconFrameSizeXOffset), 0, var15.Y + constantsModule.LimitedIconFrameSizeYOffset)
				var20 = if var21 then "#" .. "    " .. robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", locale) else "    " .. robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", locale)
			end
			return roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Position = var16.DetailsThumbnailFramePosition,
				Size = UDim2.new(1, 0, 0, if getFFlagDisplayCollectiblesIconModule() then constantsModule.DetailsThumbnailFrameHeight else 300),
				Visible = not tryingOnInfo.tryingOn
			}, {
				Thumbnail = detailsInformation.viewingDetails and roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Position = var16.DetailsThumbnailPosition,
					AnchorPoint = var16.DetailsThumbnailAnchorPoint,
					Size = UDim2.new(1, 0, 1, 0),
					Image = p2:getUrl()
				}, {
					AspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
						AspectRatio = 1,
						AspectType = Enum.AspectType.FitWithinMaxSize,
						DominantAxis = var16.DetailsThumbnailARDominantAxis
					})
				}),
				LimitedLabel = (if getFFlagIBEnableCollectiblesSystemSupportModule() then var18 else var17) and roactModule.createElement(limitedLabelModule, {
					frameSize = if getFFlagIBEnableCollectiblesSystemSupportModule() then uDim2 else UDim2.new(0, var15.X + 18, 0, var15.Y + 6),
					framePosition = UDim2.new(0, 0, 0, constantsModule.DetailsThumbnailFrameHeight - var15.Y - 8),
					imageSize = UDim2.new(0, var15.X, 0, var15.Y),
					imagePosition = UDim2.new(0, 4, 0, 3),
					textSize = UDim2.new(0, 4 + var15.X, 0, var15.Y),
					textPosition = UDim2.new(0, 5 + var15.X, 0, 3),
					text = if getFFlagIBEnableCollectiblesSystemSupportModule() then var20 else "#" .. "    " .. robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", locale)
				})
			})
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p4, _) --[[ line: 138 ]]
	return {
		view = p4.view,
		tryingOnInfo = p4.tryingOnInfo,
		detailsInformation = p4.detailsInformation,
		assetInfo = p4.assets[p4.detailsInformation.assetId],
		locale = p4.locale,
		bundles = p4.bundles
	}
end)(detailsThumbnail)