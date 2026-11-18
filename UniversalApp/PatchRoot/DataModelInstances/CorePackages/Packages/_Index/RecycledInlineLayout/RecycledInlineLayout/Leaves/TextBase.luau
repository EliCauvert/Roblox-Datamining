local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local ReactModule = require(RecycledInlineLayout.Parent.React)
local RichTextModule = require(RecycledInlineLayout.Utils.RichText)
local SplitTextModule = require(RecycledInlineLayout.Utils.SplitText)
local _ = require(RecycledInlineLayout.Types)
local GetFontFaceModule = require(RecycledInlineLayout.Utils.getFontFace)

local function _(p1)
	return if p1.fontStyle and p1.fontStyle.FontSize then p1.fontStyle.FontSize else 16
end

local function measureString(p1, p2, p3)
	-- upvalues: GetFontFaceModule (copy), RichTextModule (copy)
	local FontFaceModule = GetFontFaceModule(p1.fontStyle)
	local FontSize = if p1.fontStyle and p1.fontStyle.FontSize then p1.fontStyle.FontSize else 16
	
	return if RichTextModule.hasTags(p1.EngineTags) then p3.measureText(RichTextModule.format(p2, p1.EngineTags), FontFaceModule, FontSize, true) else p3.measureText(p2, FontFaceModule, FontSize)
end

local _ = function(p1, p2)
	local BodyLarge = if p1 and p1.FontSize and p1.LineHeight then p1 else p2 and (p2.Typography and p2.Typography.BodyLarge)
	
	return if BodyLarge == nil or BodyLarge.FontSize == nil or BodyLarge.LineHeight == nil then 0 else BodyLarge.FontSize * (BodyLarge.LineHeight - 1) / 2
end

local _ = function(Tbl, Text)
	local Copy = table.clone(Tbl)
	Copy.Text = Text
	
	return Copy
end

local _Font = Font.fromEnum(Enum.Font.BuilderSans)

local _ = function(p1, p2)
	local Default = p2.Color.Content.Default
	
	return p1:map(function(p3)
		-- upvalues: Default (copy)
		return {
			Color3 = if p3 and p3.Color3 ~= nil then p3.Color3 else Default.Color3,
			Transparency = if p3 and p3.Transparency ~= nil then p3.Transparency else Default.Transparency
		}
	end)
end

local _ = function(p1)
	-- upvalues: GetFontFaceModule (copy), _Font (copy)
	return p1:map(function(p2)
		-- upvalues: GetFontFaceModule (upval), _Font (upval)
		return GetFontFaceModule(p2) or _Font
	end)
end

local _ = function(p1)
	return p1:map(function(p2)
		return if p2 and p2.FontSize then p2.FontSize else 16
	end)
end

local function lineHeightOf(p1)
	return if p1.fontStyle and p1.fontStyle.LineHeight then p1.fontStyle.LineHeight else 1
end

local _ = function(p1): string
	return string.format("#%02X%02X%02X", math.round(p1.R * 255), math.round(p1.G * 255), (math.round(p1.B * 255)))
end

local function strokeTag(StrokeStyle, StrokeThickness)
	if StrokeStyle == nil then
		return nil
	end
	local Attributes = {
		thickness = tostring(StrokeThickness or 1),
		transparency = tostring(StrokeStyle.Transparency or 0)
	}
	
	if StrokeStyle.Color3 ~= nil then
		local StrokeStyleColor3 = StrokeStyle.Color3
		Attributes.color = string.format("#%02X%02X%02X", math.round(StrokeStyleColor3.R * 255), math.round(StrokeStyleColor3.G * 255), (math.round(StrokeStyleColor3.B * 255)))
	end
	return { name = "stroke", attributes = Attributes }
end

local function content(p1, EngineTags, p2)
	-- upvalues: RichTextModule (copy)
	local FormatResult = if RichTextModule.hasTags(EngineTags) then RichTextModule.format(p1, EngineTags) else RichTextModule.escape(p1)
	
	if p2 ~= nil then
		FormatResult = `{RichTextModule.openTag(p2)}{FormatResult}</stroke>`
	end
	return FormatResult
end

