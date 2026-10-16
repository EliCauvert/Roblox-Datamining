local GuiService = game:GetService("GuiService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local Roact = require(Parent.PurchasePromptDeps).Roact
local ReactModule = require(Parent.React)
local CoreGui = game:GetService("CoreGui")
local _ = CoreGui:WaitForChild("RobloxGui")
local CoreScriptsRootProvider = require(Parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local CompleteRequestModule = require(PurchasePrompt.Thunks.completeRequest)
local LaunchSubscriptionPurchaseModule = require(PurchasePrompt.Thunks.launchSubscriptionPurchase)
local SendEventModule = require(PurchasePrompt.Thunks.sendEvent)
local ConnectToStoreModule = require(PurchasePrompt.connectToStore)
local ExternalEventConnectionModule = require(PurchasePrompt.Components.Connection.ExternalEventConnection)
local SubscriptionPurchaseOverlayModule = require(script.Parent.SubscriptionPurchaseOverlay)
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local ExtendResult = Roact.Component:extend(script.Name)
local GetFFlagEnableSubscriptionPurchaseToastModule = require(PurchasePrompt.Flags.GetFFlagEnableSubscriptionPurchaseToast)
local FFlagSetMenuOnPurchasePromptModule = require(PurchasePrompt.Flags.FFlagSetMenuOnPurchasePrompt)

function ExtendResult.init(p1) --[[ Line: 34 ]]
	p1.state = { screenSize = Vector2.new(0, 0) }
	
	function p1.changeScreenSize(Frame: Frame) --[[ Line: 39 ]]
		-- upvalues: p1 (copy)
		if p1.state.screenSize ~= Frame.AbsoluteSize then
			p1:setState({ screenSize = Frame.AbsoluteSize })
		end
	end
	
	p1.savedSelectedCoreObject = nil
	
	function p1.endPurchase() --[[ Line: 47 ]]
		-- upvalues: p1 (copy)
		p1:restoreSelectedObject()
		p1.props.completeRequest()
	end
end

function ExtendResult.saveSelectedObject(p1) --[[ Line: 53 ]]
	-- upvalues: GuiService (copy)
	p1.savedSelectedCoreObject = GuiService.SelectedCoreObject
	GuiService.SelectedCoreObject = nil
end

function ExtendResult.restoreSelectedObject(p1) --[[ Line: 58 ]]
	-- upvalues: CoreGui (copy), GuiService (copy)
	if p1.savedSelectedCoreObject == nil or p1.savedSelectedCoreObject:IsDescendantOf(CoreGui) then
		GuiService.SelectedCoreObject = p1.savedSelectedCoreObject
	end
end

function ExtendResult.createElement(CoreScriptsRootProvider) --[[ Line: 65 ]]
	-- upvalues: Roact (copy), SubscriptionPurchaseOverlayModule (copy), ExternalEventConnectionModule (copy), GuiService (copy), FFlagSetMenuOnPurchasePromptModule (copy)
	local Props = CoreScriptsRootProvider.props
	local State = CoreScriptsRootProvider.state
	CoreScriptsRootProvider:saveSelectedObject()
	local PrimaryPaymentProviderType = nil
	local AllPaymentProviderType = nil
	local SubscriptionPurchaseInfo = Props.subscriptionPurchaseInfo
	
	if SubscriptionPurchaseInfo ~= nil then
		PrimaryPaymentProviderType = SubscriptionPurchaseInfo.PrimaryPaymentProviderType
		AllPaymentProviderType = if SubscriptionPurchaseInfo.AllPaymentProviderTypes then SubscriptionPurchaseInfo.AllPaymentProviderTypes[2] else nil
	end
	return Roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		[Roact.Change.AbsoluteSize] = CoreScriptsRootProvider.changeScreenSize,
		BackgroundTransparency = 1
	}, {
		Prompt = Roact.createElement(SubscriptionPurchaseOverlayModule, {
			screenSize = State.screenSize,
			promptState = Props.promptState,
			purchaseError = Props.purchaseError,
			economicRestrictionError = Props.economicRestrictionError,
			subscriptionId = Props.subscriptionId,
			name = Props.subscriptionPurchaseInfo.Name,
			subscriptionProviderId = Props.subscriptionPurchaseInfo.SubscriptionProviderId,
			subscriptionProviderName = Props.subscriptionPurchaseInfo.SubscriptionProviderName,
			priceTier = Props.subscriptionPurchaseInfo.PriceTier,
			displayPrice = Props.subscriptionPurchaseInfo.DisplayPrice,
			period = Props.subscriptionPurchaseInfo.DisplaySubscriptionPeriod,
			disclaimerText = Props.subscriptionPurchaseInfo.DisclaimerText,
			description = Props.subscriptionPurchaseInfo.Description,
			itemIcon = Props.subscriptionPurchaseInfo.ImageUrl,
			primaryPaymentMethod = PrimaryPaymentProviderType,
			secondaryPaymentMethod = AllPaymentProviderType,
			isGamepadEnabled = Props.isGamepadEnabled,
			isTestingMode = Props.subscriptionPurchaseInfo.IsTestingMode,
			promptSubscriptionPurchase = Props.promptSubscriptionPurchase,
			endPurchase = CoreScriptsRootProvider.endPurchase,
			onAnalyticEvent = Props.onAnalyticEvent,
			setCurrentToastMessage = Props.setCurrentToastMessage
		}),
		ModalFix = Roact.createElement("ImageButton", {
			BackgroundTransparency = 0,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		}),
		OnCoreGuiMenuOpened = Roact.createElement(ExternalEventConnectionModule, {
			event = GuiService.MenuOpened,
			callback = function() --[[ Line: 121 ]]
				-- upvalues: FFlagSetMenuOnPurchasePromptModule (upval), CoreScriptsRootProvider (copy), Props (copy)
				if FFlagSetMenuOnPurchasePromptModule and CoreScriptsRootProvider.menuOpenedBySelf then
					CoreScriptsRootProvider.menuOpenedBySelf = false
					
					return
				else
					Props.completeRequest()
				end
			end
		})
	})
