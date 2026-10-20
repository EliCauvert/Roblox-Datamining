local Patterns = { "<system_reminder>.-</system_reminder>" }

return {
	shouldOptimisticallyDisplay = function(Text: string): boolean
		-- upvalues: Patterns (copy)
		for _, pattern in Patterns do
			if string.find(Text, pattern) ~= nil then
				return false
			end
		end
		return true
	end
}