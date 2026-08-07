return require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React).createContext({
	value = nil,
	onValueChanged = function(_) --[[ line: 8 ]]
		warn("No ListProvider found for List")
	end
})