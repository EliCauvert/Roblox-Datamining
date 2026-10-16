local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local GuiService = game:GetService("GuiService")
local Roact = require(PurchasePrompt.Parent.PurchasePromptDeps).Roact
local RetryAfterUpsellModule = require(PurchasePrompt.Thunks.retryAfterUpsell)
local ExternalEventConnectionModule = require(script.Parent.ExternalEventConnection)

return (require(PurchasePrompt.connectToStore)(nil, function(Callback) --[[ Line: 31 | Named "mapDispatchToProps" ]]
	-- upvalues: RetryAfterUpsellModule (copy)
	return {
		onBrowserWindowClosed = function() --[[ Line: 33 ]]
			-- upvalues: Callback (copy), RetryAfterUpsellModule (upval)
			Callback(RetryAfterUpsellModule())
		end
	}
end)(function(p1) --[[ Line: 17 | Named "BrowserPurchaseFinishedConnector" ]]
	-- upvalues: Roact (copy), ExternalEventConnectionModule (copy), GuiService (copy)
	return Roact.createElement(ExternalEventConnectionModule, {
		event = GuiService.BrowserWindowClosed,
		callback = p1.onBrowserWindowClosed
	})
end))