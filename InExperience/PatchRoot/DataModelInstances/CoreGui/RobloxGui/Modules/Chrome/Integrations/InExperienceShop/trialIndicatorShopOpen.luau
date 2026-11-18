local Flag = false

return {
	beginOutsideTrialIndicator = function()
		-- upvalues: Flag (ref)
		Flag = true
	end,
	finishOutsideTrialIndicator = function()
		-- upvalues: Flag (ref)
		Flag = false
	end,
	isOutsideTrialIndicator = function()
		-- upvalues: Flag (ref)
		return Flag
	end
}