local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local InteractiveAlert = require(Parent.UIBlox).App.Dialog.Alert.InteractiveAlert
local UseScreenSizeFunction = require(Parent.EconomyCommonCoreScriptHooks).useScreenSize
local UseCloseOnEscapeEffectModule = require(BulkPurchaseApp.Hooks.useCloseOnEscapeEffect)
local FFlagBulkPurchaseCloseOnEscapeModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseCloseOnEscape)
local ScrimModule = require(script.Parent.Scrim)

return function(p1) --[[ Line: 22 | Named "AlertPrompt" ]]
	-- upvalues: FFlagBulkPurchaseCloseOnEscapeModule (copy), UseCloseOnEscapeEffectModule (copy), UseScreenSizeFunction (copy), ReactModule (copy), ScrimModule (copy), InteractiveAlert (copy)
	if FFlagBulkPurchaseCloseOnEscapeModule then
		UseCloseOnEscapeEffectModule("BulkPurchaseCloseAlertPrompt", p1.onDismiss)
	end
	return ReactModule.createElement(ScrimModule, {}, ReactModule.createElement(InteractiveAlert, {
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
		screenSize = UseScreenSizeFunction(),
		middleContent = p1.middleContent
	}))
end