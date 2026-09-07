return require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React).createContext({
	value = nil,
	onValueChanged = function(_)
		warn("No ListProvider found for List")
	end
})