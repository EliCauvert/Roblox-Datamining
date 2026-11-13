local _ = require("./ui")
local _ = require("../core")

return function(p1)
	local config = {
		color = {
			canvas = p1.rgb(30, 30, 32),
			grid = p1.rgb(58, 58, 62),
			panel = p1.rgb(44, 44, 46),
			raised = p1.rgb(56, 56, 59),
			hover = p1.rgb(64, 64, 68),
			divider = p1.rgb(26, 26, 28),
			field = p1.rgb(36, 36, 38),
			text = p1.rgb(240, 240, 242),
			secondary = p1.rgb(176, 176, 182),
			tertiary = p1.rgb(120, 120, 126),
			accent = p1.rgb(13, 153, 255),
			accentSoft = p1.rgb(26, 64, 96),
			danger = p1.rgb(242, 92, 84),
			white = p1.rgb(255, 255, 255),
			shadow = p1.rgb(0, 0, 0)
		},
		font = {
			regular = p1.values.font("rbxasset://fonts/families/BuilderSans.json", "Regular"),
			medium = p1.values.font("rbxasset://fonts/families/BuilderSans.json", "Medium"),
			bold = p1.values.font("rbxasset://fonts/families/BuilderSans.json", "SemiBold"),
			mono = p1.values.font("rbxasset://fonts/families/RobotoMono.json", "Regular")
		},
		size = {
			toolbar = 88,
			status = 26,
			side = 340,
			row = 32,
			header = 40,
			radius = 6,
			gutter = 12,
			text = 15,
			small = 14,
			title = 17
		},
		glyph = {
			Frame = "▢",
			Stack = "☰",
			Text = "T",
			Button = "◉",
			Image = "◩",
			List = "≡",
			Model = "⬡",
			Part = "■"
		}
	}
	
	function config.corner(TextBox, p2)
		-- upvalues: p1 (copy), config (copy)
		local FindFirstChildOfClass = p1.call(TextBox, "FindFirstChildOfClass", "UICorner") or p1.new("UICorner")
		p1.set(FindFirstChildOfClass, "CornerRadius", p1.values.udim(0, p2 or config.size.radius))
		p1.set(FindFirstChildOfClass, "Parent", TextBox)
	end
	
	function config.stroke(p2, p3, p4, p5)
		-- upvalues: p1 (copy)
		local UIStroke = p1.new("UIStroke")
		p1.set(UIStroke, "ApplyStrokeMode", p1.values.enum("ApplyStrokeMode", "Border"))
		p1.set(UIStroke, "Color", p3)
		p1.set(UIStroke, "Thickness", p4 or 1)
		p1.set(UIStroke, "Transparency", p5 or 0)
		p1.set(UIStroke, "Parent", p2)
		
		return UIStroke
	end
	
	function config.pad(TextBox, p2, p3, p4, p5)
		-- upvalues: p1 (copy)
		local FindFirstChildOfClass = p1.call(TextBox, "FindFirstChildOfClass", "UIPadding") or p1.new("UIPadding")
		p1.set(FindFirstChildOfClass, "PaddingLeft", p1.values.udim(0, p2))
		p1.set(FindFirstChildOfClass, "PaddingRight", p1.values.udim(0, p3 or p2))
		p1.set(FindFirstChildOfClass, "PaddingTop", p1.values.udim(0, p4 or 0))
		p1.set(FindFirstChildOfClass, "PaddingBottom", p1.values.udim(0, p5 or (p4 or 0)))
		p1.set(FindFirstChildOfClass, "Parent", TextBox)
	end
	
	function config.list(p2, p3, p4, p5)
		-- upvalues: p1 (copy)
		local UIListLayout = p1.new("UIListLayout")
		p1.set(UIListLayout, "FillDirection", p3)
		p1.set(UIListLayout, "SortOrder", p1.values.enum("SortOrder", "LayoutOrder"))
		p1.set(UIListLayout, "Padding", p1.values.udim(0, p4))
		p1.set(UIListLayout, "VerticalAlignment", p5 or p1.values.enum("VerticalAlignment", "Top"))
		p1.set(UIListLayout, "Parent", p2)
		
		return UIListLayout
	end
	
	function config.frame(p2, p3)
		-- upvalues: p1 (copy)
		local Frame = p1.new("Frame")
		p1.set(Frame, "Name", p2)
		p1.set(Frame, "BorderSizePixel", 0)
		
		if p3 then
			p1.set(Frame, "BackgroundColor3", p3)
			
			return Frame
		else
			p1.set(Frame, "BackgroundTransparency", 1)
			
			return Frame
		end
	end
	
	function config.place(p2, p3, p4, p5)
		-- upvalues: p1 (copy)
		if p5 ~= nil then
			p1.set(p2, "Position", p5)
		end
		p1.set(p2, "Size", p4)
		p1.set(p2, "Parent", p3)
	end
	
	function config.label(p2, p3, p4, Mono, p5)
		-- upvalues: p1 (copy), config (copy)
		local NewResult = p1.new(p5 or "TextLabel")
		p1.set(NewResult, "BackgroundTransparency", 1)
		p1.set(NewResult, "BorderSizePixel", 0)
		p1.set(NewResult, "Text", p2)
		p1.set(NewResult, "TextColor3", p3)
		p1.set(NewResult, "TextSize", p4 or config.size.text)
		p1.set(NewResult, "FontFace", Mono or config.font.medium)
		p1.set(NewResult, "TextXAlignment", p1.values.enum("TextXAlignment", "Left"))
		p1.set(NewResult, "TextTruncate", p1.values.enum("TextTruncate", "AtEnd"))
		
		return NewResult
	end
	
	function config.button(p2, p3, p4, p5)
		-- upvalues: config (copy), p1 (copy)
		local TextButton = config.label(p3, p4 or config.color.text, p5, nil, "TextButton")
		p1.set(TextButton, "Name", p2)
		p1.set(TextButton, "AutoButtonColor", false)
		p1.set(TextButton, "TextXAlignment", p1.values.enum("TextXAlignment", "Center"))
		
		return TextButton
	end
	
	function config.field(p2, p3)
		-- upvalues: config (copy), p1 (copy)
		local TextBox = config.label(p2, config.color.text, nil, if p3 then config.font.mono else nil, "TextBox")
		p1.set(TextBox, "BackgroundTransparency", 0)
		p1.set(TextBox, "BackgroundColor3", config.color.field)
		p1.set(TextBox, "PlaceholderText", "—")
		p1.set(TextBox, "PlaceholderColor3", config.color.tertiary)
		p1.set(TextBox, "ClearTextOnFocus", false)
		config.corner(TextBox, 4)
		config.pad(TextBox, 8)
		
		return TextBox
	end
	
	function config.hover(p2, p3, p4, p5)
		-- upvalues: p1 (copy)
		p1.set(p2, "BackgroundColor3", p3)
		
		return {
			p1.connect(p2, "MouseEnter", function()
				-- upvalues: p1 (upval), p2 (copy), p4 (copy)
				p1.set(p2, "BackgroundColor3", p4)
				p1.set(p2, "BackgroundTransparency", 0)
			end),
			p1.connect(p2, "MouseLeave", function()
				-- upvalues: p1 (upval), p2 (copy), p3 (copy), p5 (copy)
				p1.set(p2, "BackgroundColor3", p3)
				p1.set(p2, "BackgroundTransparency", p5 or 0)
			end)
		}
	end
	
	function config.scroller(p2)
		-- upvalues: p1 (copy), config (copy)
		local ScrollingFrame = p1.new("ScrollingFrame")
		p1.set(ScrollingFrame, "Name", p2)
		p1.set(ScrollingFrame, "BackgroundTransparency", 1)
		p1.set(ScrollingFrame, "BorderSizePixel", 0)
		p1.set(ScrollingFrame, "ScrollBarThickness", 4)
		p1.set(ScrollingFrame, "ScrollBarImageColor3", config.color.tertiary)
		p1.set(ScrollingFrame, "ScrollBarImageTransparency", 0.3)
		p1.set(ScrollingFrame, "AutomaticCanvasSize", p1.values.enum("AutomaticSize", "Y"))
		p1.set(ScrollingFrame, "CanvasSize", p1.values.udim2(0, 0, 0, 0))
		p1.set(ScrollingFrame, "ScrollingDirection", p1.values.enum("ScrollingDirection", "Y"))
		
		return ScrollingFrame
	end
	
	function config.point(p2)
		-- upvalues: p1 (copy)
		return p1.xy(p2, "Position")
	end
	
	return config
end