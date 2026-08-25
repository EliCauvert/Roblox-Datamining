local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local var2 = require(parent.ExpChatShared).Logger:new("ExpChat/Reducers/" .. script.Name)
local actions = expChat.Actions

return roduxModule.createReducer(1, {
	[require(actions.AvatarContextMenuWhisperSelected).name] = function(p0, _)
		-- upvalues: var2 (ref)
		var2:trace("AvatarContextMenuWhisperSelected dispatched")
		
		return p0 * -1
	end,
	[require(actions.PresetTrayKeyboardSelected).name] = function(p1, _)
		-- upvalues: var2 (ref)
		var2:trace("PresetTrayKeyboardSelected dispatched")
		
		return p1 * -1
	end
})