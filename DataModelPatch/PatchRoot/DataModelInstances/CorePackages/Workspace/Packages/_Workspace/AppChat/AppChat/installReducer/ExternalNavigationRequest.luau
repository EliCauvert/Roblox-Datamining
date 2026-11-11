local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)

return require(Parent.Rodux).createReducer({
	screen = nil,
	params = nil,
	requestId = 0,
	completedRequestId = 0
}, {
	[require(AppChat.Actions.NavigateIntoChat).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			screen = p2.screen,
			params = p2.params,
			requestId = p1.requestId + 1
		})
	end,
	[require(AppChat.Actions.CompleteExternalNavigationIntoChat).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { completedRequestId = p2.requestId })
	end
})