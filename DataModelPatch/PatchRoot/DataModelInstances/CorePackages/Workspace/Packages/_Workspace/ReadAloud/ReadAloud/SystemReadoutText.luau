local SystemReadoutTextModule = {
	FailedToRead = "Failed to read selected text.",
	SystemEnabled = "Read aloud is enabled."
}
setmetatable(SystemReadoutTextModule, {
	__index = function(_, p1)
		error(string.format("%q is not a valid system text key", (tostring(p1))), 2)
	end
})

return SystemReadoutTextModule