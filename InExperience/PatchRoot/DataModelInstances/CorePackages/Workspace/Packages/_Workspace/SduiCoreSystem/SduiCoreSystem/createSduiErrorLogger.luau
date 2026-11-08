local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiErrors)
local AddSduiErrorContextFieldsModule = require(SduiCoreSystem.addSduiErrorContextFields)

return function(Tbl, p1, p2)
	-- upvalues: AddSduiErrorContextFieldsModule (copy)
	local Copy = table.clone(Tbl)
	local SduiReportError = Copy.__sduiReportError or Tbl.reportError
	local P0 = p1 or Copy.__sduiErrorContext
	Copy.__sduiReportError = SduiReportError
	Copy.__sduiErrorContext = P0
	
	function Copy.reportError(p3, Tbl, p4, ...)
		-- upvalues: P0 (copy), AddSduiErrorContextFieldsModule (upval), p2 (copy), SduiReportError (copy)
		local Copy = table.clone(Tbl)
		
		if not Tbl.fullName and not Tbl.rctPath and not Tbl.templateId and P0 then
			AddSduiErrorContextFieldsModule(Copy, P0)
		end
		Copy.name = Copy.name or p2
		SduiReportError(p3, Copy, p4, ...)
	end
	
	return Copy
end