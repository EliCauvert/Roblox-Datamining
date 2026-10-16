local Status = nil
local NewResult = require(script:FindFirstAncestor("ContactImporter").Parent.AppCommonLib).Signal.new()

return {
	getStatus = function() --[[ Line: 14 ]]
		-- upvalues: Status (ref)
		return Status
	end,
	setStatus = function(Value) --[[ Line: 9 ]]
		-- upvalues: Status (ref), NewResult (copy)
		Status = Value
		NewResult:fire(Value)
	end,
	statusChanged = NewResult
}