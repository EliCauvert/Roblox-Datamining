local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent

return require(parent.Rodux).createReducer(false, {
	[require(parent.ExpChatShared).Actions.ClientAppLoaded.name] = function(_, p1)
		return p1.isGamepadEnabled
	end,
	[require(expChat.Actions.LastInputTypeChanged).name] = function(p1, p2)
		return p2.lastInputTypeUsed == Enum.UserInputType.Gamepad1 or (if p2.lastInputTypeUsed == Enum.UserInputType.Keyboard then false else p1)
	end
})