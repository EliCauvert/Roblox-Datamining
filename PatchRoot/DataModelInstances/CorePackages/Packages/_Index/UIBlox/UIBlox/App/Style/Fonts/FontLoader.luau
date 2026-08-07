-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:58 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local cryoModule = require(parent.Parent.Parent.Parent.Cryo)
local _ = require(parent.StyleTypes)
local _ = { BASE_SIZE = 16, FACTOR = 1.26 }
local t = {}
t.__index = t

function t.new(p0) --[[ line: 17 ]]
	-- upvalues: t (ref)
	local t_1 = { _tokens = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:loadFont() --[[ line: 25 ]]
	-- upvalues: cryoModule (ref)
	local tokens = self._tokens
	local t = {
		BaseSize = 20.16,
		HeadingLarge = {
			Font = Enum.Font.BuilderSansBold,
			RelativeSize = tokens.Global.Size_350 / 16,
			RelativeMinSize = tokens.Global.Size_300 / 16
		},
		HeadingSmall = {
			Font = Enum.Font.BuilderSansBold,
			RelativeSize = tokens.Global.Size_250 / 16,
			RelativeMinSize = tokens.Global.Size_200 / 16
		},
		TitleLarge = {
			Font = Enum.Font.BuilderSansBold,
			RelativeSize = tokens.Global.Size_200 / 16,
			RelativeMinSize = tokens.Global.Size_150 / 16
		},
		BodyLarge = {
			Font = Enum.Font.BuilderSans,
			RelativeSize = tokens.Global.Size_200 / 16,
			RelativeMinSize = tokens.Global.Size_150 / 16
		},
		CaptionLarge = {
			Font = Enum.Font.BuilderSansMedium,
			RelativeSize = tokens.Global.Size_150 / 16,
			RelativeMinSize = tokens.Global.Size_100 / 16
		},
		BodySmall = {
			Font = Enum.Font.BuilderSans,
			RelativeSize = tokens.Global.Size_150 / 16,
			RelativeMinSize = tokens.Global.Size_100 / 16
		},
		CaptionSmall = {
			Font = Enum.Font.BuilderSansMedium,
			RelativeSize = tokens.Global.Size_125 / 16,
			RelativeMinSize = tokens.Global.Size_100 / 16
		}
	}
	
	return cryoModule.Dictionary.join(self:mapLegacyFont(t, 16), t)
end

function t.mapLegacyFont(_, p1, _) --[[ line: 78 ]]
	return {
		Title = p1.HeadingLarge,
		Header1 = p1.HeadingSmall,
		Header2 = p1.TitleLarge,
		SubHeader1 = p1.TitleLarge,
		Body = p1.BodyLarge,
		CaptionHeader = p1.CaptionLarge,
		CaptionSubHeader = p1.CaptionLarge,
		CaptionBody = p1.BodySmall,
		Footer = p1.CaptionSmall
	}
end

return t