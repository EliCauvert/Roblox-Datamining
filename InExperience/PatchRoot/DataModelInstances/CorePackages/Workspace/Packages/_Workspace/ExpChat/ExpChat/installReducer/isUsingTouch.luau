local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent

return require(parent.Rodux).createReducer(false, {
	[require(parent.ExpChatShared).Actions.ClientAppLoaded.name] = function(_, p0) --[[ line: 10 ]]
		return p0.isTouchEnabled
	end,
	[require(expChat.Actions.LastInputTypeChanged).name] = function(p1, p2) --[[ line: 13 ]]
		return p2.lastInputTypeUsed == Enum.UserInputType.Touch or (if p2.lastInputTypeUsed == Enum.UserInputType.Keyboard then false else p1)
	end
})