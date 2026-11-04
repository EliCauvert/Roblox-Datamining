local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent.Parent
local CryoModule = require(Parent1.Cryo)
local NormalizeFontFaceFunction = require(Parent1.Foundation).Utility.normalizeFontFace
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.StyleTypes)

local function _(Cartoon, p1)
	-- upvalues: ConstantsModule (copy)
	return if typeof(Cartoon) == "Font" then Cartoon elseif Cartoon == Enum.Font.Cartoon then Font.new(ConstantsModule.ComicNeueFontFamily, p1.Weight, p1.Style) else Font.fromEnum(Cartoon)
end

local FontLoaderModule = {}
FontLoaderModule.__index = FontLoaderModule

function FontLoaderModule.new(_tokens)
	-- upvalues: FontLoaderModule (copy)
	local config = { _tokens = _tokens }
	setmetatable(config, FontLoaderModule)
	
	return config
end

function FontLoaderModule:loadFont(Cartoon)
	-- upvalues: NormalizeFontFaceFunction (copy), ConstantsModule (copy), CryoModule (copy)
	local Tokens = self._tokens
	local config = {
		BaseSize = 20.16,
		HeadingLarge = {
			Font = Enum.Font.BuilderSansBold,
			FontFace = NormalizeFontFaceFunction(Tokens.Typography.HeadingLarge.Font),
			RelativeSize = Tokens.Size.Size_700 / 16,
			RelativeMinSize = Tokens.Size.Size_600 / 16
		},
		HeadingSmall = {
			Font = Enum.Font.BuilderSansBold,
			FontFace = NormalizeFontFaceFunction(Tokens.Typography.HeadingSmall.Font),
			RelativeSize = Tokens.Size.Size_500 / 16,
			RelativeMinSize = Tokens.Size.Size_400 / 16
		},
		TitleLarge = {
			Font = Enum.Font.BuilderSansBold,
			FontFace = NormalizeFontFaceFunction(Tokens.Typography.TitleLarge.Font),
			RelativeSize = Tokens.Size.Size_400 / 16,
			RelativeMinSize = Tokens.Size.Size_300 / 16
		},
		BodyLarge = {
			Font = Enum.Font.BuilderSans,
			FontFace = NormalizeFontFaceFunction(Tokens.Typography.BodyLarge.Font),
			RelativeSize = Tokens.Size.Size_400 / 16,
			RelativeMinSize = Tokens.Size.Size_300 / 16
		},
		CaptionLarge = {
			Font = Enum.Font.BuilderSansMedium,
			FontFace = NormalizeFontFaceFunction(Tokens.Typography.CaptionLarge.Font),
			RelativeSize = Tokens.Size.Size_300 / 16,
			RelativeMinSize = Tokens.Size.Size_200 / 16
		},
		BodySmall = {
			Font = Enum.Font.BuilderSans,
			FontFace = NormalizeFontFaceFunction(Tokens.Typography.BodySmall.Font),
			RelativeSize = Tokens.Size.Size_300 / 16,
			RelativeMinSize = Tokens.Size.Size_200 / 16
		},
		CaptionSmall = {
			Font = Enum.Font.BuilderSansMedium,
			FontFace = NormalizeFontFaceFunction(Tokens.Typography.CaptionSmall.Font),
			RelativeSize = Tokens.Size.Size_250 / 16,
			RelativeMinSize = Tokens.Size.Size_200 / 16
		}
	}
	
	if Cartoon ~= nil then
		for _, Label in config do
			if type(Label) == "table" and Label.Font ~= nil then
				Label.Font = Cartoon
				local FontFace = Label.FontFace
				Label.FontFace = if typeof(Cartoon) == "Font" then Cartoon elseif Cartoon == Enum.Font.Cartoon then Font.new(ConstantsModule.ComicNeueFontFamily, FontFace.Weight, FontFace.Style) else Font.fromEnum(Cartoon)
			end
		end
	end
	return CryoModule.Dictionary.join(self:mapLegacyFont(config, 16), config)
end

function FontLoaderModule:mapLegacyFont(Labels, _)
	return {
		Title = Labels.HeadingLarge,
		Header1 = Labels.HeadingSmall,
		Header2 = Labels.TitleLarge,
		SubHeader1 = Labels.TitleLarge,
		Body = Labels.BodyLarge,
		CaptionHeader = Labels.CaptionLarge,
		CaptionSubHeader = Labels.CaptionLarge,
		CaptionBody = Labels.BodySmall,
		Footer = Labels.CaptionSmall
	}
end

return FontLoaderModule