local list = { "<system_reminder>.-</system_reminder>" }

return {
	shouldOptimisticallyDisplay = function(p0)
		-- upvalues: list (ref)
		for i, v in list do
			if string.find(p0, v) ~= nil then
				return false
			end
		end
		return true
	end
}