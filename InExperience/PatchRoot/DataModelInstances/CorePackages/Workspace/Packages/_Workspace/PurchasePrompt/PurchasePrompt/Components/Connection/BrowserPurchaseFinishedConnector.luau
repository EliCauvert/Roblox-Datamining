local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local guiService = game:GetService("GuiService")
local roact = require(purchasePrompt.Parent.PurchasePromptDeps).Roact
local retryAfterUpsellModule = require(purchasePrompt.Thunks.retryAfterUpsell)
local externalEventConnectionModule = require(script.Parent.ExternalEventConnection)

return require(purchasePrompt.connectToStore)(nil, function(p1) --[[ line: 31 | named "mapDispatchToProps" ]]
	-- upvalues: retryAfterUpsellModule (ref)
	return {
		onBrowserWindowClosed = function() --[[ line: 33 ]]
			-- upvalues: p1 (ref), retryAfterUpsellModule (copy)
			p1(retryAfterUpsellModule())
		end
	}
end)(function(p0) --[[ line: 17 | named "BrowserPurchaseFinishedConnector" ]]
	-- upvalues: roact (ref), externalEventConnectionModule (ref), guiService (ref)
	return roact.createElement(externalEventConnectionModule, {
		event = guiService.BrowserWindowClosed,
		callback = p0.onBrowserWindowClosed
	})
end)