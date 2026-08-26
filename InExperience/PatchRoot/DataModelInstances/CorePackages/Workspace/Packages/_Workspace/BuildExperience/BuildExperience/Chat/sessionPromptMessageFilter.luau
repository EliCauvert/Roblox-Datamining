local list = { "<system_reminder>.-</system_reminder>" }

return {
	shouldOptimisticallyDisplay = function(p1)
		-- upvalues: list (ref)
		for i, v in list do
			if string.find(p1, v) ~= nil then
				return false
			end
		end
		return true
	end
}