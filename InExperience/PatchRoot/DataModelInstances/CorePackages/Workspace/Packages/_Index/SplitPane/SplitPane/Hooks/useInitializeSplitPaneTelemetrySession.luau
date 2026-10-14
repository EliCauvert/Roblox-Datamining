local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local splitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local splitPaneTelemetryModule = require(script.Parent.Parent.Telemetry.SplitPaneTelemetry)
local getTelemetrySnapshotModule = require(script.Parent.Parent.Telemetry.getTelemetrySnapshot)

return function(p1)
	-- upvalues: reactModule (ref), splitPaneStoreModule (ref), signalsModule (ref), getTelemetrySnapshotModule (ref), splitPaneTelemetryModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), splitPaneStoreModule (copy), signalsModule (copy), getTelemetrySnapshotModule (copy), splitPaneTelemetryModule (copy)
		if p1 then
			local store = splitPaneStoreModule.getStore()
			
			return signalsModule.createEffect(function(p2)
				-- upvalues: store (ref), getTelemetrySnapshotModule (copy), splitPaneTelemetryModule (copy)
				if store.getIsTelemetrySessionInitialized(p2) then return end
				local var1 = getTelemetrySnapshotModule(store, p2)
				
				if splitPaneTelemetryModule.logAppLaunchViewport(var1) then
					store.setIsTelemetrySessionInitialized(true)
					splitPaneTelemetryModule.logSplitPaneViewChange(var1, splitPaneTelemetryModule.Action.Launch)
					splitPaneTelemetryModule.logStateChanged(splitPaneTelemetryModule.getTelemetryStateFromMode(store.getSupportPaneModeIfActive(false)), splitPaneTelemetryModule.Action.Launch)
				end
			end)
		end
		return nil
	end, { p1 })
end