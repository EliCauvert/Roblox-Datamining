local FailureReasonsAccumulatorModule = {}
FailureReasonsAccumulatorModule.__index = FailureReasonsAccumulatorModule

function FailureReasonsAccumulatorModule.new() --[[ Line: 4 ]]
	-- upvalues: FailureReasonsAccumulatorModule (copy)
	return (setmetatable({ passed = true, reasons = {} }, FailureReasonsAccumulatorModule))
end

function FailureReasonsAccumulatorModule:updateReasons(p1, List) --[[ Line: 13 ]]
	if not p1 then
		table.insert(self.reasons, table.concat(List, "\n"))
		self.passed = false
		
		return
	end
end

function FailureReasonsAccumulatorModule:getFinalResults() --[[ Line: 22 ]]
	if self.passed then
		return true
	else
		return false, self.reasons
	end
end

return FailureReasonsAccumulatorModule