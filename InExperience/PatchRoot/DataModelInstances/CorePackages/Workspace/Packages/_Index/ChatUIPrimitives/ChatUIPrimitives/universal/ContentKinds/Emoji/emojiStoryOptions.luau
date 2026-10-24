local config = {
	["grinning-face"] = "😀",
	["waving-hand"] = "👋",
	["thumbs-up"] = "👍",
	["party-popper"] = "🎉"
}

return {
	names = {
		"grinning-face",
		"waving-hand",
		"thumbs-up",
		"party-popper"
	},
	unicodeOf = function(p1)
		-- upvalues: config (copy)
		return config[p1]
	end
}