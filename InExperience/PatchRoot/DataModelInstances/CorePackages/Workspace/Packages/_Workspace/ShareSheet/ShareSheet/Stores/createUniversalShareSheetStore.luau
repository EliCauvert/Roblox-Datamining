local shareSheet = script:FindFirstAncestor("ShareSheet")
local signalsModule = require(shareSheet.Parent.Signals)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)

return function() --[[ line: 32 | named "createUniversalShareSheetStore" ]]
	-- upvalues: signalsModule (ref), shareSheetTelemetryModule (ref)
	local var3, var4 = signalsModule.createSignal(nil)
	
	return {
		getRequest = var3,
		show = function(p0) --[[ line: 48 ]]
			-- upvalues: var3 (ref), var4 (ref), shareSheetTelemetryModule (copy)
			local var5 = var3(false)
			
			if var5 ~= nil then
				var4(nil)
				
				if var5.onHidden then
					var5.onHidden()
				end
			end
			var4(table.clone(p0))
			shareSheetTelemetryModule.logShareSheetOpened({
				context = p0.context,
				url = p0.url,
				telemetryId = p0.telemetryId or ""
			})
			
			if p0.onShown then
				p0.onShown()
			end
		end,
		hide = function() --[[ line: 36 ]]
			-- upvalues: var3 (ref), var4 (ref)
			local var6 = var3(false)
			
			if var6 == nil then return end
			var4(nil)
			
			if var6.onHidden then
				var6.onHidden()
			end
		end
	}
end