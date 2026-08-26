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

function name.init(p1)
	-- upvalues: getFFlagFixPlayerGuiSelectionBugOnPromptExitModule (ref)
	p1.state = { screenSize = Vector2.new(0, 0) }
	
	function p0.changeScreenSize(p2)
		-- upvalues: p1 (ref)
		if p1.state.screenSize ~= p2.AbsoluteSize then
			p1:setState({ screenSize = p2.AbsoluteSize })
		end
	end
	
	if getFFlagFixPlayerGuiSelectionBugOnPromptExitModule() then
		p1.savedSelectedCoreObject = nil
		
		function p0.endPurchase()
			-- upvalues: p1 (ref)
			p1:restoreSelectedObject()
			p1.props.completeRequest()
		end
	end
end

function name.saveSelectedObject(p1)
	-- upvalues: getFFlagFixPlayerGuiSelectionBugOnPromptExitModule (ref), guiService (ref)
	if getFFlagFixPlayerGuiSelectionBugOnPromptExitModule() then
		p1.savedSelectedCoreObject = guiService.SelectedCoreObject
		guiService.SelectedCoreObject = nil
		
		return
	end
end

function name.restoreSelectedObject(p1)
	-- upvalues: getFFlagFixPlayerGuiSelectionBugOnPromptExitModule (ref), coreGuiService (ref), guiService (ref)
	if not getFFlagFixPlayerGuiSelectionBugOnPromptExitModule() then return end
	if p1.savedSelectedCoreObject == nil or p1.savedSelectedCoreObject:IsDescendantOf(coreGuiService) then
		guiService.SelectedCoreObject = p1.savedSelectedCoreObject
	end
end

function name.createElement(p1)
	-- upvalues: getFFlagFixPlayerGuiSelectionBugOnPromptExitModule (ref), roact (ref), subscriptionPurchaseOverlayModule (ref), externalEventConnectionModule (ref), guiService (ref), fFlagSetMenuOnPurchasePromptModule (ref)
	local props = p1.props
	local state = p1.state
	
	if getFFlagFixPlayerGuiSelectionBugOnPromptExitModule() then
		p1:saveSelectedObject()
	end
	local primaryPaymentProviderType = nil
	local var1 = nil
	local subscriptionPurchaseInfo = props.subscriptionPurchaseInfo
	
	if subscriptionPurchaseInfo ~= nil then
		primaryPaymentProviderType = subscriptionPurchaseInfo.PrimaryPaymentProviderType
		var1 = if subscriptionPurchaseInfo.AllPaymentProviderTypes then subscriptionPurchaseInfo.AllPaymentProviderTypes[2] else nil
	end
	return roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		[roact.Change.AbsoluteSize] = p1.changeScreenSize,
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
			secondaryPaymentMethod = var1,
			isGamepadEnabled = props.isGamepadEnabled,
			isTestingMode = props.subscriptionPurchaseInfo.IsTestingMode,
			promptSubscriptionPurchase = props.promptSubscriptionPurchase,
			endPurchase = if getFFlagFixPlayerGuiSelectionBugOnPromptExitModule() then p1.endPurchase else props.completeRequest,
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
				-- upvalues: fFlagSetMenuOnPurchasePromptModule (copy), p1 (ref), props (ref)
				if fFlagSetMenuOnPurchasePromptModule and p1.menuOpenedBySelf then
					p1.menuOpenedBySelf = false
					
					return
				end
				props.completeRequest()
			end
		})
	})
end

function name.render(p1)
	-- upvalues: requestTypeModule (ref), fFlagSetMenuOnPurchasePromptModule (ref), guiService (ref), roact (ref), coreScriptsRootProvider (ref), reactModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	if p1.props.requestType == requestTypeModule.Subscription then
		local var1 = p1:createElement()
		
		if fFlagSetMenuOnPurchasePromptModule then
			if var1 ~= nil then
				p1.menuOpenedBySelf = true
			end
			guiService:SetMenuIsOpen(var1 ~= nil, "SubscriptionUpsellContainer")
		end
		return roact.createElement(coreScriptsRootProvider, {}, {
			FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
				isIsolated = true,
				isAutoFocusRoot = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
			}, { SubscriptionPurchaseContainer = var1 })
		})
	elseif fFlagSetMenuOnPurchasePromptModule then
		guiService:SetMenuIsOpen(false, "SubscriptionUpsellContainer")
	end
	return nil
end

return connectToStoreModule(function(p1)
	return {
		requestType = p1.promptRequest.requestType,
		promptState = p1.promptState,
		purchaseError = p1.purchaseError,
		economicRestrictionError = p1.economicRestrictionError,
		subscriptionPurchaseInfo = p1.subscriptionPurchaseInfo,
		subscriptionId = p1.promptRequest.id,
		isGamepadEnabled = p1.gamepadEnabled
	}
end, function(p1)
	-- upvalues: launchSubscriptionPurchaseModule (ref), completeRequestModule (ref), sendEventModule (ref), getFFlagEnableSubscriptionPurchaseToastModule (ref), setCurrentToastMessage (ref)
	return {
		promptSubscriptionPurchase = function(p2)
			-- upvalues: p1 (ref), launchSubscriptionPurchaseModule (copy)
			return p1(launchSubscriptionPurchaseModule(p2))
		end,
		completeRequest = function()
			-- upvalues: p1 (ref), completeRequestModule (copy)
			return p1(completeRequestModule())
		end,
		onAnalyticEvent = function(p2, p3)
			-- upvalues: p1 (ref), sendEventModule (copy)
			return p1(sendEventModule(p2, p3))
		end,
		setCurrentToastMessage = if getFFlagEnableSubscriptionPurchaseToastModule() then function(p2)
			-- upvalues: p1 (ref), setCurrentToastMessage (copy)
			p1(setCurrentToastMessage(p2))
		end else nil
	}
end)(name)