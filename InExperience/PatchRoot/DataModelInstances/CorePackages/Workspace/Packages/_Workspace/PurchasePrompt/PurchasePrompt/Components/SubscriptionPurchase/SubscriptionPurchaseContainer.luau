local guiService = game:GetService("GuiService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local roact = require(parent.PurchasePromptDeps).Roact
local reactModule = require(parent.React)
local toastRoduxModule = require(parent.ToastRodux)
local coreGuiService = game:GetService("CoreGui")
local _ = coreGuiService:WaitForChild("RobloxGui")
local coreScriptsRootProvider = require(parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
local completeRequestModule = require(purchasePrompt.Thunks.completeRequest)
local launchSubscriptionPurchaseModule = require(purchasePrompt.Thunks.launchSubscriptionPurchase)
local sendEventModule = require(purchasePrompt.Thunks.sendEvent)
local connectToStoreModule = require(purchasePrompt.connectToStore)
local externalEventConnectionModule = require(purchasePrompt.Components.Connection.ExternalEventConnection)
local subscriptionPurchaseOverlayModule = require(script.Parent.SubscriptionPurchaseOverlay)
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local name = roact.Component:extend(script.Name)
local getFFlagFixPlayerGuiSelectionBugOnPromptExitModule = require(purchasePrompt.Flags.GetFFlagFixPlayerGuiSelectionBugOnPromptExit)
local getFFlagEnableSubscriptionPurchaseToastModule = require(purchasePrompt.Flags.GetFFlagEnableSubscriptionPurchaseToast)
local fFlagSetMenuOnPurchasePromptModule = require(purchasePrompt.Flags.FFlagSetMenuOnPurchasePrompt)

function name.init(p0)
	-- upvalues: getFFlagFixPlayerGuiSelectionBugOnPromptExitModule (ref)
	p0.state = { screenSize = Vector2.new(0, 0) }
	
	function p0.changeScreenSize(p1)
		-- upvalues: p0 (ref)
		if p0.state.screenSize ~= p1.AbsoluteSize then
			p0:setState({ screenSize = p1.AbsoluteSize })
		end
	end
	
	if getFFlagFixPlayerGuiSelectionBugOnPromptExitModule() then
		p0.savedSelectedCoreObject = nil
		
		function p0.endPurchase()
			-- upvalues: p0 (ref)
			p0:restoreSelectedObject()
			p0.props.completeRequest()
		end
	end
end

function name.saveSelectedObject(p2)
	-- upvalues: getFFlagFixPlayerGuiSelectionBugOnPromptExitModule (ref), guiService (ref)
	if getFFlagFixPlayerGuiSelectionBugOnPromptExitModule() then
		p2.savedSelectedCoreObject = guiService.SelectedCoreObject
		guiService.SelectedCoreObject = nil
		
		return
	end
end

function name.restoreSelectedObject(p3)
	-- upvalues: getFFlagFixPlayerGuiSelectionBugOnPromptExitModule (ref), coreGuiService (ref), guiService (ref)
	if not getFFlagFixPlayerGuiSelectionBugOnPromptExitModule() then return end
	if p3.savedSelectedCoreObject == nil or p3.savedSelectedCoreObject:IsDescendantOf(coreGuiService) then
		guiService.SelectedCoreObject = p3.savedSelectedCoreObject
	end
end

function name.createElement(p4)
	-- upvalues: getFFlagFixPlayerGuiSelectionBugOnPromptExitModule (ref), roact (ref), subscriptionPurchaseOverlayModule (ref), externalEventConnectionModule (ref), guiService (ref), fFlagSetMenuOnPurchasePromptModule (ref)
	local props = p4.props
	local state = p4.state
	
	if getFFlagFixPlayerGuiSelectionBugOnPromptExitModule() then
		p4:saveSelectedObject()
	end
	local primaryPaymentProviderType = nil
	local var17 = nil
	local subscriptionPurchaseInfo = props.subscriptionPurchaseInfo
	
	if subscriptionPurchaseInfo ~= nil then
		primaryPaymentProviderType = subscriptionPurchaseInfo.PrimaryPaymentProviderType
		var17 = if subscriptionPurchaseInfo.AllPaymentProviderTypes then subscriptionPurchaseInfo.AllPaymentProviderTypes[2] else nil
	end
	return roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		[roact.Change.AbsoluteSize] = p4.changeScreenSize,
		BackgroundTransparency = 1
	}, {
		Prompt = roact.createElement(subscriptionPurchaseOverlayModule, {
			screenSize = state.screenSize,
			promptState = props.promptState,
			purchaseError = props.purchaseError,
			economicRestrictionError = props.economicRestrictionError,
			subscriptionId = props.subscriptionId,
			name = props.subscriptionPurchaseInfo.Name,
			subscriptionProviderId = props.subscriptionPurchaseInfo.SubscriptionProviderId,
			subscriptionProviderName = props.subscriptionPurchaseInfo.SubscriptionProviderName,
			priceTier = props.subscriptionPurchaseInfo.PriceTier,
			displayPrice = props.subscriptionPurchaseInfo.DisplayPrice,
			period = props.subscriptionPurchaseInfo.DisplaySubscriptionPeriod,
			disclaimerText = props.subscriptionPurchaseInfo.DisclaimerText,
			description = props.subscriptionPurchaseInfo.Description,
			itemIcon = props.subscriptionPurchaseInfo.ImageUrl,
			primaryPaymentMethod = primaryPaymentProviderType,
			secondaryPaymentMethod = var17,
			isGamepadEnabled = props.isGamepadEnabled,
			isTestingMode = props.subscriptionPurchaseInfo.IsTestingMode,
			promptSubscriptionPurchase = props.promptSubscriptionPurchase,
			endPurchase = if getFFlagFixPlayerGuiSelectionBugOnPromptExitModule() then p4.endPurchase else props.completeRequest,
			onAnalyticEvent = props.onAnalyticEvent,
			setCurrentToastMessage = props.setCurrentToastMessage
		}),
		ModalFix = roact.createElement("ImageButton", {
			BackgroundTransparency = 0,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		}),
		OnCoreGuiMenuOpened = roact.createElement(externalEventConnectionModule, {
			event = guiService.MenuOpened,
			callback = function()
				-- upvalues: fFlagSetMenuOnPurchasePromptModule (copy), p4 (ref), props (ref)
				if fFlagSetMenuOnPurchasePromptModule and p4.menuOpenedBySelf then
					p4.menuOpenedBySelf = false
					
					return
				end
				props.completeRequest()
			end
		})
	})
