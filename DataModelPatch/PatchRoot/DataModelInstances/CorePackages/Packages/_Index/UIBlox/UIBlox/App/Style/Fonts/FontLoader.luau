local Parent = script.Parent.Parent
local CryoModule = require(Parent.Parent.Parent.Parent.Cryo)
local _ = require(Parent.StyleTypes)
local FontLoaderModule = {}
FontLoaderModule.__index = FontLoaderModule

function FontLoaderModule.new(_tokens)
	-- upvalues: FontLoaderModule (copy)
	local config = { _tokens = _tokens }
	setmetatable(config, FontLoaderModule)
	
	return config
end

function FontLoaderModule:loadFont()
	-- upvalues: CryoModule (copy)
	local Tokens = self._tokens
	local config = {
		BaseSize = 20.16,
		HeadingLarge = {
			Font = Enum.Font.BuilderSansBold,
			RelativeSize = Tokens.Global.Size_350 / 16,
			RelativeMinSize = Tokens.Global.Size_300 / 16
		},
		HeadingSmall = {
			Font = Enum.Font.BuilderSansBold,
			RelativeSize = Tokens.Global.Size_250 / 16,
			RelativeMinSize = Tokens.Global.Size_200 / 16
		},
		TitleLarge = {
			Font = Enum.Font.BuilderSansBold,
			RelativeSize = Tokens.Global.Size_200 / 16,
			RelativeMinSize = Tokens.Global.Size_150 / 16
		},
		BodyLarge = {
			Font = Enum.Font.BuilderSans,
			RelativeSize = Tokens.Global.Size_200 / 16,
			RelativeMinSize = Tokens.Global.Size_150 / 16
		},
		CaptionLarge = {
			Font = Enum.Font.BuilderSansMedium,
			RelativeSize = Tokens.Global.Size_150 / 16,
			RelativeMinSize = Tokens.Global.Size_100 / 16
		},
		BodySmall = {
			Font = Enum.Font.BuilderSans,
			RelativeSize = Tokens.Global.Size_150 / 16,
			RelativeMinSize = Tokens.Global.Size_100 / 16
		},
		CaptionSmall = {
			Font = Enum.Font.BuilderSansMedium,
			RelativeSize = Tokens.Global.Size_125 / 16,
			RelativeMinSize = Tokens.Global.Size_100 / 16
		}
	}
	
	return CryoModule.Dictionary.join(self:mapLegacyFont(config, 16), config)
end

function FontLoaderModule:mapLegacyFont(p1, _)
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

return FontLoaderModule