local userLib = script:FindFirstAncestor("UserLib")
local parent = userLib.Parent
local actionHandlers = require(parent.SignalsMiddleware).ActionHandlers
local setLocalUserIdModule = require(userLib.Actions.SetLocalUserId)
local clearUserSpecificDataModule = require(userLib.Actions.ClearUserSpecificData)
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore

local function handleSetLocalUserId(value)
	-- upvalues: localUserIdStore (ref)
	localUserIdStore.setCurrentUserId(value.userId)
	
	return false
end

local function handleClearUserSpecificData(_)
	-- upvalues: localUserIdStore (ref)
	localUserIdStore.reset()
	
	return false
end

return function(p1)
	-- upvalues: actionHandlers (ref), setLocalUserIdModule (ref), handleSetLocalUserId (ref), clearUserSpecificDataModule (ref), handleClearUserSpecificData (ref)
	actionHandlers.register(p1, setLocalUserIdModule.name, handleSetLocalUserId)
	actionHandlers.register(p1, clearUserSpecificDataModule.name, handleClearUserSpecificData)
end