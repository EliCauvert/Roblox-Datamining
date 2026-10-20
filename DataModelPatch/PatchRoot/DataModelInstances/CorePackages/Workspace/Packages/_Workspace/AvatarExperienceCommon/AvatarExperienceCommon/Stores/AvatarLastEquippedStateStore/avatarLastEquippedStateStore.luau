local AvatarLastEquippedState = nil
local ChangedLayeredMakeupSorting = false
local ShouldRevertLastEquippedState = true

return {
	getAvatarLastEquippedState = function()
		-- upvalues: AvatarLastEquippedState (ref)
		return AvatarLastEquippedState
	end,
	setAvatarLastEquippedState = function(Value)
		-- upvalues: AvatarLastEquippedState (ref)
		AvatarLastEquippedState = Value
	end,
	getChangedLayeredMakeupSorting = function()
		-- upvalues: ChangedLayeredMakeupSorting (ref)
		return ChangedLayeredMakeupSorting
	end,
	setChangedLayeredMakeupSorting = function(Value)
		-- upvalues: ChangedLayeredMakeupSorting (ref)
		ChangedLayeredMakeupSorting = Value
	end,
	getShouldRevertLastEquippedState = function()
		-- upvalues: ShouldRevertLastEquippedState (ref)
		return ShouldRevertLastEquippedState
	end,
	setShouldRevertLastEquippedState = function(Value)
		-- upvalues: ShouldRevertLastEquippedState (ref)
		ShouldRevertLastEquippedState = Value
	end
}