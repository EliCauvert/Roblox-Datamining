local CoreModule = require("../vendor/compose/core")
local DesignModule = require("../vendor/compose/design")
local _ = require("./types")
local ControlsModule = require("./controls")
local FieldsModule = require("./fields")
local IconsModule = require("../ui/icons")
local MotionModule = require("./motion")
local Roblox3dLibraryModule = require("../vendor/compose/design-editor/roblox-3d-library")
local RobloxTypesModule = require("../ui/roblox_types")
local StyleTagsModule = require("../ui/style_tags")
local VisualTargetModule = require("../ui/visual_target")
local config = { VirtualList = true, VirtualGrid = true, Outline = true }
local config1 = { TabView = "tabs", PageView = "pages" }
local config2 = {
	ErrorBoundary = true,
	TabView = true,
	PageView = true,
	NavigationStack = true,
	NavigationSplitView = true,
	Table = true,
	VirtualList = true,
	VirtualGrid = true,
	Outline = true
}
local config3 = {
	CellEditor = { key = "value", property = "onChange" },
	DateTimePicker = { key = "value", property = "onChange" },
	Pagination = { key = "page", property = "onChange" },
	Vote = { key = "value", property = "onChange" },
	StepIndicator = { key = "current", property = "onSelect" },
	Dialog = { key = "isPresented", property = "onPresentedChange" },
	Popover = { key = "isPresented", property = "onPresentedChange" },
	Toast = { key = "isPresented", property = "onPresentedChange" },
	Callout = {
		key = "isPresented",
		property = "onRetire",
		constant = false
	}
}
local config4 = {
	Menu = { { list = "items", handler = "onSelect" } },
	SplitButton = { { list = "items", handler = "onSelect" } },
	RadialMenu = { { list = "items", handler = "onSelect" } },
	Dialog = { { list = "actions", handler = "onActivate" } },
	Notice = { { list = "actions", handler = "onActivate" } },
	Sheet = { { list = "actions", handler = "onActivate" } },
	Callout = { { list = "actions", handler = "onActivate" } },
	Alert = { { list = "actions", handler = "onActivate" } },
	RowActions = {
		{ list = "leading", handler = "onActivate" },
		{ list = "trailing", handler = "onActivate" }
	}
}

local function noop() end

local function copy(Literal)
	-- upvalues: copy (copy)
	if type(Literal) ~= "table" then
		return Literal
	end
	local t = {}
	
	for i, value in Literal do
		t[i] = copy(value)
	end
	return t
end

local function _(p1)
	return if type(p1) == "table" then p1 else nil
end

local config5 = { Picker = true, ComboBox = true }
local config6 = {
	string = "string",
	choice = "string",
	color = "string",
	number = "number",
	boolean = "boolean"
}
local config7 = {
	string = "string",
	number = "number",
	boolean = "boolean",
	color = "color",
	image = "string",
	vector3 = "vector3",
	list = "value",
	record = "value",
	slot = "content"
}

local _ = function(p1)
	-- upvalues: FieldsModule (copy)
	local Control = FieldsModule.controls[p1]
	
	return if Control == nil then {} else Control.fields
end

local List = {}

for _, value in { IconsModule.BUILTIN, IconsModule.ART } do
	for i in value do
		table.insert(List, i)
	end
end
table.sort(List)

local _ = function(Text: string, p1): boolean
	return p1 == "string" and string.match(Text, "[iI]con$") ~= nil
end

local config8 = {
	corners = { surface = {} },
	sliceCenter = { scaleMode = { "slice" } },
	sliceScale = { scaleMode = { "slice" }, sliceCenter = {} },
	visibleLines = { multiline = { true } },
	hug = { mode = { "all" } },
	indicatorPosition = { style = { "radioGroup" } },
	needle = { presentation = { "gauge" } },
	sweep = { presentation = { "gauge" } },
	segments = { presentation = { "bar" } },
	leading = { zone = { "topbar" } },
	trailing = { zone = { "topbar" } },
	edge = { placement = { "side", "adaptive" } },
	alpha = { onAlphaChange = {} }
}
local config9 = {
	Picker = {
		maxHeight = { style = { "automatic", "menu", "navigationLink" } }
	},
	ProgressView = {
		diameter = { presentation = { "circular", "gauge", "spinner" } }
	},
	Toggle = { mixed = { presentation = { "checkbox" } } }
}
local config10 = {
	NavigationSplitView = { maxSidebarWidth = 480 },
	ProgressView = { min = 0, sweep = 240 },
	Image = { sliceCenter = { x0 = 0, y0 = 0, x1 = 1, y1 = 1 } }
}
local config11 = {
	Visible = true,
	Interactable = true,
	AutoLocalize = true,
	enabled = true
}

