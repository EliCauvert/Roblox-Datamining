local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameHorizontal = RoactFitComponents.FitFrameHorizontal
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local FitTextLabel = RoactFitComponents.FitTextLabel
local RemoveAvailableToSellAssetModule = require(Modules.AvatarExperience.Catalog.Thunks.RemoveAvailableToSellAsset)
local GetMarketplaceFeeModule = require(Modules.AvatarExperience.Catalog.Thunks.GetMarketplaceFee)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local IconTextBoxModule = require(Modules.AvatarExperience.Catalog.Components.IconTextBox)
local RobuxAmountDisplayModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay)
local FFlagAXRemoveSellPageAndChildrenGamepadBindings = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRemoveSellPageAndChildrenGamepadBindings
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus1 = UIBloxModule.App.Loading.Enum.RetrievalStatus
local IconsCommonRobux = UIBloxModule.App.ImageSet.Images["icons/common/robux"]
local SellItemPrompt = RoactModule.PureComponent:extend("SellItemPrompt")

function SellItemPrompt.init(p1)
	-- upvalues: UserInputService (copy), WithStyleFunction (copy), RoactModule (copy), LoadingStateContainer (copy), RetrievalStatus1 (copy), NavigationUtilsModule (copy)
	p1.isMounted = false
	p1.state = { isKeyboardRepositioned = false, priceInRobux = 0 }
	
	function p1.changeText(p2)
		-- upvalues: p1 (copy)
		if not p1.isMounted then return end
		local PriceInRobux = p1.state.priceInRobux
		local Text: string = p2.Text
		local PriceInRobux1 = if PriceInRobux == 0 then "" else PriceInRobux
		
		if string.len(Text) > 10 then
			p2.Text = PriceInRobux1
			
			return
		end
		if PriceInRobux ~= 0 and (Text == nil or Text == "") then
			p1:setState({ priceInRobux = 0 })
			
			return
		end
		if string.match(Text, "^[0-9]+$") then
			p1:setState({ priceInRobux = Text })
			
			return
		else
			p2.Text = PriceInRobux1
		end
	end
	
	function p1.sellItem()
		-- upvalues: p1 (copy)
		local PriceInRobux = p1.state.priceInRobux
		
		if PriceInRobux and tonumber(PriceInRobux) > 0 then
			p1.props.sellAsset(p1.props.networking, p1.props.itemId, p1.props.userAssetId, (tonumber(PriceInRobux)))
			
			return
		end
	end
	
	function p1.getMarketplaceFee()
		-- upvalues: p1 (copy)
		return p1.props.getMarketplaceFee(p1.props.networking)
	end
	
	p1.keyboardConnection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
		-- upvalues: p1 (copy), UserInputService (upval)
		if not p1.isMounted then return end
		if not p1.state.isKeyboardRepositioned and UserInputService.OnScreenKeyboardVisible then
			p1:setState({ isKeyboardRepositioned = true })
		end
	end)
	
	function p1.getMiddleContent(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy), RoactModule (upval), LoadingStateContainer (upval), RetrievalStatus1 (upval)
		return function()
			-- upvalues: WithStyleFunction (upval), p1 (upval), p2 (copy), RoactModule (upval), LoadingStateContainer (upval), RetrievalStatus1 (upval)
			return RoactModule.createElement(LoadingStateContainer, {
				dataStatus = RetrievalStatus1.fromRawValue(p1.props.marketPlaceFeeFetchingState),
				onRetry = p1.getMarketplaceFee,
				renderOnLoaded = function()
					-- upvalues: WithStyleFunction (upval), p1 (upval), p2 (upval)
					return WithStyleFunction(function(p3)
						-- upvalues: p1 (upval), p2 (upval)
						return p1:renderOnLoaded(p2, p3)
					end)
				end
			})
		end
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function SellItemPrompt.didMount(p1)
	-- upvalues: RetrievalStatus (copy)
	p1.isMounted = true
	
	if p1.props.marketPlaceFeeFetchingState ~= RetrievalStatus.Fetching then
		p1.getMarketplaceFee()
	end
end

function SellItemPrompt.willUpdate(p1, p2, _)
	-- upvalues: UtilsModule (copy)
	if UtilsModule.isFetchingDoneOrFailed(p1.props.sellFetchingState, p2.sellFetchingState) then
		p1.closePrompt()
	end
end

