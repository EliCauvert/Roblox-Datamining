local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ItemTile = UIBloxModule.Tile.ItemTile
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local GetFFlagL2ControllerSupportModule = require(Modules.AvatarExperience.Flags.GetFFlagL2ControllerSupport)
local FFlagAXThumbTypeNilCheck = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXThumbTypeNilCheck
local _ = require(Modules.AvatarExperience.Common.Types)

return (ReactModule.forwardRef(function(Gui, p1)
	-- upvalues: CatalogUtilsModule (copy), FFlagAXThumbTypeNilCheck (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), UseLocalizationModule (copy), UseStyleFunction (copy), UseRoactServiceModule (copy), RoactLocalizationModule (copy), NumberLocalization (copy), ReactModule (copy), ItemTile (copy), CatalogConstantsModule (copy), GetFFlagL2ControllerSupportModule (copy), Button (copy), ButtonType (copy), Focusable (copy)
	local RbxThumbType = CatalogUtilsModule.GetRbxThumbType(Gui.itemType)
	local UseLocalizationModuleResult = UseLocalizationModule({
		holdingLabel = "Feature.Catalog.Label.Holding",
		offSaleLabel = "Feature.Catalog.Heading.TakeOffSale",
		sellAction = "Feature.Catalog.Action.Sell",
		buyPriceLabel = "Feature.Catalog.Label.BuyPrice",
		salePriceLabel = "Feature.Catalog.Label.SalePrice"
	})
	local UseStyleResult = UseStyleFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactLocalizationModule)
	local Formatted = Gui.buyPrice and string.format("%.0f", Gui.buyPrice)
	local LocalizeResult = Formatted and NumberLocalization.localize(Formatted, UseRoactServiceModuleResult:GetLocale())
	local Formatted1 = Gui.salePrice and string.format("%.0f", Gui.salePrice)
	local LocalizeResult1 = Formatted1 and NumberLocalization.localize(Formatted1, UseRoactServiceModuleResult:GetLocale())
	local HoldingLabel = if Gui.isOnHold then UseLocalizationModuleResult.holdingLabel elseif Gui.isOnSale then UseLocalizationModuleResult.offSaleLabel else UseLocalizationModuleResult.sellAction
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 100),
		LayoutOrder = Gui.layoutOrder
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8)
		}),
		ItemTileContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(100, 100)
		}, {
			ItemTile = ReactModule.createElement(ItemTile, {
				name = "",
				thumbnail = if FFlagAXThumbTypeNilCheck and RbxThumbType then GetRbxthumbWithTypeSizeAndOptionsFunction(Gui.itemId, RbxThumbType, 150) else GetRbxthumbWithTypeSizeAndOptionsFunction(Gui.itemId, RbxThumbType, 150),
				restrictionTypes = Gui.restrictionTypes
			})
		}),
		DetailsContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -108, 1, 0)
		}, {
			LabelsContainer = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0) }, {
				Layout = ReactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 4),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				ItemTitleLabel = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0),
					Text = Gui.title,
					Font = UseStyleResult.Font.Header2.Font,
					TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize,
					TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				BuyPriceLabel = LocalizeResult and ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = UseLocalizationModuleResult.buyPriceLabel .. " " .. CatalogConstantsModule.RobloxEmoji.Robux .. LocalizeResult,
					Font = UseStyleResult.Font.Body.Font,
					TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Body.RelativeSize,
					TextColor3 = UseStyleResult.Theme.TextEmphasis.Color
				}),
				SalePriceLabel = LocalizeResult1 and ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = UseLocalizationModuleResult.salePriceLabel .. " " .. CatalogConstantsModule.RobloxEmoji.Robux .. LocalizeResult1,
					Font = UseStyleResult.Font.Body.Font,
					TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Body.RelativeSize,
					TextColor3 = UseStyleResult.Theme.TextEmphasis.Color
				})
			}),
			Button = Gui.resaleRestriction ~= CatalogConstantsModule.ResaleRestriction.Disabled and (not GetFFlagL2ControllerSupportModule() and ReactModule.createElement(Button, {
				layoutOrder = 2,
				buttonType = if Gui.isOnSale then ButtonType.Secondary else ButtonType.PrimarySystem,
				size = UDim2.new(1, 0, 0, 28),
				text = HoldingLabel,
				position = UDim2.fromScale(0, 1),
				anchorPoint = Vector2.new(0, 1),
				onActivated = Gui.onActivated,
				isDisabled = Gui.isOnHold
			})),
			ButtonContainer = Gui.resaleRestriction ~= CatalogConstantsModule.ResaleRestriction.Disabled and (GetFFlagL2ControllerSupportModule() and ReactModule.createElement(Focusable.Frame, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 28),
				Position = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 1),
				NextSelectionUp = if GetFFlagL2ControllerSupportModule() then Gui.NextSelectionUp else nil,
				NextSelectionDown = if GetFFlagL2ControllerSupportModule() then Gui.NextSelectionDown else nil,
				ref = if GetFFlagL2ControllerSupportModule() then p1 else nil
			}, {
				OnSaleButton = Gui.isOnSale and ReactModule.createElement(Button, {
					buttonType = ButtonType.Secondary,
					size = UDim2.fromScale(1, 1),
					text = HoldingLabel,
					onActivated = Gui.onActivated,
					isDisabled = Gui.isOnHold
				}),
				OffSaleButton = not Gui.isOnSale and ReactModule.createElement(Button, {
					buttonType = ButtonType.PrimarySystem,
					size = UDim2.fromScale(1, 1),
					text = HoldingLabel,
					onActivated = Gui.onActivated,
					isDisabled = Gui.isOnHold
				})
			}))
		})
	})
end))