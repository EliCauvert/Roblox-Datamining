local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent

return require(Parent.Rodux).createReducer(false, {
	[require(Parent.ExpChatShared).Actions.ClientAppLoaded.name] = function(_, p1) --[[ Line: 10 ]]
		return p1.isGamepadEnabled
	end,
	[require(ExpChat.Actions.LastInputTypeChanged).name] = function(p1, p2) --[[ Line: 13 ]]
		return p2.lastInputTypeUsed == Enum.UserInputType.Gamepad1 or p2.lastInputTypeUsed ~= Enum.UserInputType.Keyboard and p1
	end
})