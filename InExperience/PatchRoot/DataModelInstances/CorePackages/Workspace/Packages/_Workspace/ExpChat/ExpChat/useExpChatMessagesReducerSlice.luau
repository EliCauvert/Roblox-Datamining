local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local tutilsModule = require(parent.tutils)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(expChat.installReducer.Messages)

return function()
	-- upvalues: useSelector (ref), tutilsModule (ref)
	return useSelector(function(p1)
		return p1.Messages
	end, tutilsModule.shallowEqual)
end