local UserLib = script:FindFirstAncestor("UserLib")
local Parent = UserLib.Parent
local ActionHandlers = require(Parent.SignalsMiddleware).ActionHandlers
local SetLocalUserIdModule = require(UserLib.Actions.SetLocalUserId)
local ClearUserSpecificDataModule = require(UserLib.Actions.ClearUserSpecificData)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore

local function handleSetLocalUserId(p1): boolean
	-- upvalues: LocalUserIdStore (copy)
	LocalUserIdStore.setCurrentUserId(p1.userId)
	
	return false
end

local function handleClearUserSpecificData(_): boolean
	-- upvalues: LocalUserIdStore (copy)
	LocalUserIdStore.reset()
	
	return false
end

return function(p1)
	-- upvalues: ActionHandlers (copy), SetLocalUserIdModule (copy), handleSetLocalUserId (copy), ClearUserSpecificDataModule (copy), handleClearUserSpecificData (copy)
	ActionHandlers.register(p1, SetLocalUserIdModule.name, handleSetLocalUserId)
	ActionHandlers.register(p1, ClearUserSpecificDataModule.name, handleClearUserSpecificData)
end