local function markup(p1, p2)
	-- upvalues: strokeTag (copy), content (copy), GetFontFaceModule (copy), _Font (copy), RichTextModule (copy)
	local ContentResult = content(p1.Text or "", p1.EngineTags, if p2.strokeStyle == nil then strokeTag(p1.strokeStyle, p1.strokeThickness) else nil)
	local FontFaceModule = GetFontFaceModule(p1.fontStyle) or _Font
	local FontFaceModule1 = GetFontFaceModule(p2.fontStyle) or _Font
	
	if FontFaceModule.Style == Enum.FontStyle.Italic and FontFaceModule1.Style ~= Enum.FontStyle.Italic then
		ContentResult = `<i>{ContentResult}</i>`
	end
	local Attributes = {}
	
	if FontFaceModule.Family ~= FontFaceModule1.Family then
		Attributes.family = FontFaceModule.Family
	end
	if FontFaceModule.Weight ~= FontFaceModule1.Weight then
		Attributes.weight = tostring(FontFaceModule.Weight.Value)
	end
	if (if p1.fontStyle and p1.fontStyle.FontSize then p1.fontStyle.FontSize else 16) ~= (if p2.fontStyle and p2.fontStyle.FontSize then p2.fontStyle.FontSize else 16) then
		Attributes.size = tostring(if p1.fontStyle and p1.fontStyle.FontSize then p1.fontStyle.FontSize else 16)
	end
	local TextStyle = p1.textStyle or {}
	local TextStyle1 = p2.textStyle or {}
	
	if TextStyle.Color3 ~= nil and TextStyle.Color3 ~= TextStyle1.Color3 then
		local TextStyleColor3 = TextStyle.Color3
		Attributes.color = string.format("#%02X%02X%02X", math.round(TextStyleColor3.R * 255), math.round(TextStyleColor3.G * 255), (math.round(TextStyleColor3.B * 255)))
	end
	local Transparency = TextStyle.Transparency or 0
	
	if Transparency ~= (TextStyle1.Transparency or 0) then
		Attributes.transparency = tostring(Transparency)
	end
	if next(Attributes) ~= nil then
		ContentResult = `{RichTextModule.openTag({ name = "font", attributes = Attributes })}{ContentResult}</font>`
	end
	return ContentResult
end

local _ = function(p1): boolean
	-- upvalues: GetFontFaceModule (copy), _Font (copy)
	return (GetFontFaceModule(p1.fontStyle) or _Font).Style == Enum.FontStyle.Italic
end

local _ = function(p1): boolean
	return p1.textStyle ~= nil and p1.textStyle.Color3 ~= nil
end

local _ = function(Entry, Callback)
	for _, value in Entry do
		if Callback(value) then
			return value
		end
	end
	return Entry[1]
end

local function base(Entry)
	-- upvalues: GetFontFaceModule (copy), _Font (copy)
	local t = {}
	
	local function _(p1): boolean
		-- upvalues: GetFontFaceModule (upval), _Font (upval)
		return not ((GetFontFaceModule(p1.fontStyle) or _Font).Style == Enum.FontStyle.Italic)
	end
	local value1 = nil
	
	for _, value in Entry do
		if not ((GetFontFaceModule(value.fontStyle) or _Font).Style == Enum.FontStyle.Italic) then
			value1 = value
			t.fontStyle = value1.fontStyle
			
			local _ = function(p1): boolean
				return not (p1.textStyle ~= nil and p1.textStyle.Color3 ~= nil)
			end
			local value3 = nil
			
			for _, value2 in Entry do
				if not (value2.textStyle ~= nil and value2.textStyle.Color3 ~= nil) then
					value3 = value2
					t.textStyle = value3.textStyle
					t.strokeStyle = Entry[1].strokeStyle
					t.strokeThickness = Entry[1].strokeThickness
					
					return t
				end
			end
			value3 = Entry[1]
		end
	end
	value1 = Entry[1]
end

