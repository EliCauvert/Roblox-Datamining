local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local alertPromptModule = require(bulkPurchaseApp.Components.AlertPrompt)

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), alertPromptModule (ref)
	local var1 = useLocalization({
		title = "CoreScripts.BulkPurchasePrompt.SuccessPrompt.Heading",
		bodyText = "CoreScripts.BulkPurchasePrompt.SuccessPrompt.Body",
		dismissCTA = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.DismissCTA"
	})
	
	return reactModule.createElement(alertPromptModule, {
		title = var1.title,
		bodyText = var1.bodyText:gsub("{.*}", tostring(p1.itemCount)),
		dismissCTA = var1.dismissCTA,
		onDismiss = p1.onDismiss
	})
end