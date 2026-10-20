local _ = require(script:FindFirstAncestor("BuildExperience").Parent.Foundation)
local _Font = Font.new("rbxasset://fonts/families/BuilderMono.json", Enum.FontWeight.Regular)

local function _(p1): string
	return `#{p1.Color3:ToHex()}`
end

local function typographyToTextStyles(TitleMedium, Emphasis)
	local TitleMediumFont = TitleMedium.Font
	local config = {
		textSize = TitleMedium.FontSize,
		color = `#{Emphasis.Color3:ToHex()}`,
		transparency = Emphasis.Transparency
	}
	
	if typeof(TitleMediumFont) == "EnumItem" then
		config.font = TitleMediumFont
		
		return config
	end
	if typeof(TitleMediumFont) == "Font" then
		config.fontFace = TitleMediumFont
		
		return config
	end
	if typeof(TitleMediumFont) == "table" then
		config.fontFace = Font.new(TitleMediumFont.Family, TitleMediumFont.Weight, TitleMediumFont.Style)
	end
	return config
end

local _ = function(p1)
	return p1.FontSize
end

local _ = function(p1)
	return p1.LineHeight
end

local _ = function(p1)
	return p1.Color3
end

local _ = function(p1)
	return p1.Transparency
end

local _ = function(p1)
	return p1
end

return function(p1, p2)
	-- upvalues: typographyToTextStyles (copy), _Font (copy)
	local Typography = p1.Typography
	local Content = p1.Color.Content
	local Surface = p1.DarkMode.Surface
	
	return {
		textStyles = typographyToTextStyles(Typography.BodyMedium, p2),
		headerStyles = {
			typographyToTextStyles(Typography.HeadingLarge, Content.Emphasis),
			typographyToTextStyles(Typography.HeadingMedium, Content.Emphasis),
			typographyToTextStyles(Typography.HeadingSmall, Content.Emphasis),
			typographyToTextStyles(Typography.TitleLarge, Content.Emphasis),
			typographyToTextStyles(Typography.TitleMedium, Content.Emphasis),
			(typographyToTextStyles(Typography.TitleMedium, Content.Emphasis))
		},
		codeStyles = {
			fontFace = _Font,
			textSize = Typography.BodyMedium.FontSize,
			lineHeight = Typography.BodyMedium.LineHeight,
			color = `#{Content.Emphasis.Color3:ToHex()}`,
			transparency = Content.Emphasis.Transparency
		},
		codeBackgroundStyles = {
			backgroundColor3 = Surface.Surface_300.Color3,
			backgroundTransparency = Surface.Surface_300.Transparency
		},
		linkStyles = { linkColor = `#{Content.Link.Color3:ToHex()}` },
		imageStyles = {
			size = UDim2.fromOffset(p1.Size.Size_400, p1.Size.Size_400)
		}
	}
end