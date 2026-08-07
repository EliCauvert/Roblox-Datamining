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

function assetCard.init(p0) --[[ line: 24 ]]
	-- upvalues: getSelectionImageObjectRegularModule (ref)
	p0.selectedImage = getSelectionImageObjectRegularModule()
end

function assetCard.render(p1) --[[ line: 28 ]]
	-- upvalues: images (ref), roactModule (ref), inspectAndBuyContextModule (ref), getFFlagDisplayCollectiblesIconModule (ref), utilityFunctionsModule (ref), getFFlagIBEnableCollectiblesSystemSupportModule (ref), constantsModule (ref), colorsModule (ref), appFonts (ref), limitedLabelModule (ref)
	local view = p1.props.view
	local equipped = p1.props.equipped
	local assetInfo = p1.props.assetInfo
	local openDetails = p1.props.openDetails
	local assetCardSizeX = p1.props.assetCardSizeX
	local limited = images["icons/status/item/limited"]
	local var13 = if limited then limited.ImageRectSize / images.ImagesResolutionScale else Vector2.new(0, 0)
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p2) --[[ line: 38 ]]
			-- upvalues: view (ref), getFFlagDisplayCollectiblesIconModule (copy), utilityFunctionsModule (copy), assetInfo (ref), getFFlagIBEnableCollectiblesSystemSupportModule (copy), constantsModule (copy), var13 (ref), roactModule (copy), colorsModule (copy), p1 (ref), openDetails (ref), assetCardSizeX (ref), appFonts (copy), equipped (ref), limitedLabelModule (copy)
			local var14 = p2[view]
			local var15 = getFFlagDisplayCollectiblesIconModule() and utilityFunctionsModule.isCollectibles(assetInfo)
			local var16 = nil
			local var17 = nil
			local uDim2 = nil
			
			if getFFlagIBEnableCollectiblesSystemSupportModule() then
				var16 = utilityFunctionsModule.hasLimitedQuantity(assetInfo)
				var17 = utilityFunctionsModule.isLimited1Point0_LimitedUnique(assetInfo) or utilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(assetInfo)
				uDim2 = UDim2.new(0, var13.X + (if var17 then constantsModule.LimitedIconFrameSizeXOffset * 2 else constantsModule.LimitedIconFrameSizeXOffset), 0, var13.Y + constantsModule.LimitedIconFrameSizeYOffset)
			end
			local createElement = roactModule.createElement
			local var19 = "ImageButton"
			local t = {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				BackgroundColor3 = colorsModule.Gray2,
				Selectable = true,
				SelectionImageObject = p1.selectedImage,
				[roactModule.Event.Activated] = function() --[[ line: 66 ]]
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
					[roactModule.Event.Activated] = function() --[[ line: 78 ]]
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
						UITextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = var14.AssetTextMaxSize })
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
			local var22 = if getFFlagIBEnableCollectiblesSystemSupportModule() then var16 else var15
			
			if var22 then
				var22 = roactModule.createElement
				var22 = var22(limitedLabelModule, {
					frameSize = if getFFlagIBEnableCollectiblesSystemSupportModule() then uDim2 else UDim2.new(0, var13.X + 18, 0, var13.Y + 4),
					framePosition = UDim2.new(0, 16, 0, assetCardSizeX - var13.Y - 20),
					imageSize = UDim2.new(0, var13.X, 0, var13.Y),
					imagePosition = UDim2.new(0, 5, 0, 2),
					textSize = UDim2.new(0, var13.X, 0, var13.Y),
					textPosition = UDim2.new(0, 5 + var13.X, 0, 2),
					text = if getFFlagIBEnableCollectiblesSystemSupportModule() and not var17 then nil else "#"
				})
			end
			t_1.LimitedLabel = var22
			
			return createElement(var19, t, t_1)
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p3, p4) --[[ line: 146 ]]
	return {
		view = p3.view,
		equipped = p3.equippedAssets[p4.assetInfo.assetId] == true,
		locale = p3.locale
	}
end, function(p5) --[[ line: 154 ]]
	-- upvalues: setDetailsInformationModule (ref)
	return {
		openDetails = function(p6) --[[ line: 156 ]]
			-- upvalues: p5 (ref), setDetailsInformationModule (copy)
			p5(setDetailsInformationModule(true, p6))
		end
	}
end)(assetCard)