local function refine(p1, List)
	-- upvalues: config9 (copy), config10 (copy), config8 (copy), config11 (copy)
	local Entry = config9[p1] or {}
	local Entry1 = config10[p1] or {}
	for i, value in List do
		local Entry2 = Entry[i] or config8[i]
		
		if Entry2 ~= nil then
			local v1 = true
			
			for i1 in Entry2 do
				v1 = v1 and List[i1] ~= nil
			end
			if v1 then
				value.requires = Entry2
			end
		end
		if Entry1[i] ~= nil then
			value.default = Entry1[i]
		elseif value.default == nil and value.type == "boolean" and config11[i] then
			value.default = true
		end
	end
	return List
end

local function plainFields(Fields)
	-- upvalues: List (copy)
	local t = {}
	local List1 = {}
	
	for field in Fields do
		table.insert(List1, field)
	end
	table.sort(List1)
	
	for Order, Text in List1 do
		local Field = Fields[Text]
		local HasMatch = string.match(Text, "^%l") ~= nil
		local HasMatch1: boolean = Field.type == "string" and string.match(Text, "[iI]con$") ~= nil
		t[Text] = {
			type = if HasMatch1 then "choice" else Field.type,
			options = if HasMatch1 then List else Field.options,
			datatype = if Field.type == "color" then "Color3" else Field.datatype,
			also = Field.also,
			group = if HasMatch then "Control" else "Roblox",
			order = Order
		}
	end
	return t
end

local function fieldsOf(p2, p3)
	-- upvalues: FieldsModule (copy), List (copy), config6 (copy), config5 (copy)
	local t = {}
	local Order = 1000
	local Control = FieldsModule.controls[p2]
	local T = if Control == nil then {} else Control.fields
	for Text, value in T do
		if p3.fields[string.lower((string.sub(Text, 1, 1))) .. string.sub(Text, 2)] == nil or not string.match(Text, "^%u") or p2 == "Text" and Text == "TextSize" then
			Order += 1
			local HasMatch: boolean = value.type == "string" and string.match(Text, "[iI]con$") ~= nil
			t[Text] = {
				group = "More",
				advanced = true,
				type = if HasMatch then "choice" else value.type,
				options = if HasMatch then List else value.options,
				datatype = if value.type == "color" then "Color3" else value.datatype,
				also = value.also,
				order = Order
			}
		end
	end
	for i, field in p3.fields do
		local Entry = T[i]
		local List2 = if field.format == "padding" then { "number", "table" } elseif field.format == "spacing" then { "number" } elseif Entry and Entry.also then table.clone(Entry.also) else nil
		local Entry1 = if Entry == nil then nil else config6[Entry.type]
		local Entry2 = config6[field.type]
		
		if Entry1 ~= nil and Entry1 ~= Entry2 and (List2 == nil or table.find(List2, Entry1) == nil) then
			local List1 = List2 or {}
			table.insert(List1, Entry1)
			List2 = List1
		end
		local HasMatch: boolean = field.type == "string" and string.match(i, "[iI]con$") ~= nil
		local config = {
			type = if HasMatch then "choice" else field.type,
			options = if HasMatch then List else field.options,
			order = field.order,
			label = field.label,
			default = field.default,
			datatype = if field.type == "color" then "Color3" else nil,
			also = List2,
			tokens = field.tokens
		}
		
		if field.perRow ~= nil then
			config.perRow = field.perRow
		end
		local FacetSides = if field.format == "padding" then "Facet.Sides" elseif i == "options" and config5[p2] then "{ Facet.PickerOption<string> }" elseif i == "columns" and p2 == "Table" then "{ Facet.TableColumn<$Item, $Key> }" elseif i == "rowActions" then "Facet.RowActionsOptions?" elseif p2 == "Sheet" and i == "detents" then "{ Facet.SheetDetent }" elseif p2 == "TabView" and i == "tabs" then "{ Facet.Tab }" elseif i == "actions" then "{ Facet." .. (if p2 == "Dialog" then "DialogAction" elseif p2 == "Alert" then "AlertAction" else "OverlayAction") .. " }" elseif p2 == "RowActions" and (i == "leading" or i == "trailing") then "{ Facet.RowAction }" else nil
		
		if FacetSides ~= nil then
			config.luauType = FacetSides
		end
		t[i] = config
	end
	if p3.content then
		t[p3.content] = { type = "content", label = "Content", group = "Control" }
	end
	return t
end

local function seeds(p4)
	-- upvalues: ControlsModule (copy)
	local ControlsModuleEntry = ControlsModule[p4]
	
	if ControlsModuleEntry == nil then
		return {}
	else
		local Seeds = ControlsModuleEntry.seeds
		
		return if Seeds == nil then if ControlsModuleEntry.container == true or ControlsModuleEntry.content ~= nil then {
			{
				kind = "Text",
				props = { text = "Make this content yours" }
			}
		} else {} else Seeds
	end
end

