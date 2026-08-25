local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local detailsTextModule = require(parent.Components.DetailsText)
local detailsThumbnailModule = require(parent.Components.DetailsThumbnail)
local detailsDescriptionModule = require(parent.Components.DetailsDescription)
local detailsButtonsModule = require(parent.Components.DetailsButtons)
local tryOnViewportModule = require(parent.Components.TryOnViewport)
local openOverlayModule = require(parent.Actions.OpenOverlay)
local overlayModule = require(parent.Enums.Overlay)
local getAssetBundlesModule = require(parent.Thunks.GetAssetBundles)
local reportOpenDetailsPageModule = require(parent.Thunks.ReportOpenDetailsPage)
local getEconomyProductInfoModule = require(parent.Thunks.GetEconomyProductInfo)
local getCollectibleResellableInstancesModule = require(parent.Thunks.GetCollectibleResellableInstances)
local colorsModule = require(parent.Colors)
local constantsModule = require(parent.Constants)
local utilityFunctionsModule = require(parent.UtilityFunctions)
local tutilsModule = require(corePackagesService.Packages.tutils)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local itemInfoList = require(corePackagesService.Workspace.Packages.ItemDetails).ItemInfoList
local attributionConstantsModule = require(parent.AttributionConstants)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local getFFlagDisplayCollectiblesIconModule = require(parent.Flags.GetFFlagDisplayCollectiblesIcon)
local getItemDetailsModule = require(parent.Thunks.GetItemDetails)
local setAssetFromBundleInfoModule = require(parent.Actions.SetAssetFromBundleInfo)
local themeModule = require(coreGuiService.RobloxGui.Modules.Settings.Theme)
local controllerBarHeight = require(coreGuiService.RobloxGui.Modules.InGameMenuConstants).ControllerBarHeight
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local assetDetails = roactModule.PureComponent:extend("AssetDetails")

function assetDetails.setScrollingEnabled(value, p0)
	if value.state.scrollingEnabled ~= p0 then
		value:setState({ scrollingEnabled = p0 })
	end
end

function assetDetails.getInfoRowProps(p1)
	-- upvalues: robloxTranslatorModule (ref), attributionConstantsModule (ref), overlayModule (ref), roactModule (ref), constantsModule (ref)
	local assetInfo = p1.props.assetInfo or {}
	local locale = p1.props.locale
	local var30 = assetInfo.parentBundleId ~= nil
	local t = {
		LayoutOrder = 1,
		Selectable = false,
		infoName = robloxTranslatorModule:FormatByKeyForLocale("Feature.Catalog.Label.Filter.Creator", locale),
		infoData = assetInfo.creatorName or "",
		hasVerifiedBadge = assetInfo.creatorHasVerifiedBadge
	}
	local t_1 = nil
	local creatingUniverseId = assetInfo.creatingUniverseId
	
	if creatingUniverseId then
		local var33 = p1.props.creatingExperiences[creatingUniverseId]
		
		if var33 and attributionConstantsModule.ShowPlayableAttributionMapper[var33.playabilityStatus] then
			t_1 = {
				infoName = robloxTranslatorModule:FormatByKeyForLocale("Feature.Catalog.Label.Attribution", locale),
				infoData = var33.name or "",
				onActivate = function()
					-- upvalues: p1 (ref), overlayModule (copy), var33 (ref)
					p1.props.openOverlay(overlayModule.AttributionTraversal, var33)
				end,
				LayoutOrder = 2,
				[roactModule.Ref] = p1.attributionRef,
				Selectable = true
			}
		end
	end
	local text = nil
	
	if var30 then
		text = robloxTranslatorModule:FormatByKeyForLocale("Feature.Catalog.Label.Bundle", locale)
	else
		local assetTypeId = constantsModule.AssetCategoriesLocalized[constantsModule.AssetTypeIdToCategory[assetInfo.assetTypeId]]
		local assetTypeId_1 = constantsModule.AssetTypeIdToTypeLocalized[assetInfo.assetTypeId]
		
		if assetTypeId and assetTypeId_1 then
			text = robloxTranslatorModule:FormatByKeyForLocale(assetTypeId, locale) .. " | " .. robloxTranslatorModule:FormatByKeyForLocale(assetTypeId_1, locale)
		end
	end
	return {
		t,
		t_1,
		{
			LayoutOrder = 3,
			Selectable = false,
			infoName = robloxTranslatorModule:FormatByKeyForLocale("Feature.Catalog.Label.CategoryType", locale),
			infoData = text
		}
	}
end

function assetDetails.init(p2)
	-- upvalues: roactModule (ref)
	p2.state = { scrollingEnabled = true }
	p2.attributionRef = roactModule.createRef()
end

