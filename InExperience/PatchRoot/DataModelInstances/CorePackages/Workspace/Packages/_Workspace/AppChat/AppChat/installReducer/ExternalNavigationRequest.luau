local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)

return require(parent.Rodux).createReducer({
	screen = nil,
	params = nil,
	requestId = 0,
	completedRequestId = 0
}, {
	[require(appChat.Actions.NavigateIntoChat).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			screen = p2.screen,
			params = p2.params,
			requestId = p1.requestId + 1
		})
	end,
	[require(appChat.Actions.CompleteExternalNavigationIntoChat).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { completedRequestId = p2.requestId })
	end
})