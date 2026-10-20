local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local UseLocalizationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Hooks.useLocalization)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconsCommonRobux = UIBloxModule.App.ImageSet.Images["icons/common/robux"]

return function(p1)
	-- upvalues: UseLocalizationModule (copy), UseStyleFunction (copy), NumberLocalization (copy), LocalizationService (copy), ReactModule (copy), ImageSetLabel (copy), IconsCommonRobux (copy)
	local UseLocalizationModuleResult = UseLocalizationModule({
		itemInfoLabel = "Feature.Catalog.Heading.ItemInfo",
		serialNumberLabel = "Feature.Catalog.Label.SerialNumberColon",
		averagePriceLabel = "Feature.Catalog.Label.AveragePriceColon"
	})
	local UseStyleResult = UseStyleFunction()
	local AveragePrice = p1.itemIdPriceSerialNumber.averagePrice
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local SubHeader1 = UseStyleResultFont.SubHeader1
	local Body = UseStyleResultFont.Body
	local BaseSize = UseStyleResultFont.BaseSize
	local ScaledRelativeSize = Body.RelativeSize * BaseSize
	local SerialNumber = if p1.itemIdPriceSerialNumber.serialNumber then p1.itemIdPriceSerialNumber.serialNumber else nil
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0)
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 10)
		}),
		ItemInfoSubHeader = ReactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			TextWrapped = true,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = UseLocalizationModuleResult.itemInfoLabel,
			Font = SubHeader1.Font,
			Size = UDim2.fromScale(1, 0),
			TextSize = SubHeader1.RelativeSize * BaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Theme.TextEmphasis.Color,
			TextTransparency = Theme.TextEmphasis.Transparency
		}),
		SerialNumberContainer = SerialNumber and ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 10)
			}),
			SerialNumberLabel = ReactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				TextWrapped = true,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = UseLocalizationModuleResult.serialNumberLabel,
				Font = Body.Font,
				TextSize = ScaledRelativeSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency
			}),
			SerialNumberText = ReactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				TextWrapped = true,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = SerialNumber,
				Font = Body.Font,
				TextSize = ScaledRelativeSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency
			})
		}),
		AveragePriceContainer = ReactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 10)
			}),
			AveragePriceLabel = ReactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				TextWrapped = true,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = UseLocalizationModuleResult.averagePriceLabel,
				Font = Body.Font,
				TextSize = ScaledRelativeSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency
			}),
			AveragePriceTextContainer = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 4)
				}),
				AveragePriceRobuxImage = ReactModule.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Image = IconsCommonRobux,
					Size = UDim2.fromOffset(ScaledRelativeSize, ScaledRelativeSize),
					ImageColor3 = Theme.TextDefault.Color,
					ImageTransparency = Theme.TextDefault.Transparency
				}),
				AveragePriceText = ReactModule.createElement("TextLabel", {
					LayoutOrder = 2,
					TextWrapped = true,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = AveragePrice and NumberLocalization.localize(AveragePrice, LocalizationService.RobloxLocaleId) or "",
					Font = Body.Font,
					TextSize = ScaledRelativeSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.Transparency
				})
			})
		})
	})
end