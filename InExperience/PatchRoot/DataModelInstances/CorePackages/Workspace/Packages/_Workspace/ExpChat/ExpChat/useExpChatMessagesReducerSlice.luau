local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local tutilsModule = require(parent.tutils)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(expChat.installReducer.Messages)

return function() --[[ line: 14 ]]
	-- upvalues: useSelector (ref), tutilsModule (ref)
	return useSelector(function(p0) --[[ line: 15 ]]
		return p0.Messages
	end, tutilsModule.shallowEqual)
end