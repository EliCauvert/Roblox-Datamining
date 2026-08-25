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

function name.init(p0)
	p0.state = { screenSize = Vector2.new(0, 0) }
	
	function p0.changeScreenSize(p1)
		-- upvalues: p0 (ref)
		if p0.state.screenSize ~= p1.AbsoluteSize then
			p0:setState({ screenSize = p1.AbsoluteSize })
		end
	end
	
	p0.savedSelectedCoreObject = nil
	
	function p0.endPurchase()
		-- upvalues: p0 (ref)
		p0:restoreSelectedObject()
		p0.props.completeRequest()
	end
end

function name.saveSelectedObject(p2)
	-- upvalues: guiService (ref)
	p2.savedSelectedCoreObject = guiService.SelectedCoreObject
	guiService.SelectedCoreObject = nil
end

function name.restoreSelectedObject(p3)
	-- upvalues: coreGuiService (ref), guiService (ref)
	if p3.savedSelectedCoreObject == nil or p3.savedSelectedCoreObject:IsDescendantOf(coreGuiService) then
		guiService.SelectedCoreObject = p3.savedSelectedCoreObject
	end
end

function name.createElement(p4)
	-- upvalues: requestTypeModule (ref), roact (ref), premiumUpsellOverlayModule (ref), externalEventConnectionModule (ref), guiService (ref), fFlagSetMenuOnPurchasePromptModule (ref)
	local props = p4.props
	local state = p4.state
	
	if props.requestType == requestTypeModule.Premium then
		p4:saveSelectedObject()
		
		return roact.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			[roact.Change.AbsoluteSize] = p4.changeScreenSize,
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
				endPurchase = p4.endPurchase,
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
	return nil
end

function name.render(p5)
	-- upvalues: fFlagSetMenuOnPurchasePromptModule (ref), guiService (ref), getFFLagUseCoreScriptsRootProviderForUpsellModalModule (ref), roact (ref), coreScriptsRootProvider (ref), reactModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var16 = p5:createElement()
	
	if fFlagSetMenuOnPurchasePromptModule then
		if var16 ~= nil then
			p5.menuOpenedBySelf = true
		end
		guiService:SetMenuIsOpen(var16 ~= nil, "PremiumUpsellContainer")
	end
	return if getFFLagUseCoreScriptsRootProviderForUpsellModalModule() then roact.createElement(coreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { PremiumUpsellContainer = var16 })
	}) else var16
end

return connectToStoreModule(function(p6)
	return {
		requestType = p6.promptRequest.requestType,
		promptState = p6.promptState,
		purchaseError = p6.purchaseError,
		economicRestrictionError = p6.economicRestrictionError,
		premiumProductInfo = p6.premiumProductInfo,
		isGamepadEnabled = p6.gamepadEnabled
	}
end, function(p7)
	-- upvalues: launchPremiumUpsellModule (ref), completeRequestModule (ref), sendEventModule (ref), initiatePremiumPrecheckModule (ref)
	return {
		promptPremiumPurchase = function()
			-- upvalues: p7 (ref), launchPremiumUpsellModule (copy)
			return p7(launchPremiumUpsellModule())
		end,
		completeRequest = function()
			-- upvalues: p7 (ref), completeRequestModule (copy)
			return p7(completeRequestModule())
		end,
		onAnalyticEvent = function(p8, p9)
			-- upvalues: p7 (ref), sendEventModule (copy)
			return p7(sendEventModule(p8, p9))
		end,
		dispatchPremiumPrecheck = function()
			-- upvalues: p7 (ref), initiatePremiumPrecheckModule (copy)
			return p7(initiatePremiumPrecheckModule())
		end
	}
end)(name)