function SellItemPrompt.renderOnLoaded(p1, p2, p3)
	-- upvalues: NumberLocalization (copy), CatalogUtilsModule (copy), RoactModule (copy), FitFrameVertical (copy), Focusable (copy), IconTextBoxModule (copy), IconsCommonRobux (copy), FitTextLabel (copy), FitFrameHorizontal (copy), ImageSetLabel (copy), RobuxAmountDisplayModule (copy)
	local MarketplaceFee = p1.props.marketplaceFee
	local AveragePrice = p1.props.averagePrice
	local Localization = p1.props.localization
	local TaxRate: number = MarketplaceFee.taxRate
	local MinimumFee = MarketplaceFee.minimumFee
	local LocalizeResult = AveragePrice and NumberLocalization.localize(AveragePrice, Localization:GetLocale()) or ""
	local v1 = 0
	local LocalizeResult1 = 0
	local Flag = true
	local Number: number? = tonumber(p1.state.priceInRobux)
	
	if Number and Number > 0 then
		Flag = false
		local RoundResult = CatalogUtilsModule.Round(TaxRate * Number)
		v1 = MinimumFee < RoundResult and RoundResult or MinimumFee
		LocalizeResult1 = NumberLocalization.localize(string.format("%.0f", CatalogUtilsModule.Round(Number - v1)), Localization:GetLocale())
	end
	local _Font = p3.Font
	local Theme = p3.Theme
	local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
	local YOffset = ScaledBaseSize + 2
	
	return RoactModule.createElement(FitFrameVertical, {
		BackgroundTransparency = 1,
		contentPadding = UDim.new(0, 6),
		width = UDim.new(1, 0),
		HorizontalAlignment = Enum.HorizontalAlignment.Center
	}, {
		PriceTextBox = RoactModule.createElement(Focusable[IconTextBoxModule], {
			LayoutOrder = 1,
			PlaceholderText = p2.placeholderText,
			Image = IconsCommonRobux,
			TextInputType = Enum.TextInputType.Number,
			[RoactModule.Change.Text] = p1.changeText
		}),
		WarningText = Flag and RoactModule.createElement(FitTextLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = true,
			width = UDim.new(1, 0),
			Text = p2.minimumWarningText,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 0, 20),
			TextColor3 = Theme.Alert.Color,
			Font = _Font.Body.Font,
			TextSize = _Font.Body.RelativeSize * _Font.BaseSize
		}),
		RobuxFeeContainer = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, YOffset)
		}, {
			RobloxFeeLabel = RoactModule.createElement(FitTextLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				width = FitTextLabel.Width.FitToText,
				Font = _Font.Body.Font,
				Text = p2.robloxFeeText:gsub("({feePercentage})", TaxRate * 100),
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency,
				TextSize = ScaledBaseSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(0, 0, 1, 0)
			}),
			RobuxContainer = RoactModule.createElement(FitFrameHorizontal, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				height = UDim.new(1, 0),
				contentPadding = UDim.new(0, 6),
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0)
			}, {
				MinusText = RoactModule.createElement(FitTextLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Text = "-",
					width = FitTextLabel.Width.FitToText,
					Font = _Font.Body.Font,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.Transparency,
					TextSize = ScaledBaseSize
				}),
				Image = RoactModule.createElement(ImageSetLabel, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(0, ScaledBaseSize, 0, ScaledBaseSize),
					Image = IconsCommonRobux,
					ImageColor3 = Theme.TextDefault.Color,
					ImageTransparency = Theme.TextDefault.Transparency
				}),
				Text = RoactModule.createElement(FitTextLabel, {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					width = FitTextLabel.Width.FitToText,
					Text = NumberLocalization.localize(string.format("%.0f", v1), Localization:GetLocale()),
					Font = _Font.Body.Font,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.Transparency,
					TextSize = ScaledBaseSize
				})
			})
		}),
		YouEarnContainer = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 4,
			Size = UDim2.new(1, 0, 0, YOffset)
		}, {
			YouEarnLabel = RoactModule.createElement(FitTextLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				width = FitTextLabel.Width.FitToText,
				Font = _Font.Body.Font,
				Text = p2.sellCutText,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextSize = ScaledBaseSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(0, 0, 1, 0)
			}),
			RobuxContainer = RoactModule.createElement(FitFrameHorizontal, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				height = UDim.new(1, 0),
				contentPadding = UDim.new(0, 6),
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0)
			}, {
				Image = RoactModule.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(0, ScaledBaseSize, 0, ScaledBaseSize),
					Image = IconsCommonRobux,
					ImageColor3 = Theme.TextDefault.Color,
					ImageTransparency = Theme.TextDefault.Transparency
				}),
				Text = RoactModule.createElement(FitTextLabel, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					width = FitTextLabel.Width.FitToText,
					Text = tostring(LocalizeResult1),
					Font = _Font.Body.Font,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					TextSize = ScaledBaseSize
				})
			})
		}),
		AverageSellPriceContainer = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 5,
			Size = UDim2.new(1, 0, 0, YOffset)
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 12),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			AverageSellPriceLabel = RoactModule.createElement(FitTextLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				width = FitTextLabel.Width.FitToText,
				Font = _Font.Body.Font,
				Text = p2.averageSellPriceText,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency,
				TextSize = ScaledBaseSize
			}),
			RobuxContainer = RoactModule.createElement(RobuxAmountDisplayModule, {
				padding = 6,
				robuxAmountText = LocalizeResult,
				iconSize = ScaledBaseSize,
				textSize = ScaledBaseSize
			})
		})
	})
end

function SellItemPrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy), UserInputService (copy), RoactModule (copy), Focusable (copy), FFlagAXRemoveSellPageAndChildrenGamepadBindings (copy), RoactGamepadModule (copy), InteractiveAlert (copy), ButtonType (copy), RetrievalStatus (copy)
	return WithLocalizationFunction({
		titleText = "Feature.Catalog.Heading.SellItem",
		robloxFeeText = "Feature.Catalog.Label.RobuxFee",
		sellCutText = "Feature.Catalog.Label.SellCut",
		averageSellPriceText = "Feature.Catalog.Label.AveragePrice",
		placeholderText = "Feature.Catalog.Label.Price",
		minimumWarningText = "Feature.Catalog.Label.MinimumAmount",
		minimumWarningTextWithPrice = "Feature.Catalog.Label.MinimumAmountCustom",
		confirmButtonText = "Feature.Catalog.Action.Sell",
		cancelButtonText = "Feature.Catalog.Action.Cancel"
	})(function(p2)
		-- upvalues: p1 (copy), UserInputService (upval), RoactModule (upval), Focusable (upval), FFlagAXRemoveSellPageAndChildrenGamepadBindings (upval), RoactGamepadModule (upval), InteractiveAlert (upval), ButtonType (upval), RetrievalStatus (upval)
		local ScreenSize = p1.props.screenSize
		local Number: number? = tonumber(p1.state.priceInRobux)
		local NoNumber: boolean = not Number or Number == 0
		
		return RoactModule.createElement(Focusable.Frame, {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			inputBindings = if FFlagAXRemoveSellPageAndChildrenGamepadBindings then nil else {
				SellItem = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonX, p1.sellItem, { key = "Feature.Catalog.Action.Sell", disabled = NoNumber })
			}
		}, {
			InteractiveAlert = RoactModule.createElement(InteractiveAlert, {
				isMiddleContentFocusable = true,
				title = p2.titleText,
				buttonStackInfo = {
					buttons = {
						{
							isDefaultChild = true,
							props = {
								onActivated = p1.closePrompt,
								text = p2.cancelButtonText
							}
						},
						{
							buttonType = ButtonType.PrimarySystem,
							props = {
								isDisabled = NoNumber,
								isLoading = p1.props.sellFetchingState == RetrievalStatus.Fetching or p1.props.marketPlaceFeeFetchingState == RetrievalStatus.Fetching,
								onActivated = p1.sellItem,
								text = p2.confirmButtonText
							}
						}
					}
				},
				middleContent = p1.getMiddleContent(p2),
				position = if p1.state.isKeyboardRepositioned then UDim2.new(0.5, 0, 0, (ScreenSize.Y - UserInputService.OnScreenKeyboardSize.Y) / 2) else UDim2.new(0.5, 0, 0.5, 0),
				screenSize = p1.props.screenSize,
				defaultChildRef = p1.props.defaultChildRef
			})
		})
	end)
end

function SellItemPrompt.willUnmount(p1)
	p1.keyboardConnection:disconnect()
	p1.keyboardConnection = nil
	p1.isMounted = false
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactServices.connect({
	networking = RoactNetworkingModule,
	localization = RoactLocalizationModule
})((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: ItemDataModule (copy), PerformFetch (copy), CatalogConstantsModule (copy)
	local UserAssetId = p2.userAssetId
	local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, p2.itemId, p2.itemType)
	local CollectibleItemId = ItemDataModuleResult and ItemDataModuleResult.collectibleItemId
	
	return {
		screenSize = p1.ScreenSize,
		averagePrice = ItemDataModuleResult and ItemDataModuleResult.averagePrice,
		sellFetchingState = PerformFetch.GetStatus(p1, CatalogConstantsModule.RemoveAvailableToSellAssetKey .. tostring(UserAssetId)),
		marketPlaceFeeFetchingState = PerformFetch.GetStatus(p1, CatalogConstantsModule.GetMarketplaceFeeKey),
		marketplaceFee = p1.AvatarExperience.Catalog.MarketplaceFee,
		collectibleItemId = CollectibleItemId,
		priceFloor = p1.AvatarExperience.Catalog.CollectibleMarketplaceResaleParameters and p1.AvatarExperience.Catalog.CollectibleMarketplaceResaleParameters[CollectibleItemId] and p1.AvatarExperience.Catalog.CollectibleMarketplaceResaleParameters[CollectibleItemId].priceFloor or 0
	}
end, function(Callback)
	-- upvalues: GetMarketplaceFeeModule (copy), RemoveAvailableToSellAssetModule (copy)
	return {
		getMarketplaceFee = function(p1)
			-- upvalues: Callback (copy), GetMarketplaceFeeModule (upval)
			return Callback(GetMarketplaceFeeModule(p1))
		end,
		sellAsset = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), RemoveAvailableToSellAssetModule (upval)
			return Callback(RemoveAvailableToSellAssetModule(p1, p2, p3, p4))
		end
	}
end)(SellItemPrompt))))))))