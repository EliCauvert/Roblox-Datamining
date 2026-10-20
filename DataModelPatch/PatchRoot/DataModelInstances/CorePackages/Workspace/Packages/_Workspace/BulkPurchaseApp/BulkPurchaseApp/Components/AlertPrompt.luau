local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local InteractiveAlert = require(Parent.UIBlox).App.Dialog.Alert.InteractiveAlert
local UseScreenSizeFunction = require(Parent.EconomyCommonCoreScriptHooks).useScreenSize
local ScrimModule = require(script.Parent.Scrim)

return function(p1)
	-- upvalues: UseScreenSizeFunction (copy), ReactModule (copy), ScrimModule (copy), InteractiveAlert (copy)
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