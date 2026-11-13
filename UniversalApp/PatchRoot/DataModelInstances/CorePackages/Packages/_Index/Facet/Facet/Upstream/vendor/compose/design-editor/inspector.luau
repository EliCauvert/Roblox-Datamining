local _ = require("./ui")
local CoreModule = require("../core")
local DesignModule = require("../design")
local Datatype = DesignModule.datatype

local function equalLiteral(Literal, Literal1): boolean
	-- upvalues: equalLiteral (copy)
	if Literal == Literal1 then
		return true
	end
	if type(Literal) ~= "table" or type(Literal1) ~= "table" then
		return false
	end
	for i, value in Literal do
		if not equalLiteral(value, Literal1[i]) then
			return false
		end
	end
	for i1 in Literal1 do
		if Literal[i1] == nil then
			return false
		end
	end
	return true
end

local function equalList(Args, Args1, Callback): boolean
	if Args == nil or Args1 == nil then
		return Args == Args1
	end
	if #Args ~= #Args1 then
		return false
	end
	for i, arg in Args do
		if if Callback then not Callback(arg, Args1[i]) else arg ~= Args1[i] then
			return false
		end
	end
	return true
end

local function equalValue(p1, p2)
	-- upvalues: equalLiteral (copy), equalList (copy)
	return if p1 == nil or p2 == nil then p1 == p2 else equalLiteral(p1.literal, p2.literal) and (p1.input == p2.input and (p1.item == p2.item and (p1.output == p2.output and (p1.node == p2.node and (p1.nodeFrom == p2.nodeFrom and (p1.token == p2.token and (p1.state == p2.state and (p1.motion == p2.motion and p1.play == p2.play))))))) and (equalList(p1.fields, p2.fields) and (equalList(p1.nodes, p2.nodes) and equalList(p1.args, p2.args, equalLiteral))))
end

