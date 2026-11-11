local CorePackages = game:GetService("CorePackages")
local ClearUserSpecificDataModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.ClearUserSpecificData)
local HttpCanceller = require(CorePackages.Workspace.Packages.Http).NetworkLayers.HttpCanceller
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ClearSquadStorageModule = require(CorePackages.Workspace.Packages.SquadsCore.clearSquadStorage)
local HttpStoreModule = nil
local GetFFlagIsSquadEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local FFlagLuaAppUseAppHttpStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUseAppHttpStore

if FFlagLuaAppUseAppHttpStore then
	HttpStoreModule = require(CorePackages.Workspace.Packages.HttpStore)
end
return function()
	-- upvalues: GetFFlagIsSquadEnabledFunction (copy), ClearSquadStorageModule (copy), ClearUserSpecificDataModule (copy), HttpCanceller (copy), FFlagLuaAppUseAppHttpStore (copy), HttpStoreModule (ref), PerformFetch (copy)
	return function(p1)
		-- upvalues: GetFFlagIsSquadEnabledFunction (upval), ClearSquadStorageModule (upval), ClearUserSpecificDataModule (upval), HttpCanceller (upval), FFlagLuaAppUseAppHttpStore (upval), HttpStoreModule (upval), PerformFetch (upval)
		if GetFFlagIsSquadEnabledFunction() then
			ClearSquadStorageModule()
		end
		p1:dispatch(ClearUserSpecificDataModule())
		HttpCanceller.cancel()
		
		if FFlagLuaAppUseAppHttpStore then
			local GetResult = HttpStoreModule.Instance.get()
			
			if GetResult then
				GetResult.cancelAll()
			end
		end
		PerformFetch.ClearOutstandingPromiseStatus()
	end
end