local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local interactiveAlert = require(parent.UIBlox).App.Dialog.Alert.InteractiveAlert
local useScreenSize = require(parent.EconomyCommonCoreScriptHooks).useScreenSize
local scrimModule = require(script.Parent.Scrim)

return function(p0) --[[ line: 18 | named "AlertPrompt" ]]
	-- upvalues: useScreenSize (ref), reactModule (ref), scrimModule (ref), interactiveAlert (ref)
	return reactModule.createElement(scrimModule, {}, reactModule.createElement(interactiveAlert, {
		title = p0.title,
		bodyText = p0.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = { onActivated = p0.onDismiss, text = p0.dismissCTA }
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = useScreenSize(),
		middleContent = p0.middleContent
	}))
end