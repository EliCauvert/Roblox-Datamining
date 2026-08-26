local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local cryoModule = require(parent_1.Parent.Cryo)
local _ = require(parent.StyleTypes)
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local _ = { BASE_SIZE = 16, FACTOR = 1.26 }
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local t_1 = { _tokens = p1 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:loadFont(p1)
	-- upvalues: UIBloxConfigModule (ref), cryoModule (ref)
	local tokens = self._tokens
	local t = {
		BaseSize = 20.16,
		HeadingLarge = {
			Font = Enum.Font.BuilderSansBold,
			RelativeSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_700 else tokens.Global.Size_350) / 16,
			RelativeMinSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_600 else tokens.Global.Size_300) / 16
		},
		HeadingSmall = {
			Font = Enum.Font.BuilderSansBold,
			RelativeSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_500 else tokens.Global.Size_250) / 16,
			RelativeMinSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_400 else tokens.Global.Size_200) / 16
		},
		TitleLarge = {
			Font = Enum.Font.BuilderSansBold,
			RelativeSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_400 else tokens.Global.Size_200) / 16,
			RelativeMinSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Size_150) / 16
		},
		BodyLarge = {
			Font = Enum.Font.BuilderSans,
			RelativeSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_400 else tokens.Global.Size_200) / 16,
			RelativeMinSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Size_150) / 16
		},
		CaptionLarge = {
			Font = Enum.Font.BuilderSansMedium,
			RelativeSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Size_150) / 16,
			RelativeMinSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100) / 16
		},
		BodySmall = {
			Font = Enum.Font.BuilderSans,
			RelativeSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Size_150) / 16,
			RelativeMinSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100) / 16
		},
		CaptionSmall = {
			Font = Enum.Font.BuilderSansMedium,
			RelativeSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_250 else tokens.Global.Size_125) / 16,
			RelativeMinSize = (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100) / 16
		}
	}
	
	if p1 ~= nil then
		for i, v in t do
			if type(v) == "table" and v.Font ~= nil then
				v.Font = p1
			end
		end
	end
	return cryoModule.Dictionary.join(self:mapLegacyFont(t, 16), t)
end

function t.mapLegacyFont(_, p2, _)
	return {
		Title = p2.HeadingLarge,
		Header1 = p2.HeadingSmall,
		Header2 = p2.TitleLarge,
		SubHeader1 = p2.TitleLarge,
		Body = p2.BodyLarge,
		CaptionHeader = p2.CaptionLarge,
		CaptionSubHeader = p2.CaptionLarge,
		CaptionBody = p2.BodySmall,
		Footer = p2.CaptionSmall
	}
end

return t