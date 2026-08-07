-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

local parent = script.Parent

return {
	name = "MarkdownCore",
	exclude = { "_Index" },
	storyRoots = { parent },
	mapStory = require(parent.StoryMiddleware),
	roact = require(parent.Parent.Dev.Roact)
}