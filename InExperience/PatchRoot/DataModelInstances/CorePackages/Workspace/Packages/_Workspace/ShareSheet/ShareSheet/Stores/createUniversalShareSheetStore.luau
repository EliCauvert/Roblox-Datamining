local shareSheet = script:FindFirstAncestor("ShareSheet")
local signalsModule = require(shareSheet.Parent.Signals)
local fFlagShareSheetTelemetryRefactorModule = require(shareSheet.Flags.FFlagShareSheetTelemetryRefactor)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)

return function()
	-- upvalues: signalsModule (ref), fFlagShareSheetTelemetryRefactorModule (ref), shareSheetTelemetryModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	local function hide(p1)
		-- upvalues: var1 (ref), var2 (ref), fFlagShareSheetTelemetryRefactorModule (copy), shareSheetTelemetryModule (copy)
		local var3 = var1(false)
		
		if var3 == nil then return end
		var2(nil)
		
		if fFlagShareSheetTelemetryRefactorModule then
			shareSheetTelemetryModule.logLifecycle({
				context = var3.context,
				telemetryId = var3.telemetryId or "",
				lifecycleType = shareSheetTelemetryModule.LifecycleType.Close,
				closeReason = p1 or shareSheetTelemetryModule.CloseReason.Programmatic
			})
		end
		if var3.onHidden then
			var3.onHidden()
		end
	end
	
	return {
		getRequest = var1,
		show = function(p1)
			-- upvalues: hide (ref), fFlagShareSheetTelemetryRefactorModule (copy), shareSheetTelemetryModule (copy), var2 (ref)
			hide(if fFlagShareSheetTelemetryRefactorModule then shareSheetTelemetryModule.CloseReason.Replaced else nil)
			var2(table.clone(p1))
			
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