function assetDetails.willUpdate(p3, p4)
	-- upvalues: utilityFunctionsModule (ref), tutilsModule (ref)
	if utilityFunctionsModule.isCollectibles(p3.props.assetInfo) then
		local collectibleItemId = p3.props.assetInfo.collectibleItemId
		local resellableInstances = p3.props.resellableInstances
		local resellableInstances_1 = p4.resellableInstances
		
		if resellableInstances and (resellableInstances[collectibleItemId] and (resellableInstances_1 and resellableInstances_1[collectibleItemId])) and tutilsModule.fieldCount(resellableInstances[collectibleItemId]) ~= tutilsModule.fieldCount(resellableInstances_1[collectibleItemId]) then
			p3:setState({})
		end
	end
	local parentBundleId = p3.props.assetInfo and p3.props.assetInfo.parentBundleId
	local bundles = p3.props.bundles
	local bundles_1 = p4.bundles
	
	if parentBundleId and bundles and (bundles[parentBundleId] and bundles_1) and (bundles_1[parentBundleId] and bundles_1[parentBundleId] ~= bundles[parentBundleId]) then
		p3.props.setAssetFromBundleInfo(p3.props.assetInfo.assetId, bundles_1[parentBundleId])
	end
end

function assetDetails.didUpdate(p5, p6)
	-- upvalues: utilityFunctionsModule (ref)
	local reportOpenDetailsPage = p5.props.reportOpenDetailsPage
	local assetInfo = p5.props.assetInfo
	
	if assetInfo and assetInfo ~= p6.assetInfo then
		local bundles = p5.props.bundles
		local var36 = assetInfo.parentBundleId ~= nil
		local var37 = var36 and utilityFunctionsModule.getBundleId(assetInfo)
		
		if not var36 and assetInfo.owned == nil or var36 and bundles[var37].owned == nil then
			local assetId = assetInfo.assetId
			local asset = Enum.AvatarItemType.Asset
			
			if var36 then
				assetId = var37
				asset = Enum.AvatarItemType.Bundle
			end
			p5.props.getItemDetails(assetId, asset)
		end
	end
	if p5.props.detailsInformation.viewingDetails and not p6.detailsInformation.viewingDetails then
		reportOpenDetailsPage(assetInfo)
	end
end

