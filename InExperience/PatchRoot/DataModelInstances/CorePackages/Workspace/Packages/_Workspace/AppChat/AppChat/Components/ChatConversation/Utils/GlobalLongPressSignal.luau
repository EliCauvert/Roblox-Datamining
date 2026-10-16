local NewResult = require(script:FindFirstAncestor("AppChat").Parent.AppCommonLib).Signal.new()

return {
	dismissed = NewResult,
	dismiss = function() --[[ Line: 14 ]]
		-- upvalues: NewResult (copy)
		NewResult:fire()
	end
}