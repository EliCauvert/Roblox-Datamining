local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local images = require(corePackagesService.Packages.UIBlox).App.ImageSet.Images
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local colorsModule = require(parent.Colors)
local constantsModule = require(parent.Constants)
local setDetailsInformationModule = require(parent.Actions.SetDetailsInformation)
local getSelectionImageObjectRegularModule = require(parent.getSelectionImageObjectRegular)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local limitedLabelModule = require(parent.Components.LimitedLabel)
local utilityFunctionsModule = require(parent.UtilityFunctions)
local getFFlagDisplayCollectiblesIconModule = require(parent.Flags.GetFFlagDisplayCollectiblesIcon)
local getFFlagIBEnableCollectiblesSystemSupportModule = require(parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local assetCard = roactModule.Component:extend("AssetCard")

function assetCard.init(p1)
	-- upvalues: getSelectionImageObjectRegularModule (ref)
	p1.selectedImage = getSelectionImageObjectRegularModule()
end

function assetCard.render(p1)
	-- upvalues: images (ref), roactModule (ref), inspectAndBuyContextModule (ref), getFFlagDisplayCollectiblesIconModule (ref), utilityFunctionsModule (ref), getFFlagIBEnableCollectiblesSystemSupportModule (ref), constantsModule (ref), colorsModule (ref), appFonts (ref), limitedLabelModule (ref)
	local view = p1.props.view
	local equipped = p1.props.equipped
	local assetInfo = p1.props.assetInfo
	local openDetails = p1.props.openDetails
	local assetCardSizeX = p1.props.assetCardSizeX
	local limited = images["icons/status/item/limited"]
	local var1 = if limited then limited.ImageRectSize / images.ImagesResolutionScale else Vector2.new(0, 0)
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: view (ref), getFFlagDisplayCollectiblesIconModule (copy), utilityFunctionsModule (copy), assetInfo (ref), getFFlagIBEnableCollectiblesSystemSupportModule (copy), constantsModule (copy), var1 (ref), roactModule (copy), colorsModule (copy), p1 (ref), openDetails (ref), assetCardSizeX (ref), appFonts (copy), equipped (ref), limitedLabelModule (copy)
			local var2 = p2[view]
			local var3 = getFFlagDisplayCollectiblesIconModule() and utilityFunctionsModule.isCollectibles(assetInfo)
			local var4 = nil
			local var5 = nil
			local uDim2 = nil
			
			if getFFlagIBEnableCollectiblesSystemSupportModule() then
				var4 = utilityFunctionsModule.hasLimitedQuantity(assetInfo)
				var5 = utilityFunctionsModule.isLimited1Point0_LimitedUnique(assetInfo) or utilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(assetInfo)
				uDim2 = UDim2.new(0, var1.X + (if var5 then constantsModule.LimitedIconFrameSizeXOffset * 2 else constantsModule.LimitedIconFrameSizeXOffset), 0, var1.Y + constantsModule.LimitedIconFrameSizeYOffset)
			end
			local createElement = roactModule.createElement
			local var6 = "ImageButton"
			local t = {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				BackgroundColor3 = colorsModule.Gray2,
				Selectable = true,
				SelectionImageObject = p1.selectedImage,
				[roactModule.Event.Activated] = function()
					-- upvalues: openDetails (copy), assetInfo (copy)
					openDetails(assetInfo.assetId)
				end
			}
			local t_1 = {
				AssetThumbnail = roactModule.createElement("ImageButton", {
					Size = UDim2.new(1, 0, 0, assetCardSizeX),
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					BackgroundColor3 = colorsModule.Graphite,
					Selectable = false,
					AutoButtonColor = false,
					Image = "rbxthumb://type=Asset&id=" .. assetInfo.assetId .. "&w=150&h=150",
					[roactModule.Event.Activated] = function()
						-- upvalues: openDetails (copy), assetInfo (copy)
						openDetails(assetInfo.assetId)
					end
				}),
				AssetNameBackground = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, -assetCardSizeX),
					Position = UDim2.new(0, 0, 0, assetCardSizeX),
					BackgroundColor3 = Color3.fromRGB(44, 45, 47)
				}, {
					AssetName = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						TextSize = 12,
						TextScaled = true,
						Size = UDim2.new(1, -10, 1, -10),
						TextTruncate = Enum.TextTruncate.AtEnd,
						Position = UDim2.new(0, 5, 0, 5),
						Text = assetInfo.name or "",
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						Font = appFonts.default:getDefault(),
						TextColor3 = Color3.new(1, 1, 1)
					}, {
						UITextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = var2.AssetTextMaxSize })
					})
				}),
				EquippedFrame = roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Image = "rbxasset://textures/ui/InspectMenu/gr-item-selector.png",
					Size = UDim2.new(1, 0, 1, 0),
					Visible = equipped,
					ImageColor3 = colorsModule.Green,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(2.5, 2.5, 2.5, 2.5)
				}),
				Corner = roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Image = "rbxasset://textures/ui/InspectMenu/gr-item-selector-triangle.png",
					Position = UDim2.new(1, -25, 0, 0),
					Size = UDim2.new(0, 25, 0, 25),
					Visible = equipped,
					ImageColor3 = colorsModule.Green
				})
			}
			local var7 = if getFFlagIBEnableCollectiblesSystemSupportModule() then var4 else var3
			
			if var7 then
				var7 = roactModule.createElement
				var7 = var7(limitedLabelModule, {
					frameSize = if getFFlagIBEnableCollectiblesSystemSupportModule() then uDim2 else UDim2.new(0, var1.X + 18, 0, var1.Y + 4),
					framePosition = UDim2.new(0, 16, 0, assetCardSizeX - var1.Y - 20),
					imageSize = UDim2.new(0, var1.X, 0, var1.Y),
					imagePosition = UDim2.new(0, 5, 0, 2),
					textSize = UDim2.new(0, var1.X, 0, var1.Y),
					textPosition = UDim2.new(0, 5 + var1.X, 0, 2),
					text = if getFFlagIBEnableCollectiblesSystemSupportModule() and not var5 then nil else "#"
				})
			end
			t_1.LimitedLabel = var7
			
			return createElement(var6, t, t_1)
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, p2)
	return {
		view = p1.view,
		equipped = p1.equippedAssets[p2.assetInfo.assetId] == true,
		locale = p1.locale
	}
end, function(p1)
	-- upvalues: setDetailsInformationModule (ref)
	return {
		openDetails = function(p2)
			-- upvalues: p1 (ref), setDetailsInformationModule (copy)
			p1(setDetailsInformationModule(true, p2))
		end
	}
end)(assetCard)