local function color(Types, Text: string)
	return if type(Text) == "string" and string.match(Text, "^#%x%x%x%x%x%x$") then Types.Color3.fromHex(Text) else Text
end

local function enumItem(Types, Match, p4)
	for _, enum in Types.Enum:GetEnums() do
		if tostring(enum) == Match then
			return enum:FromName(p4)
		end
	end
	return nil
end

local function native3dKinds()
	-- upvalues: Roblox3dLibraryModule (copy)
	local SchemaResult = Roblox3dLibraryModule.schema()
	local t = {}
	
	for i, value in {
		Model = {},
		Part = {
			Size = "size",
			Color = "color",
			Material = "material",
			Transparency = "transparency",
			CanCollide = "canCollide",
			CanQuery = "canQuery",
			CanTouch = "canTouch",
			CastShadow = "castShadow"
		},
		PointLight = {
			Brightness = "brightness",
			Range = "range",
			Color = "color",
			Enabled = "enabled",
			Shadows = "shadows"
		},
		SurfaceLight = {
			Brightness = "brightness",
			Range = "range",
			Color = "color",
			Enabled = "enabled",
			Shadows = "shadows",
			Face = "face",
			Angle = "angle"
		},
		Decal = {
			Texture = "image",
			Color3 = "color",
			Transparency = "transparency",
			Face = "face"
		},
		Texture = {
			Texture = "image",
			Color3 = "color",
			Transparency = "transparency",
			Face = "face",
			StudsPerTileU = "tileU",
			StudsPerTileV = "tileV",
			OffsetStudsU = "offsetU",
			OffsetStudsV = "offsetV"
		}
	} do
		local Kind = SchemaResult.kinds[i]
		local Fields = {}
		
		for i1, value1 in value do
			local Field = Kind.fields[value1]
			Fields[i1] = {
				type = if i1 == "Material" or i1 == "Size" or i1 == "Face" then "datatype" else Field.type,
				options = Field.options,
				datatype = if i1 == "Material" then "Enum.Material" elseif i1 == "Size" then "Vector3" elseif i1 == "Face" then "Enum.NormalId" else nil
			}
		end
		t[i] = { children = Kind.children == "list", fields = Fields }
	end
	t.Part.fields.CFrame = { type = "datatype", datatype = "CFrame" }
	t.Part.fields.Anchored = { type = "boolean" }
	t.Part.fields.Reflectance = { type = "number" }
	t.Part.fields.MaterialVariant = { type = "string" }
	t.Part.fields.Shape = { type = "datatype", datatype = "Enum.PartType" }
	t.Decal.fields.ZIndex = { type = "number" }
	t.Texture.fields.ZIndex = { type = "number" }
	
	return t
end

