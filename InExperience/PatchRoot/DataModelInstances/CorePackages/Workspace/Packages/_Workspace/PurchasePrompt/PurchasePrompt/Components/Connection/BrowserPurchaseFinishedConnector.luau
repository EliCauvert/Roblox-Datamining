local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local guiService = game:GetService("GuiService")
local roact = require(purchasePrompt.Parent.PurchasePromptDeps).Roact
local retryAfterUpsellModule = require(purchasePrompt.Thunks.retryAfterUpsell)
local externalEventConnectionModule = require(script.Parent.ExternalEventConnection)

return require(purchasePrompt.connectToStore)(nil, function(p1)
	-- upvalues: retryAfterUpsellModule (ref)
	return {
		onBrowserWindowClosed = function()
			-- upvalues: p1 (ref), retryAfterUpsellModule (copy)
			p1(retryAfterUpsellModule())
		end
	}
end)(function(p1)
	-- upvalues: roact (ref), externalEventConnectionModule (ref), guiService (ref)
	return roact.createElement(externalEventConnectionModule, {
		event = guiService.BrowserWindowClosed,
		callback = p1.onBrowserWindowClosed
	})
end)