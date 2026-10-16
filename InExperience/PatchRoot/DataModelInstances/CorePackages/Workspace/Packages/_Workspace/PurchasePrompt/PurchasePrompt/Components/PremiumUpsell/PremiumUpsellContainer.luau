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
local LaunchPremiumUpsellModule = require(PurchasePrompt.Thunks.launchPremiumUpsell)
local SendEventModule = require(PurchasePrompt.Thunks.sendEvent)
local ConnectToStoreModule = require(PurchasePrompt.connectToStore)
local InitiatePremiumPrecheckModule = require(PurchasePrompt.Thunks.initiatePremiumPrecheck)
local ExternalEventConnectionModule = require(PurchasePrompt.Components.Connection.ExternalEventConnection)
local PremiumUpsellOverlayModule = require(script.Parent.PremiumUpsellOverlay)
local GetFFLagUseCoreScriptsRootProviderForUpsellModalModule = require(PurchasePrompt.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal)
local FFlagSetMenuOnPurchasePromptModule = require(PurchasePrompt.Flags.FFlagSetMenuOnPurchasePrompt)
local ExtendResult = Roact.Component:extend(script.Name)

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
	-- upvalues: RequestTypeModule (copy), Roact (copy), PremiumUpsellOverlayModule (copy), ExternalEventConnectionModule (copy), GuiService (copy), FFlagSetMenuOnPurchasePromptModule (copy)
	local Props = CoreScriptsRootProvider.props
	local State = CoreScriptsRootProvider.state
	
	if Props.requestType == RequestTypeModule.Premium then
		CoreScriptsRootProvider:saveSelectedObject()
		
		return Roact.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			[Roact.Change.AbsoluteSize] = CoreScriptsRootProvider.changeScreenSize,
			BackgroundTransparency = 1
		}, {
			Prompt = Roact.createElement(PremiumUpsellOverlayModule, {
				screenSize = State.screenSize,
				promptState = Props.promptState,
				purchaseError = Props.purchaseError,
				economicRestrictionError = Props.economicRestrictionError,
				currencySymbol = Props.premiumProductInfo.currencySymbol,
				robuxPrice = Props.premiumProductInfo.price,
				robuxAmount = Props.premiumProductInfo.robuxAmount,
				isGamepadEnabled = Props.isGamepadEnabled,
				promptPremiumPurchase = Props.promptPremiumPurchase,
				dispatchPremiumPrecheck = Props.dispatchPremiumPrecheck,
				endPurchase = CoreScriptsRootProvider.endPurchase,
				onAnalyticEvent = Props.onAnalyticEvent
			}),
			ModalFix = Roact.createElement("ImageButton", {
				BackgroundTransparency = 0,
				Modal = true,
				Size = UDim2.new(0, 0, 0, 0)
			}),
			OnCoreGuiMenuOpened = Roact.createElement(ExternalEventConnectionModule, {
				event = GuiService.MenuOpened,
				callback = function() --[[ Line: 107 ]]
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
	else
		return nil
	end
end

function ExtendResult.render(p1) --[[ Line: 118 ]]
	-- upvalues: FFlagSetMenuOnPurchasePromptModule (copy), GuiService (copy), GetFFLagUseCoreScriptsRootProviderForUpsellModalModule (copy), Roact (copy), CoreScriptsRootProvider (copy), ReactModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local Element = p1:createElement()
	
	if FFlagSetMenuOnPurchasePromptModule then
		if Element ~= nil then
			p1.menuOpenedBySelf = true
		end
		GuiService:SetMenuIsOpen(Element ~= nil, "PremiumUpsellContainer")
	end
	return if GetFFLagUseCoreScriptsRootProviderForUpsellModalModule() then Roact.createElement(CoreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { PremiumUpsellContainer = Element })
	}) else Element
end

return (ConnectToStoreModule(function(p1) --[[ Line: 142 ]]
	return {
		requestType = p1.promptRequest.requestType,
		promptState = p1.promptState,
		purchaseError = p1.purchaseError,
		economicRestrictionError = p1.economicRestrictionError,
		premiumProductInfo = p1.premiumProductInfo,
		isGamepadEnabled = p1.gamepadEnabled
	}
end, function(Callback) --[[ Line: 154 ]]
	-- upvalues: LaunchPremiumUpsellModule (copy), CompleteRequestModule (copy), SendEventModule (copy), InitiatePremiumPrecheckModule (copy)
	return {
		promptPremiumPurchase = function() --[[ Line: 156 ]]
			-- upvalues: Callback (copy), LaunchPremiumUpsellModule (upval)
			return Callback(LaunchPremiumUpsellModule())
		end,
		completeRequest = function() --[[ Line: 159 ]]
			-- upvalues: Callback (copy), CompleteRequestModule (upval)
			return Callback(CompleteRequestModule())
		end,
		onAnalyticEvent = function(p1, p2) --[[ Line: 162 ]]
			-- upvalues: Callback (copy), SendEventModule (upval)
			return Callback(SendEventModule(p1, p2))
		end,
		dispatchPremiumPrecheck = function() --[[ Line: 165 ]]
			-- upvalues: Callback (copy), InitiatePremiumPrecheckModule (upval)
			return Callback(InitiatePremiumPrecheckModule())
		end
	}
end)(ExtendResult))