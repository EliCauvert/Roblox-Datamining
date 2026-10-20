local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AlertPromptModule = require(BulkPurchaseApp.Components.AlertPrompt)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), AlertPromptModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "CoreScripts.BulkPurchasePrompt.SuccessPrompt.Heading",
		bodyText = "CoreScripts.BulkPurchasePrompt.SuccessPrompt.Body",
		dismissCTA = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.DismissCTA"
	})
	
	return ReactModule.createElement(AlertPromptModule, {
		title = UseLocalizationResult.title,
		bodyText = UseLocalizationResult.bodyText:gsub("{.*}", (tostring(p1.itemCount))),
		dismissCTA = UseLocalizationResult.dismissCTA,
		onDismiss = p1.onDismiss
	})
end