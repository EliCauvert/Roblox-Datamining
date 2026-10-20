local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent.Parent
local CryoModule = require(Parent1.Cryo)
local FoundationModule = require(Parent1.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
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
	-- upvalues: FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), ConstantsModule (copy), CryoModule (copy)
	local Tokens = self._tokens
	local config = {
		BaseSize = 20.16,
		HeadingLarge = {
			Font = Enum.Font.BuilderSansBold,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.HeadingLarge.Font) else nil,
			RelativeSize = Tokens.Size.Size_700 / 16,
			RelativeMinSize = Tokens.Size.Size_600 / 16
		},
		HeadingSmall = {
			Font = Enum.Font.BuilderSansBold,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.HeadingSmall.Font) else nil,
			RelativeSize = Tokens.Size.Size_500 / 16,
			RelativeMinSize = Tokens.Size.Size_400 / 16
		},
		TitleLarge = {
			Font = Enum.Font.BuilderSansBold,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.TitleLarge.Font) else nil,
			RelativeSize = Tokens.Size.Size_400 / 16,
			RelativeMinSize = Tokens.Size.Size_300 / 16
		},
		BodyLarge = {
			Font = Enum.Font.BuilderSans,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.BodyLarge.Font) else nil,
			RelativeSize = Tokens.Size.Size_400 / 16,
			RelativeMinSize = Tokens.Size.Size_300 / 16
		},
		CaptionLarge = {
			Font = Enum.Font.BuilderSansMedium,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.CaptionLarge.Font) else nil,
			RelativeSize = Tokens.Size.Size_300 / 16,
			RelativeMinSize = Tokens.Size.Size_200 / 16
		},
		BodySmall = {
			Font = Enum.Font.BuilderSans,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.BodySmall.Font) else nil,
			RelativeSize = Tokens.Size.Size_300 / 16,
			RelativeMinSize = Tokens.Size.Size_200 / 16
		},
		CaptionSmall = {
			Font = Enum.Font.BuilderSansMedium,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.CaptionSmall.Font) else nil,
			RelativeSize = Tokens.Size.Size_250 / 16,
			RelativeMinSize = Tokens.Size.Size_200 / 16
		}
	}
	
	if Cartoon ~= nil then
		for _, Label in config do
			if type(Label) == "table" and Label.Font ~= nil then
				Label.Font = Cartoon
				
				if FoundationFontFaceMigration then
					local FontFace = Label.FontFace
					Label.FontFace = if typeof(Cartoon) == "Font" then Cartoon elseif Cartoon == Enum.Font.Cartoon then Font.new(ConstantsModule.ComicNeueFontFamily, FontFace.Weight, FontFace.Style) else Font.fromEnum(Cartoon)
				end
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