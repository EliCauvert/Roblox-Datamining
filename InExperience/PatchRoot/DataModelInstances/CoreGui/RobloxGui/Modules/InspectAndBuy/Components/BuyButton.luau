local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local GuiService = game:GetService("GuiService")
local MarketplaceService = game:GetService("MarketplaceService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local Parent = script.Parent.Parent
local ColorsModule = require(Parent.Colors)
local PromptPurchaseModule = require(Parent.Thunks.PromptPurchase)
local GetSelectionImageObjectRoundedModule = require(Parent.getSelectionImageObjectRounded)
local UtilityFunctionsModule = require(Parent.UtilityFunctions)
local BuyButton = RoactModule.PureComponent:extend("BuyButton")

function BuyButton.init(p1) --[[ Line: 21 ]]
	-- upvalues: GetSelectionImageObjectRoundedModule (copy), GuiService (copy)
	p1.selectedImage = GetSelectionImageObjectRoundedModule()
	p1.connections = {}
	p1.lastGamepadFocus = nil
	
	function p1.onPromptPurchaseFinished() --[[ Line: 26 ]]
		-- upvalues: p1 (copy), GuiService (upval)
		if p1.props.gamepadEnabled and p1.props.visible then
			GuiService.SelectedCoreObject = p1.lastGamepadFocus
		end
	end
end

function BuyButton.render(p1) --[[ Line: 34 ]]
	-- upvalues: UtilityFunctionsModule (copy), RoactModule (copy), ColorsModule (copy), GuiService (copy), AppFonts (copy)
	local ItemType = p1.props.itemType
	local ItemId = p1.props.itemId
	local ForSale = p1.props.forSale
	local PromptPurchaseFunction = p1.props.promptPurchase
	local BuyText = p1.props.buyText
	local CollectibleItemId = p1.props.collectibleItemId
	local CollectibleLowestAvailableResaleProductId = p1.props.collectibleLowestAvailableResaleProductId
	local CollectibleLowestAvailableResaleItemInstanceId = p1.props.collectibleLowestAvailableResaleItemInstanceId
	local CollectibleLowestResalePrice = p1.props.collectibleLowestResalePrice
	local IsLimited2Point0_Or_LimitedCollectible = UtilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(p1.props.assetInfo)
	local ImageTransparency: number = if ForSale then 0 else 0.5
	
	return RoactModule.createElement("ImageButton", {
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundTransparency = 1,
		Size = UDim2.new(0.5, -32, 0, 44),
		Image = "rbxasset://textures/ui/InspectMenu/Button_white.png",
		ImageColor3 = ColorsModule.Green,
		SelectionImageObject = p1.selectedImage,
		LayoutOrder = 3,
		ImageTransparency = ImageTransparency,
		[RoactModule.Ref] = p1.props.buyButtonRef,
		[RoactModule.Event.Activated] = function() --[[ Line: 66 ]]
			-- upvalues: ForSale (copy), p1 (copy), GuiService (upval), PromptPurchaseFunction (copy), ItemId (copy), ItemType (copy), CollectibleItemId (copy), CollectibleLowestAvailableResaleProductId (copy), CollectibleLowestAvailableResaleItemInstanceId (copy), CollectibleLowestResalePrice (copy), IsLimited2Point0_Or_LimitedCollectible (copy)
			if ForSale then
				if p1.props.gamepadEnabled and p1.props.visible then
					p1.lastGamepadFocus = GuiService.SelectedCoreObject
					GuiService.SelectedCoreObject = nil
				end
				PromptPurchaseFunction(ItemId, ItemType, CollectibleItemId, CollectibleLowestAvailableResaleProductId, CollectibleLowestAvailableResaleItemInstanceId, CollectibleLowestResalePrice, IsLimited2Point0_Or_LimitedCollectible)
			end
		end
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		RobuxIcon = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/common/robux_small.png",
			LayoutOrder = 1,
			Size = UDim2.new(0, 16, 0, 16),
			ImageTransparency = ImageTransparency,
			ImageColor3 = ColorsModule.White,
			Visible = p1.props.showRobuxIcon
		}),
		BuyText = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 16,
			LayoutOrder = 2,
			Size = UDim2.new(0, p1:getBuyButtonTextSize(BuyText), 1, 0),
			Text = tostring(BuyText),
			Font = AppFonts.default:getDefault(),
			TextColor3 = ColorsModule.White,
			TextTransparency = ImageTransparency,
			TextXAlignment = Enum.TextXAlignment.Center
		})
	})
end

function BuyButton.didMount(p1) --[[ Line: 114 ]]
	-- upvalues: MarketplaceService (copy)
	local PromptBundlePurchaseFinishedConnection = MarketplaceService.PromptBundlePurchaseFinished:Connect(p1.onPromptPurchaseFinished)
	table.insert(p1.connections, (MarketplaceService.PromptPurchaseFinished:Connect(p1.onPromptPurchaseFinished)))
	table.insert(p1.connections, PromptBundlePurchaseFinishedConnection)
end

function BuyButton.willUnmount(p1) --[[ Line: 122 ]]
	for _, connection in pairs(p1.connections) do
		connection:Disconnect()
	end
end

function BuyButton.getBuyButtonTextSize(p2, BuyText) --[[ Line: 128 ]]
	-- upvalues: TextService (copy), AppFonts (copy)
	if p2.props.buyButtonRef.current then
		local TextSize = TextService:GetTextSize(tostring(BuyText), 16, AppFonts.default:getDefault(), Vector2.new(p2.props.buyButtonRef.current.AbsoluteSize.X, 5000))
		p2.props.buyButtonRef.Size = UDim2.new(0, 1, 0, TextSize.Y)
		
		return TextSize.X > 32 and TextSize.X or 32
	else
		return 0
	end
end

return RoactRoduxModule.UNSTABLE_connect2(function(p2, _) --[[ Line: 143 ]]
	return {
		locale = p2.locale,
		view = p2.view,
		assetInfo = p2.assets[p2.detailsInformation.assetId],
		gamepadEnabled = p2.gamepadEnabled,
		visible = p2.visible
	}
end, function(Callback) --[[ Line: 153 ]]
	-- upvalues: PromptPurchaseModule (copy)
	return {
		promptPurchase = function(p2, p3, p4, p5, p6, p7, p8) --[[ Line: 155 ]]
			-- upvalues: Callback (copy), PromptPurchaseModule (upval)
			Callback(PromptPurchaseModule(p2, p3, p4, p5, p6, p7, p8))
		end
	}
end)(BuyButton)