local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local var1 = require(parent.ExpChatShared).Logger:new("ExpChat/Reducers/" .. script.Name)
local actions = expChat.Actions

return roduxModule.createReducer(1, {
	[require(actions.AvatarContextMenuWhisperSelected).name] = function(p1, _)
		-- upvalues: var1 (ref)
		var1:trace("AvatarContextMenuWhisperSelected dispatched")
		
		return p1 * -1
	end,
	[require(actions.PresetTrayKeyboardSelected).name] = function(p1, _)
		-- upvalues: var1 (ref)
		var1:trace("PresetTrayKeyboardSelected dispatched")
		
		return p1 * -1
	end
})