local _ = require(script:FindFirstAncestor("BuildExperience").Parent.Foundation)
local font = Font.new("rbxasset://fonts/families/BuilderMono.json", Enum.FontWeight.Regular)

local function _(p0)
	return `#{p0.Color3:ToHex()}`
end

local function typographyToTextStyles(p1, p2)
	local font = p1.Font
	local t = {
		textSize = p1.FontSize,
		color = `#{p2.Color3:ToHex()}`,
		transparency = p2.Transparency
	}
	
	if typeof(font) == "EnumItem" then
		t.font = font
		
		return t
	elseif typeof(font) == "Font" then
		t.fontFace = font
		
		return t
	elseif typeof(font) == "table" then
		t.fontFace = Font.new(font.Family, font.Weight, font.Style)
	end
	return t
end

local _ = function(p3)
	return p3.FontSize
end

local _ = function(p4)
	return p4.LineHeight
end

local _ = function(p5)
	return p5.Color3
end

local _ = function(p6)
	return p6.Transparency
end

local _ = function(p7)
	return p7
end

return function(p8, p9)
	-- upvalues: typographyToTextStyles (ref), font (ref)
	local typography = p8.Typography
	local content = p8.Color.Content
	local surface = p8.DarkMode.Surface
	
	return {
		textStyles = typographyToTextStyles(typography.BodyMedium, p9),
		headerStyles = {
			typographyToTextStyles(typography.HeadingLarge, content.Emphasis),
			typographyToTextStyles(typography.HeadingMedium, content.Emphasis),
			typographyToTextStyles(typography.HeadingSmall, content.Emphasis),
			typographyToTextStyles(typography.TitleLarge, content.Emphasis),
			typographyToTextStyles(typography.TitleMedium, content.Emphasis),
			typographyToTextStyles(typography.TitleMedium, content.Emphasis)
		},
		codeStyles = {
			fontFace = font,
			textSize = typography.BodyMedium.FontSize,
			lineHeight = typography.BodyMedium.LineHeight,
			color = `#{content.Emphasis.Color3:ToHex()}`,
			transparency = content.Emphasis.Transparency
		},
		codeBackgroundStyles = {
			backgroundColor3 = surface.Surface_300.Color3,
			backgroundTransparency = surface.Surface_300.Transparency
		},
		linkStyles = { linkColor = `#{content.Link.Color3:ToHex()}` },
		imageStyles = {
			size = UDim2.fromOffset(p8.Size.Size_400, p8.Size.Size_400)
		}
	}
end