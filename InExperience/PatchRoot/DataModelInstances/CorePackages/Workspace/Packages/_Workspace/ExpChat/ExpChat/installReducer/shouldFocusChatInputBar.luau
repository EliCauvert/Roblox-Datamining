local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoduxModule = require(Parent.Rodux)
local NewResult = require(Parent.ExpChatShared).Logger:new("ExpChat/Reducers/" .. script.Name)
local Actions = ExpChat.Actions

return RoduxModule.createReducer(1, {
	[require(Actions.AvatarContextMenuWhisperSelected).name] = function(p1: number, _): number
		-- upvalues: NewResult (copy)
		NewResult:trace("AvatarContextMenuWhisperSelected dispatched")
		
		return p1 * -1
	end,
	[require(Actions.PresetTrayKeyboardSelected).name] = function(p1: number, _): number
		-- upvalues: NewResult (copy)
		NewResult:trace("PresetTrayKeyboardSelected dispatched")
		
		return p1 * -1
	end
})