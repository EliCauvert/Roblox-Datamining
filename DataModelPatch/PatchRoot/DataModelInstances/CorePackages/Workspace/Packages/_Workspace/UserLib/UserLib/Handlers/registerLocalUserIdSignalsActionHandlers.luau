local UserLib = script:FindFirstAncestor("UserLib")
local ActionHandlers = require(UserLib.Parent.SignalsMiddleware).ActionHandlers
local SetLocalUserIdModule = require(UserLib.Actions.SetLocalUserId)
local ClearUserSpecificDataModule = require(UserLib.Actions.ClearUserSpecificData)
local LocalUserIdStoreModule = require(UserLib.Stores.LocalUserIdStore)

local function handleSetLocalUserId(p1): boolean
	-- upvalues: LocalUserIdStoreModule (copy)
	LocalUserIdStoreModule.setCurrentUserId(p1.userId)
	
	return false
end

local function handleClearUserSpecificData(_): boolean
	-- upvalues: LocalUserIdStoreModule (copy)
	LocalUserIdStoreModule.reset()
	
	return false
end

return function(p1)
	-- upvalues: ActionHandlers (copy), SetLocalUserIdModule (copy), handleSetLocalUserId (copy), ClearUserSpecificDataModule (copy), handleClearUserSpecificData (copy)
	ActionHandlers.register(p1, SetLocalUserIdModule.name, handleSetLocalUserId)
	ActionHandlers.register(p1, ClearUserSpecificDataModule.name, handleClearUserSpecificData)
end