local shareSheet = script:FindFirstAncestor("ShareSheet")
local signalsModule = require(shareSheet.Parent.Signals)
local fFlagShareSheetTelemetryRefactorModule = require(shareSheet.Flags.FFlagShareSheetTelemetryRefactor)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)

return function() --[[ line: 35 | named "createUniversalShareSheetStore" ]]
	-- upvalues: signalsModule (ref), fFlagShareSheetTelemetryRefactorModule (ref), shareSheetTelemetryModule (ref)
	local var4, var5 = signalsModule.createSignal(nil)
	
	local function hide(p0) --[[ line: 39 ]]
		-- upvalues: var4 (ref), var5 (ref), fFlagShareSheetTelemetryRefactorModule (copy), shareSheetTelemetryModule (copy)
		local var7 = var4(false)
		
		if var7 == nil then return end
		var5(nil)
		
		if fFlagShareSheetTelemetryRefactorModule then
			shareSheetTelemetryModule.logLifecycle({
				context = var7.context,
				telemetryId = var7.telemetryId or "",
				lifecycleType = shareSheetTelemetryModule.LifecycleType.Close,
				closeReason = p0 or shareSheetTelemetryModule.CloseReason.Programmatic
			})
		end
		if var7.onHidden then
			var7.onHidden()
		end
	end
	
	return {
		getRequest = var4,
		show = function(p1) --[[ line: 59 ]]
			-- upvalues: hide (ref), fFlagShareSheetTelemetryRefactorModule (copy), shareSheetTelemetryModule (copy), var5 (ref)
			hide(if fFlagShareSheetTelemetryRefactorModule then shareSheetTelemetryModule.CloseReason.Replaced else nil)
			var5(table.clone(p1))
			
			if fFlagShareSheetTelemetryRefactorModule then
				shareSheetTelemetryModule.logLifecycle({
					context = p1.context,
					telemetryId = p1.telemetryId or "",
					lifecycleType = shareSheetTelemetryModule.LifecycleType.Open
				})
			else
				shareSheetTelemetryModule.logShareSheetOpened({
					context = p1.context,
					url = p1.url,
					telemetryId = p1.telemetryId or ""
				})
			end
			if p1.onShown then
				p1.onShown()
			end
		end,
		hide = hide
	}
end