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

function assetDetails.setScrollingEnabled(value, p1)
	if value.state.scrollingEnabled ~= p1 then
		value:setState({ scrollingEnabled = p1 })
	end
end

function assetDetails.getInfoRowProps(p1)
	-- upvalues: robloxTranslatorModule (ref), attributionConstantsModule (ref), overlayModule (ref), roactModule (ref), constantsModule (ref)
	local assetInfo = p1.props.assetInfo or {}
	local locale = p1.props.locale
	local var1 = assetInfo.parentBundleId ~= nil
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
		local var2 = p1.props.creatingExperiences[creatingUniverseId]
		
		if var2 and attributionConstantsModule.ShowPlayableAttributionMapper[var2.playabilityStatus] then
			t_1 = {
				infoName = robloxTranslatorModule:FormatByKeyForLocale("Feature.Catalog.Label.Attribution", locale),
				infoData = var2.name or "",
				onActivate = function()
					-- upvalues: p1 (ref), overlayModule (copy), var2 (ref)
					p1.props.openOverlay(overlayModule.AttributionTraversal, var2)
				end,
				LayoutOrder = 2,
				[roactModule.Ref] = p1.attributionRef,
				Selectable = true
			}
		end
	end
	local text = nil
	
	if var1 then
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

function assetDetails.init(p1)
	-- upvalues: roactModule (ref)
	p1.state = { scrollingEnabled = true }
	p1.attributionRef = roactModule.createRef()
end

function assetDetails.willUpdate(p1, p2)
	-- upvalues: utilityFunctionsModule (ref), tutilsModule (ref)
	if utilityFunctionsModule.isCollectibles(p1.props.assetInfo) then
		local collectibleItemId = p1.props.assetInfo.collectibleItemId
		local resellableInstances = p1.props.resellableInstances
		local resellableInstances_1 = p2.resellableInstances
		
		if resellableInstances and (resellableInstances[collectibleItemId] and (resellableInstances_1 and resellableInstances_1[collectibleItemId])) and tutilsModule.fieldCount(resellableInstances[collectibleItemId]) ~= tutilsModule.fieldCount(resellableInstances_1[collectibleItemId]) then
			p1:setState({})
		end
	end
	local parentBundleId = p1.props.assetInfo and p1.props.assetInfo.parentBundleId
	local bundles = p1.props.bundles
	local bundles_1 = p2.bundles
	
	if parentBundleId and bundles and (bundles[parentBundleId] and bundles_1) and (bundles_1[parentBundleId] and bundles_1[parentBundleId] ~= bundles[parentBundleId]) then
		p1.props.setAssetFromBundleInfo(p1.props.assetInfo.assetId, bundles_1[parentBundleId])
	end
end

function assetDetails.didUpdate(p1, p2)
	-- upvalues: utilityFunctionsModule (ref)
	local reportOpenDetailsPage = p1.props.reportOpenDetailsPage
	local assetInfo = p1.props.assetInfo
	
	if assetInfo and assetInfo ~= p2.assetInfo then
		local bundles = p1.props.bundles
		local var1 = assetInfo.parentBundleId ~= nil
		local var2 = var1 and utilityFunctionsModule.getBundleId(assetInfo)
		
		if not var1 and assetInfo.owned == nil or var1 and bundles[var2].owned == nil then
			local assetId = assetInfo.assetId
			local asset = Enum.AvatarItemType.Asset
			
			if var1 then
				assetId = var2
				asset = Enum.AvatarItemType.Bundle
			end
			p1.props.getItemDetails(assetId, asset)
		end
	end
	if p1.props.detailsInformation.viewingDetails and not p2.detailsInformation.viewingDetails then
		reportOpenDetailsPage(assetInfo)
	end
end

