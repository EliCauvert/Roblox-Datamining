local _ = require(script:FindFirstAncestor("ChatUIPrimitives").UniversalMessage.Types)
local ExpressionTrayFixturesModule = {
	enabledCatalog = {
		status = "enabled",
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
									presetId = "good-game",
									text = "Good game"
								}
							},
							{
								content = {
									kind = "preset",
									presetId = "good-luck",
									text = "Good luck"
								}
							},
							{
								content = {
									kind = "preset",
									presetId = "play-again",
									text = "Play again"
								}
							}
						}
					},
					{
						categoryId = "play-together",
						name = "Play together",
						items = {
							{
								content = {
									kind = "preset",
									presetId = "want-to-play",
									text = "Want to play?"
								}
							},
							{
								content = { kind = "preset", presetId = "join-me", text = "Join me" }
							}
						}
					}
				}
			},
			{
				categoryGroupId = "emojis",
				name = "Emojis",
				categories = {
					{
						categoryId = "top-picks",
						name = "Top picks",
						items = {
							{
								content = {
									kind = "emoji",
									emojiId = "grinning-face",
									unicode = "😀",
									name = "grinning-face"
								}
							},
							{
								content = {
									kind = "emoji",
									emojiId = "waving-hand",
									unicode = "👋",
									name = "waving-hand"
								}
							},
							{
								content = {
									kind = "emoji",
									emojiId = "thumbs-up",
									unicode = "👍",
									name = "thumbs-up"
								}
							},
							{
								content = {
									kind = "emoji",
									emojiId = "party-popper",
									unicode = "🎉",
									name = "party-popper"
								}
							}
						}
					}
				}
			}
		}
	},
	disabledCatalog = { status = "disabled", categoryGroups = {} }
}
ExpressionTrayFixturesModule.quickWordsOnlyCatalog = {
	status = "enabled",
	categoryGroups = {
		ExpressionTrayFixturesModule.enabledCatalog.categoryGroups[1]
	}
}
ExpressionTrayFixturesModule.emojisOnlyCatalog = {
	status = "enabled",
	categoryGroups = {
		ExpressionTrayFixturesModule.enabledCatalog.categoryGroups[2]
	}
}

return ExpressionTrayFixturesModule