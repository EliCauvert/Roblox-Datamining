local guiService = game:GetService("GuiService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local purchasePromptDepsModule = require(parent.PurchasePromptDeps)
local roact = purchasePromptDepsModule.Roact
local reactModule = require(parent.React)
local coreScriptsRootProvider = require(parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local purchaseVIPServerFlow = purchasePromptDepsModule.IAPExperience.PurchaseFlow.PurchaseVIPServerFlow
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
local completeRequestModule = require(purchasePrompt.Thunks.completeRequest)
local connectToStoreModule = require(purchasePrompt.connectToStore)
local externalEventConnectionModule = require(purchasePrompt.Components.Connection.ExternalEventConnection)
local name = roact.Component:extend(script.Name)

function name.render(p1)
	-- upvalues: requestTypeModule (ref), roact (ref), coreScriptsRootProvider (ref), reactModule (ref), purchaseVIPServerFlow (ref), purchaseErrorModule (ref), externalEventConnectionModule (ref), guiService (ref)
	local props = p1.props
	
	return if props.requestType == requestTypeModule.VIPServer then roact.createElement(coreScriptsRootProvider, {}, {
		Prompt = reactModule.createElement(purchaseVIPServerFlow, {
			isUnsupportedInStudio = props.purchaseError == purchaseErrorModule.UnsupportedInStudio,
			onClose = props.completeRequest
		}),
		ModalFix = roact.createElement("ImageButton", {
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.fromOffset(0, 0)
		}),
		OnCoreGuiMenuOpened = roact.createElement(externalEventConnectionModule, {
			event = guiService.MenuOpened,
			callback = props.completeRequest
		})
	}) else nil
end

return connectToStoreModule(function(p1)
	return {
		requestType = p1.promptRequest.requestType,
		purchaseError = p1.purchaseError
	}
end, function(p1)
	-- upvalues: completeRequestModule (ref)
	return {
		completeRequest = function()
			-- upvalues: p1 (ref), completeRequestModule (copy)
			return p1(completeRequestModule())
		end
	}
end)(name)