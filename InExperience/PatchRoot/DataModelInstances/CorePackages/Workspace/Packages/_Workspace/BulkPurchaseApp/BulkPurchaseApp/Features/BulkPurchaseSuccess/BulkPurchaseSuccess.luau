local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local alertPromptModule = require(bulkPurchaseApp.Components.AlertPrompt)

return function(p0) --[[ line: 13 | named "BulkPurchaseSuccess" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), alertPromptModule (ref)
	local var3 = useLocalization({
		title = "CoreScripts.BulkPurchasePrompt.SuccessPrompt.Heading",
		bodyText = "CoreScripts.BulkPurchasePrompt.SuccessPrompt.Body",
		dismissCTA = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.DismissCTA"
	})
	
	return reactModule.createElement(alertPromptModule, {
		title = var3.title,
		bodyText = var3.bodyText:gsub("{.*}", tostring(p0.itemCount)),
		dismissCTA = var3.dismissCTA,
		onDismiss = p0.onDismiss
	})
end