local PlayerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local RoduxModule = require(PlayerContextualMenu.Parent.Rodux)
local UserBlockingModule = require(PlayerContextualMenu.Rodux.UserBlocking)
local FFlagUserBlockingApiPlayerContextMenuEnabledModule = require(PlayerContextualMenu.Flags.FFlagUserBlockingApiPlayerContextMenuEnabled)

return function() --[[ Line: 9 ]]
	-- upvalues: RoduxModule (copy), FFlagUserBlockingApiPlayerContextMenuEnabledModule (copy), UserBlockingModule (copy)
	return RoduxModule.combineReducers({
		IsBlockedByMe = if FFlagUserBlockingApiPlayerContextMenuEnabledModule then nil else require(script.Parent.IsBlockedByMe),
		UserBlocking = if FFlagUserBlockingApiPlayerContextMenuEnabledModule then UserBlockingModule.installReducer() else nil
	})
end