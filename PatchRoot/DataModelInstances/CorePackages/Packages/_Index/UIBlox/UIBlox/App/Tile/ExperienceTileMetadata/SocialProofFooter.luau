-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:00 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent.Parent
local reactModule = require(parent_1.Parent.Parent.React)
local statGroupModule = require(parent_1.Indicator.StatGroup)
local footerFrameModule = require(parent.FooterFrame)

return function(p0) --[[ line: 19 | named "SocialProofFooter" ]]
	-- upvalues: reactModule (ref), footerFrameModule (ref), statGroupModule (ref)
	return reactModule.createElement(footerFrameModule, p0, {
		Stats = reactModule.createElement(statGroupModule, { ratingText = p0.ratingText, playingText = p0.playingText })
	})
end