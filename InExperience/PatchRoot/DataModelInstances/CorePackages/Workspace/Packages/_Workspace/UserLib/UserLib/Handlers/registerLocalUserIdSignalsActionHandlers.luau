local userLib = script:FindFirstAncestor("UserLib")
local actionHandlers = require(userLib.Parent.SignalsMiddleware).ActionHandlers
local setLocalUserIdModule = require(userLib.Actions.SetLocalUserId)
local clearUserSpecificDataModule = require(userLib.Actions.ClearUserSpecificData)
local localUserIdStoreModule = require(userLib.Stores.LocalUserIdStore)

local function handleSetLocalUserId(value) --[[ line: 21 ]]
	-- upvalues: localUserIdStoreModule (ref)
	localUserIdStoreModule.setCurrentUserId(value.userId)
	
	return false
end

local function handleClearUserSpecificData(_) --[[ line: 26 ]]
	-- upvalues: localUserIdStoreModule (ref)
	localUserIdStoreModule.reset()
	
	return false
end

return function(p0) --[[ line: 31 ]]
	-- upvalues: actionHandlers (ref), setLocalUserIdModule (ref), handleSetLocalUserId (ref), clearUserSpecificDataModule (ref), handleClearUserSpecificData (ref)
	actionHandlers.register(p0, setLocalUserIdModule.name, handleSetLocalUserId)
	actionHandlers.register(p0, clearUserSpecificDataModule.name, handleClearUserSpecificData)
end