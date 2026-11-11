local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local ReactModule = require(CorePackages.Packages.React)
local LuaAppChartsAppPageIxpLayer = game:DefineFastString("LuaAppChartsAppPageIxpLayer", require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers.ChartsMigrationLayer)
local Flag = false

return function(Enabled)
	-- upvalues: ReactModule (copy), Flag (ref), IXPService (copy), LuaAppChartsAppPageIxpLayer (copy)
	ReactModule.useEffect(function()
		-- upvalues: Flag (upval), Enabled (copy), IXPService (upval), LuaAppChartsAppPageIxpLayer (upval)
		if not Flag and Enabled ~= false then
			Flag = true
			IXPService:LogFlagLinkedUserLayerExposure(LuaAppChartsAppPageIxpLayer)
			
			return
		end
	end, { Enabled })
end