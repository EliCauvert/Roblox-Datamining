local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local MemStorageService = game:GetService("MemStorageService")
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local LoginStatus = require(CorePackages.Workspace.Packages.RobloxAppEnums).LoginStatus
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local MemStorageKeysModule = require(Modules.LuaApp.Enum.MemStorageKeys)
local ApiFetchReminderOfNormsModule = require(Modules.LuaApp.Thunks.Moderation.ApiFetchReminderOfNorms)
local GetFFlagEnableCachingforReminderOfNormsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableCachingforReminderOfNorms

local function _(p1, p2, Item): boolean
	-- upvalues: MemStorageService (copy), MemStorageKeysModule (copy)
	return if p1 then not p2 or (not MemStorageService:HasItem(MemStorageKeysModule.ReminderOfNorms) or Item ~= MemStorageService:GetItem(MemStorageKeysModule.ReminderOfNorms)) else false
end

return function(_)
	-- upvalues: UseSelectorFunction (copy), LoginStatus (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), ReactModule (copy), GetFFlagEnableCachingforReminderOfNormsFunction (copy), MemStorageService (copy), MemStorageKeysModule (copy), ApiFetchReminderOfNormsModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p1): boolean
		-- upvalues: LoginStatus (upval)
		return p1.AuthenticationStatus.status == LoginStatus.LOGGED_IN
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		return p1.LocalUserId
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), GetFFlagEnableCachingforReminderOfNormsFunction (upval), UseSelectorResult1 (copy), MemStorageService (upval), MemStorageKeysModule (upval), UseDispatchResult (copy), ApiFetchReminderOfNormsModule (upval), UseRoactServiceModuleResult (copy)
		local FFlagEnableCachingforReminderOfNorms = GetFFlagEnableCachingforReminderOfNormsFunction()
		
		if if UseSelectorResult then not FFlagEnableCachingforReminderOfNorms or (not MemStorageService:HasItem(MemStorageKeysModule.ReminderOfNorms) or UseSelectorResult1 ~= MemStorageService:GetItem(MemStorageKeysModule.ReminderOfNorms)) else false then
			UseDispatchResult(ApiFetchReminderOfNormsModule(UseRoactServiceModuleResult)):andThen(function()
				-- upvalues: MemStorageService (upval), MemStorageKeysModule (upval), UseSelectorResult1 (upval)
				MemStorageService:SetItem(MemStorageKeysModule.ReminderOfNorms, UseSelectorResult1)
			end):catch(function() end)
		end
		return nil
	end, {
		UseSelectorResult,
		UseSelectorResult1,
		UseRoactServiceModuleResult
	})
	
	return nil
end