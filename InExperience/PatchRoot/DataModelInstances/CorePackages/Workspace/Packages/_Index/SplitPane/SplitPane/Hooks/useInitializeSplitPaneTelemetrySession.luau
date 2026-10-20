local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SplitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local SplitPaneTelemetryModule = require(script.Parent.Parent.Telemetry.SplitPaneTelemetry)
local GetTelemetrySnapshotModule = require(script.Parent.Parent.Telemetry.getTelemetrySnapshot)

return function(p1)
	-- upvalues: ReactModule (copy), SplitPaneStoreModule (copy), SignalsModule (copy), GetTelemetrySnapshotModule (copy), SplitPaneTelemetryModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), SplitPaneStoreModule (upval), SignalsModule (upval), GetTelemetrySnapshotModule (upval), SplitPaneTelemetryModule (upval)
		if p1 then
			local Store = SplitPaneStoreModule.getStore()
			
			return SignalsModule.createEffect(function(p2)
				-- upvalues: Store (copy), GetTelemetrySnapshotModule (upval), SplitPaneTelemetryModule (upval)
				if Store.getIsTelemetrySessionInitialized(p2) then return end
				local TelemetrySnapshotModule = GetTelemetrySnapshotModule(Store, p2)
				
				if SplitPaneTelemetryModule.logAppLaunchViewport(TelemetrySnapshotModule) then
					Store.setIsTelemetrySessionInitialized(true)
					SplitPaneTelemetryModule.logSplitPaneViewChange(TelemetrySnapshotModule, SplitPaneTelemetryModule.Action.Launch)
					SplitPaneTelemetryModule.logStateChanged(SplitPaneTelemetryModule.getTelemetryStateFromMode(Store.getSupportPaneModeIfActive(false)), SplitPaneTelemetryModule.Action.Launch)
				end
			end)
		else
			return nil
		end
	end, { p1 })
end