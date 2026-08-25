local corePackagesService = game:GetService("CorePackages")
local textService = game:GetService("TextService")
local guiService = game:GetService("GuiService")
local marketplaceService = game:GetService("MarketplaceService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local parent = script.Parent.Parent
local colorsModule = require(parent.Colors)
local promptPurchaseModule = require(parent.Thunks.PromptPurchase)
local getSelectionImageObjectRoundedModule = require(parent.getSelectionImageObjectRounded)
local utilityFunctionsModule = require(parent.UtilityFunctions)
local buyButton = roactModule.PureComponent:extend("BuyButton")

function buyButton.init(p0)
	-- upvalues: getSelectionImageObjectRoundedModule (ref), guiService (ref)
	p0.selectedImage = getSelectionImageObjectRoundedModule()
	p0.connections = {}
	p0.lastGamepadFocus = nil
	
	function p0.onPromptPurchaseFinished()
		-- upvalues: p0 (ref), guiService (copy)
		if p0.props.gamepadEnabled and p0.props.visible then
			guiService.SelectedCoreObject = p0.lastGamepadFocus
		end
	end
end

function buyButton.render(p1)
	-- upvalues: utilityFunctionsModule (ref), roactModule (ref), colorsModule (ref), guiService (ref), appFonts (ref)
	local itemType = p1.props.itemType
	local itemId = p1.props.itemId
	local showRobuxIcon = p1.props.showRobuxIcon
	local forSale = p1.props.forSale
	local promptPurchase = p1.props.promptPurchase
	local buyText = p1.props.buyText
	local buyButtonRef = p1.props.buyButtonRef
	local collectibleItemId = p1.props.collectibleItemId
	local collectibleLowestAvailableResaleProductId = p1.props.collectibleLowestAvailableResaleProductId
	local collectibleLowestAvailableResaleItemInstanceId = p1.props.collectibleLowestAvailableResaleItemInstanceId
	local collectibleLowestResalePrice = p1.props.collectibleLowestResalePrice
	local var11 = utilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(p1.props.assetInfo)
	local var12 = if not forSale then 0.5 else 0
	
	return roactModule.createElement("ImageButton", {
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundTransparency = 1,
		Size = UDim2.new(0.5, -32, 0, 44),
		Image = "rbxasset://textures/ui/InspectMenu/Button_white.png",
		ImageColor3 = colorsModule.Green,
		SelectionImageObject = p1.selectedImage,
		LayoutOrder = 3,
		ImageTransparency = var12,
		[roactModule.Ref] = buyButtonRef,
		[roactModule.Event.Activated] = function()
			-- upvalues: forSale (ref), p1 (ref), guiService (copy), promptPurchase (ref), itemId (ref), itemType (ref), collectibleItemId (ref), collectibleLowestAvailableResaleProductId (ref), collectibleLowestAvailableResaleItemInstanceId (ref), collectibleLowestResalePrice (ref), var11 (ref)
			if forSale then
				if p1.props.gamepadEnabled and p1.props.visible then
					p1.lastGamepadFocus = guiService.SelectedCoreObject
					guiService.SelectedCoreObject = nil
				end
				promptPurchase(itemId, itemType, collectibleItemId, collectibleLowestAvailableResaleProductId, collectibleLowestAvailableResaleItemInstanceId, collectibleLowestResalePrice, var11)
			end
		end
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		RobuxIcon = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/common/robux_small.png",
			LayoutOrder = 1,
			Size = UDim2.new(0, 16, 0, 16),
			ImageTransparency = var12,
			ImageColor3 = colorsModule.White,
			Visible = showRobuxIcon
		}),
		BuyText = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 16,
			LayoutOrder = 2,
			Size = UDim2.new(0, p1:getBuyButtonTextSize(buyText), 1, 0),
			Text = tostring(buyText),
			Font = appFonts.default:getDefault(),
			TextColor3 = colorsModule.White,
			TextTransparency = var12,
			TextXAlignment = Enum.TextXAlignment.Center
		})
	})
end

function buyButton.didMount(p2)
	-- upvalues: marketplaceService (ref)
	local promptBundlePurchaseFinishedConnection = marketplaceService.PromptBundlePurchaseFinished:Connect(p2.onPromptPurchaseFinished)
	table.insert(p2.connections, marketplaceService.PromptPurchaseFinished:Connect(p2.onPromptPurchaseFinished))
	table.insert(p2.connections, promptBundlePurchaseFinishedConnection)
end

function buyButton.willUnmount(p3)
	for i, v in pairs(p3.connections) do
		v:Disconnect()
	end
end

function buyButton.getBuyButtonTextSize(p4, p5)
	-- upvalues: textService (ref), appFonts (ref)
	if p4.props.buyButtonRef.current then
		local var14 = textService:GetTextSize(tostring(p5), 16, appFonts.default:getDefault(), Vector2.new(p4.props.buyButtonRef.current.AbsoluteSize.X, 5000))
		p4.props.buyButtonRef.Size = UDim2.new(0, 1, 0, var14.Y)
		
		return if var14.X > 32 then var14.X else 32
	end
	return 0
end

return roactRoduxModule.UNSTABLE_connect2(function(p6, _)
	return {
		locale = p6.locale,
		view = p6.view,
		assetInfo = p6.assets[p6.detailsInformation.assetId],
		gamepadEnabled = p6.gamepadEnabled,
		visible = p6.visible
	}
end, function(p7)
	-- upvalues: promptPurchaseModule (ref)
	return {
		promptPurchase = function(p8, p9, p10, p11, p12, p13, p14)
			-- upvalues: p7 (ref), promptPurchaseModule (copy)
			p7(promptPurchaseModule(p8, p9, p10, p11, p12, p13, p14))
		end
	}
end)(buyButton)