return {
	createMerge = function(Label)
		-- upvalues: lineHeightOf (copy), markup (copy), base (copy)
		return {
			canMerge = function(): boolean
				return true
			end,
			labelKey = lineHeightOf,
			markup = markup,
			base = base,
			sharedOnly = { "strokeStyle", "strokeThickness" },
			label = Label
		}
	end,
	measure = function(p1, p2)
		-- upvalues: measureString (copy)
		return measureString(p1, p1.Text or "", p2)
	end,
	measureFoundationText = function(p1, p2): Vector2
		-- upvalues: measureString (copy)
		local FontStyle = p1.fontStyle
		local Tokens = p2.tokens
		local FontStyle1 = if FontStyle and FontStyle.FontSize and FontStyle.LineHeight then FontStyle else Tokens and (Tokens.Typography and Tokens.Typography.BodyLarge)
		
		return measureString(p1, p1.Text or "", p2) + Vector2.new(0, (if FontStyle1 == nil or FontStyle1.FontSize == nil or FontStyle1.LineHeight == nil then 0 else FontStyle1.FontSize * (FontStyle1.LineHeight - 1) / 2) * 2)
	end,
	withFoundationPadding = function(p1, p2, p3): Vector2
		local Tokens = p3.tokens
		local BodyLarge = if p2 and p2.FontSize and p2.LineHeight then p2 else Tokens and (Tokens.Typography and Tokens.Typography.BodyLarge)
		
		return p1 + Vector2.new(0, (if BodyLarge == nil or BodyLarge.FontSize == nil or BodyLarge.LineHeight == nil then 0 else BodyLarge.FontSize * (BodyLarge.LineHeight - 1) / 2) * 2)
	end,
	split = function(Tbl, p1, p2, p3)
		-- upvalues: SplitTextModule (copy), measureString (copy)
		local SplitResult, SplitResult2 = SplitTextModule.split(if p2 then SplitTextModule.SplitBy.Symbol else Tbl.SplitBy or SplitTextModule.SplitBy.Word, function(p4)
			-- upvalues: measureString (upval), Tbl (copy), p3 (copy)
			return measureString(Tbl, p4, p3).X
		end, Tbl.Text or "", p1)
		
		if SplitResult2 == nil then
			return Tbl, nil
		else
			local Copy = table.clone(Tbl)
			Copy.Text = SplitResult
			local Copy1 = table.clone(Tbl)
			Copy1.Text = SplitResult2
			
			return Copy, Copy1
		end
	end,
	trimStart = function(Tbl)
		local Text = Tbl.Text or ""
		local Replaced = string.gsub(Text, "^%s+", "")
		
		if Replaced == "" then
			return nil
		elseif Replaced == Text then
			return Tbl
		else
			local Copy = table.clone(Tbl)
			Copy.Text = Replaced
			
			return Copy
		end
	end,
	trimEnd = function(Tbl)
		local Text = Tbl.Text or ""
		local Replaced = string.gsub(Text, "%s+$", "")
		
		if Replaced == Text then
			return Tbl
		else
			local Copy = table.clone(Tbl)
			Copy.Text = Replaced
			
			return Copy
		end
	end,
	styleProps = function(p1, p2)
		-- upvalues: GetFontFaceModule (copy), _Font (copy)
		local FontStyle = p1.fontStyle
		local Default = p2.Color.Content.Default
		local MapResult = p1.textStyle:map(function(p3)
			-- upvalues: Default (copy)
			return {
				Color3 = if p3 and p3.Color3 ~= nil then p3.Color3 else Default.Color3,
				Transparency = if p3 and p3.Transparency ~= nil then p3.Transparency else Default.Transparency
			}
		end)
		
		return {
			TextColor3 = MapResult:map(function(p3)
				return p3.Color3
			end),
			TextTransparency = MapResult:map(function(p3)
				return p3.Transparency
			end),
			FontFace = FontStyle:map(function(p3)
				-- upvalues: GetFontFaceModule (upval), _Font (upval)
				return GetFontFaceModule(p3) or _Font
			end),
			TextSize = FontStyle:map(function(p3)
				return if p3 and p3.FontSize then p3.FontSize else 16
			end),
			LineHeight = FontStyle:map(function(p3)
				return if p3 and p3.LineHeight then p3.LineHeight else 1
			end),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}
	end,
	foundationProps = function(p1, p2)
		-- upvalues: GetFontFaceModule (copy), _Font (copy)
		local FontStyle = p1.fontStyle
		local Default = p2.Color.Content.Default
		
		return {
			fontStyle = {
				Font = FontStyle:map(function(p3)
					-- upvalues: GetFontFaceModule (upval), _Font (upval)
					return GetFontFaceModule(p3) or _Font
				end),
				FontSize = FontStyle:map(function(p3)
					return if p3 and p3.FontSize then p3.FontSize else 16
				end)
			},
			textStyle = p1.textStyle:map(function(p3)
				-- upvalues: Default (copy)
				return {
					Color3 = if p3 and p3.Color3 ~= nil then p3.Color3 else Default.Color3,
					Transparency = if p3 and p3.Transparency ~= nil then p3.Transparency else Default.Transparency
				}
			end),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}
	end,
	useLineHeight = function(p1)
		-- upvalues: ReactModule (copy)
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult (copy), p1 (copy), ReactModule (upval)
			local function apply(p2)
				-- upvalues: UseRefResult (upval)
				local Current = UseRefResult.current
				
				if Current ~= nil then
					Current.LineHeight = if p2 and p2.LineHeight then p2.LineHeight else 1
				end
			end
			
			local Value = p1:getValue()
			local Current = UseRefResult.current
			
			if Current ~= nil then
				Current.LineHeight = if Value and Value.LineHeight then Value.LineHeight else 1
			end
			return ReactModule.__subscribeToBinding(p1, apply)
		end, { p1 })
		
		return UseRefResult
	end
}