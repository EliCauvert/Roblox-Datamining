local guiService = game:GetService("GuiService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local roact = require(parent.PurchasePromptDeps).Roact
local reactModule = require(parent.React)
local coreGuiService = game:GetService("CoreGui")
local _ = coreGuiService:WaitForChild("RobloxGui")
local coreScriptsRootProvider = require(parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
local completeRequestModule = require(purchasePrompt.Thunks.completeRequest)
local launchPremiumUpsellModule = require(purchasePrompt.Thunks.launchPremiumUpsell)
local sendEventModule = require(purchasePrompt.Thunks.sendEvent)
local connectToStoreModule = require(purchasePrompt.connectToStore)
local initiatePremiumPrecheckModule = require(purchasePrompt.Thunks.initiatePremiumPrecheck)
local externalEventConnectionModule = require(purchasePrompt.Components.Connection.ExternalEventConnection)
local premiumUpsellOverlayModule = require(script.Parent.PremiumUpsellOverlay)
local getFFLagUseCoreScriptsRootProviderForUpsellModalModule = require(purchasePrompt.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal)
local fFlagSetMenuOnPurchasePromptModule = require(purchasePrompt.Flags.FFlagSetMenuOnPurchasePrompt)
local name = roact.Component:extend(script.Name)

function name.init(p1)
	p1.state = { screenSize = Vector2.new(0, 0) }
	
	function p0.changeScreenSize(p2)
		-- upvalues: p1 (ref)
		if p1.state.screenSize ~= p2.AbsoluteSize then
			p1:setState({ screenSize = p2.AbsoluteSize })
		end
	end
	
	p1.savedSelectedCoreObject = nil
	
	function p0.endPurchase()
		-- upvalues: p1 (ref)
		p1:restoreSelectedObject()
		p1.props.completeRequest()
	end
end

function name.saveSelectedObject(p1)
	-- upvalues: guiService (ref)
	p1.savedSelectedCoreObject = guiService.SelectedCoreObject
	guiService.SelectedCoreObject = nil
end

function name.restoreSelectedObject(p1)
	-- upvalues: coreGuiService (ref), guiService (ref)
	if p1.savedSelectedCoreObject == nil or p1.savedSelectedCoreObject:IsDescendantOf(coreGuiService) then
		guiService.SelectedCoreObject = p1.savedSelectedCoreObject
	end
end

function name.createElement(p1)
	-- upvalues: requestTypeModule (ref), roact (ref), premiumUpsellOverlayModule (ref), externalEventConnectionModule (ref), guiService (ref), fFlagSetMenuOnPurchasePromptModule (ref)
	local props = p1.props
	local state = p1.state
	
	if props.requestType == requestTypeModule.Premium then
		p1:saveSelectedObject()
		
		return roact.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			[roact.Change.AbsoluteSize] = p1.changeScreenSize,
			BackgroundTransparency = 1
		}, {
			Prompt = roact.createElement(premiumUpsellOverlayModule, {
				screenSize = state.screenSize,
				promptState = props.promptState,
				purchaseError = props.purchaseError,
				economicRestrictionError = props.economicRestrictionError,
				currencySymbol = props.premiumProductInfo.currencySymbol,
				robuxPrice = props.premiumProductInfo.price,
				robuxAmount = props.premiumProductInfo.robuxAmount,
				isGamepadEnabled = props.isGamepadEnabled,
				promptPremiumPurchase = props.promptPremiumPurchase,
				dispatchPremiumPrecheck = props.dispatchPremiumPrecheck,
				endPurchase = p1.endPurchase,
				onAnalyticEvent = props.onAnalyticEvent
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
	return nil
end

function name.render(p1)
	-- upvalues: fFlagSetMenuOnPurchasePromptModule (ref), guiService (ref), getFFLagUseCoreScriptsRootProviderForUpsellModalModule (ref), roact (ref), coreScriptsRootProvider (ref), reactModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var1 = p1:createElement()
	
	if fFlagSetMenuOnPurchasePromptModule then
		if var1 ~= nil then
			p1.menuOpenedBySelf = true
		end
		guiService:SetMenuIsOpen(var1 ~= nil, "PremiumUpsellContainer")
	end
	return if getFFLagUseCoreScriptsRootProviderForUpsellModalModule() then roact.createElement(coreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { PremiumUpsellContainer = var1 })
	}) else var1
end

return connectToStoreModule(function(p1)
	return {
		requestType = p1.promptRequest.requestType,
		promptState = p1.promptState,
		purchaseError = p1.purchaseError,
		economicRestrictionError = p1.economicRestrictionError,
		premiumProductInfo = p1.premiumProductInfo,
		isGamepadEnabled = p1.gamepadEnabled
	}
end, function(p1)
	-- upvalues: launchPremiumUpsellModule (ref), completeRequestModule (ref), sendEventModule (ref), initiatePremiumPrecheckModule (ref)
	return {
		promptPremiumPurchase = function()
			-- upvalues: p1 (ref), launchPremiumUpsellModule (copy)
			return p1(launchPremiumUpsellModule())
		end,
		completeRequest = function()
			-- upvalues: p1 (ref), completeRequestModule (copy)
			return p1(completeRequestModule())
		end,
		onAnalyticEvent = function(p2, p3)
			-- upvalues: p1 (ref), sendEventModule (copy)
			return p1(sendEventModule(p2, p3))
		end,
		dispatchPremiumPrecheck = function()
			-- upvalues: p1 (ref), initiatePremiumPrecheckModule (copy)
			return p1(initiatePremiumPrecheckModule())
		end
	}
end)(name)