function assetDetails.render(p1)
	-- upvalues: images (ref), roactModule (ref), inspectAndBuyContextModule (ref), getFFlagDisplayCollectiblesIconModule (ref), utilityFunctionsModule (ref), playersService (ref), tutilsModule (ref), controllerBarHeight (ref), themeModule (ref), colorsModule (ref), detailsButtonsModule (ref), detailsThumbnailModule (ref), isInExperienceUIVREnabled (ref), tryOnViewportModule (ref), detailsTextModule (ref), imageSetLabel (ref), robloxTranslatorModule (ref), appFonts (ref), detailsDescriptionModule (ref), itemInfoList (ref)
	local view = p1.props.view
	local detailsInformation = p1.props.detailsInformation
	local assetInfo = p1.props.assetInfo or {}
	local localPlayerModel = p1.props.localPlayerModel
	local scrollingEnabled = p1.state.scrollingEnabled
	local locale = p1.props.locale
	local owned = images["icons/status/item/owned"]
	local var1 = if owned then owned.ImageRectSize / images.ImagesResolutionScale else Vector2.new(0, 0)
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: view (ref), getFFlagDisplayCollectiblesIconModule (copy), utilityFunctionsModule (copy), assetInfo (ref), p1 (ref), playersService (copy), tutilsModule (copy), controllerBarHeight (copy), themeModule (copy), roactModule (copy), colorsModule (copy), detailsInformation (ref), detailsButtonsModule (copy), localPlayerModel (ref), scrollingEnabled (ref), detailsThumbnailModule (copy), isInExperienceUIVREnabled (copy), tryOnViewportModule (copy), detailsTextModule (copy), var1 (ref), imageSetLabel (copy), owned (ref), robloxTranslatorModule (copy), locale (ref), appFonts (copy), detailsDescriptionModule (copy), itemInfoList (copy)
			local resellableInstances
			local var2 = p2[view]
			local var3 = 0
			local var4 = 0
			
			if getFFlagDisplayCollectiblesIconModule() and utilityFunctionsModule.isCollectibles(assetInfo) then
				local var5
				resellableInstances = p1.props.resellableInstances
				p1.props.getCollectibleResellableInstances(assetInfo.collectibleItemId, playersService.LocalPlayer and playersService.LocalPlayer.UserId)
				
				if resellableInstances and resellableInstances[assetInfo.collectibleItemId] then
					var5 = tutilsModule.fieldCount(resellableInstances[assetInfo.collectibleItemId])
					
					if not var5 then
						var5 = 0
					end
					var4 = var5
				end
			end
			local var6 = utilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(assetInfo)
			
			if p1.props.gamepadEnabled then
				var3 = -1 * controllerBarHeight
			end
			var3 += -themeModule.DefaultCornerRadius.Offset
			resellableInstances = roactModule.createElement
			
			return resellableInstances("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Position = UDim2.new(0, var2.BorderPaddingSize, 0, 0),
				Size = UDim2.new(1, -(2 * var2.BorderPaddingSize), 1, var3),
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
							-- upvalues: p1 (copy)
							p1:setScrollingEnabled(value)
						end
					}) else nil else localPlayerModel and roactModule.createElement(tryOnViewportModule, {
						localPlayerModel = localPlayerModel,
						setScrollingEnabled = function(value)
							-- upvalues: p1 (copy)
							p1:setScrollingEnabled(value)
						end
					}),
					DetailsText = roactModule.createElement(detailsTextModule, { localPlayerModel = localPlayerModel }),
					ItemOwnedLabelContainer = var6 and roactModule.createElement("Frame", {
						BorderSizePixel = 0,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, var1.Y + 20),
						BackgroundColor3 = Color3.fromRGB(57, 59, 61)
					}, {
						Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
						OwnedIcon = roactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							Size = UDim2.new(0, var1.X, 0, var1.Y),
							Position = UDim2.new(0, 12, 0, 10),
							Image = owned
						}),
						ItemOwnedLabel = roactModule.createElement("TextLabel", {
							TextSize = 12,
							BackgroundTransparency = 1,
							Size = UDim2.new(0, var1.X, 0, var1.Y),
							Position = UDim2.new(0, var1.X + 60, 0, 10),
							Text = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.OwnedItems", locale, { QUANTITY = tostring(var4) }),
							Font = appFonts.default:getDefault(),
							TextColor3 = Color3.new(1, 1, 1)
						})
					}),
					DetailsDescription = roactModule.createElement(detailsDescriptionModule),
					ItemInfoList = roactModule.createElement(itemInfoList, { LayoutOrder = 5, rowData = p1:getInfoRowProps() })
				})
			})
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
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
end, function(p1)
	-- upvalues: getAssetBundlesModule (ref), getEconomyProductInfoModule (ref), reportOpenDetailsPageModule (ref), getCollectibleResellableInstancesModule (ref), openOverlayModule (ref), getItemDetailsModule (ref), setAssetFromBundleInfoModule (ref)
	return {
		getAssetBundles = function(value)
			-- upvalues: p1 (ref), getAssetBundlesModule (copy)
			p1(getAssetBundlesModule(value))
		end,
		getEconomyProductInfo = function(p2, p3, p4)
			-- upvalues: p1 (ref), getEconomyProductInfoModule (copy)
			p1(getEconomyProductInfoModule(p2, p3, p4))
		end,
		reportOpenDetailsPage = function(p2)
			-- upvalues: p1 (ref), reportOpenDetailsPageModule (copy)
			p1(reportOpenDetailsPageModule(p2))
		end,
		getCollectibleResellableInstances = function(p2, p3)
			-- upvalues: p1 (ref), getCollectibleResellableInstancesModule (copy)
			p1(getCollectibleResellableInstancesModule(p2, p3))
		end,
		openOverlay = function(p2, p3)
			-- upvalues: p1 (ref), openOverlayModule (copy)
			p1(openOverlayModule(p2, p3))
		end,
		getItemDetails = function(p2, p3)
			-- upvalues: p1 (ref), getItemDetailsModule (copy)
			p1(getItemDetailsModule(p2, p3))
		end,
		setAssetFromBundleInfo = function(value, p2)
			-- upvalues: p1 (ref), setAssetFromBundleInfoModule (copy)
			p1(setAssetFromBundleInfoModule(value, p2))
		end
	}
end)(assetDetails)