return function(p1)
	-- upvalues: CoreModule (copy), DesignModule (copy), equalList (copy), equalValue (copy), Datatype (copy)
	local v1 = require("./theme")(p1)
	local Color = v1.color
	local Size = v1.size
	local List = {
		"Layout", "Auto layout", "Fill", "Text", "Image", "Interaction"
	}
	
	local function describe(Prop)
		if Prop == nil then
			return ""
		else
			local Input = Prop.input
			local Item = Prop.item
			local Output = Prop.output
			local Token = Prop.token
			local Node = Prop.node
			local State = Prop.state
			local Play = Prop.play
			local Motion = Prop.motion
			local Text: string = if Motion then "  〜 " .. Motion else ""
			
			return if Node then "◎ " .. Node elseif Play then "▶ " .. Play elseif State then "state." .. State .. Text elseif Input then Input .. Text elseif Item then "item." .. Item .. Text elseif Output then "→ " .. Output elseif Token then Token else ""
		end
	end
	
	local function _(p2): string
		return if p2.token then "◆" elseif p2.play then "▶" elseif p2.output then "⚡" else "⛓"
	end
	
	local function choices(p2, p3, Tokens)
		local List = {}
		
		if p3.type == "event" then
			for _, output in p2.contract.outputs do
				table.insert(List, { output = output.id })
			end
			local Sequences = p2.sequences
			
			if Sequences then
				for _, sequence in Sequences do
					table.insert(List, { play = sequence.id })
				end
			end
			return List
		else
			if p3.type == "node" then
				local function visit(Root)
					-- upvalues: List (copy), visit (copy)
					table.insert(List, { node = Root.id })
					
					for _, child in Root.children do
						visit(child)
					end
				end
				
				visit(p2.root)
				
				return List
			end
			for _, input in p2.contract.inputs do
				if input.type == "slot" == (p3.type == "content") then
					table.insert(List, { input = input.id })
				end
			end
			local State = p2.state
			
			if State and p3.type ~= "content" then
				for _, value in State do
					table.insert(List, { state = value.id })
				end
			end
			if p3.tokens then
				for _, token in Tokens do
					table.insert(List, { token = token })
				end
			end
			return List
		end
	end
	
	local function same(Prop, p4): boolean
		return Prop ~= nil and (Prop.input == p4.input and (Prop.output == p4.output and (Prop.token == p4.token and (Prop.item == p4.item and (Prop.node == p4.node and Prop.state == p4.state)))) and Prop.play == p4.play)
	end
	
	local function humanize(Text: string): string
		local Replaced = string.gsub(string.gsub(string.gsub(Text, "Color3$", "Color"), "(%u)(%u%l)", "%1 %2"), "(%l)(%u)", "%1 %2")
		
		return string.upper((string.sub(Replaced, 1, 1))) .. string.lower((string.sub(Replaced, 2)))
	end
	
	local _ = function(Text: string)
		-- upvalues: p1 (copy)
		return if string.match(Text, "^#%x%x%x%x%x%x$") then p1.hex(Text) else nil
	end
	
	return function(p4, p5, p6)
		-- upvalues: v1 (copy), p1 (copy), Color (copy), Size (copy), humanize (copy), CoreModule (upval), DesignModule (upval), equalList (upval), equalValue (upval), List (copy), describe (copy), Datatype (upval), choices (copy), same (copy)
		local P17 = p6 or {}
		local Tokens = P17.tokens or {}
		local DesignInspector = v1.scroller("DesignInspector")
		p1.set(DesignInspector, "Size", p1.values.udim2(1, 0, 1, 0))
		v1.list(DesignInspector, p1.values.enum("FillDirection", "Vertical"), 0)
		p1.set(DesignInspector, "Parent", p5)
		local FrameResults = {}
		local List1 = {}
		
		local function _(List)
			-- upvalues: List1 (copy)
			for _, value in List do
				table.insert(List1, value)
			end
		end
		
		local function clear()
			-- upvalues: List1 (copy), FrameResults (copy), p1 (upval)
			for _, Connection in List1 do
				Connection:Disconnect()
			end
			table.clear(List1)
			
			for _, frameResult in FrameResults do
				p1.destroy(frameResult)
			end
			table.clear(FrameResults)
		end
		
		local v2 = nil
		local UserInputService = p1.service("UserInputService")
		local InputChanged = p1.connect(UserInputService, "InputChanged", function(p7)
			-- upvalues: v2 (ref), p1 (upval), UserInputService (copy)
			local v3 = v2
			
			if v3 and p1.get(p7, "UserInputType") == p1.values.enum("UserInputType", "MouseMovement") then
				v3.value = math.max(0, v3.start + math.round((p1.xy(p7, "Position").X - v3.from) / 2) * (if p1.call(UserInputService, "IsKeyDown", p1.values.enum("KeyCode", "LeftShift")) == true then 10 else 1))
				p1.set(v3.box, "Text", (tostring(v3.value)))
			end
		end)
		local InputEnded = p1.connect(UserInputService, "InputEnded", function(p7)
			-- upvalues: v2 (ref), p1 (upval), p4 (copy)
			local v3 = v2
			
			if v3 and p1.get(p7, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") then
				v2 = nil
				
				if v3.value ~= v3.start then
					p4.change(v3.key, { literal = v3.value })
				end
			end
		end)
		local Count = 0
		
		local function block(p7, p8)
			-- upvalues: Count (ref), v1 (upval), p1 (upval), DesignInspector (copy), FrameResults (copy)
			Count += 1
			local FrameResult = v1.frame(p7)
			p1.set(FrameResult, "Size", p1.values.udim2(1, 0, 0, p8))
			p1.set(FrameResult, "LayoutOrder", Count)
			p1.set(FrameResult, "Parent", DesignInspector)
			table.insert(FrameResults, FrameResult)
			
			return FrameResult
		end
		
		local function field(Key, p7, p8)
			-- upvalues: v1 (upval), Color (upval), p1 (upval), List1 (copy)
			local FieldResult = v1.field(Key, p8)
			local StrokeResult = v1.stroke(FieldResult, Color.accent, 1, 1)
			
			for _, value in {
				p1.connect(FieldResult, "Focused", function()
					-- upvalues: p1 (upval), StrokeResult (copy)
					p1.set(StrokeResult, "Transparency", 0)
				end),
				p1.connect(FieldResult, "FocusLost", function()
					-- upvalues: p1 (upval), StrokeResult (copy), FieldResult (copy), Key (copy), p7 (copy)
					p1.set(StrokeResult, "Transparency", 1)
					
					if p1.text(FieldResult, "Text") ~= Key then
						p7(p1.text(FieldResult, "Text"))
					end
				end)
			} do
				table.insert(List1, value)
			end
			return FieldResult
		end
		
		local function pressable(p9, Panel, Hover, p10, p11)
			-- upvalues: v1 (upval), Size (upval), p1 (upval), List1 (copy)
			local ButtonResult = v1.button(p9, "", nil, Size.small)
			p1.set(ButtonResult, "BackgroundTransparency", p11 or 0)
			v1.corner(ButtonResult, 4)
			
			for _, value in v1.hover(ButtonResult, Panel, Hover, p11) do
				table.insert(List1, value)
			end
			for _, value1 in { p1.connect(ButtonResult, "Activated", p10) } do
				table.insert(List1, value1)
			end
			return ButtonResult
		end
		
		local function toggle(p12, p13, p14)
			-- upvalues: pressable (copy), Color (upval), p1 (upval), v1 (upval)
			local Toggle = pressable("Toggle", if p12 then Color.accent else Color.raised, if p12 then Color.accent else Color.hover, p14, if p13 then 0 else 0.55)
			p1.set(Toggle, "Size", p1.values.udim2(0, 36, 0, 22))
			v1.corner(Toggle, 11)
			local Knob = v1.frame("Knob", Color.white)
			p1.set(Knob, "Size", p1.values.udim2(0, 18, 0, 18))
			p1.set(Knob, "AnchorPoint", p1.values.vector2(0, 0.5))
			p1.set(Knob, "Position", p1.values.udim2(0, if p12 then 16 else 2, 0.5, 0))
			p1.set(Knob, "BackgroundTransparency", if p13 then 0 else 0.35)
			v1.corner(Knob, 9)
			p1.set(Knob, "Parent", Toggle)
			
			return Toggle
		end
		
		local function segmented(Ids, From, Callback)
			-- upvalues: v1 (upval), Color (upval), p1 (upval), pressable (copy), humanize (upval)
			local Segmented = v1.frame("Segmented", Color.field)
			v1.corner(Segmented, 4)
			v1.pad(Segmented, 2, 2, 2, 2)
			p1.set(v1.list(Segmented, p1.values.enum("FillDirection", "Horizontal"), 2), "HorizontalFlex", p1.values.enum("UIFlexAlignment", "Fill"))
			
			for i, id in Ids do
				local IsFromMatch = id == From
				local PressableResult = pressable(id, if IsFromMatch then Color.raised else Color.field, Color.hover, function()
					-- upvalues: Callback (copy), id (copy)
					Callback(id)
				end)
				p1.set(PressableResult, "LayoutOrder", i)
				p1.set(PressableResult, "Size", p1.values.udim2(0, 0, 1, 0))
				p1.set(PressableResult, "Text", (humanize(id)))
				v1.pad(PressableResult, 4, 4, 0, 0)
				p1.set(PressableResult, "FontFace", if IsFromMatch then v1.font.bold else v1.font.medium)
				p1.set(PressableResult, "TextColor3", if IsFromMatch then Color.text else Color.secondary)
				v1.corner(PressableResult, 3)
				p1.set(PressableResult, "Parent", Segmented)
			end
			return Segmented
		end
		
		local function editorSlot(Key)
			-- upvalues: v1 (upval), p1 (upval)
			local Editor = v1.frame("Editor")
			p1.set(Editor, "Size", p1.values.udim2(1, -158, 1, -4))
			p1.set(Editor, "AnchorPoint", p1.values.vector2(0, 0.5))
			p1.set(Editor, "Position", p1.values.udim2(0, 128, 0.5, 0))
			p1.set(Editor, "Parent", Key)
			
			return Editor
		end
		
		local CellResult = CoreModule.cell(false)
		
		local function render(p12, p13, List2, p14)
			-- upvalues: clear (copy), Count (ref), DesignModule (upval), p4 (copy), equalList (upval), equalValue (upval), block (copy), v1 (upval), Size (upval), Color (upval), p1 (upval), field (copy), editorSlot (copy), segmented (copy), List (upval), humanize (upval), pressable (copy), describe (upval), toggle (copy), P17 (copy), v2 (ref), List1 (copy), Datatype (upval), Tokens (copy), choices (upval), same (upval), CellResult (copy)
			clear()
			Count = 0
			local FindResult = DesignModule.document.find(p12.root, p13)
			
			if FindResult == nil then return end
			local Kind = p4.library.kinds[FindResult.kind]
			local Fields = if Kind then Kind.fields else {}
			local t = {}
			
			if #List2 > 1 then
				FindResult = table.clone(FindResult)
				local Copy = table.clone(FindResult.props)
				FindResult.props = Copy
				Fields = table.clone(Fields)
				
				local function effective(ChooseANode, p15)
					-- upvalues: p4 (upval)
					local Kind = p4.library.kinds[ChooseANode.kind]
					
					if Kind == nil then
						return ChooseANode.props[p15]
					end
					local Default = if Kind.defaults then Kind.defaults[p15] else nil
					
					if Default == nil then
						Default = Kind.fields[p15].default
					end
					local Prop = ChooseANode.props[p15]
					
					if not Prop then
						if Default ~= nil then
							return { literal = Default }
						end
						Prop = nil
					end
					return Prop
				end
				
				for i, value in table.clone(Fields) do
					local EffectiveResult = effective(FindResult, i)
					
					for _, value1 in List2 do
						local ChooseANode = assert(DesignModule.document.find(p12.root, value1), "Choose a node")
						local Kind1 = p4.library.kinds[ChooseANode.kind]
						local Field = if Kind1 then Kind1.fields[i] else nil
						
						if Field == nil or Field.type ~= value.type or Field.datatype ~= value.datatype or not equalList(Field.options, value.options) or Kind1 ~= nil and not DesignModule.document.applies(ChooseANode, Kind1, i) then
							Fields[i] = nil
							break
						elseif not equalValue(EffectiveResult, (effective(ChooseANode, i))) then
							t[i] = true
						end
					end
					if t[i] or EffectiveResult == nil then
						Copy[i] = nil
					else
						Copy[i] = EffectiveResult
					end
				end
			end
			local Header = block("Header", 72)
			v1.pad(Header, Size.gutter, Size.gutter, 10, 10)
			local Badge = v1.frame("Badge", Color.accentSoft)
			p1.set(Badge, "Size", p1.values.udim2(0, 28, 0, 28))
			p1.set(Badge, "AnchorPoint", p1.values.vector2(0, 0.5))
			p1.set(Badge, "Position", p1.values.udim2(0, 0, 0.5, 0))
			v1.corner(Badge, 6)
			local LabelResult = v1.label(v1.glyph[FindResult.kind] or "◇", Color.accent, 14, v1.font.bold)
			p1.set(LabelResult, "Size", p1.values.udim2(1, 0, 1, 0))
			p1.set(LabelResult, "TextXAlignment", p1.values.enum("TextXAlignment", "Center"))
			p1.set(LabelResult, "Parent", Badge)
			p1.set(Badge, "Parent", Header)
			local FieldResult = field(if #List2 > 1 then `{#List2} selected` else FindResult.name, function(p15)
				-- upvalues: p4 (upval)
				p4.rename(p15)
			end)
			p1.set(FieldResult, "Name", "NodeName")
			p1.set(FieldResult, "BackgroundTransparency", 1)
			p1.set(FieldResult, "TextSize", Size.title)
			p1.set(FieldResult, "FontFace", v1.font.bold)
			v1.place(FieldResult, Header, p1.values.udim2(1, -36, 0, 26), p1.values.udim2(0, 36, 0, 0))
			v1.place(v1.label(FindResult.kind, Color.tertiary, Size.small), Header, p1.values.udim2(1, -44, 0, 24), p1.values.udim2(0, 44, 0, 26))
			
			local function section(p15)
				-- upvalues: block (upval), v1 (upval), Color (upval), p1 (upval), Size (upval)
				local BlockResult = block(p15, 40)
				v1.place(v1.frame("Rule", Color.divider), BlockResult, p1.values.udim2(1, 0, 0, 1))
				local LabelResult = v1.label(p15, Color.text, Size.small, v1.font.bold)
				p1.set(LabelResult, "Position", p1.values.udim2(0, Size.gutter, 0, 12))
				v1.place(LabelResult, BlockResult, p1.values.udim2(1, -2 * Size.gutter, 0, 24))
			end
			
			local function row(p15, p16)
				-- upvalues: block (upval), v1 (upval), Size (upval), Color (upval), p1 (upval)
				local BlockResult = block(p15, 40)
				v1.pad(BlockResult, Size.gutter)
				local LabelResult = v1.label(p16, Color.secondary, Size.small)
				p1.set(LabelResult, "Name", "Label")
				p1.set(LabelResult, "Size", p1.values.udim2(0, 122, 1, 0))
				p1.set(LabelResult, "TextWrapped", true)
				p1.set(LabelResult, "TextTruncate", p1.values.enum("TextTruncate", "AtEnd"))
				p1.set(LabelResult, "Parent", BlockResult)
				
				return BlockResult, LabelResult
			end
			
			if p4.library.tags ~= nil then
				local Tags = row("Tags", "Style tags")
				local FieldResult1 = field(table.concat(FindResult.tags or {}, ", "), function(Text: string)
					-- upvalues: p4 (upval)
					local List = {}
					
					for i in string.gmatch(Text, "[^,%s]+") do
						table.insert(List, i)
					end
					p4.tag(if #List > 0 then List else nil)
				end, true)
				p1.set(FieldResult1, "PlaceholderText", "None")
				p1.set(FieldResult1, "Size", p1.values.udim2(1, 0, 1, 0))
				p1.set(FieldResult1, "Parent", (editorSlot(Tags)))
			end
			if #List2 == 1 and Kind and Kind.children == "template" then
				section("Data")
				local Ids = {}
				
				for _, input in p12.contract.inputs do
					if input.type == "list" then
						table.insert(Ids, input.id)
					end
				end
				local Bind = FindResult.bind
				local From = if Bind then Bind.from else nil
				local EditorSlotResult = editorSlot((row("List", "Source")))
				
				if #Ids > 0 then
					v1.place(segmented(Ids, From, function(From)
						-- upvalues: p4 (upval), Bind (copy)
						p4.bind({ from = From, key = if Bind then Bind.key else "id" })
					end), EditorSlotResult, p1.values.udim2(1, 0, 1, 0))
				else
					v1.place(v1.label("No list inputs", Color.tertiary, Size.small), EditorSlotResult, p1.values.udim2(1, 0, 1, 0))
				end
				if Bind then
					v1.place(field(Bind.key, function(Key)
						-- upvalues: p4 (upval), Bind (copy)
						p4.bind({ from = Bind.from, key = Key })
					end, true), editorSlot((row("Key", "Key"))), p1.values.udim2(1, 0, 1, 0))
				end
			end
			local t1 = {}
			local List3 = {}
			local Advanced = {}
			
			for i1, field1 in Fields do
				if #List2 ~= 1 or not Kind or DesignModule.document.applies(FindResult, Kind, i1) then
					if field1.advanced and FindResult.props[i1] == nil then
						table.insert(Advanced, i1)
					else
						local Group = field1.group or "Properties"
						
						if t1[Group] == nil then
							t1[Group] = {}
							
							if not table.find(List, Group) then
								table.insert(List3, Group)
							end
						end
						table.insert(t1[Group], i1)
					end
				end
			end
			table.sort(List3)
			local Copy = table.clone(List)
			
			for _, value2 in List3 do
				table.insert(Copy, value2)
			end
			local function renderGroups(List2, p15)
				-- upvalues: Fields (ref), section (copy), FindResult (ref), humanize (upval), row (copy), t (copy), editorSlot (upval), p4 (upval), pressable (upval), Color (upval), p1 (upval), DesignModule (upval), p12 (copy), describe (upval), v1 (upval), Kind (copy), toggle (upval), segmented (upval), field (upval), P17 (upval), p13 (copy), v2 (upval), List1 (upval), Size (upval), Datatype (upval), Tokens (upval), choices (upval), same (upval)
				for _, value in List2 do
					local List = p15[value]
					
					if List ~= nil then
						table.sort(List, function(A, B): boolean
							-- upvalues: Fields (upval)
							local Order = Fields[A].order or 1e999
							local Order1 = Fields[B].order or 1e999
							
							return if Order == Order1 then A < B else Order < Order1
						end)
						section(value)
						
						for _, value1 in List do
							local Field = Fields[value1]
							local Prop = FindResult.props[value1]
							local RowResult, RowResult2 = row(value1, (Field.label or humanize(value1)) .. (if t[value1] then " (Mixed)" else ""))
							local EditorSlotResult = editorSlot(RowResult)
							local Literal = if Prop then Prop.literal else nil
							local ContentKind = p4.library.contentKind
							
							if Prop and Literal == nil then
								local Binding = pressable("Binding", Color.accentSoft, Color.hover, function()
									-- upvalues: p4 (upval), value1 (copy)
									p4.change(value1, nil)
								end)
								p1.set(Binding, "Size", p1.values.udim2(1, 0, 1, 0))
								local Node = Prop.node
								local FindResult1 = if Node then DesignModule.document.find(p12.root, Node) else nil
								p1.set(Binding, "Text", (if Prop.token then "◆" elseif Prop.play then "▶" elseif Prop.output then "⚡" else "⛓") .. "  " .. (if FindResult1 then "◎ " .. FindResult1.name else describe(Prop)))
								p1.set(Binding, "TextColor3", Color.accent)
								p1.set(Binding, "FontFace", v1.font.bold)
								p1.set(Binding, "TextXAlignment", p1.values.enum("TextXAlignment", "Left"))
								p1.set(Binding, "TextTruncate", p1.values.enum("TextTruncate", "AtEnd"))
								v1.pad(Binding, 8)
								p1.set(Binding, "Parent", EditorSlotResult)
							elseif Field.type == "boolean" then
								local Default = Field.default
								local Defaults = if Kind then Kind.defaults else nil
								
								if Default == nil and Defaults then
									Default = Defaults[value1]
								end
								local IsDefault: boolean = if Literal == nil then Default == true else Literal == true
								local Ggle = toggle(IsDefault, Literal ~= nil, function()
									-- upvalues: p4 (upval), value1 (copy), IsDefault (copy)
									p4.change(value1, { literal = not IsDefault })
								end)
								p1.set(Ggle, "AnchorPoint", p1.values.vector2(0, 0.5))
								p1.set(Ggle, "Position", p1.values.udim2(0, 0, 0.5, 0))
								p1.set(Ggle, "Parent", EditorSlotResult)
							elseif Field.type == "choice" and #(Field.options or {}) > 3 then
								local Options = Field.options or {}
								local Value = if type(Literal) == "string" then Literal else nil
								local Picker = pressable("Picker", Color.field, Color.hover, function()
									-- upvalues: Value (copy), Options (copy), p4 (upval), value1 (copy)
									p4.change(value1, {
										literal = Options[(Value and table.find(Options, Value) or 0) % #Options + 1]
									})
								end)
								p1.set(Picker, "Size", p1.values.udim2(1, 0, 1, 0))
								p1.set(Picker, "Text", (if Value then humanize(Value) else "Auto") .. "  ▾")
								p1.set(Picker, "TextColor3", if Value then Color.text else Color.tertiary)
								p1.set(Picker, "TextXAlignment", p1.values.enum("TextXAlignment", "Left"))
								v1.pad(Picker, 8)
								p1.set(Picker, "Parent", EditorSlotResult)
							elseif Field.type == "choice" then
								v1.place(segmented(Field.options or {}, if type(Literal) == "string" then Literal else nil, function(Literal)
									-- upvalues: p4 (upval), value1 (copy)
									p4.change(value1, { literal = Literal })
								end), EditorSlotResult, p1.values.udim2(1, 0, 1, 0))
							elseif Field.type == "number" then
								local FieldResult = field(if type(Literal) == "number" then tostring(Literal) else "", function(p16)
									-- upvalues: p4 (upval), value1 (copy)
									local Number: number? = tonumber(p16)
									
									if Number then
										p4.change(value1, { literal = Number })
										
										return
									end
									if p16 == "" then
										p4.change(value1, nil)
									end
								end, true)
								p1.set(FieldResult, "PlaceholderText", "Auto")
								p1.set(FieldResult, "Size", p1.values.udim2(1, 0, 1, 0))
								p1.set(RowResult2, "Active", true)
								
								for _, value2 in {
									p1.connect(RowResult2, "InputBegan", function(p16)
										-- upvalues: p1 (upval), P17 (upval), p13 (upval), value1 (copy), Literal (copy), FieldResult (copy), v2 (upval)
										if p1.get(p16, "UserInputType") == p1.values.enum("UserInputType", "MouseButton1") then
											local MeasureResult = if P17.measure then P17.measure(p13, value1) else nil
											local Number = if type(Literal) == "number" then Literal else tonumber(p1.text(FieldResult, "Text")) or math.round(MeasureResult or 0)
											v2 = {
												key = value1,
												box = FieldResult,
												from = p1.xy(p16, "Position").X,
												start = Number,
												value = Number
											}
										end
									end),
									p1.connect(RowResult2, "MouseEnter", function()
										-- upvalues: p1 (upval), RowResult2 (copy), Color (upval)
										p1.set(RowResult2, "TextColor3", Color.text)
									end),
									p1.connect(RowResult2, "MouseLeave", function()
										-- upvalues: p1 (upval), RowResult2 (copy), Color (upval)
										p1.set(RowResult2, "TextColor3", Color.secondary)
									end)
								} do
									table.insert(List1, value2)
								end
								p1.set(FieldResult, "Parent", EditorSlotResult)
							elseif Field.type == "color" then
								local Text = if type(Literal) == "string" then Literal else ""
								local FieldResult = field(Text, function(Literal)
									-- upvalues: p4 (upval), value1 (copy)
									p4.change(value1, if Literal == "" then nil else { literal = Literal })
								end, true)
								p1.set(FieldResult, "PlaceholderText", "None")
								p1.set(FieldResult, "Size", p1.values.udim2(1, 0, 1, 0))
								v1.pad(FieldResult, 30, 8)
								local Swatch = v1.frame("Swatch", (if string.match(Text, "^#%x%x%x%x%x%x$") then p1.hex(Text) else nil) or Color.field)
								p1.set(Swatch, "Size", p1.values.udim2(0, 14, 0, 14))
								p1.set(Swatch, "AnchorPoint", p1.values.vector2(0, 0.5))
								p1.set(Swatch, "Position", p1.values.udim2(0, -22, 0.5, 0))
								v1.corner(Swatch, 3)
								local HexResult = if string.match(Text, "^#%x%x%x%x%x%x$") then p1.hex(Text) else nil
								v1.stroke(Swatch, Color.white, 1, if HexResult then 0.85 else 0.6)
								p1.set(Swatch, "Parent", FieldResult)
								p1.set(FieldResult, "Parent", EditorSlotResult)
							elseif Field.type == "vector3" then
								local t2 = {}
								
								if type(Literal) == "table" then
									local LiteralEntry = Literal[1]
									t2[1] = if type(LiteralEntry) == "number" then LiteralEntry else 0
									local LiteralEntry1 = Literal[2]
									t2[2] = if type(LiteralEntry1) == "number" then LiteralEntry1 else 0
									local LiteralEntry2 = Literal[3]
									t2[3] = if type(LiteralEntry2) == "number" then LiteralEntry2 else 0
								else
									t2 = { 0, 0, 0 }
								end
								p1.set(v1.list(EditorSlotResult, p1.values.enum("FillDirection", "Horizontal"), 4), "HorizontalFlex", p1.values.enum("UIFlexAlignment", "Fill"))
								
								for i, value3 in { "X", "Y", "Z" } do
									local FieldResult = field(tostring(t2[i]), function(p16)
										-- upvalues: p4 (upval), value1 (copy), i (copy), t2 (ref)
										local Number: number? = tonumber(p16)
										
										if Number then
											p4.change(value1, function(p17)
												-- upvalues: value1 (upval), i (upval), Number (copy), t2 (upval)
												local Prop = p17.props[value1]
												local Literal = if Prop then Prop.literal else nil
												local Literal1 = {}
												
												for i1 = 1, 3 do
													local LiteralEntry = if type(Literal) == "table" then Literal[i1] else nil
													Literal1[i1] = if i1 == i then Number else LiteralEntry or t2[i1]
												end
												return { literal = Literal1 }
											end)
										end
									end, true)
									p1.set(FieldResult, "Name", value3)
									p1.set(FieldResult, "LayoutOrder", i)
									p1.set(FieldResult, "Size", p1.values.udim2(0, 0, 1, 0))
									v1.pad(FieldResult, 16, 4)
									v1.place(v1.label(value3, Color.tertiary, Size.small, v1.font.bold), FieldResult, p1.values.udim2(0, 10, 1, 0), p1.values.udim2(0, -12, 0, 0))
									p1.set(FieldResult, "Parent", EditorSlotResult)
								end
							elseif Field.type == "string" then
								v1.place(field(if type(Literal) == "string" then Literal else "", function(Literal)
									-- upvalues: p4 (upval), value1 (copy)
									p4.change(value1, if Literal == "" then nil else { literal = Literal })
								end), EditorSlotResult, p1.values.udim2(1, 0, 1, 0))
							elseif Field.type == "datatype" and Field.datatype ~= nil and Datatype.arity[Field.datatype] ~= nil then
								local ArityEntry: number = Datatype.arity[Field.datatype]
								local Defaults = if Kind then Kind.defaults else nil
								local Default = if Defaults then Defaults[value1] else Field.default
								local Literal1 = if type(Literal) == "table" then Literal elseif type(Default) == "table" then Default else {}
								local Tbl = {}
								
								for i2 = 1, ArityEntry do
									Tbl[i2] = Literal1[i2] or 0
								end
								p1.set(RowResult, "Size", p1.values.udim2(1, 0, 0, ArityEntry * 32))
								v1.list(EditorSlotResult, p1.values.enum("FillDirection", "Vertical"), 4)
								
								for i1 = 1, ArityEntry do
									local Entry = Tbl[i1]
									local Ken = Datatype.token(Entry)
									local FrameResult = v1.frame(`Component{i1}`)
									p1.set(FrameResult, "LayoutOrder", i1)
									p1.set(FrameResult, "Size", p1.values.udim2(1, 0, 0, 28))
									v1.place(v1.label(tostring(i1), Color.tertiary, Size.small), FrameResult, p1.values.udim2(0, 14, 1, 0))
									
									local function _(p16)
										-- upvalues: Tbl (copy), i1 (copy), p4 (upval), value1 (copy)
										local Copy = table.clone(Tbl)
										Copy[i1] = p16
										p4.change(value1, { literal = Copy })
									end
									
									local FieldResult = field(Ken or tostring(Entry), function(p16)
										-- upvalues: Tbl (copy), i1 (copy), p4 (upval), value1 (copy)
										local Number: number? = tonumber(p16)
										
										if Number then
											local Copy = table.clone(Tbl)
											Copy[i1] = Number
											p4.change(value1, { literal = Copy })
											
											return
										end
										if p16 == "" then
											local Copy = table.clone(Tbl)
											Copy[i1] = 0
											p4.change(value1, { literal = Copy })
										end
									end, true)
									p1.set(FieldResult, "Size", p1.values.udim2(1, if Field.tokens and #Tokens > 0 then -38 else -18, 1, 0))
									p1.set(FieldResult, "Position", p1.values.udim2(0, 18, 0, 0))
									p1.set(FieldResult, "TextColor3", if Ken then Color.accent else Color.text)
									p1.set(FieldResult, "Parent", FrameResult)
									
									if Field.tokens and #Tokens > 0 then
										local Bind = pressable("Bind", Color.panel, Color.hover, function()
											-- upvalues: Ken (copy), Tokens (upval), Tbl (copy), i1 (copy), p4 (upval), value1 (copy)
											local Copy = table.clone(Tbl)
											Copy[i1] = {
												token = Tokens[(Ken and table.find(Tokens, Ken) or 0) % #Tokens + 1]
											}
											p4.change(value1, { literal = Copy })
										end, 1)
										p1.set(Bind, "Size", p1.values.udim2(0, 20, 1, 0))
										p1.set(Bind, "Position", p1.values.udim2(1, -20, 0, 0))
										p1.set(Bind, "Text", "◆")
										p1.set(Bind, "TextColor3", if Ken then Color.accent else Color.tertiary)
										p1.set(Bind, "Parent", FrameResult)
									end
									p1.set(FrameResult, "Parent", EditorSlotResult)
								end
							elseif Field.type == "value" or Field.type == "datatype" then
								v1.place(field(if Literal == nil then "" else DesignModule.literal(Literal), function(p16)
									-- upvalues: p4 (upval), value1 (copy), DesignModule (upval), Field (copy), humanize (upval)
									if p16 == "" then
										p4.change(value1, nil)
										
										return
									end
									local Success, Result = pcall(DesignModule.parseLiteral, p16)
									
									if Success then
										p4.change(value1, { literal = Result })
										
										return
									else
										p4.problem:set(`{Field.label or humanize(value1)}: {Result}`)
									end
								end, true), EditorSlotResult, p1.values.udim2(1, 0, 1, 0))
							elseif Field.type == "content" and type(Literal) == "table" and type(Literal["$template"]) == "string" then
								local Template = Literal["$template"]
								local OpenContent = pressable("OpenContent", Color.accentSoft, Color.hover, function()
									-- upvalues: p4 (upval), Template (copy)
									p4.select(Template)
								end)
								p1.set(OpenContent, "Size", p1.values.udim2(1, 0, 1, 0))
								local FindResult2 = DesignModule.document.find(p12.root, Template)
								p1.set(OpenContent, "Text", "◇ " .. (if FindResult2 then FindResult2.name else Template))
								p1.set(OpenContent, "TextColor3", Color.accent)
								p1.set(OpenContent, "Parent", EditorSlotResult)
							elseif Field.type == "content" and ContentKind ~= nil then
								local AddContent = pressable("AddContent", Color.panel, Color.hover, function()
									-- upvalues: p4 (upval), value1 (copy), ContentKind (copy)
									p4.content(value1, ContentKind)
								end)
								p1.set(AddContent, "Size", p1.values.udim2(1, 0, 1, 0))
								p1.set(AddContent, "Text", "+ " .. ContentKind)
								p1.set(AddContent, "TextColor3", Color.accent)
								p1.set(AddContent, "Parent", EditorSlotResult)
							else
								v1.place(v1.label("Not bound", Color.tertiary, Size.small), EditorSlotResult, p1.values.udim2(1, 0, 1, 0))
							end
							local ChoicesResult = choices(p12, Field, Tokens)
							
							if t[value1] then
								for _, value4 in p1.descendants(EditorSlotResult) do
									if p1.isA(value4, "TextBox") then
										p1.set(value4, "Text", "")
										p1.set(value4, "PlaceholderText", "Mixed")
									end
								end
							end
							if #ChoicesResult > 0 then
								local NoLiteral: boolean = Prop ~= nil and Literal == nil
								local Bind = pressable("Bind", Color.panel, Color.hover, function()
									-- upvalues: ChoicesResult (copy), same (upval), Prop (copy), p4 (upval), value1 (copy)
									local v3 = 0
									
									for i, value in ChoicesResult do
										if same(Prop, value) then
											v3 = i
										end
									end
									local Copy = table.clone(ChoicesResult[v3 % #ChoicesResult + 1])
									local HasInput: boolean = Copy.input ~= nil or Copy.state ~= nil or Copy.item ~= nil
									Copy.motion = if Prop and HasInput then Prop.motion else nil
									p4.change(value1, Copy)
								end, 1)
								p1.set(Bind, "Size", p1.values.udim2(0, 24, 0, 24))
								p1.set(Bind, "AnchorPoint", p1.values.vector2(1, 0.5))
								p1.set(Bind, "Position", p1.values.udim2(1, 0, 0.5, 0))
								p1.set(Bind, "Text", if Field.type == "event" then "⚡" elseif Field.tokens then "◆" else "⛓")
								p1.set(Bind, "FontFace", v1.font.bold)
								p1.set(Bind, "TextColor3", if NoLiteral then Color.accent else Color.tertiary)
								p1.set(Bind, "Parent", RowResult)
							end
							local Motion = p4.library.motion
							local HasInput: boolean = Prop ~= nil and (Prop.input ~= nil or (Prop.state ~= nil or Prop.item ~= nil))
							
							if Motion ~= nil and Prop ~= nil and HasInput then
								local Roles = Motion.roles
								local Motion1 = pressable("Motion", Color.panel, Color.hover, function()
									-- upvalues: Prop (copy), Roles (copy), p4 (upval), value1 (copy)
									local Copy = table.clone(Prop)
									Copy.motion = Roles[(Prop.motion and table.find(Roles, Prop.motion) or 0) + 1]
									p4.change(value1, Copy)
								end, 1)
								p1.set(Motion1, "Size", p1.values.udim2(0, 24, 0, 24))
								p1.set(Motion1, "AnchorPoint", p1.values.vector2(1, 0.5))
								p1.set(Motion1, "Position", p1.values.udim2(1, -28, 0.5, 0))
								p1.set(Motion1, "Text", "〜")
								p1.set(Motion1, "FontFace", v1.font.bold)
								p1.set(Motion1, "TextColor3", if Prop.motion then Color.accent else Color.tertiary)
								p1.set(Motion1, "Parent", RowResult)
							end
						end
					end
				end
			end
			
			renderGroups(Copy, t2)
			
			if #Advanced > 0 then
				local AdvancedToggle = block("AdvancedToggle", 36)
				local Advanced1 = pressable("Advanced", Color.raised, Color.hover, function()
					-- upvalues: CellResult (upval)
					CellResult:set(not CellResult:peek())
				end)
				p1.set(Advanced1, "Text", if p14 then `Advanced  ▾  {#Advanced}` else `Advanced  ▸  {#Advanced}`)
				p1.set(Advanced1, "TextColor3", Color.secondary)
				p1.set(Advanced1, "FontFace", v1.font.bold)
				p1.set(Advanced1, "Size", p1.values.udim2(1, -2 * Size.gutter, 0, 28))
				p1.set(Advanced1, "Position", p1.values.udim2(0, Size.gutter, 0, 4))
				p1.set(Advanced1, "TextXAlignment", p1.values.enum("TextXAlignment", "Left"))
				p1.set(Advanced1, "Parent", AdvancedToggle)
				
				if p14 then
					renderGroups({ "Advanced" }, { Advanced = Advanced })
				end
			end
			local Sequences = p12.sequences
			local PlayFunction = P17.play
			
			if Sequences and PlayFunction then
				local Sequences1 = block("Sequences", 28)
				local Sequences2 = v1.label("Sequences", Color.secondary, Size.small)
				p1.set(Sequences2, "FontFace", v1.font.bold)
				p1.set(Sequences2, "Size", p1.values.udim2(1, -2 * Size.gutter, 1, 0))
				p1.set(Sequences2, "Position", p1.values.udim2(0, Size.gutter, 0, 0))
				p1.set(Sequences2, "Parent", Sequences1)
				
				for _, sequence in Sequences do
					local Sequence = block("Sequence", 32)
					local Id = sequence.id
					local Play = pressable("Play", Color.raised, Color.hover, function()
						-- upvalues: PlayFunction (copy), Id (copy)
						PlayFunction(Id)
					end)
					local CountSteps = #sequence.steps
					p1.set(Play, "Text", `▶  {Id}   {CountSteps} {if CountSteps == 1 then "step" else "steps"}{if sequence.autoplay then "  ·  on show" else ""}`)
					p1.set(Play, "TextColor3", Color.text)
					p1.set(Play, "TextXAlignment", p1.values.enum("TextXAlignment", "Left"))
					p1.set(Play, "Size", p1.values.udim2(1, -2 * Size.gutter, 0, 28))
					p1.set(Play, "Position", p1.values.udim2(0, Size.gutter, 0, 2))
					p1.set(Play, "Parent", Sequence)
				end
			end
			block("End", 16)
		end
		
		local OwnResult = CoreModule.owner.own(p1.owner, CoreModule.createRootOwner(function()
			-- upvalues: CoreModule (upval), render (copy), p4 (copy), CellResult (copy)
			CoreModule.watch(function(Callback)
				-- upvalues: render (upval), p4 (upval), CellResult (upval)
				render(Callback(p4.document), Callback(p4.selected), Callback(p4.selection), Callback(CellResult))
			end)
		end, p1.runtime.reactor).dispose)
		
		return {
			root = DesignInspector,
			dispose = function()
				-- upvalues: OwnResult (copy), InputChanged (copy), InputEnded (copy), clear (copy), p1 (upval), DesignInspector (copy)
				OwnResult()
				InputChanged:Disconnect()
				InputEnded:Disconnect()
				clear()
				p1.destroy(DesignInspector)
			end
		}
	end
end