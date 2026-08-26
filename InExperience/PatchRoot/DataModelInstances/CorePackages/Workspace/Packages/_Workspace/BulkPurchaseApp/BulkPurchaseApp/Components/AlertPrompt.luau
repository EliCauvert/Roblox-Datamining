local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local interactiveAlert = require(parent.UIBlox).App.Dialog.Alert.InteractiveAlert
local useScreenSize = require(parent.EconomyCommonCoreScriptHooks).useScreenSize
local useCloseOnEscapeEffectModule = require(bulkPurchaseApp.Hooks.useCloseOnEscapeEffect)
local fFlagBulkPurchaseCloseOnEscapeModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseCloseOnEscape)
local scrimModule = require(script.Parent.Scrim)

return function(p1)
	-- upvalues: fFlagBulkPurchaseCloseOnEscapeModule (ref), useCloseOnEscapeEffectModule (ref), useScreenSize (ref), reactModule (ref), scrimModule (ref), interactiveAlert (ref)
	if fFlagBulkPurchaseCloseOnEscapeModule then
		useCloseOnEscapeEffectModule("BulkPurchaseCloseAlertPrompt", p1.onDismiss)
	end
	return reactModule.createElement(scrimModule, {}, reactModule.createElement(interactiveAlert, {
		title = p1.title,
		bodyText = p1.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = { onActivated = p1.onDismiss, text = p1.dismissCTA }
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = useScreenSize(),
		middleContent = p1.middleContent
	}))
end