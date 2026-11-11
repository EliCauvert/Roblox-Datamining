local NewResult = require(script:FindFirstAncestor("AppChat").Parent.AppCommonLib).Signal.new()

return {
	dismissed = NewResult,
	dismiss = function()
		-- upvalues: NewResult (copy)
		NewResult:fire()
	end
}