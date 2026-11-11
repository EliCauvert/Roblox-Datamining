local CorePackages = game:GetService("CorePackages")
local Parent = script.Parent.Parent
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local ColorsModule = require(Parent.Colors)
local ConstantsModule = require(Parent.Constants)
local SetDetailsInformationModule = require(Parent.Actions.SetDetailsInformation)
local GetSelectionImageObjectRegularModule = require(Parent.getSelectionImageObjectRegular)
local InspectAndBuyContextModule = require(Parent.Components.InspectAndBuyContext)
local LimitedLabelModule = require(Parent.Components.LimitedLabel)
local UtilityFunctionsModule = require(Parent.UtilityFunctions)
local GetFFlagDisplayCollectiblesIconModule = require(Parent.Flags.GetFFlagDisplayCollectiblesIcon)
local GetFFlagIBEnableCollectiblesSystemSupportModule = require(Parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local AssetCard = RoactModule.Component:extend("AssetCard")

function AssetCard.init(p1)
	-- upvalues: GetSelectionImageObjectRegularModule (copy)
	p1.selectedImage = GetSelectionImageObjectRegularModule()
end

function AssetCard.render(p1)
	-- upvalues: Images (copy), RoactModule (copy), InspectAndBuyContextModule (copy), GetFFlagDisplayCollectiblesIconModule (copy), UtilityFunctionsModule (copy), GetFFlagIBEnableCollectiblesSystemSupportModule (copy), ConstantsModule (copy), ColorsModule (copy), AppFonts (copy), LimitedLabelModule (copy)
	local View = p1.props.view
	local Equipped = p1.props.equipped
	local AssetInfo = p1.props.assetInfo
	local OpenDetailsFunction = p1.props.openDetails
	local AssetCardSizeX = p1.props.assetCardSizeX
	local IconsStatusItemLimited = Images["icons/status/item/limited"]
	local ImageRectSizeRatio = IconsStatusItemLimited and IconsStatusItemLimited.ImageRectSize / Images.ImagesResolutionScale or Vector2.new(0, 0)
	
	return RoactModule.createElement(InspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: View (copy), GetFFlagDisplayCollectiblesIconModule (upval), UtilityFunctionsModule (upval), AssetInfo (copy), GetFFlagIBEnableCollectiblesSystemSupportModule (upval), ConstantsModule (upval), ImageRectSizeRatio (copy), RoactModule (upval), ColorsModule (upval), p1 (copy), OpenDetailsFunction (copy), AssetCardSizeX (copy), AppFonts (upval), Equipped (copy), LimitedLabelModule (upval)
			local v1 = p2[View]
			local IsCollectibles = GetFFlagDisplayCollectiblesIconModule() and UtilityFunctionsModule.isCollectibles(AssetInfo)
			local HasLimitedQuantity = nil
			local IsLimited1Point0_LimitedUnique = nil
			local v2: UDim2? = nil
			
			if GetFFlagIBEnableCollectiblesSystemSupportModule() then
				HasLimitedQuantity = UtilityFunctionsModule.hasLimitedQuantity(AssetInfo)
				IsLimited1Point0_LimitedUnique = UtilityFunctionsModule.isLimited1Point0_LimitedUnique(AssetInfo) or UtilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(AssetInfo)
				v2 = UDim2.new(0, ImageRectSizeRatio.X + (if IsLimited1Point0_LimitedUnique then ConstantsModule.LimitedIconFrameSizeXOffset * 2 else ConstantsModule.LimitedIconFrameSizeXOffset), 0, ImageRectSizeRatio.Y + ConstantsModule.LimitedIconFrameSizeYOffset)
			end
			return RoactModule.createElement("ImageButton", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				BackgroundColor3 = ColorsModule.Gray2,
				Selectable = true,
				SelectionImageObject = p1.selectedImage,
				[RoactModule.Event.Activated] = function()
					-- upvalues: OpenDetailsFunction (upval), AssetInfo (upval)
					OpenDetailsFunction(AssetInfo.assetId)
				end
			}, {
				AssetThumbnail = RoactModule.createElement("ImageButton", {
					Size = UDim2.new(1, 0, 0, AssetCardSizeX),
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					BackgroundColor3 = ColorsModule.Graphite,
					Selectable = false,
					AutoButtonColor = false,
					Image = "rbxthumb://type=Asset&id=" .. AssetInfo.assetId .. "&w=150&h=150",
					[RoactModule.Event.Activated] = function()
						-- upvalues: OpenDetailsFunction (upval), AssetInfo (upval)
						OpenDetailsFunction(AssetInfo.assetId)
					end
				}),
				AssetNameBackground = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, -AssetCardSizeX),
					Position = UDim2.new(0, 0, 0, AssetCardSizeX),
					BackgroundColor3 = Color3.fromRGB(44, 45, 47)
				}, {
					AssetName = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						TextSize = 12,
						TextScaled = true,
						Size = UDim2.new(1, -10, 1, -10),
						TextTruncate = Enum.TextTruncate.AtEnd,
						Position = UDim2.new(0, 5, 0, 5),
						Text = AssetInfo.name or "",
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						Font = AppFonts.default:getDefault(),
						TextColor3 = Color3.new(1, 1, 1)
					}, {
						UITextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = v1.AssetTextMaxSize })
					})
				}),
				EquippedFrame = RoactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Image = "rbxasset://textures/ui/InspectMenu/gr-item-selector.png",
					Size = UDim2.new(1, 0, 1, 0),
					Visible = Equipped,
					ImageColor3 = ColorsModule.Green,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(2.5, 2.5, 2.5, 2.5)
				}),
				Corner = RoactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Image = "rbxasset://textures/ui/InspectMenu/gr-item-selector-triangle.png",
					Position = UDim2.new(1, -25, 0, 0),
					Size = UDim2.new(0, 25, 0, 25),
					Visible = Equipped,
					ImageColor3 = ColorsModule.Green
				}),
				LimitedLabel = (if GetFFlagIBEnableCollectiblesSystemSupportModule() then HasLimitedQuantity else IsCollectibles) and RoactModule.createElement(LimitedLabelModule, {
					frameSize = if GetFFlagIBEnableCollectiblesSystemSupportModule() then v2 else UDim2.new(0, ImageRectSizeRatio.X + 18, 0, ImageRectSizeRatio.Y + 4),
					framePosition = UDim2.new(0, 16, 0, AssetCardSizeX - ImageRectSizeRatio.Y - 20),
					imageSize = UDim2.new(0, ImageRectSizeRatio.X, 0, ImageRectSizeRatio.Y),
					imagePosition = UDim2.new(0, 5, 0, 2),
					textSize = UDim2.new(0, ImageRectSizeRatio.X, 0, ImageRectSizeRatio.Y),
					textPosition = UDim2.new(0, 5 + ImageRectSizeRatio.X, 0, 2),
					text = if GetFFlagIBEnableCollectiblesSystemSupportModule() and not IsLimited1Point0_LimitedUnique then nil else "#"
				})
			})
		end
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, p2)
	return {
		view = p1.view,
		equipped = p1.equippedAssets[p2.assetInfo.assetId] == true,
		locale = p1.locale
	}
end, function(Callback)
	-- upvalues: SetDetailsInformationModule (copy)
	return {
		openDetails = function(p1)
			-- upvalues: Callback (copy), SetDetailsInformationModule (upval)
			Callback(SetDetailsInformationModule(true, p1))
		end
	}
end)(AssetCard)