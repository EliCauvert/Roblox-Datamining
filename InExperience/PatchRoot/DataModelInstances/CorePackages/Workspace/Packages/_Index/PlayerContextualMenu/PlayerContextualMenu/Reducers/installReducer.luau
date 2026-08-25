local playerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local roduxModule = require(playerContextualMenu.Parent.Rodux)
local userBlockingModule = require(playerContextualMenu.Rodux.UserBlocking)
local fFlagUserBlockingApiPlayerContextMenuEnabledModule = require(playerContextualMenu.Flags.FFlagUserBlockingApiPlayerContextMenuEnabled)

return function()
	-- upvalues: roduxModule (ref), fFlagUserBlockingApiPlayerContextMenuEnabledModule (ref), userBlockingModule (ref)
	return roduxModule.combineReducers({
		IsBlockedByMe = if not fFlagUserBlockingApiPlayerContextMenuEnabledModule then require(script.Parent.IsBlockedByMe) else nil,
		UserBlocking = if fFlagUserBlockingApiPlayerContextMenuEnabledModule then userBlockingModule.installReducer() else nil
	})
end