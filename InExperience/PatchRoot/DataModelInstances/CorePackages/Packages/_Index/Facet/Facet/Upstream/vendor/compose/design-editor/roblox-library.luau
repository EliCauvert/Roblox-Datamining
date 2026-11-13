local UiModule = require("./ui")
local _ = require("./environment")
local CoreModule = require("../core")
local _ = require("../design")

return function(p1, p2)
	-- upvalues: UiModule (copy), CoreModule (copy)
	local NewUi = UiModule.create(p1, p2, true)
	local BuilderSansJson = NewUi.values.font("rbxasset://fonts/families/BuilderSans.json", "Medium")
	
	local function _(Text: string)
		-- upvalues: NewUi (copy)
		return if string.match(Text, "^#%x%x%x%x%x%x$") then NewUi.hex(Text) else nil
	end
	
	local _ = function(p3)
		return if type(p3) == "string" then p3 elseif type(p3) == "number" or type(p3) == "boolean" then tostring(p3) else nil
	end
	
	local _ = function(p3)
		return if type(p3) == "number" then p3 else nil
	end
	
	local _ = function(p3, Callback: (any) -> ())
		-- upvalues: CoreModule (upval)
		if p3 == nil then return end
		local Readable = p3.readable
		
		if Readable then
			CoreModule.watch(function(Callback)
				-- upvalues: Callback (copy), Readable (copy)
				Callback(Callback(Readable))
			end)
			
			return
		else
			Callback(p3.literal)
		end
	end
	
	local function parentChildren(Frame, List)
		-- upvalues: NewUi (copy)
		for _, value in List do
			if value ~= nil then
				NewUi.set(value, "Parent", Frame)
			end
		end
	end
	
	local function sized(p3, Frame)
		-- upvalues: NewUi (copy), CoreModule (upval)
		NewUi.set(Frame, "BackgroundTransparency", 1)
		CoreModule.watch(function(Callback)
			-- upvalues: p3 (copy), NewUi (upval), Frame (copy)
			local function _(p4)
				-- upvalues: Callback (copy)
				return if p4 == nil then nil elseif p4.readable then Callback(p4.readable) else p4.literal
			end
			
			local Width = p3.width
			local CallbackResult = if Width == nil then nil elseif Width.readable then Callback(Width.readable) else Width.literal
			local CallbackResult1 = (if type(CallbackResult) == "number" then CallbackResult else nil) or 0
			local Height = p3.height
			local CallbackResult2 = if Height == nil then nil elseif Height.readable then Callback(Height.readable) else Height.literal
			local CallbackResult21 = (if type(CallbackResult2) == "number" then CallbackResult2 else nil) or 0
			local FillWidth = p3.fillWidth
			local v1 = (if FillWidth == nil then nil elseif FillWidth.readable then Callback(FillWidth.readable) else FillWidth.literal) == true
			local FillHeight = p3.fillHeight
			local v2 = (if FillHeight == nil then nil elseif FillHeight.readable then Callback(FillHeight.readable) else FillHeight.literal) == true
			NewUi.set(Frame, "Size", NewUi.values.udim2(if v1 then 1 else 0, CallbackResult1, if v2 then 1 else 0, CallbackResult21))
			NewUi.set(Frame, "AutomaticSize", NewUi.values.enum("AutomaticSize", if CallbackResult1 == 0 and not v1 then if CallbackResult21 == 0 and not v2 then "XY" else "X" elseif CallbackResult21 == 0 and not v2 then "Y" else "None"))
		end)
		local Background = p3.background
		
		local function v33(Text: string)
			-- upvalues: NewUi (upval), Frame (copy)
			local HexResult = if type(Text) == "string" and string.match(Text, "^#%x%x%x%x%x%x$") then NewUi.hex(Text) else nil
			
			if HexResult then
				NewUi.set(Frame, "BackgroundColor3", HexResult)
				NewUi.set(Frame, "BackgroundTransparency", 0)
				
				return
			else
				NewUi.set(Frame, "BackgroundTransparency", 1)
			end
		end
		
		if Background ~= nil then
			local Readable = Background.readable
			
			if Readable then
				CoreModule.watch(function(Callback)
					-- upvalues: v33 (copy), Readable (copy)
					v33(Callback(Readable))
				end)
			else
				v33(Background.literal)
			end
		end
		local Visible = p3.Visible
		
		local function v36(Enabled)
			-- upvalues: NewUi (upval), Frame (copy)
			NewUi.set(Frame, "Visible", Enabled ~= false)
		end
		
		if Visible == nil then return end
		local Readable1 = Visible.readable
		
		if Readable1 then
			CoreModule.watch(function(Callback)
				-- upvalues: v36 (copy), Readable1 (copy)
				v36(Callback(Readable1))
			end)
			
			return
		else
			NewUi.set(Frame, "Visible", Visible.literal ~= false)
		end
	end
	
	local Tbl = {
		width = {
			type = "number",
			tokens = true,
			group = "Layout",
			order = 1
		},
		height = {
			type = "number",
			tokens = true,
			group = "Layout",
			order = 2
		},
		fillWidth = { type = "boolean", group = "Layout", order = 3 },
		fillHeight = { type = "boolean", group = "Layout", order = 4 },
		background = { type = "color", group = "Fill", order = 1 },
		Visible = {
			type = "boolean",
			group = "Fill",
			order = 2,
			default = true
		}
	}
	
	local _ = function(List)
		-- upvalues: Tbl (copy)
		local Copy = table.clone(Tbl)
		
		for i, value in List do
			Copy[i] = value
		end
		return Copy
	end
	
	local function textual(p3, p4)
		-- upvalues: CoreModule (upval), NewUi (copy)
		local Text = p3.text
		
		local function v52(p5)
			-- upvalues: p4 (copy)
			p4.text((if type(p5) == "string" then p5 elseif type(p5) == "number" or type(p5) == "boolean" then tostring(p5) else nil) or "")
		end
		
		if Text ~= nil then
			local Readable = Text.readable
			
			if Readable then
				CoreModule.watch(function(Callback)
					-- upvalues: v52 (copy), Readable (copy)
					v52(Callback(Readable))
				end)
			else
				local Literal = Text.literal
				p4.text((if type(Literal) == "string" then Literal elseif type(Literal) == "number" or type(Literal) == "boolean" then tostring(Literal) else nil) or "")
			end
		end
		local TextSize = p3.textSize
		
		local function v55(p5)
			-- upvalues: p4 (copy)
			p4.size((if type(p5) == "number" then p5 else nil) or 16)
		end
		
		if TextSize ~= nil then
			local Readable1 = TextSize.readable
			
			if Readable1 then
				CoreModule.watch(function(Callback)
					-- upvalues: v55 (copy), Readable1 (copy)
					v55(Callback(Readable1))
				end)
			else
				local Literal = TextSize.literal
				p4.size((if type(Literal) == "number" then Literal else nil) or 16)
			end
		end
		local TextColor = p3.textColor
		
		local function v59(Text: string)
			-- upvalues: NewUi (upval), p4 (copy)
			p4.color((if type(Text) == "string" and string.match(Text, "^#%x%x%x%x%x%x$") then NewUi.hex(Text) else nil) or NewUi.rgb(235, 238, 242))
		end
		
		if TextColor == nil then return end
		local Readable2 = TextColor.readable
		
		if Readable2 then
			CoreModule.watch(function(Callback)
				-- upvalues: v59 (copy), Readable2 (copy)
				v59(Callback(Readable2))
			end)
			
			return
		else
			local Literal: string = TextColor.literal
			p4.color((if type(Literal) == "string" and string.match(Literal, "^#%x%x%x%x%x%x$") then NewUi.hex(Literal) else nil) or NewUi.rgb(235, 238, 242))
		end
	end
	
	local Defaults = { direction = "vertical", gap = 8, fillWidth = true }
	local Defaults1 = { text = "Text" }
	local Defaults2 = { text = "Button", background = "#3581F7" }
	local Defaults3 = { fillWidth = true, height = 240, gap = 4 }
	local config = {
		name = "Roblox",
		containerKind = "Stack",
		parameter = "Host",
		parameterType = "nil",
		returnType = "GuiObject",
		readable = "Compose.ReadOnlyValue",
		cell = "Compose.Cell",
		token = "tokens",
		prelude = {}
	}
	local Kinds = {
		Frame = {
			children = "list",
			call = "Design.Frame",
			fields = Tbl,
			build = function(p3, p4)
				-- upvalues: NewUi (copy), sized (copy), parentChildren (copy)
				local Frame = NewUi.new("Frame")
				NewUi.set(Frame, "BorderSizePixel", 0)
				sized(p3, Frame)
				parentChildren(Frame, p4)
				
				return Frame
			end
		}
	}
	local Stack = { children = "list", call = "Design.Stack" }
	local Copy = table.clone(Tbl)
	
	for i, value in {
		direction = {
			type = "choice",
			group = "Auto layout",
			order = 1,
			options = { "vertical", "horizontal" }
		},
		gap = {
			type = "number",
			tokens = true,
			group = "Auto layout",
			order = 2
		},
		padding = {
			type = "number",
			tokens = true,
			group = "Auto layout",
			order = 3
		}
	} do
		Copy[i] = value
	end
	Stack.fields = Copy
	Stack.defaults = Defaults
	
	function Stack.build(Defaults, List)
		-- upvalues: NewUi (copy), sized (copy), CoreModule (upval), parentChildren (copy)
		local Frame = NewUi.new("Frame")
		NewUi.set(Frame, "BorderSizePixel", 0)
		sized(Defaults, Frame)
		local UIListLayout = NewUi.new("UIListLayout")
		NewUi.set(UIListLayout, "SortOrder", NewUi.values.enum("SortOrder", "LayoutOrder"))
		local Direction = Defaults.direction
		
		local function v67(p3)
			-- upvalues: NewUi (upval), UIListLayout (copy)
			NewUi.set(UIListLayout, "FillDirection", if p3 == "horizontal" then NewUi.values.enum("FillDirection", "Horizontal") else NewUi.values.enum("FillDirection", "Vertical"))
		end
		
		if Direction ~= nil then
			local Readable = Direction.readable
			
			if Readable then
				CoreModule.watch(function(Callback)
					-- upvalues: v67 (copy), Readable (copy)
					v67(Callback(Readable))
				end)
			else
				NewUi.set(UIListLayout, "FillDirection", if Direction.literal == "horizontal" then NewUi.values.enum("FillDirection", "Horizontal") else NewUi.values.enum("FillDirection", "Vertical"))
			end
		end
		local Gap = Defaults.gap
		
		local function v70(p3)
			-- upvalues: NewUi (upval), UIListLayout (copy)
			NewUi.set(UIListLayout, "Padding", NewUi.values.udim(0, (if type(p3) == "number" then p3 else nil) or 0))
		end
		
		if Gap ~= nil then
			local Readable1 = Gap.readable
			
			if Readable1 then
				CoreModule.watch(function(Callback)
					-- upvalues: v70 (copy), Readable1 (copy)
					v70(Callback(Readable1))
				end)
			else
				local Literal = Gap.literal
				NewUi.set(UIListLayout, "Padding", NewUi.values.udim(0, (if type(Literal) == "number" then Literal else nil) or 0))
			end
		end
		NewUi.set(UIListLayout, "Parent", Frame)
		local UIPadding = NewUi.new("UIPadding")
		local Padding = Defaults.padding
		
		local function v74(Literal)
			-- upvalues: NewUi (upval), UIPadding (copy)
			local UdimResult = NewUi.values.udim(0, (if type(Literal) == "number" then Literal else nil) or 0)
			NewUi.set(UIPadding, "PaddingTop", UdimResult)
			NewUi.set(UIPadding, "PaddingBottom", UdimResult)
			NewUi.set(UIPadding, "PaddingLeft", UdimResult)
			NewUi.set(UIPadding, "PaddingRight", UdimResult)
		end
		
		if Padding ~= nil then
			local Readable2 = Padding.readable
			
			if Readable2 then
				CoreModule.watch(function(Callback)
					-- upvalues: v74 (copy), Readable2 (copy)
					v74(Callback(Readable2))
				end)
			else
				v74(Padding.literal)
			end
		end
		NewUi.set(UIPadding, "Parent", Frame)
		
		for i, value in List do
			if NewUi.isA(value, "GuiObject") then
				NewUi.set(value, "LayoutOrder", i)
			end
		end
		parentChildren(Frame, List)
		
		return Frame
	end
	
	Kinds.Stack = Stack
	local Text = { children = "none", call = "Design.Text" }
	local Copy1 = table.clone(Tbl)
	
	for i1, value1 in {
		text = { type = "string", group = "Text", order = 1 },
		textSize = {
			type = "number",
			tokens = true,
			group = "Text",
			order = 2
		},
		textColor = { type = "color", group = "Text", order = 3 }
	} do
		Copy1[i1] = value1
	end
	Text.fields = Copy1
	Text.defaults = Defaults1
	
	function Text.build(p3)
		-- upvalues: NewUi (copy), sized (copy), BuilderSansJson (copy), textual (copy)
		local TextLabel = NewUi.new("TextLabel")
		sized(p3, TextLabel)
		NewUi.set(TextLabel, "BackgroundTransparency", 1)
		NewUi.set(TextLabel, "FontFace", BuilderSansJson)
		NewUi.set(TextLabel, "TextSize", 16)
		NewUi.set(TextLabel, "TextColor3", NewUi.rgb(235, 238, 242))
		textual(p3, {
			text = function(p4)
				-- upvalues: NewUi (upval), TextLabel (copy)
				NewUi.set(TextLabel, "Text", p4)
			end,
			size = function(p4)
				-- upvalues: NewUi (upval), TextLabel (copy)
				NewUi.set(TextLabel, "TextSize", p4)
			end,
			color = function(p4)
				-- upvalues: NewUi (upval), TextLabel (copy)
				NewUi.set(TextLabel, "TextColor3", p4)
			end
		})
		
		return TextLabel
	end
	
	Kinds.Text = Text
	local Button = { children = "none", call = "Design.Button" }
	local Copy2 = table.clone(Tbl)
	
	for i2, value2 in {
		text = { type = "string", group = "Text", order = 1 },
		textSize = {
			type = "number",
			tokens = true,
			group = "Text",
			order = 2
		},
		textColor = { type = "color", group = "Text", order = 3 },
		onActivate = { type = "event", group = "Interaction", order = 1 }
	} do
		Copy2[i2] = value2
	end
	Button.fields = Copy2
	Button.defaults = Defaults2
	
	function Button.build(p3)
		-- upvalues: NewUi (copy), sized (copy), BuilderSansJson (copy), textual (copy), CoreModule (upval)
		local TextButton = NewUi.new("TextButton")
		NewUi.set(TextButton, "AutoButtonColor", true)
		sized(p3, TextButton)
		NewUi.set(TextButton, "FontFace", BuilderSansJson)
		NewUi.set(TextButton, "TextSize", 16)
		NewUi.set(TextButton, "TextColor3", NewUi.rgb(255, 255, 255))
		NewUi.set(TextButton, "BorderSizePixel", 0)
		local UICorner = NewUi.new("UICorner")
		NewUi.set(UICorner, "CornerRadius", NewUi.values.udim(0, 8))
		NewUi.set(UICorner, "Parent", TextButton)
		local UIPadding = NewUi.new("UIPadding")
		NewUi.set(UIPadding, "PaddingLeft", NewUi.values.udim(0, 16))
		NewUi.set(UIPadding, "PaddingRight", NewUi.values.udim(0, 16))
		NewUi.set(UIPadding, "PaddingTop", NewUi.values.udim(0, 10))
		NewUi.set(UIPadding, "PaddingBottom", NewUi.values.udim(0, 10))
		NewUi.set(UIPadding, "Parent", TextButton)
		textual(p3, {
			text = function(p4)
				-- upvalues: NewUi (upval), TextButton (copy)
				NewUi.set(TextButton, "Text", p4)
			end,
			size = function(p4)
				-- upvalues: NewUi (upval), TextButton (copy)
				NewUi.set(TextButton, "TextSize", p4)
			end,
			color = function(p4)
				-- upvalues: NewUi (upval), TextButton (copy)
				NewUi.set(TextButton, "TextColor3", p4)
			end
		})
		local OnActivate = p3.onActivate
		local Callback = if OnActivate then OnActivate.callback else nil
		
		if Callback then
			local Activated = NewUi.connect(TextButton, "Activated", function()
				-- upvalues: Callback (copy)
				Callback()
			end)
			CoreModule.cleanup(function()
				-- upvalues: Activated (copy)
				Activated:Disconnect()
			end)
		end
		return TextButton
	end
	
	Kinds.Button = Button
	local Image = { children = "none", call = "Design.Image" }
	local Copy3 = table.clone(Tbl)
	
	for i3, value3 in { image = { type = "string", group = "Image", order = 1 } } do
		Copy3[i3] = value3
	end
	Image.fields = Copy3
	
	function Image.build(p3)
		-- upvalues: NewUi (copy), sized (copy), CoreModule (upval)
		local ImageLabel = NewUi.new("ImageLabel")
		sized(p3, ImageLabel)
		local Image = p3.image
		
		local function v87(p4)
			-- upvalues: NewUi (upval), ImageLabel (copy)
			NewUi.set(ImageLabel, "Image", (if type(p4) == "string" then p4 elseif type(p4) == "number" or type(p4) == "boolean" then tostring(p4) else nil) or "")
		end
		
		if Image == nil then
			return ImageLabel
		end
		local Readable = Image.readable
		
		if Readable then
			CoreModule.watch(function(Callback)
				-- upvalues: v87 (copy), Readable (copy)
				v87(Callback(Readable))
			end)
			
			return ImageLabel
		else
			local Literal = Image.literal
			NewUi.set(ImageLabel, "Image", (if type(Literal) == "string" then Literal elseif type(Literal) == "number" or type(Literal) == "boolean" then tostring(Literal) else nil) or "")
			
			return ImageLabel
		end
	end
	
	Kinds.Image = Image
	local List = {
		children = "template",
		template = "render",
		source = "from",
		key = "key",
		call = "Design.List"
	}
	local Copy4 = table.clone(Tbl)
	
	for i4, value4 in {
		gap = {
			type = "number",
			tokens = true,
			group = "Auto layout",
			order = 1
		}
	} do
		Copy4[i4] = value4
	end
	List.fields = Copy4
	List.defaults = Defaults3
	
	function List.build(p3)
		-- upvalues: NewUi (copy), sized (copy), CoreModule (upval)
		local ScrollingFrame = NewUi.new("ScrollingFrame")
		NewUi.set(ScrollingFrame, "BorderSizePixel", 0)
		NewUi.set(ScrollingFrame, "ScrollBarThickness", 6)
		NewUi.set(ScrollingFrame, "AutomaticCanvasSize", NewUi.values.enum("AutomaticSize", "Y"))
		NewUi.set(ScrollingFrame, "CanvasSize", NewUi.values.udim2(0, 0, 0, 0))
		sized(p3, ScrollingFrame)
		local UIListLayout = NewUi.new("UIListLayout")
		NewUi.set(UIListLayout, "SortOrder", NewUi.values.enum("SortOrder", "LayoutOrder"))
		local Gap = p3.gap
		
		local function v93(p4)
			-- upvalues: NewUi (upval), UIListLayout (copy)
			NewUi.set(UIListLayout, "Padding", NewUi.values.udim(0, (if type(p4) == "number" then p4 else nil) or 0))
		end
		
		if Gap ~= nil then
			local Readable = Gap.readable
			
			if Readable then
				CoreModule.watch(function(Callback)
					-- upvalues: v93 (copy), Readable (copy)
					v93(Callback(Readable))
				end)
			else
				local Literal = Gap.literal
				NewUi.set(UIListLayout, "Padding", NewUi.values.udim(0, (if type(Literal) == "number" then Literal else nil) or 0))
			end
		end
		NewUi.set(UIListLayout, "Parent", ScrollingFrame)
		local From = p3.from
		local Render = p3.render
		local Rows = if From then From.rows else nil
		local Template = if Render then Render.template else nil
		
		if Rows and Template then
			local v1 = nil
			CoreModule.watch(function(Callback)
				-- upvalues: Rows (copy), v1 (ref), CoreModule (upval), Template (copy), NewUi (upval), ScrollingFrame (copy)
				local CallbackResult = Callback(Rows)
				
				if v1 then
					CoreModule.owner.dispose(v1)
				end
				local Owner = CoreModule.createOwner()
				v1 = Owner
				CoreModule.withOwner(Owner, function()
					-- upvalues: CallbackResult (copy), Template (upval), CoreModule (upval), NewUi (upval), ScrollingFrame (upval)
					for i, value in CallbackResult do
						local TemplateResult = Template(CoreModule.cell(value))
						
						if NewUi.isA(TemplateResult, "GuiObject") then
							NewUi.set(TemplateResult, "LayoutOrder", i)
							NewUi.set(TemplateResult, "Parent", ScrollingFrame)
						end
					end
				end)
			end)
			CoreModule.cleanup(function()
				-- upvalues: v1 (ref), CoreModule (upval)
				if v1 then
					CoreModule.owner.dispose(v1)
				end
			end)
		end
		return ScrollingFrame
	end
	
	Kinds.List = List
	config.kinds = Kinds
	
	for _, kind in config.kinds do
		local BuildFunction = kind.build
		
		function kind.build(p4, p5, p6)
			-- upvalues: BuildFunction (copy), NewUi (copy)
			local BuildResult = BuildFunction(p4, p5, p6)
			
			if BuildResult ~= nil then
				NewUi.set(BuildResult, "Name", p6)
			end
			return BuildResult
		end
	end
	return config
end