function assetDetails.render(p7)
	-- upvalues: images (ref), roactModule (ref), inspectAndBuyContextModule (ref), getFFlagDisplayCollectiblesIconModule (ref), utilityFunctionsModule (ref), playersService (ref), tutilsModule (ref), controllerBarHeight (ref), themeModule (ref), colorsModule (ref), detailsButtonsModule (ref), detailsThumbnailModule (ref), isInExperienceUIVREnabled (ref), tryOnViewportModule (ref), detailsTextModule (ref), imageSetLabel (ref), robloxTranslatorModule (ref), appFonts (ref), detailsDescriptionModule (ref), itemInfoList (ref)
	local view = p7.props.view
	local detailsInformation = p7.props.detailsInformation
	local assetInfo = p7.props.assetInfo or {}
	local localPlayerModel = p7.props.localPlayerModel
	local scrollingEnabled = p7.state.scrollingEnabled
	local locale = p7.props.locale
	local owned = images["icons/status/item/owned"]
	local var39 = if owned then owned.ImageRectSize / images.ImagesResolutionScale else Vector2.new(0, 0)
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p8)
			-- upvalues: view (ref), getFFlagDisplayCollectiblesIconModule (copy), utilityFunctionsModule (copy), assetInfo (ref), p7 (ref), playersService (copy), tutilsModule (copy), controllerBarHeight (copy), themeModule (copy), roactModule (copy), colorsModule (copy), detailsInformation (ref), detailsButtonsModule (copy), localPlayerModel (ref), scrollingEnabled (ref), detailsThumbnailModule (copy), isInExperienceUIVREnabled (copy), tryOnViewportModule (copy), detailsTextModule (copy), var39 (ref), imageSetLabel (copy), owned (ref), robloxTranslatorModule (copy), locale (ref), appFonts (copy), detailsDescriptionModule (copy), itemInfoList (copy)
			local resellableInstances
			local var40 = p8[view]
			local var41 = 0
			local var42 = 0
			
			if getFFlagDisplayCollectiblesIconModule() and utilityFunctionsModule.isCollectibles(assetInfo) then
				local var43
				resellableInstances = p7.props.resellableInstances
				p7.props.getCollectibleResellableInstances(assetInfo.collectibleItemId, playersService.LocalPlayer and playersService.LocalPlayer.UserId)
				
				if resellableInstances and resellableInstances[assetInfo.collectibleItemId] then
					var43 = tutilsModule.fieldCount(resellableInstances[assetInfo.collectibleItemId])
					
					if not var43 then
						var43 = 0
					end
					var42 = var43
				end
			end
			local var44 = utilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(assetInfo)
			
			if p7.props.gamepadEnabled then
				var41 = -1 * controllerBarHeight
			end
			var41 += -themeModule.DefaultCornerRadius.Offset
			resellableInstances = roactModule.createElement
			
			return resellableInstances("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Position = UDim2.new(0, var40.BorderPaddingSize, 0, 0),
				Size = UDim2.new(1, -(2 * var40.BorderPaddingSize), 1, var41),
				BackgroundColor3 = colorsModule.Carbon,
				Visible = detailsInformation.viewingDetails
			}, {
				DetailsButtons = roactModule.createElement(detailsButtonsModule, { localPlayerModel = localPlayerModel }),
				Container = roactModule.createElement("ScrollingFrame", {
					BackgroundTransparency = 1,
					ScrollBarThickness = 0,
					Selectable = false,
					Size = UDim2.new(1, 0, 1, -55),
					ScrollingEnabled = scrollingEnabled,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					AutomaticCanvasSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = roactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 10)
					}),
					DetailsThumbnail = roactModule.createElement(detailsThumbnailModule),
					TryOnViewport = if not isInExperienceUIVREnabled then if detailsInformation.viewingDetails and localPlayerModel then roactModule.createElement(tryOnViewportModule, {
						localPlayerModel = localPlayerModel,
						setScrollingEnabled = function(value)
							-- upvalues: p7 (copy)
							p7:setScrollingEnabled(value)
						end
					}) else nil else localPlayerModel and roactModule.createElement(tryOnViewportModule, {
						localPlayerModel = localPlayerModel,
						setScrollingEnabled = function(value)
							-- upvalues: p7 (copy)
							p7:setScrollingEnabled(value)
						end
					}),
					DetailsText = roactModule.createElement(detailsTextModule, { localPlayerModel = localPlayerModel }),
					ItemOwnedLabelContainer = var44 and roactModule.createElement("Frame", {
						BorderSizePixel = 0,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, var39.Y + 20),
						BackgroundColor3 = Color3.fromRGB(57, 59, 61)
					}, {
						Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
						OwnedIcon = roactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							Size = UDim2.new(0, var39.X, 0, var39.Y),
							Position = UDim2.new(0, 12, 0, 10),
							Image = owned
						}),
						ItemOwnedLabel = roactModule.createElement("TextLabel", {
							TextSize = 12,
							BackgroundTransparency = 1,
							Size = UDim2.new(0, var39.X, 0, var39.Y),
							Position = UDim2.new(0, var39.X + 60, 0, 10),
							Text = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.OwnedItems", locale, { QUANTITY = tostring(var42) }),
							Font = appFonts.default:getDefault(),
							TextColor3 = Color3.new(1, 1, 1)
						})
					}),
					DetailsDescription = roactModule.createElement(detailsDescriptionModule),
					ItemInfoList = roactModule.createElement(itemInfoList, { LayoutOrder = 5, rowData = p7:getInfoRowProps() })
				})
			})
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p9, _)
	return {
		view = p9.view,
		detailsInformation = p9.detailsInformation,
		assetInfo = p9.assets[p9.detailsInformation.assetId],
		bundles = p9.bundles,
		gamepadEnabled = p9.gamepadEnabled,
		locale = p9.locale,
		resellableInstances = p9.collectibleResellableInstances,
		creatingExperiences = p9.creatingExperiences
	}
end, function(p10)
	-- upvalues: getAssetBundlesModule (ref), getEconomyProductInfoModule (ref), reportOpenDetailsPageModule (ref), getCollectibleResellableInstancesModule (ref), openOverlayModule (ref), getItemDetailsModule (ref), setAssetFromBundleInfoModule (ref)
	return {
		getAssetBundles = function(value)
			-- upvalues: p10 (ref), getAssetBundlesModule (copy)
			p10(getAssetBundlesModule(value))
		end,
		getEconomyProductInfo = function(p11, p12, p13)
			-- upvalues: p10 (ref), getEconomyProductInfoModule (copy)
			p10(getEconomyProductInfoModule(p11, p12, p13))
		end,
		reportOpenDetailsPage = function(p14)
			-- upvalues: p10 (ref), reportOpenDetailsPageModule (copy)
			p10(reportOpenDetailsPageModule(p14))
		end,
		getCollectibleResellableInstances = function(p15, p16)
			-- upvalues: p10 (ref), getCollectibleResellableInstancesModule (copy)
			p10(getCollectibleResellableInstancesModule(p15, p16))
		end,
		openOverlay = function(p17, p18)
			-- upvalues: p10 (ref), openOverlayModule (copy)
			p10(openOverlayModule(p17, p18))
		end,
		getItemDetails = function(p19, p20)
			-- upvalues: p10 (ref), getItemDetailsModule (copy)
			p10(getItemDetailsModule(p19, p20))
		end,
		setAssetFromBundleInfo = function(value, p21)
			-- upvalues: p10 (ref), setAssetFromBundleInfoModule (copy)
			p10(setAssetFromBundleInfoModule(value, p21))
		end
	}
end)(assetDetails)