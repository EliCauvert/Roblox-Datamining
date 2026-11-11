local FailureReasonsAccumulatorModule = {}
FailureReasonsAccumulatorModule.__index = FailureReasonsAccumulatorModule

function FailureReasonsAccumulatorModule.new()
	-- upvalues: FailureReasonsAccumulatorModule (copy)
	return (setmetatable({ passed = true, reasons = {} }, FailureReasonsAccumulatorModule))
end

function FailureReasonsAccumulatorModule:updateReasons(p1, List)
	if not p1 then
		table.insert(self.reasons, table.concat(List, "\n"))
		self.passed = false
		
		return
	end
end

function FailureReasonsAccumulatorModule:getFinalResults()
	if self.passed then
		return true
	else
		return false, self.reasons
	end
end

return FailureReasonsAccumulatorModule