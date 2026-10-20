local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local GetFFlagEnableBankersRoundingOnResaleModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableBankersRoundingOnResale)
local IconsCommonRobux = Images["icons/common/robux"]
local IconsActionsInfoSmall = Images["icons/actions/info_small"]

local function getRobloxCommissionAmount(Number: number, MarketplaceFee)
	-- upvalues: GetFFlagEnableBankersRoundingOnResaleModule (copy), CatalogUtilsModule (copy)
	if not Number or Number <= 0 then
		return 0, 0
	end
	local TaxRate: number = MarketplaceFee.taxRate
	local MinimumFee: number = MarketplaceFee.minimumFee
	
	if not GetFFlagEnableBankersRoundingOnResaleModule() then
		return math.max(CatalogUtilsModule.Round(TaxRate * Number), MinimumFee), 0
	end
	local BankersRoundingResult: number = CatalogUtilsModule.bankersRounding(Number * (1 - TaxRate))
	local NumberDelta = Number - BankersRoundingResult
	
	if NumberDelta < MinimumFee then
		return MinimumFee, Number - MinimumFee
	else
		return NumberDelta, BankersRoundingResult
	end
end

return function(p1)
	-- upvalues: UseLocalizationModule (copy), UseStyleFunction (copy), GetFFlagEnableBankersRoundingOnResaleModule (copy), getRobloxCommissionAmount (copy), CatalogUtilsModule (copy), NumberLocalization (copy), LocalizationService (copy), UseNavigationFunction (copy), ControlState (copy), AvatarScreen (copy), ReactModule (copy), IconButton (copy), IconsActionsInfoSmall (copy), IconSize (copy), ImageSetLabel (copy), IconsCommonRobux (copy)
	local UseLocalizationModuleResult = UseLocalizationModule({
		overviewLabel = "Feature.Catalog.Heading.Overview",
		robloxFeeText = "Feature.Catalog.Label.Fee",
		sellCutText = "Feature.Catalog.Label.SellCut"
	})
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local SubHeader1 = UseStyleResultFont.SubHeader1
	local Body = UseStyleResultFont.Body
	local BaseSize = UseStyleResultFont.BaseSize
	local ScaledRelativeSize = SubHeader1.RelativeSize * BaseSize
	local ScaledRelativeSize1 = Body.RelativeSize * BaseSize
	local ScaledTaxRate = p1.marketplaceFee.taxRate * 100
	local FeePercentage = UseLocalizationModuleResult.robloxFeeText:gsub("({feePercentage})", ScaledTaxRate)
	local Number: number? = tonumber(if p1.priceInRobux and p1.priceInRobux ~= "" then p1.priceInRobux else 0)
	local RobloxCommissionAmount = nil
	local RobloxCommissionAmount2 = nil
	
	if GetFFlagEnableBankersRoundingOnResaleModule() then
		RobloxCommissionAmount, RobloxCommissionAmount2 = getRobloxCommissionAmount(Number, p1.marketplaceFee)
	else
		RobloxCommissionAmount = getRobloxCommissionAmount(Number, p1.marketplaceFee)
		RobloxCommissionAmount2 = CatalogUtilsModule.Round(Number - RobloxCommissionAmount)
	end
	local LocalizeResult = NumberLocalization.localize(RobloxCommissionAmount, LocalizationService.RobloxLocaleId)
	local LocalizeResult1 = NumberLocalization.localize(string.format("%.0f", RobloxCommissionAmount2), LocalizationService.RobloxLocaleId)
	local UseNavigationResult = UseNavigationFunction()
	
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
		OverviewFrameContainer = ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			OverviewSubHeader = ReactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				TextWrapped = true,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = UseLocalizationModuleResult.overviewLabel,
				Font = SubHeader1.Font,
				TextSize = ScaledRelativeSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency
			}),
			OverviewInfoButton = ReactModule.createElement(IconButton, {
				layoutOrder = 2,
				backgroundTransparency = 1,
				icon = IconsActionsInfoSmall,
				iconSize = IconSize.Small,
				onStateChanged = function(_, Pressed)
					-- upvalues: ControlState (upval), UseNavigationResult (copy), AvatarScreen (upval), ScaledTaxRate (copy)
					if Pressed == ControlState.Pressed or Pressed == ControlState.SelectedPressed then
						UseNavigationResult.navigate(AvatarScreen.ResaleFeePolicyPrompt, {
							yourSharePercent = 100 - ScaledTaxRate,
							robloxFeePercent = ScaledTaxRate
						})
					end
				end,
				iconColor3 = Theme.IconEmphasis.Color,
				iconTransparency = Theme.IconEmphasis.Transparency
			})
		}),
		CommissionContainer = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			CommissionLabel = ReactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				TextWrapped = true,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = FeePercentage,
				Font = Body.Font,
				TextSize = ScaledRelativeSize1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency
			}),
			CommissionAmountContainer = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 4)
				}),
				CommissionMinusText = ReactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					Text = "-",
					TextWrapped = true,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = Body.Font,
					TextSize = ScaledRelativeSize1,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.Transparency
				}),
				CommissionRobuxImage = ReactModule.createElement(ImageSetLabel, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Image = IconsCommonRobux,
					Size = UDim2.fromOffset(ScaledRelativeSize1, ScaledRelativeSize1),
					ImageColor3 = Theme.TextDefault.Color,
					ImageTransparency = Theme.TextDefault.Transparency
				}),
				CommissionAmountText = ReactModule.createElement("TextLabel", {
					LayoutOrder = 3,
					TextWrapped = true,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = LocalizeResult,
					Font = Body.Font,
					TextSize = ScaledRelativeSize1,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.Transparency
				})
			})
		}),
		YouEarnContainer = ReactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			YouEarnLabel = ReactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				TextWrapped = true,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = UseLocalizationModuleResult.sellCutText,
				Font = Body.Font,
				TextSize = ScaledRelativeSize1,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency
			}),
			YouEarnAmountRobuxContainer = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 4)
				}),
				YouEarnRobuxImage = ReactModule.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Image = IconsCommonRobux,
					Size = UDim2.fromOffset(ScaledRelativeSize1, ScaledRelativeSize1),
					ImageColor3 = Theme.TextDefault.Color,
					ImageTransparency = Theme.TextDefault.Transparency
				}),
				YouEarnAmountText = ReactModule.createElement("TextLabel", {
					LayoutOrder = 2,
					TextWrapped = true,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = LocalizeResult1,
					Font = Body.Font,
					TextSize = ScaledRelativeSize1,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.Transparency
				})
			})
		})
	})
end