end

function name.render(p5)
	-- upvalues: requestTypeModule (ref), fFlagSetMenuOnPurchasePromptModule (ref), guiService (ref), roact (ref), coreScriptsRootProvider (ref), reactModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	if p5.props.requestType == requestTypeModule.Subscription then
		local var18 = p5:createElement()
		
		if fFlagSetMenuOnPurchasePromptModule then
			if var18 ~= nil then
				p5.menuOpenedBySelf = true
			end
			guiService:SetMenuIsOpen(var18 ~= nil, "SubscriptionUpsellContainer")
		end
		return roact.createElement(coreScriptsRootProvider, {}, {
			FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
				isIsolated = true,
				isAutoFocusRoot = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
			}, { SubscriptionPurchaseContainer = var18 })
		})
	elseif fFlagSetMenuOnPurchasePromptModule then
		guiService:SetMenuIsOpen(false, "SubscriptionUpsellContainer")
	end
	return nil
end

return connectToStoreModule(function(p6)
	return {
		requestType = p6.promptRequest.requestType,
		promptState = p6.promptState,
		purchaseError = p6.purchaseError,
		economicRestrictionError = p6.economicRestrictionError,
		subscriptionPurchaseInfo = p6.subscriptionPurchaseInfo,
		subscriptionId = p6.promptRequest.id,
		isGamepadEnabled = p6.gamepadEnabled
	}
end, function(p7)
	-- upvalues: launchSubscriptionPurchaseModule (ref), completeRequestModule (ref), sendEventModule (ref), getFFlagEnableSubscriptionPurchaseToastModule (ref), setCurrentToastMessage (ref)
	return {
		promptSubscriptionPurchase = function(p8)
			-- upvalues: p7 (ref), launchSubscriptionPurchaseModule (copy)
			return p7(launchSubscriptionPurchaseModule(p8))
		end,
		completeRequest = function()
			-- upvalues: p7 (ref), completeRequestModule (copy)
			return p7(completeRequestModule())
		end,
		onAnalyticEvent = function(p9, p10)
			-- upvalues: p7 (ref), sendEventModule (copy)
			return p7(sendEventModule(p9, p10))
		end,
		setCurrentToastMessage = if getFFlagEnableSubscriptionPurchaseToastModule() then function(p11)
			-- upvalues: p7 (ref), setCurrentToastMessage (copy)
			p7(setCurrentToastMessage(p11))
		end else nil
	}
end)(name)