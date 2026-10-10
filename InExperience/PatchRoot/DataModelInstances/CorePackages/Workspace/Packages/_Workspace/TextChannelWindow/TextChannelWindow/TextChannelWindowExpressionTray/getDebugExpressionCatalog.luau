local t = {
	status = "enabled",
	version = "studio-debug",
	categoryGroups = {
		{
			categoryGroupId = "quick-words",
			name = "Quick Words",
			categories = {
				{
					categoryId = "general",
					name = "General",
					items = {
						{
							content = {
								kind = "preset",
								presetId = "studio-follow-me",
								text = "Follow me"
							}
						},
						{
							content = {
								kind = "preset",
								presetId = "studio-good-game",
								text = "Good game!"
							}
						},
						{
							content = {
								kind = "preset",
								presetId = "studio-this-way",
								text = "This way"
							}
						}
					}
				},
				{
					categoryId = "reactions",
					name = "Reactions",
					items = {
						{
							content = {
								kind = "preset",
								presetId = "studio-awesome",
								text = "Awesome!"
							}
						},
						{
							content = {
								kind = "preset",
								presetId = "studio-oops",
								text = "Oops!"
							}
						}
					}
				}
			}
		}
	}
}

return function()
	-- upvalues: t (ref)
	return t
end