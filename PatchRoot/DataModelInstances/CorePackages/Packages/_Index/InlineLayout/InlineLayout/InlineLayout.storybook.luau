-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:40 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent

return {
	name = "InlineLayout",
	exclude = { "_Index" },
	storyRoots = { parent },
	mapStory = require(parent_1.MarkdownCore).StoryMiddleware,
	roact = require(parent_1.Dev.Roact)
}