local AvatarLastEquippedState = nil
local ChangedLayeredMakeupSorting = false
local ShouldRevertLastEquippedState = true

return {
	getAvatarLastEquippedState = function() --[[ Line: 25 ]]
		-- upvalues: AvatarLastEquippedState (ref)
		return AvatarLastEquippedState
	end,
	setAvatarLastEquippedState = function(Value) --[[ Line: 29 ]]
		-- upvalues: AvatarLastEquippedState (ref)
		AvatarLastEquippedState = Value
	end,
	getChangedLayeredMakeupSorting = function() --[[ Line: 33 ]]
		-- upvalues: ChangedLayeredMakeupSorting (ref)
		return ChangedLayeredMakeupSorting
	end,
	setChangedLayeredMakeupSorting = function(Value) --[[ Line: 37 ]]
		-- upvalues: ChangedLayeredMakeupSorting (ref)
		ChangedLayeredMakeupSorting = Value
	end,
	getShouldRevertLastEquippedState = function() --[[ Line: 41 ]]
		-- upvalues: ShouldRevertLastEquippedState (ref)
		return ShouldRevertLastEquippedState
	end,
	setShouldRevertLastEquippedState = function(Value) --[[ Line: 45 ]]
		-- upvalues: ShouldRevertLastEquippedState (ref)
		ShouldRevertLastEquippedState = Value
	end
}