return {
	create = function(p5)
		-- upvalues: RobloxTypesModule (copy), color (copy), enumItem (copy), noop (copy), ControlsModule (copy), config (copy), refine (copy), fieldsOf (copy), seeds (copy), VisualTargetModule (copy), FieldsModule (copy), copy (copy), CoreModule (copy), config3 (copy), config4 (copy), config1 (copy), config2 (copy), plainFields (copy), native3dKinds (copy), StyleTagsModule (copy), MotionModule (copy), config7 (copy), DesignModule (copy)
		local UI = p5.UI
		local Types = p5.types or RobloxTypesModule()
		
		local function convert(Text: string, Literal)
			-- upvalues: color (upval), Types (copy), enumItem (upval)
			if Text == "Color3" then
				return color(Types, Literal)
			end
			local Match: string? = string.match(Text, "^Enum%.(.+)$")
			
			if Match ~= nil then
				return if type(Literal) == "string" then enumItem(Types, Match, Literal) else Literal
			end
			if type(Literal) ~= "table" then
				return Literal
			end
			if Text == "CFrame" then
				local List = {}
				
				for _, value in Literal do
					assert(type(value) == "number", "CFrame components must be numbers")
					table.insert(List, value)
				end
				if #List == 0 then
					return Types.CFrame.new()
				elseif #List == 3 then
					return Types.CFrame.new(List[1], List[2], List[3])
				elseif #List == 7 then
					return Types.CFrame.new(List[1], List[2], List[3], List[4], List[5], List[6], List[7])
				else
					assert(#List == 12, "CFrame needs zero, three, seven or twelve components")
					
					return Types.CFrame.new(List[1], List[2], List[3], List[4], List[5], List[6], List[7], List[8], List[9], List[10], List[11], List[12])
				end
			else
				local v2 = 0
				local v3 = 0
				local v4 = 0
				local v5 = 0
				local Count = 0
				
				for _, value1 in Literal do
					if type(value1) == "number" then
						Count += 1
						
						if Count == 1 then
							v2 = value1
						elseif Count == 2 then
							v3 = value1
						elseif Count == 3 then
							v4 = value1
						elseif Count == 4 then
							v5 = value1
						end
					end
				end
				return if Text == "UDim2" then Types.UDim2.new(v2, v3, v4, v5) elseif Text == "UDim" then Types.UDim.new(v2, v3) elseif Text == "Vector2" then Types.Vector2.new(v2, v3) elseif Text == "Vector3" then Types.Vector3.new(v2, v3, v4) elseif Text == "Rect" then Types.Rect.new(v2, v3, v4, v5) elseif Text == "NumberRange" then Types.NumberRange.new(v2, v3) else nil
			end
		end
		
		local function _(p6, p7)
			-- upvalues: convert (copy)
			local Readable = p6.readable
			
			return if Readable == nil or p7 == nil then Readable or (p6.callback or (p6.node or p6.slot)) else function(Callback)
				-- upvalues: Readable (copy), convert (upval), p7 (copy)
				local CallbackResult = Callback(Readable)
				
				return if CallbackResult == nil then nil else convert(p7, CallbackResult)
			end
		end
		
		local function stack(List)
			-- upvalues: UI (copy)
			local config = { gap = "s", width = "fill" }
			
			for _, value in List do
				config[#config + 1] = value
			end
			return UI.VStack(config, "Content")
		end
		
		local _ = function(p6)
			-- upvalues: stack (copy)
			return function()
				-- upvalues: p6 (copy), stack (upval)
				return if #p6 == 1 then p6[1] else stack(p6)
			end
		end
		
		local function actions(Children, Key)
			-- upvalues: actions (copy), noop (upval)
			local Children1 = if type(Children) == "table" then Children else nil
			
			if Children1 == nil then return end
			for _, value in Children1 do
				local Noops = if type(value) == "table" then value else nil
				
				if Noops ~= nil then
					if Noops.children ~= nil then
						actions(Noops.children, Key)
					elseif not Noops.divider and Noops[Key] == nil then
						Noops[Key] = noop
					end
				end
			end
		end
		
		local Kinds = {}
		
		for i, value in ControlsModule do
			local Content = value.content
			local IsEntry = config[i] == true
			local IsEntry1: boolean = IsEntry or i == "Table"
			local RefineResult = refine(i, (fieldsOf(i, value)))
			Kinds[i] = {
				fields = RefineResult,
				defaults = value.defaults,
				seeds = if value.seeds == nil and Content == nil then nil else seeds(i),
				children = if IsEntry1 then "template" elseif Content == nil then if value.container then "list" else "none" else "slot",
				slot = Content,
				leaf = value.container and value.category ~= "Layout" or nil,
				category = value.category,
				source = if IsEntry1 then "from" else nil,
				template = if IsEntry then "render" else nil,
				key = if IsEntry1 then "key" else nil,
				call = "UI." .. i,
				selectionTarget = if i == "Sheet" or i == "Dialog" or i == "Toast" then VisualTargetModule.resolve else nil,
				build = function(ButtonResults, Entry, Text2)
					-- upvalues: FieldsModule (upval), i (copy), value (copy), convert (copy), copy (upval), RefineResult (copy), Types (copy), CoreModule (upval), config3 (upval), config4 (upval), actions (copy), noop (upval), Content (copy), stack (copy), config1 (upval), IsEntry1 (copy), IsEntry (copy), UI (copy), config (upval), config2 (upval)
					local ButtonResults1 = {}
					local t = {}
					local Control = FieldsModule.controls[i]
					local Fields = if Control then Control.fields else nil
					for i1, default in value.defaults do
						local Field = if Fields then Fields[i1] else nil
						local Datatype = if Field and value.fields[i1] == nil then Field.datatype else nil
						ButtonResults1[i1] = if Datatype == nil then copy(default) else convert(Datatype, default)
					end
					for i2, buttonResult in ButtonResults do
						local RefineResultEntry = RefineResult[i2]
						local Datatype = if RefineResultEntry then RefineResultEntry.datatype else nil
						local Literal = buttonResult.literal
						
						if buttonResult.value ~= nil then
							ButtonResults1[i2] = buttonResult.value
							continue
						end
						if Literal == nil then
							local Readable = buttonResult.readable
							t[i2] = if Readable == nil or Datatype == nil then Readable or (buttonResult.callback or (buttonResult.node or buttonResult.slot)) else function(Callback)
								-- upvalues: Readable (copy), convert (upval), Datatype (copy)
								local CallbackResult = Callback(Readable)
								
								return if CallbackResult == nil then nil else convert(Datatype, CallbackResult)
							end
						else
							ButtonResults1[i2] = if Datatype then convert(Datatype, Literal) else copy(Literal)
						end
					end
					local CellResults = {}
					local State = value.state
					local States = value.states or (if State == nil then {} else { State })
					for _, state in States do
						local Text = ButtonResults1[state]
						
						if i == "ColorPicker" and state == "value" then
							Text = if type(Text) == "string" and string.match(Text, "^#%x%x%x%x%x%x$") then Types.Color3.fromHex(Text) else Text
						elseif i == "DateTimePicker" and state == "value" and ButtonResults1.time == true then
							local Text3 = if type(Text) == "table" then Text else nil
							
							if Text3 ~= nil then
								Text3.hour = Text3.hour or 0
								Text3.minute = Text3.minute or 0
							end
						end
						local CellResult = CoreModule.cell(Text)
						CellResults[state] = CellResult
						ButtonResults1[state] = CellResult
					end
					for i3, field in value.fields do
						if field.format == "color" and CellResults[i3] == nil and ButtonResults1[i3] ~= nil then
							local Text1: string = ButtonResults1[i3]
							ButtonResults1[i3] = if type(Text1) == "string" and string.match(Text1, "^#%x%x%x%x%x%x$") then Types.Color3.fromHex(Text1) else Text1
						end
					end
					local Entry1 = config3[i]
					
					if Entry1 ~= nil then
						local CellResult = CellResults[Entry1.key]
						
						if CellResult ~= nil then
							local Constant = Entry1.constant
							
							ButtonResults1[Entry1.property] = function(p6)
								-- upvalues: CellResult (copy), Constant (copy)
								CellResult:set(if Constant == nil then p6 else Constant)
							end
						end
					end
					local Value = CellResults.value
					
					if i == "Toggle" and ButtonResults1.mixed ~= nil and Value ~= nil then
						function ButtonResults1.onChange(p6)
							-- upvalues: Value (copy)
							Value:set(p6)
						end
					end
					if i == "NumberInput" then
						ButtonResults1.value = CoreModule.cell((tostring(ButtonResults1.numericValue or 0)))
					end
					if i == "Image" or value.nativeSize and (ButtonResults1.width ~= nil or ButtonResults1.height ~= nil) then
						local Width = ButtonResults1.width
						local Height = ButtonResults1.height
						local Height1 = if type(Height) == "number" then Height else 140
						ButtonResults1.Size = if Width == "fill" then Types.UDim2.new(1, 0, 0, Height1) else Types.UDim2.fromOffset(if type(Width) == "number" then Width else 240, Height1)
						ButtonResults1.width = nil
						ButtonResults1.height = nil
					end
					local Entry2 = config4[i]
					
					if Entry2 ~= nil then
						for _, value1 in Entry2 do
							actions(ButtonResults1[value1.list], value1.handler)
						end
					end
					if i == "ComboBox" then
						function ButtonResults1.acceptCustom(p6)
							return true, p6
						end
					end
					if i == "NavBar" then
						ButtonResults1.onBack = noop
					end
					if i == "Skeleton" and ButtonResults1.form ~= "line" then
						ButtonResults1.lines = nil
					end
					if i == "LevelPicker" then
						if ButtonResults1.segment == "image" and ButtonResults1.images == nil then
							ButtonResults1.segment = "glyph"
						end
						ButtonResults1.images = if ButtonResults1.segment == "image" then ButtonResults1.images else nil
						
						if ButtonResults1.segment ~= "glyph" then
							ButtonResults1.glyphs = nil
						end
					end
					if i == "Toast" then
						if ButtonResults.position ~= nil or ButtonResults.width ~= nil or ButtonResults.fade ~= nil then
							ButtonResults1.action = nil
							ButtonResults1.closeButton = nil
						end
						local Action = ButtonResults1.action
						local Action1 = if type(Action) == "table" then Action else nil
						local IsPresented1 = CellResults.isPresented
						
						if Action1 ~= nil and IsPresented1 ~= nil then
							function Action1.onActivate()
								-- upvalues: IsPresented1 (copy)
								IsPresented1:set(false)
							end
						end
					end
					if i == "Card" then
						local PrimaryAction = ButtonResults1.primaryAction
						local PrimaryAction1 = if type(PrimaryAction) == "table" then PrimaryAction else nil
						
						if PrimaryAction1 ~= nil then
							PrimaryAction1.onActivate = noop
						end
						local Menu = ButtonResults1.menu
						local Menu1 = if type(Menu) == "table" then Menu else nil
						
						if Menu1 ~= nil then
							actions(Menu1.items, "onSelect")
						end
					end
					if Content ~= nil then
						local ButtonResult1 = ButtonResults[Content]
						local Slot = if ButtonResult1 == nil then nil else ButtonResult1.slot
						
						if Slot == nil then
							if i ~= "Card" then
								local t1 = {}
								
								ButtonResults1[Content] = function()
									-- upvalues: t1 (copy), stack (upval)
									return if #t1 == 1 then t1[1] else stack(t1)
								end
							end
						else
							ButtonResults1[Content] = Slot
							
							if i == "Card" then
								ButtonResults1.image = nil
							end
						end
					end
					if i == "ErrorBoundary" then
						local t1 = {}
						
						local function Fallback()
							-- upvalues: t1 (copy), stack (upval)
							return if #t1 == 1 then t1[1] else stack(t1)
						end
						
						function ButtonResults1.view()
							-- upvalues: Entry (copy), stack (upval)
							return if #Entry == 1 then Entry[1] else stack(Entry)
						end
						
						ButtonResults1.fallback = Fallback
					end
					local Entry3 = config1[i]
					
					if Entry3 ~= nil then
						local ButtonResult2 = ButtonResults1[Entry3]
						local ButtonResult3 = if type(ButtonResult2) == "table" then ButtonResult2 else nil
						
						if ButtonResult3 ~= nil then
							for i4, value2 in ButtonResult3 do
								local v6 = if type(value2) == "table" then value2 else nil
								local Entry4 = if type(i4) == "number" then Entry[i4] else nil
								
								if v6 ~= nil then
									local T = if Entry4 == nil then {} else { Entry4 }
									
									function v6.content()
										-- upvalues: T (copy), stack (upval)
										return if #T == 1 then T[1] else stack(T)
									end
								end
							end
						end
					end
					if i == "NavigationSplitView" then
						local T1 = if Entry[1] == nil then {} else { Entry[1] }
						
						function ButtonResults1.sidebar()
							-- upvalues: T1 (copy), stack (upval)
							return if #T1 == 1 then T1[1] else stack(T1)
						end
						
						local T2 = if Entry[2] == nil then {} else { Entry[2] }
						
						function ButtonResults1.detail()
							-- upvalues: T2 (copy), stack (upval)
							return if #T2 == 1 then T2[1] else stack(T2)
						end
					end
					if i == "NavigationStack" then
						local Root = ButtonResults1.root
						local Root1 = if type(Root) == "table" then Root else nil
						
						if Root1 ~= nil then
							local T3 = if Entry[1] == nil then {} else { Entry[1] }
							
							function Root1.content()
								-- upvalues: T3 (copy), stack (upval)
								return if #T3 == 1 then T3[1] else stack(T3)
							end
						end
						local Destinations = ButtonResults1.destinations
						local Destinations1 = if type(Destinations) == "table" then Destinations else nil
						
						if Destinations1 ~= nil then
							local List = {}
							
							for i5 in Destinations1 do
								if type(i5) == "string" then
									table.insert(List, i5)
								end
							end
							table.sort(List)
							
							for i6, value3 in List do
								local Destination = Destinations1[value3]
								local Destination1 = if type(Destination) == "table" then Destination else nil
								local Entry5 = Entry[i6 + 1]
								
								if Destination1 ~= nil then
									local T4 = if Entry5 == nil then {} else { Entry5 }
									
									function Destination1.content()
										-- upvalues: T4 (copy), stack (upval)
										return if #T4 == 1 then T4[1] else stack(T4)
									end
								end
							end
						end
					end
					local From = ButtonResults.from
					
					if IsEntry1 and (From ~= nil and From.rows ~= nil) then
						ButtonResults1.from = From.rows
						
						if From.key ~= nil then
							ButtonResults1.key = From.key
						end
					end
					if IsEntry then
						local Render = ButtonResults.render
						local Template = if Render == nil then nil else Render.template
						
						if Template == nil then
							function ButtonResults1.render(p6)
								-- upvalues: UI (upval)
								return UI.Text({
									TextWrapped = true,
									text = function(Callback): string
										-- upvalues: p6 (copy)
										local CallbackResult = Callback(p6)
										
										return (tostring(CallbackResult.label or (CallbackResult.name or (CallbackResult.id or "Item"))))
									end
								}, "RowLabel")
							end
						else
							ButtonResults1.render = Template
						end
					end
					if i == "Menu" and (ButtonResults1.trigger ~= nil or t.trigger ~= nil) and ButtonResults1.label == value.defaults.label then
						ButtonResults1.label = nil
					end
					if i == "Table" then
						local Columns = ButtonResults1.columns
						local Columns1 = if type(Columns) == "table" then Columns else nil
						
						if Columns1 ~= nil then
							for _, value4 in Columns1 do
								local v7 = if type(value4) == "table" then value4 else nil
								
								if v7 ~= nil then
									local Field = v7.field or v7.id
									
									function v7.value(p6)
										-- upvalues: Field (copy)
										return p6[Field]
									end
									
									v7.field = nil
								end
							end
						end
					end
					for i7, value5 in t do
						ButtonResults1[i7] = value5
					end
					if config[i] then
						for _, value6 in Entry do
							ButtonResults1[#ButtonResults1 + 1] = value6
						end
					elseif Content == nil and value.container and not config2[i] then
						for _, value7 in Entry do
							ButtonResults1[#ButtonResults1 + 1] = value7
						end
					end
					local Anchor = value.anchor
					
					if Anchor ~= nil then
						local AnchorLabel = ButtonResults1.anchorLabel or (value.defaults.anchorLabel or "Open")
						ButtonResults1.anchorLabel = nil
						local ButtonResult = ButtonResults[Anchor]
						
						if ButtonResult ~= nil and ButtonResult.node ~= nil then
							ButtonResults1[Anchor] = CoreModule.sample(ButtonResult.node)
						end
						if ButtonResults1[Anchor] == nil then
							local IsPresented = CellResults.isPresented
							local ButtonResult4 = UI.Button({
								label = AnchorLabel,
								onActivate = function()
									-- upvalues: IsPresented (copy)
									if IsPresented ~= nil then
										IsPresented:set(true)
									end
								end
							}, i .. "Anchor")
							ButtonResults1[Anchor] = ButtonResult4
							
							return UI.VStack({ gap = "s", ButtonResult4, UI[i](ButtonResults1, Text2) }, Text2 .. "Host")
						end
					end
					return UI[i](ButtonResults1, Text2)
				end
			}
		end
		local _ = function(p6, Callback)
			-- upvalues: convert (copy), copy (upval)
			return function(List, List1, p7)
				-- upvalues: p6 (copy), convert (upval), copy (upval), Callback (copy)
				local t = {}
				
				for i, value in List do
					local v8 = p6[i]
					local Color = if v8 and v8.type == "color" then "Color3" elseif v8 then v8.datatype else nil
					local Literal = value.literal
					
					if value.value ~= nil then
						t[i] = value.value
					elseif Literal == nil then
						local Readable = value.readable
						t[i] = if Readable == nil or Color == nil then Readable or (value.callback or (value.node or value.slot)) else function(Callback)
							-- upvalues: Readable (copy), convert (upval), Color (copy)
							local CallbackResult = Callback(Readable)
							
							return if CallbackResult == nil then nil else convert(Color, CallbackResult)
						end
					else
						t[i] = if Color then convert(Color, Literal) else copy(Literal)
					end
				end
				for _, value1 in List1 do
					t[#t + 1] = value1
				end
				return Callback(p7, t)
			end
		end
		
		for i1, control in FieldsModule.controls do
			if Kinds[i1] == nil then
				local Fields = control.fields
				
				local function v80(p8, p9)
					-- upvalues: UI (copy), i1 (copy)
					return UI[i1](p9, p8)
				end
				
				Kinds[i1] = {
					category = "More",
					fields = refine(i1, (plainFields(control.fields))),
					children = if control.children then "list" else "none",
					call = "UI." .. i1,
					build = function(List, List1, p8)
						-- upvalues: Fields (copy), convert (copy), copy (upval), v80 (copy)
						local t = {}
						
						for i, value in List do
							local v9 = Fields[i]
							local Color = if v9 and v9.type == "color" then "Color3" elseif v9 then v9.datatype else nil
							local Literal = value.literal
							
							if value.value ~= nil then
								t[i] = value.value
							elseif Literal == nil then
								local Readable = value.readable
								t[i] = if Readable == nil or Color == nil then Readable or (value.callback or (value.node or value.slot)) else function(Callback)
									-- upvalues: Readable (copy), convert (upval), Color (copy)
									local CallbackResult = Callback(Readable)
									
									return if CallbackResult == nil then nil else convert(Color, CallbackResult)
								end
							else
								t[i] = if Color then convert(Color, Literal) else copy(Literal)
							end
						end
						for _, value1 in List1 do
							t[#t + 1] = value1
						end
						return v80(p8, t)
					end
				}
			end
		end
		local HostFunction = p5.host
		
		if HostFunction ~= nil then
			local Copy = table.clone(FieldsModule.host)
			
			for i2, value1 in native3dKinds() do
				Copy[i2] = value1
			end
			for i3, value2 in Copy do
				if Kinds[i3] == nil then
					local Fields1 = value2.fields
					
					local function v84(p8, p9)
						-- upvalues: HostFunction (copy), i3 (copy)
						return HostFunction(i3, p8, p9)
					end
					
					Kinds[i3] = {
						category = "Roblox",
						fields = plainFields(value2.fields),
						children = if value2.children then "list" else "none",
						call = "Host." .. i3,
						build = function(List, List1, p8)
							-- upvalues: Fields1 (copy), convert (copy), copy (upval), v84 (copy)
							local t = {}
							
							for i, value in List do
								local v9 = Fields1[i]
								local Color = if v9 and v9.type == "color" then "Color3" elseif v9 then v9.datatype else nil
								local Literal = value.literal
								
								if value.value ~= nil then
									t[i] = value.value
								elseif Literal == nil then
									local Readable = value.readable
									t[i] = if Readable == nil or Color == nil then Readable or (value.callback or (value.node or value.slot)) else function(Callback)
										-- upvalues: Readable (copy), convert (upval), Color (copy)
										local CallbackResult = Callback(Readable)
										
										return if CallbackResult == nil then nil else convert(Color, CallbackResult)
									end
								else
									t[i] = if Color then convert(Color, Literal) else copy(Literal)
								end
							end
							for _, value1 in List1 do
								t[#t + 1] = value1
							end
							return v84(p8, t)
						end
					}
				end
			end
		end
		local Tokens = p5.tokens
		
		if Tokens ~= nil then
			for _, kind in Kinds do
				for Text, field in kind.fields do
					if field.type == "color" or field.type == "number" or field.type == "datatype" or Text == "width" or Text == "height" or string.match(Text, "[Gg]ap$") or string.match(Text, "[Pp]adding") then
						field.tokens = true
					end
				end
			end
		end
		local Prelude = {
			"local Facet = require(game:GetService(\"ReplicatedStorage\").Facet)"
		}
		
		if Tokens ~= nil then
			table.insert(Prelude, Tokens.require)
		end
		local self = setmetatable({}, { __mode = "k" })
		local ExtendResult = {
			name = "Facet",
			parameter = "UI",
			parameterType = "Facet.Controls",
			readable = "Facet.ReadOnlyValue",
			cell = "Facet.Value",
			newCell = "Facet.Compose.cell",
			show = "Facet.Compose.show",
			keyed = "Facet.Compose.keyed",
			contentKind = "HStack",
			prelude = Prelude,
			token = if Tokens == nil then nil else Tokens.path,
			returnType = if p5.space == "3d" then "Instance" else "GuiObject",
			tags = {
				call = "Facet.tag",
				apply = function(Key, p8)
					-- upvalues: self (copy), StyleTagsModule (upval)
					if typeof(Key) == "Instance" then
						self[Key] = StyleTagsModule(Key, p8, self[Key])
					end
				end
			},
			motion = {
				call = "UI.follow",
				roles = MotionModule.roles,
				animate = if p5.motion then p5.motion.animate else nil
			},
			sequence = {
				call = "UI.sequence",
				toward = "UI.toward",
				build = if p5.motion then p5.motion.sequence else nil
			},
			space = p5.space or "2d",
			containerKind = if p5.space == "3d" then "Model" else nil,
			provide = p5.provide,
			categories = {
				"Layout", "Content", "Input", "Collections", "Navigation", "Overlays",
				"Status", "More", "Roblox"
			},
			kinds = Kinds
		}
		local Designs = p5.designs or {}
		for i4, design in Designs do
			local Fields2 = {}
			local Defaults = {}
			
			for Order, input in design.contract.inputs do
				Fields2[input.id] = {
					type = if input.options == nil then config7[input.type] else "choice",
					options = input.options,
					datatype = if input.type == "color" then "Color3" elseif input.type == "vector3" then "Vector3" else nil,
					luauType = input.luauType,
					order = Order
				}
				
				if input.preview ~= nil then
					Defaults[input.id] = input.preview
				end
			end
			for i5, output in design.contract.outputs do
				Fields2[output.id] = { type = "event", order = #design.contract.inputs + i5 }
			end
			ExtendResult = DesignModule.extend(ExtendResult, {
				kinds = {
					[i4] = {
						children = "none",
						fields = Fields2,
						defaults = Defaults,
						category = design.category or "Game",
						call = design.call,
						build = function(List, _, p8)
							-- upvalues: Fields2 (copy), convert (copy), copy (upval), design (copy), CoreModule (upval), p5 (copy)
							local CellResults = {}
							
							for i, value in List do
								local Field = Fields2[i]
								local Datatype = if Field then Field.datatype else nil
								local Value = nil
								
								if value.value == nil then
									if value.literal == nil then
										local Readable = value.readable
										Value = if Readable == nil or Datatype == nil then Readable or (value.callback or (value.node or value.slot)) else function(Callback)
											-- upvalues: Readable (copy), convert (upval), Datatype (copy)
											local CallbackResult = Callback(Readable)
											
											return if CallbackResult == nil then nil else convert(Datatype, CallbackResult)
										end
									else
										Value = if Datatype then convert(Datatype, value.literal) else copy(value.literal)
									end
								else
									Value = value.value
								end
								CellResults[i] = Value
							end
							for _, input in design.contract.inputs do
								local Entry = List[input.id]
								
								if input.kind ~= "value" and Entry ~= nil and Entry.literal ~= nil then
									CellResults[input.id] = CoreModule.cell(CellResults[input.id])
								end
							end
							return design.build(p5.UI, CellResults, p8)
						end
					}
				},
				prelude = design.prelude
			})
		end
		return if p5.extension == nil then ExtendResult else DesignModule.extend(ExtendResult, p5.extension)
	end,
	controls = ControlsModule,
	seeds = seeds
}