end

function ExtendResult.render(p1) --[[ Line: 132 ]]
	-- upvalues: RequestTypeModule (copy), FFlagSetMenuOnPurchasePromptModule (copy), GuiService (copy), Roact (copy), CoreScriptsRootProvider (copy), ReactModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	if p1.props.requestType == RequestTypeModule.Subscription then
		local Element = p1:createElement()
		
		if FFlagSetMenuOnPurchasePromptModule then
			if Element ~= nil then
				p1.menuOpenedBySelf = true
			end
			GuiService:SetMenuIsOpen(Element ~= nil, "SubscriptionUpsellContainer")
		end
		return Roact.createElement(CoreScriptsRootProvider, {}, {
			FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
				isIsolated = true,
				isAutoFocusRoot = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
			}, { SubscriptionPurchaseContainer = Element })
		})
	else
		if FFlagSetMenuOnPurchasePromptModule then
			GuiService:SetMenuIsOpen(false, "SubscriptionUpsellContainer")
		end
		return nil
	end
end

return (ConnectToStoreModule(function(p1) --[[ Line: 159 ]]
	return {
		requestType = p1.promptRequest.requestType,
		promptState = p1.promptState,
		purchaseError = p1.purchaseError,
		economicRestrictionError = p1.economicRestrictionError,
		subscriptionPurchaseInfo = p1.subscriptionPurchaseInfo,
		subscriptionId = p1.promptRequest.id,
		isGamepadEnabled = p1.gamepadEnabled
	}
end, function(Callback) --[[ Line: 171 ]]
	-- upvalues: LaunchSubscriptionPurchaseModule (copy), CompleteRequestModule (copy), SendEventModule (copy), GetFFlagEnableSubscriptionPurchaseToastModule (copy), SetCurrentToastMessageFunction (copy)
	return {
		promptSubscriptionPurchase = function(p1) --[[ Line: 173 ]]
			-- upvalues: Callback (copy), LaunchSubscriptionPurchaseModule (upval)
			return Callback(LaunchSubscriptionPurchaseModule(p1))
		end,
		completeRequest = function() --[[ Line: 176 ]]
			-- upvalues: Callback (copy), CompleteRequestModule (upval)
			return Callback(CompleteRequestModule())
		end,
		onAnalyticEvent = function(p1, p2) --[[ Line: 179 ]]
			-- upvalues: Callback (copy), SendEventModule (upval)
			return Callback(SendEventModule(p1, p2))
		end,
		setCurrentToastMessage = if GetFFlagEnableSubscriptionPurchaseToastModule() then function(p1) --[[ Line: 183 ]]
			-- upvalues: Callback (copy), SetCurrentToastMessageFunction (upval)
			Callback(SetCurrentToastMessageFunction(p1))
		end else nil
	}
end)(ExtendResult))