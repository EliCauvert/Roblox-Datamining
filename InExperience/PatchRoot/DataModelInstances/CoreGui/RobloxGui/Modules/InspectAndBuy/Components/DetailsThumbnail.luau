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

local function _(p1)
	local var1
	if p1 then
		var1 = p1.parentBundleId ~= nil
	end
	return var1
end

function detailsThumbnail.getUrl(p1)
	-- upvalues: utilityFunctionsModule (ref), fixBundleThumbnailOnDetailPage (ref)
	local var1
	local assetInfo = p1.props.assetInfo
	local detailsInformation = p1.props.detailsInformation
	local bundles = p1.props.bundles
	local bundleId = utilityFunctionsModule.getBundleId(assetInfo)
	
	if assetInfo then
		var1 = assetInfo.parentBundleId ~= nil
	end
	local _ = ""
	
	return if not (not var1 or not bundles[bundleId] or not bundles[bundleId].costumeId) then if fixBundleThumbnailOnDetailPage then "rbxthumb://type=BundleThumbnail&id=" .. tostring(bundleId) .. "&w=420&h=420" else "rbxthumb://type=Outfit&id=" .. bundles[bundleId].costumeId .. "&w=420&h=420" else "rbxthumb://type=Asset&id=" .. detailsInformation.assetId .. "&w=420&h=420"
end

function detailsThumbnail.render(p1)
	-- upvalues: images (ref), roactModule (ref), inspectAndBuyContextModule (ref), getFFlagDisplayCollectiblesIconModule (ref), utilityFunctionsModule (ref), getFFlagIBEnableCollectiblesSystemSupportModule (ref), constantsModule (ref), robloxTranslatorModule (ref), limitedLabelModule (ref)
	local view = p1.props.view
	local detailsInformation = p1.props.detailsInformation
	local tryingOnInfo = p1.props.tryingOnInfo
	local locale = p1.props.locale
	local assetInfo = p1.props.assetInfo
	local limited = images["icons/status/item/limited"]
	local var1 = if limited then limited.ImageRectSize / images.ImagesResolutionScale else Vector2.new(0, 0)
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: view (ref), getFFlagDisplayCollectiblesIconModule (copy), utilityFunctionsModule (copy), assetInfo (ref), getFFlagIBEnableCollectiblesSystemSupportModule (copy), constantsModule (copy), var1 (ref), robloxTranslatorModule (copy), locale (ref), roactModule (copy), tryingOnInfo (ref), detailsInformation (ref), p1 (ref), limitedLabelModule (copy)
			local var2 = p2[view]
			local var3 = getFFlagDisplayCollectiblesIconModule() and utilityFunctionsModule.isCollectibles(assetInfo)
			local var4 = nil
			local _ = nil
			local uDim2 = nil
			local var5 = nil
			
			if getFFlagIBEnableCollectiblesSystemSupportModule() and assetInfo then
				var4 = utilityFunctionsModule.hasLimitedQuantity(assetInfo)
				local var6 = utilityFunctionsModule.isLimited1Point0_LimitedUnique(assetInfo) or utilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(assetInfo)
				uDim2 = UDim2.new(0, var1.X + (if var6 then constantsModule.LimitedIconFrameSizeXOffset * 2 else constantsModule.LimitedIconFrameSizeXOffset), 0, var1.Y + constantsModule.LimitedIconFrameSizeYOffset)
				var5 = if var6 then "#" .. "    " .. robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", locale) else "    " .. robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", locale)
			end
			return roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Position = var2.DetailsThumbnailFramePosition,
				Size = UDim2.new(1, 0, 0, if getFFlagDisplayCollectiblesIconModule() then constantsModule.DetailsThumbnailFrameHeight else 300),
				Visible = not tryingOnInfo.tryingOn
			}, {
				Thumbnail = detailsInformation.viewingDetails and roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Position = var2.DetailsThumbnailPosition,
					AnchorPoint = var2.DetailsThumbnailAnchorPoint,
					Size = UDim2.new(1, 0, 1, 0),
					Image = p1:getUrl()
				}, {
					AspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
						AspectRatio = 1,
						AspectType = Enum.AspectType.FitWithinMaxSize,
						DominantAxis = var2.DetailsThumbnailARDominantAxis
					})
				}),
				LimitedLabel = (if getFFlagIBEnableCollectiblesSystemSupportModule() then var4 else var3) and roactModule.createElement(limitedLabelModule, {
					frameSize = if getFFlagIBEnableCollectiblesSystemSupportModule() then uDim2 else UDim2.new(0, var1.X + 18, 0, var1.Y + 6),
					framePosition = UDim2.new(0, 0, 0, constantsModule.DetailsThumbnailFrameHeight - var1.Y - 8),
					imageSize = UDim2.new(0, var1.X, 0, var1.Y),
					imagePosition = UDim2.new(0, 4, 0, 3),
					textSize = UDim2.new(0, 4 + var1.X, 0, var1.Y),
					textPosition = UDim2.new(0, 5 + var1.X, 0, 3),
					text = if getFFlagIBEnableCollectiblesSystemSupportModule() then var5 else "#" .. "    " .. robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.LimitedItems", locale)
				})
			})
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		view = p1.view,
		tryingOnInfo = p1.tryingOnInfo,
		detailsInformation = p1.detailsInformation,
		assetInfo = p1.assets[p1.detailsInformation.assetId],
		locale = p1.locale,
		bundles = p1.bundles
	}
end)(detailsThumbnail)