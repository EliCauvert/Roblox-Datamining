local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)

return require(parent.Rodux).createReducer({
	screen = nil,
	params = nil,
	requestId = 0,
	completedRequestId = 0
}, {
	[require(appChat.Actions.NavigateIntoChat).name] = function(p0, p1) --[[ line: 18 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, {
			screen = p1.screen,
			params = p1.params,
			requestId = p0.requestId + 1
		})
	end,
	[require(appChat.Actions.CompleteExternalNavigationIntoChat).name] = function(p2, p3) --[[ line: 26 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { completedRequestId = p3.requestId })
	end
})