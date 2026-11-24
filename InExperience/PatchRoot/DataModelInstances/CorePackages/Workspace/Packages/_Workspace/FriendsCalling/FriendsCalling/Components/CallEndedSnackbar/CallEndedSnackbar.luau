local Parent = script:FindFirstAncestor("FriendsCalling").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local GetCallEndedMessageModule = require(script.Parent.getCallEndedMessage)
local SnackbarDEPRECATED = FoundationModule.Snackbar_DEPRECATED
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), GetCallEndedMessageModule (copy), ReactModule (copy), SnackbarDEPRECATED (copy)
	local UseTokensResult = UseTokensFunction()
	local CallEndedMessageModule = GetCallEndedMessageModule(p1.endReason)
	
	return if CallEndedMessageModule == nil then nil else ReactModule.createElement(SnackbarDEPRECATED, {
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -math.max(20, UseTokensResult.Padding.XLarge)),
		testId = p1.testId or "friends-calling-call-ended-snackbar",
		title = CallEndedMessageModule
	})
end