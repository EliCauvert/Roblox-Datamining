local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local _ = require(script.Parent.createFaeFeatureAccessStore)

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworkingModule (copy), ReactModule (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), UseSignalStateFunction (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworkingModule)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRoactServiceResult (copy), SendAXCounterV2Function (upval), ConstantsModule (upval)
		if p1.getFetchStatus(false) == "idle" then
			p1.fetch(UseRoactServiceResult):catch(function(Err)
				-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval)
				if Err then
					SendAXCounterV2Function(ConstantsModule.Counter.Errors.FetchFaeFeatureAccessError)
				end
			end)
			
			return
		end
	end, { p1, UseRoactServiceResult })
	
	return {
		canClaimFaeItem = UseSignalStateFunction(p1.getCanClaimFaeItem),
		showFaeUpsell = UseSignalStateFunction(p1.getShowFaeUpsell),
		fetchStatus = UseSignalStateFunction(p1.getFetchStatus)
	}
end