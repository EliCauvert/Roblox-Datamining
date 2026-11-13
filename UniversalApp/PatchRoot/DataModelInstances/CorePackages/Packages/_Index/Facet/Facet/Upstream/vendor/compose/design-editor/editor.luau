local _ = require("./ui")
local CoreModule = require("../core")
local DesignModule = require("../design")
local CanvasModule = require("./canvas")
local DevicesModule = require("./devices")
local LayersModule = require("./layers")
local LibraryPanelModule = require("./library-panel")
local InspectorModule = require("./inspector")
local PromptModule = require("./prompt")
local ThemePanelModule = require("./theme-panel")
local _ = require("./stage")
local _ = require("./stage3d")
local _ = require("./render-preview")

return function(p1, p2)
	-- upvalues: DesignModule (copy), DevicesModule (copy), CanvasModule (copy), CoreModule (copy), LayersModule (copy), PromptModule (copy), LibraryPanelModule (copy), ThemePanelModule (copy), InspectorModule (copy)
	local v1 = require("./theme")(p1)
	local Color = v1.color
	local Size = v1.size
	
	local function chip(p3, p4, p5)
		-- upvalues: v1 (copy), Color (copy), p1 (copy)
		local ButtonResult = v1.button(p3, p4, if p5 then Color.white else Color.text)
		p1.set(ButtonResult, "AutomaticSize", p1.values.enum("AutomaticSize", "X"))
		p1.set(ButtonResult, "Size", p1.values.udim2(0, 0, 0, 30))
		p1.set(ButtonResult, "BackgroundTransparency", if p5 then 0 else 1)
		p1.set(ButtonResult, "FontFace", if p5 then v1.font.bold else v1.font.medium)
		v1.corner(ButtonResult, 6)
		v1.pad(ButtonResult, if p5 then 14 else 10)
		
		return ButtonResult
	end
	
	local function divider(Count)
		-- upvalues: v1 (copy), Color (copy), p1 (copy)
		local Divider = v1.frame("Divider", Color.raised)
		p1.set(Divider, "Size", p1.values.udim2(0, 1, 0, 20))
		p1.set(Divider, "LayoutOrder", Count)
		
		return Divider
	end
	
	local function group(p3, p4, HorizontalAlignment)
		-- upvalues: v1 (copy), p1 (copy), Size (copy)
		local FrameResult = v1.frame(p3)
		p1.set(FrameResult, "AutomaticSize", p1.values.enum("AutomaticSize", "X"))
		p1.set(FrameResult, "Size", p1.values.udim2(0, 0, 0, Size.toolbar / 2))
		p1.set(FrameResult, "LayoutOrder", p4)
		p1.set(v1.list(FrameResult, p1.values.enum("FillDirection", "Horizontal"), 2, p1.values.enum("VerticalAlignment", "Center")), "HorizontalAlignment", HorizontalAlignment)
		
		return FrameResult
	end
	
	return function(p3, p4, p5, p6)
		-- upvalues: DesignModule (upval), p1 (copy), v1 (copy), Color (copy), Size (copy), group (copy), DevicesModule (upval), CanvasModule (upval), CoreModule (upval), p2 (copy), LayersModule (upval), PromptModule (upval), LibraryPanelModule (upval), ThemePanelModule (upval), InspectorModule (upval), chip (copy), divider (copy)
		local SlotSamples = p6.slotSamples or {}
		for slotSample in SlotSamples do
			local InputResult = DesignModule.document.input(p4, slotSample)
			assert(InputResult and InputResult.type == "slot", "Unknown slot sample: " .. slotSample .. "; declare a slot input")
		end
		local t = {}
		local config = {
			OpenDesign = true,
			Device = true,
			AllDevices = true,
			ActualSize = true,
			Camera = true,
			Undo = true,
			Redo = true,
			Duplicate = true,
			Delete = true,
			TextSize = true,
			Close = true,
			Theme = p6.theme ~= nil,
			Export = p6.onExport ~= nil,
			Capture = p6.capture ~= nil
		}
		local Previews = p6.previews or {}
		for _, preview in Previews do
			assert(preview.name ~= "" and not t[preview.name], "Preview names must be nonempty and unique")
			assert(not config[preview.name], "Preview name conflicts with an editor control: " .. preview.name)
			t[preview.name] = true
			assert(#preview.choices > 0, "Preview requires choices")
			local t1 = {}
			
			for _, choice in preview.choices do
				assert(choice ~= "" and not t1[choice], "Preview choices must be nonempty and unique")
				t1[choice] = true
			end
			assert(t1[preview.initial or preview.choices[1]], "Unknown initial Preview choice")
		end
		local Previews1 = p6.previews or {}
		for _, preview1 in Previews1 do
			preview1.select(preview1.initial or preview1.choices[1])
		end
		local GetAttribute: number = p1.call(p5, "GetAttribute", "ComposeDesignTextSize")
		local ClampedValue: number = if type(GetAttribute) == "number" and GetAttribute == GetAttribute then math.clamp(GetAttribute, 15, 19) else 15
		p1.setTextSize(ClampedValue)
		local SessionResult = DesignModule.session(p3, p4)
		local ComposeDesign = v1.frame("ComposeDesign", Color.canvas)
		
		if p6.scene and p3.space == "3d" then
			p1.set(ComposeDesign, "BackgroundTransparency", 1)
		end
		p1.set(ComposeDesign, "Size", p1.values.udim2(1, 0, 1, 0))
		local Toolbar = v1.frame("Toolbar", Color.panel)
		v1.place(Toolbar, ComposeDesign, p1.values.udim2(1, 0, 0, Size.toolbar))
		local Rule = v1.frame("Rule", Color.divider)
		p1.set(Rule, "AnchorPoint", p1.values.vector2(0, 1))
		v1.place(Rule, Toolbar, p1.values.udim2(1, 0, 0, 1), p1.values.udim2(0, 0, 1, 0))
		local Insert = group("Insert", 1, p1.values.enum("HorizontalAlignment", "Left"))
		p1.set(Insert, "Position", p1.values.udim2(0, Size.gutter, 0, Size.toolbar / 2))
		p1.set(Insert, "Parent", Toolbar)
		local v2 = v1.label("◆", Color.accent, 18, v1.font.bold)
		p1.set(v2, "Name", "Brand")
		p1.set(v2, "Size", p1.values.udim2(0, 24, 0, 30))
		p1.set(v2, "TextXAlignment", p1.values.enum("TextXAlignment", "Center"))
		p1.set(v2, "LayoutOrder", 0)
		p1.set(v2, "Parent", Insert)
		local Actions = group("Actions", 3, p1.values.enum("HorizontalAlignment", "Right"))
		p1.set(Actions, "AnchorPoint", p1.values.vector2(1, 0))
		p1.set(Actions, "Position", p1.values.udim2(1, -Size.gutter, 0, 0))
		p1.set(Actions, "Parent", Toolbar)
		
		local function side(p7, p8, p9: number)
			-- upvalues: v1 (upval), Color (upval), p1 (upval), Size (upval), ComposeDesign (copy)
			local FrameResult = v1.frame(p7, Color.panel)
			p1.set(FrameResult, "AnchorPoint", p1.values.vector2(p9, 0))
			p1.set(FrameResult, "Position", p1.values.udim2(p9, 0, 0, Size.toolbar))
			v1.place(FrameResult, ComposeDesign, p1.values.udim2(0, Size.side, 1, -Size.toolbar - Size.status))
			local Rule = v1.frame("Rule", Color.divider)
			p1.set(Rule, "AnchorPoint", p1.values.vector2(1 - p9, 0))
			v1.place(Rule, FrameResult, p1.values.udim2(0, 1, 1, 0), p1.values.udim2(1 - p9, 0, 0, 0))
			local LabelResult = v1.label(p8, Color.text, Size.small, v1.font.bold)
			p1.set(LabelResult, "Name", "Caption")
			p1.set(LabelResult, "Position", p1.values.udim2(0, Size.gutter + 4, 0, 0))
			v1.place(LabelResult, FrameResult, p1.values.udim2(1, -2 * Size.gutter, 0, Size.header))
			local Body = v1.frame("Body")
			v1.place(Body, FrameResult, p1.values.udim2(1, -1, 1, -Size.header), p1.values.udim2(0, 0, 0, Size.header))
			
			return FrameResult, Body
		end
		
		local LibraryPanel, LibraryPanel2 = side("LibraryPanel", "Library", 0)
		p1.set(LibraryPanel, "Size", p1.values.udim2(0, Size.side, 0.45, -Size.toolbar))
		local LayersPanel, LayersPanel2 = side("LayersPanel", "Layers", 0)
		p1.set(LayersPanel, "Position", p1.values.udim2(0, 0, 0.45, 0))
		p1.set(LayersPanel, "Size", p1.values.udim2(0, Size.side, 0.55, -Size.status))
		local _, InspectorPanel2 = side("InspectorPanel", "Design", 1)
		local StagePanel = v1.frame("StagePanel", Color.canvas)
		
		if p6.scene and p3.space == "3d" then
			p1.set(StagePanel, "BackgroundTransparency", 1)
		end
		p1.set(StagePanel, "Position", p1.values.udim2(0, Size.side, 0, Size.toolbar))
		p1.set(StagePanel, "Size", p1.values.udim2(1, -2 * Size.side, 1, -Size.toolbar - Size.status))
		p1.set(StagePanel, "ClipsDescendants", true)
		p1.set(StagePanel, "Parent", ComposeDesign)
		local StatusBar = v1.frame("StatusBar", Color.panel)
		p1.set(StatusBar, "AnchorPoint", p1.values.vector2(0, 1))
		v1.place(StatusBar, ComposeDesign, p1.values.udim2(1, 0, 0, Size.status), p1.values.udim2(0, 0, 1, 0))
		v1.place(v1.frame("Rule", Color.divider), StatusBar, p1.values.udim2(1, 0, 0, 1))
		local LabelResult = v1.label("", Color.tertiary, Size.small)
		p1.set(LabelResult, "Name", "Problem")
		p1.set(LabelResult, "Position", p1.values.udim2(0, Size.gutter, 0, 0))
		p1.set(LabelResult, "Size", p1.values.udim2(0.5, -Size.gutter - 40, 1, 0))
		p1.set(LabelResult, "TextTruncate", p1.values.enum("TextTruncate", "AtEnd"))
		p1.set(LabelResult, "Parent", StatusBar)
		local Zoom = v1.button("Zoom", "", Color.secondary, Size.small)
		p1.set(Zoom, "AnchorPoint", p1.values.vector2(0.5, 0))
		p1.set(Zoom, "Position", p1.values.udim2(0.5, 0, 0, 0))
		p1.set(Zoom, "Size", p1.values.udim2(0, 64, 0, Size.status))
		p1.set(Zoom, "FontFace", v1.font.bold)
		p1.set(Zoom, "Parent", StatusBar)
		local LabelResult1 = v1.label("", Color.text, Size.small, v1.font.bold)
		p1.set(LabelResult1, "Name", "DocumentTitle")
		p1.set(LabelResult1, "AnchorPoint", p1.values.vector2(1, 0))
		p1.set(LabelResult1, "Position", p1.values.udim2(1, -Size.gutter, 0, 0))
		p1.set(LabelResult1, "Size", p1.values.udim2(0.25, 0, 1, 0))
		p1.set(LabelResult1, "TextXAlignment", p1.values.enum("TextXAlignment", "Right"))
		p1.set(LabelResult1, "RichText", true)
		p1.set(LabelResult1, "Parent", StatusBar)
		local Sync = v1.button("Sync", "", nil, Size.small)
		p1.set(Sync, "AnchorPoint", p1.values.vector2(0, 0))
		p1.set(Sync, "Position", p1.values.udim2(0.5, 40, 0, 0))
		p1.set(Sync, "Size", p1.values.udim2(0, 160, 0, Size.status))
		p1.set(Sync, "FontFace", v1.font.bold)
		p1.set(Sync, "Parent", StatusBar)
		p1.set(ComposeDesign, "Parent", p5)
		local List = if p3.space == "3d" then {
			DevicesModule.custom("Scene", p6.stageSize or { X = 1280, Y = 720 })
		} else p6.devices or (if p6.stageSize then { DevicesModule.custom("Canvas", p6.stageSize) } else DevicesModule.all)
		local config1 = {
			renderPreview = p6.renderPreview,
			scene = p6.scene,
			devices = List,
			device = p6.device,
			frame = p6.frame,
			bindings = p6.bindings,
			outputs = p6.outputs,
			backdrop = p6.backdrop,
			token = p6.token,
			resolveToken = p6.resolveToken,
			slots = p6.slots,
			slotSamples = p6.slotSamples
		}
		local CanvasModuleResult = CanvasModule(p1, SessionResult, StagePanel, config1)
		local t2 = {}
		local Tbl1 = {}
		local t1 = {}
		local Label = {}
		local Callback = nil
		local v3 = nil
		local InputContext = p1.new("InputContext")
		local v4 = nil
		local Activated = nil
		
		local function closeDesign()
			-- upvalues: p1 (upval), InputContext (copy), v3 (ref), Activated (ref), v4 (ref)
			p1.set(InputContext, "Enabled", true)
			
			if v3 then
				v3.dispose()
				v3 = nil
			end
			if Activated then
				Activated:Disconnect()
				Activated = nil
			end
			if v4 then
				p1.destroy(v4)
				v4 = nil
			end
		end
		
		local config11 = {
			Read = function() end,
			Fit = CanvasModuleResult.fit,
			Undo = SessionResult.undo,
			Redo = SessionResult.redo,
			Duplicate = SessionResult.duplicate,
			Delete = SessionResult.remove,
			Copy = SessionResult.copy,
			Paste = SessionResult.paste,
			Wrap = SessionResult.wrap,
			Unwrap = SessionResult.unwrap,
			CloseDesign = closeDesign,
			OpenDesign = function()
				-- upvalues: DesignModule (upval), SessionResult (copy), p3 (copy), p1 (upval), InputContext (copy), v3 (ref), Activated (ref), v4 (ref), v1 (upval), Color (upval), ComposeDesign (copy), closeDesign (copy), CoreModule (upval), p6 (copy), p2 (upval)
				local SelectAnImportedDesign = assert(assert(p3.kinds[assert((DesignModule.document.find(SessionResult.document:peek().root, SessionResult.selected:peek()))).kind]).design, "Select an imported Design")
				local ThisImportedDesignIsReadOnly = assert(SelectAnImportedDesign.save, "This imported Design is read-only")
				local ParseResult = DesignModule.parse(SelectAnImportedDesign.source:peek(), SelectAnImportedDesign.library)
				p1.set(InputContext, "Enabled", true)
				
				if v3 then
					v3.dispose()
					v3 = nil
				end
				if Activated then
					Activated:Disconnect()
					Activated = nil
				end
				if v4 then
					p1.destroy(v4)
					v4 = nil
				end
				local NestedDesign = v1.frame("NestedDesign", Color.canvas)
				v4 = NestedDesign
				v1.place(NestedDesign, ComposeDesign, p1.values.udim2(1, 0, 1, 0))
				p1.set(NestedDesign, "Active", true)
				p1.set(NestedDesign, "ZIndex", 40)
				local BackToAssembly = v1.button("BackToAssembly", "Back to " .. SessionResult.document:peek().name)
				v1.place(BackToAssembly, NestedDesign, p1.values.udim2(1, 0, 0, 32))
				Activated = p1.connect(BackToAssembly, "Activated", closeDesign)
				local NestedEditor = v1.frame("NestedEditor", Color.canvas)
				v1.place(NestedEditor, NestedDesign, p1.values.udim2(1, 0, 1, -32), p1.values.udim2(0, 0, 0, 32))
				local Success, Result = pcall(p2, SelectAnImportedDesign.library, ParseResult, NestedEditor, {
					runtime = p1.runtime,
					link = {
						read = function()
							-- upvalues: SelectAnImportedDesign (copy)
							return SelectAnImportedDesign.source:peek()
						end,
						write = ThisImportedDesignIsReadOnly,
						watch = function(Callback)
							-- upvalues: SelectAnImportedDesign (copy), CoreModule (upval), p1 (upval)
							local PeekResult = SelectAnImportedDesign.source:peek()
							
							return CoreModule.createRootOwner(function()
								-- upvalues: CoreModule (upval), SelectAnImportedDesign (upval), PeekResult (ref), Callback (copy)
								CoreModule.watch(function(Callback1)
									-- upvalues: SelectAnImportedDesign (upval), PeekResult (upval), Callback (upval)
									local CallbackResult = Callback1(SelectAnImportedDesign.source)
									
									if CallbackResult ~= PeekResult then
										PeekResult = CallbackResult
										Callback()
									end
								end)
							end, p1.runtime.reactor).dispose
						end
					},
					token = p6.token,
					resolveToken = p6.resolveToken,
					tokens = p6.tokens,
					stageSize = p6.stageSize or { X = 1280, Y = 720 }
				})
				
				if not Success then
					p1.set(InputContext, "Enabled", true)
					
					if v3 then
						v3.dispose()
						v3 = nil
					end
					if Activated then
						Activated:Disconnect()
						Activated = nil
					end
					if v4 then
						p1.destroy(v4)
						v4 = nil
					end
					error(Result, 0)
				end
				v3 = Result
				p1.set(InputContext, "Enabled", false)
			end
		}
		local Tbl = nil
		
		local function execute(Vector)
			-- upvalues: Tbl (ref), SessionResult (copy), config11 (copy), p6 (copy), CanvasModuleResult (copy), DesignModule (upval), p3 (copy), t2 (copy), Label (copy), List (copy), t1 (copy), Tbl1 (copy), ClampedValue (ref), Callback (ref)
			if Tbl then
				local Copy = table.clone(Tbl)
				Copy.action = Vector.action
				Copy.ok = Vector.action == "Read" or Vector.action == "Close"
				Copy.problem = if Copy.ok then nil else "Editor is closed; open the Design again"
				Copy.next = if Copy.ok then nil else "Open the Design again"
				
				return Copy
			end
			local EmitResult = nil
			local Files = {}
			
			if Vector.action ~= "Read" then
				SessionResult.problem:set(nil)
			end
			local Success, Result = pcall(function()
				-- upvalues: config11 (upval), Vector (copy), p6 (upval), Files (ref), CanvasModuleResult (upval), DesignModule (upval), SessionResult (upval), EmitResult (ref), p3 (upval), t2 (upval), Label (upval)
				local Entry: () -> () = config11[Vector.action]
				
				if Vector.action == "Close" then
					assert(p6.onClose, "Close requires a host close handler")
					
					return
				end
				if Vector.action == "Capture" then
					assert(string.match(Vector.name, "%S"), "Capture requires a nonempty name")
					Files = table.clone(assert(p6.capture, "Capture requires a host capture callback")(Vector.name, CanvasModuleResult.current()))
					
					return
				end
				if Entry then
					Entry()
					
					return
				end
				if Vector.action == "Camera" then
					assert(CanvasModuleResult.current().scene, "Open a 3D Design before Camera").setCamera(Vector.preset)
					
					return
				end
				if Vector.action == "Orbit" then
					assert(CanvasModuleResult.current().scene, "Open a 3D Design before Orbit").orbit(Vector.yaw, Vector.pitch)
					
					return
				end
				if Vector.action == "Zoom" then
					assert(Vector.scale > 0 and Vector.scale < 1e999, "Zoom requires a finite positive scale")
					CanvasModuleResult.zoomTo(Vector.scale, Vector.around)
					
					return
				end
				if Vector.action == "Select" then
					for _, id in Vector.ids do
						assert(DesignModule.document.find(SessionResult.document:peek().root, id), "Unknown Design node: " .. id)
					end
					SessionResult.selectMany(Vector.ids)
					
					return
				elseif Vector.action == "Change" then
					SessionResult.change(Vector.field, Vector.value)
					
					return
				else
					if Vector.action == "ChangeMany" then
						SessionResult.changeMany(Vector.changes)
						
						return
					end
					if Vector.action == "Rename" then
						SessionResult.rename(Vector.name)
						
						return
					end
					if Vector.action == "Tag" then
						SessionResult.tag(Vector.tags)
						
						return
					end
					if Vector.action == "Content" then
						SessionResult.content(Vector.field, Vector.kind)
						
						return
					end
					if Vector.action == "Bind" then
						SessionResult.bind(Vector.binding)
						
						return
					end
					if Vector.action == "Move" then
						SessionResult.move(Vector.id, Vector.destination, Vector.before)
						
						return
					end
					if Vector.action == "Shift" then
						SessionResult.shift(Vector.step)
						
						return
					end
					if Vector.action == "Hide" then
						SessionResult.hide(Vector.id, Vector.hidden)
						
						return
					end
					if Vector.action == "Lock" then
						SessionResult.lock(Vector.id, Vector.locked)
						
						return
					end
					if Vector.action == "Contract" then
						SessionResult.setContract(Vector.contract)
						
						return
					end
					if Vector.action == "Replace" then
						SessionResult.replace(Vector.document)
						
						return
					end
					if Vector.action == "SelectRelative" then
						SessionResult.selectRelative(Vector.direction)
						
						return
					end
					if Vector.action == "ActualSize" then
						CanvasModuleResult.actualSize(Vector.enabled)
						
						return
					end
					if Vector.action == "Pan" then
						assert(CanvasModuleResult.current().stage or CanvasModuleResult.current().scene).pan({ X = Vector.x, Y = Vector.y })
						
						return
					end
					if Vector.action == "Play" then
						assert(CanvasModuleResult.current().stage or CanvasModuleResult.current().scene).play(Vector.sequence)
						
						return
					end
					if Vector.action == "Guides" then
						assert(CanvasModuleResult.current().scene, "Guides requires a 3D Design").guides(Vector.enabled)
						
						return
					end
					if Vector.action == "Export" then
						EmitResult = DesignModule.emit(SessionResult.document:peek(), p3)
						
						if p6.onExport then
							p6.onExport(EmitResult)
							
							return
						end
					elseif Vector.action == "Insert" then
						SessionResult.insert(Vector.kind)
						
						return
					else
						if Vector.action == "Device" then
							CanvasModuleResult.select(Vector.id)
							
							return
						end
						if Vector.action == "AllDevices" then
							CanvasModuleResult.showAll(Vector.enabled)
							
							return
						end
						if Vector.action == "Preview" then
							assert(t2[Vector.name], "Unknown Preview; Read lists available previews")(Vector.choice)
							
							return
						end
						if Label[Vector.action] then
							Label[Vector.action](Vector)
							
							return
						end
						error("Unknown editor action; use Read")
					end
				end
			end)
			local PeekResult = if Success then SessionResult.problem:peek() else tostring(Result)
			local IsRead: boolean = Success and (Vector.action == "Read" or PeekResult == nil)
			
			if not IsRead then
				SessionResult.problem:set(PeekResult)
			end
			local Devices = {}
			
			for _, value in List do
				table.insert(Devices, value.id)
			end
			local PreviewChoices = {}
			
			for i, value1 in t1 do
				PreviewChoices[i] = table.clone(value1)
			end
			local Scene = CanvasModuleResult.current().scene
			local Identity = p6.identity
			local config = {
				closed = false,
				ok = IsRead,
				action = Vector.action,
				design = SessionResult.document:peek().name,
				target = if Identity then Identity.path else SessionResult.document:peek().name,
				commit = if Identity then Identity.commit else nil,
				path = if Identity then Identity.path else nil,
				files = Files,
				selection = table.clone(SessionResult.selection:peek()),
				device = CanvasModuleResult.device:peek().id,
				previews = table.clone(Tbl1),
				previewChoices = PreviewChoices,
				devices = Devices,
				allDevices = CanvasModuleResult.all:peek(),
				actualSize = CanvasModuleResult.current().actualSize:peek(),
				zoom = CanvasModuleResult.zoom:peek(),
				textSize = ClampedValue,
				source = EmitResult,
				prompt = if Callback then Callback() else nil,
				camera = if Scene then Scene.readCamera() else nil,
				problem = PeekResult,
				next = if IsRead then nil else "execute({ action = \"Read\" })"
			}
			
			if IsRead and Vector.action == "Close" then
				config.closed = true
				Tbl = config
				local Success1, Result1 = pcall(assert(p6.onClose))
				
				if not Success1 then
					config.ok = false
					config.problem = tostring(Result1)
					config.next = "Check the host close handler"
				end
			end
			return config
		end
		
		local v5 = LayersModule(p1)(SessionResult, LayersPanel2)
		local NewPrompt = if p6.prompt then PromptModule.create(p1, SessionResult, CanvasModuleResult, StagePanel, p6.prompt, function(p7, p8, p9)
			-- upvalues: CoreModule (upval), p1 (upval), DesignModule (upval), p3 (copy), config1 (copy), CanvasModule (upval)
			return CoreModule.withOwner(p1.owner, function()
				-- upvalues: DesignModule (upval), p3 (upval), p7 (copy), config1 (upval), p8 (copy), CanvasModule (upval), p1 (upval), p9 (copy)
				local SessionResult = DesignModule.session(p3, DesignModule.parse(p7, p3))
				SessionResult.selectMany({})
				local Copy = table.clone(config1)
				Copy.devices = { p8 }
				Copy.device = p8.id
				Copy.readOnly = true
				
				return CanvasModule(p1, SessionResult, p9, Copy).dispose
			end)
		end) else nil
		
		if NewPrompt then
			Callback = NewPrompt.read
			
			function Label.Prompt(p7)
				-- upvalues: NewPrompt (copy)
				assert(p7.action == "Prompt")
				NewPrompt.submit(p7.text, p7.count, p7.theme)
			end
			
			function Label.ChooseDraft(p7)
				-- upvalues: NewPrompt (copy)
				assert(p7.action == "ChooseDraft")
				NewPrompt.choose(p7.index)
			end
			
			Label.DiscardDrafts = NewPrompt.discard
		end
		local v6 = LibraryPanelModule(p1)(SessionResult, LibraryPanel2)
		local NewThemePanel = if p6.theme then ThemePanelModule.create(p1, LibraryPanel2, p6.theme) else nil
		
		function Label.Theme(p7)
			-- upvalues: p1 (upval), NewThemePanel (copy), v6 (copy)
			assert(p7.action == "Theme")
			p1.set(assert(NewThemePanel, "Theme requires a theme store").root, "Visible", p7.opened)
			p1.set(v6.root, "Visible", not p7.opened)
		end
		
		function Label.ThemeValue(p7)
			-- upvalues: NewThemePanel (copy)
			assert(p7.action == "ThemeValue")
			assert(NewThemePanel, "ThemeValue requires a theme store").write(p7.id, p7.value)
		end
		
		local v7 = InspectorModule(p1)(SessionResult, InspectorPanel2, {
			tokens = p6.tokens,
			play = function(Sequence)
				-- upvalues: execute (copy)
				execute({ action = "Play", sequence = Sequence })
			end,
			measure = function(p7, p8)
				-- upvalues: CanvasModuleResult (copy), p1 (upval)
				local Stage = CanvasModuleResult.current().stage
				local Node = if Stage then Stage.nodes[p7] else nil
				
				if Node == nil then
					return nil
				else
					local PeekResult = CanvasModuleResult.zoom:peek()
					
					return if p8 == "width" then p1.xy(Node, "AbsoluteSize").X / PeekResult elseif p8 == "height" then p1.xy(Node, "AbsoluteSize").Y / PeekResult else nil
				end
			end
		})
		local List1 = {}
		
		local function action(Key, Name, Count, Actions, p7, Callback)
			-- upvalues: chip (upval), p1 (upval), Color (upval), v1 (upval), List1 (copy)
			local ChipResult = chip(Key, Name, p7)
			p1.set(ChipResult, "LayoutOrder", Count)
			local Accent = if p7 then Color.accent else Color.panel
			local RgbResult = if p7 then p1.rgb(56, 172, 255) else Color.hover
			p1.set(ChipResult, "BackgroundColor3", Accent)
			local HoverFunction = v1.hover
			local v8: number = if p7 then 0 else 1
			for _, value in HoverFunction(ChipResult, Accent, RgbResult, v8) do
				table.insert(List1, value)
			end
			table.insert(List1, p1.connect(ChipResult, "Activated", function()
				-- upvalues: Callback (copy)
				Callback()
			end))
			p1.set(ChipResult, "Parent", Actions)
			
			return ChipResult
		end
		
		local Count = 10
		local OpenDesign = action("OpenDesign", "Edit Design", 9, Insert, false, function()
			-- upvalues: execute (copy)
			execute({ action = "OpenDesign" })
		end)
		
		local function cycling(Name, List, Initial, Callback)
			-- upvalues: Tbl1 (copy), t1 (copy), t2 (copy), p1 (upval), action (copy), Count (ref), Insert (copy), execute (copy)
			if #List ~= 0 then
				Tbl1[Name] = Initial or List[1]
				t1[Name] = table.clone(List)
				local v9 = nil
				
				t2[Name] = function(Value)
					-- upvalues: List (copy), Name (copy), Callback (copy), Tbl1 (upval), p1 (upval), v9 (ref)
					assert(table.find(List, Value), "Unknown choice for " .. Name .. "; Read returns current previews")
					Callback(Value)
					Tbl1[Name] = Value
					p1.set(assert(v9), "Text", Value)
				end
				
				v9 = action(Name, Tbl1[Name], Count, Insert, false, function()
					-- upvalues: List (copy), Tbl1 (upval), Name (copy), execute (upval)
					execute({
						action = "Preview",
						name = Name,
						choice = List[(table.find(List, Tbl1[Name]) or 1) % #List + 1]
					})
				end)
				Count += 1
				
				return
			end
		end
		
		local Device = nil
		local AllDevices = nil
		local ActualSize = nil
		local Camera = nil
		local Scene = CanvasModuleResult.current().scene
		
		if Scene then
			local list = {
				"fit",
				"eye-height",
				"approach-20",
				"close-up",
				"top-down"
			}
			Camera = action("Camera", "Camera", Count, Insert, false, function()
				-- upvalues: list (copy), Scene (copy), execute (copy)
				local v9 = 1
				
				for i, value in list do
					if value == Scene.preset:peek() then
						v9 = i
						break
					end
				end
				execute({ action = "Camera", preset = list[v9 % #list + 1] })
			end)
			Count += 1
		end
		if #List > 1 then
			p1.set(divider(Count), "Parent", Insert)
			Count += 1
			Device = action("Device", CanvasModuleResult.current().device.name, Count, Insert, false, function()
				-- upvalues: List (copy), CanvasModuleResult (copy), execute (copy)
				execute({
					action = "Device",
					id = List[(table.find(List, CanvasModuleResult.device:peek()) or 1) % #List + 1].id
				})
			end)
			Count += 1
			AllDevices = action("AllDevices", "All devices", Count, Insert, false, function()
				-- upvalues: execute (copy), CanvasModuleResult (copy)
				execute({
					action = "AllDevices",
					enabled = not CanvasModuleResult.all:peek()
				})
			end)
			Count += 1
		end
		if p3.space ~= "3d" then
			ActualSize = action("ActualSize", "Actual size", Count, Insert, false, function()
				-- upvalues: execute (copy), CanvasModuleResult (copy)
				execute({
					action = "ActualSize",
					enabled = not CanvasModuleResult.current().actualSize:peek()
				})
			end)
			Count += 1
		end
		local Previews2 = p6.previews
		
		if Previews2 then
			for _, value in Previews2 do
				cycling(value.name, value.choices, value.initial, value.select)
			end
		end
		local Undo = action("Undo", "Undo", 1, Actions, false, SessionResult.undo)
		local Redo = action("Redo", "Redo", 2, Actions, false, SessionResult.redo)
		
		if p6.capture then
			local _ = action("Capture", "Capture", 10, Actions, false, function()
				-- upvalues: execute (copy), SessionResult (copy)
				execute({
					action = "Capture",
					name = SessionResult.document:peek().name
				})
			end)
		end
		local _ = action("Close", "Close", 11, Actions, false, function()
			-- upvalues: execute (copy)
			execute({ action = "Close" })
		end)
		p1.set(divider(3), "Parent", Actions)
		local _ = action("Duplicate", "Duplicate", 4, Actions, false, SessionResult.duplicate)
		local _ = action("Delete", "Delete", 5, Actions, false, SessionResult.remove)
		local TextSize = nil
		
		if NewThemePanel then
			local _ = action("Theme", "Theme", 9, Actions, false, function()
				-- upvalues: execute (copy), p1 (upval), NewThemePanel (copy)
				execute({
					action = "Theme",
					opened = p1.get(NewThemePanel.root, "Visible") ~= true
				})
			end)
		end
		function Label.TextSize(p8)
			-- upvalues: p6 (copy), p5 (copy), ClampedValue (ref), p1 (upval), TextSize (ref)
			assert(p8.action == "TextSize")
			local Size = p8.size
			assert(Size == 15 or (Size == 17 or Size == 19), "TextSize requires 15, 17 or 19")
			local ComposeDesignTextSize, ComposeDesignTextSize2 = assert(p6.runtime.host.render.setAttribute, "Design text size requires host attributes")(p5, "ComposeDesignTextSize", Size)
			assert(ComposeDesignTextSize, ComposeDesignTextSize2)
			ClampedValue = Size
			p1.setTextSize(Size)
			p1.set(assert(TextSize), "Text", `Text {Size}`)
		end
		
		TextSize = action("TextSize", `Text {ClampedValue}`, 8, Actions, false, function()
			-- upvalues: execute (copy), ClampedValue (ref)
			execute({
				action = "TextSize",
				size = if ClampedValue < 17 then 17 elseif ClampedValue < 19 then 19 else 15
			})
		end)
		
		if p6.onExport then
			local Spacer = v1.frame("Spacer")
			p1.set(Spacer, "Size", p1.values.udim2(0, 6, 0, 1))
			p1.set(Spacer, "LayoutOrder", 6)
			p1.set(Spacer, "Parent", Actions)
			local _ = action("Export", "Export", 7, Actions, true, function()
				-- upvalues: execute (copy)
				execute({ action = "Export" })
			end)
		end
		p1.set(InputContext, "Name", "ComposeDesignShortcuts")
		p1.set(InputContext, "Sink", true)
		
		local function bind(p8, Callback, G)
			-- upvalues: p1 (upval), List1 (copy), v3 (ref), InputContext (copy)
			local InputAction = p1.new("InputAction")
			p1.set(InputAction, "Name", p8)
			
			for _, value in G do
				local InputBinding = p1.new("InputBinding")
				p1.set(InputBinding, "KeyCode", value[1])
				
				if value[2] then
					p1.set(InputBinding, "PrimaryModifier", value[2])
				end
				if value[3] then
					p1.set(InputBinding, "SecondaryModifier", value[3])
				end
				p1.set(InputBinding, "Parent", InputAction)
			end
			table.insert(List1, p1.connect(InputAction, "Pressed", function()
				-- upvalues: p1 (upval), v3 (upval), Callback (copy)
				local OptionalNodeResult = p1.optionalNode(p1.call(p1.service("UserInputService"), "GetFocusedTextBox"))
				
				if v3 == nil and not OptionalNodeResult then
					Callback()
				end
			end))
			p1.set(InputAction, "Parent", InputContext)
		end
		
		bind("Delete", SessionResult.remove, {
			{ p1.values.enum("KeyCode", "Delete") },
			{ p1.values.enum("KeyCode", "Backspace") }
		})
		
		local function command(p9, p10)
			-- upvalues: p1 (upval)
			local List = {}
			
			for _, value in {
				"LeftControl", "RightControl", "LeftMeta", "RightMeta", "LeftSuper",
				"RightSuper"
			} do
				local KeyCodes = {
					p1.values.enum("KeyCode", p9),
					p1.values.enum("KeyCode", value)
				}
				
				if p10 then
					table.insert(KeyCodes, p1.values.enum("KeyCode", "LeftShift"))
					table.insert(List, {
						p1.values.enum("KeyCode", p9),
						p1.values.enum("KeyCode", value),
						p1.values.enum("KeyCode", "RightShift")
					})
				end
				table.insert(List, KeyCodes)
			end
			return List
		end
		
		bind("Duplicate", SessionResult.duplicate, (command("D")))
		bind("Undo", SessionResult.undo, (command("Z")))
		bind("Copy", SessionResult.copy, (command("C")))
		bind("Paste", SessionResult.paste, (command("V")))
		bind("Wrap", function()
			-- upvalues: p1 (upval), SessionResult (copy)
			if not p1.keyDown({ "LeftShift", "RightShift" }) then
				SessionResult.wrap()
			end
		end, (command("G")))
		bind("Unwrap", SessionResult.unwrap, (command("G", true)))
		bind("MoveUp", function()
			-- upvalues: SessionResult (copy)
			SessionResult.shift(-1)
		end, {
			{
				p1.values.enum("KeyCode", "Up"),
				p1.values.enum("KeyCode", "LeftAlt")
			}
		})
		bind("MoveDown", function()
			-- upvalues: SessionResult (copy)
			SessionResult.shift(1)
		end, {
			{
				p1.values.enum("KeyCode", "Down"),
				p1.values.enum("KeyCode", "LeftAlt")
			}
		})
		local Z = command("Z", true)
		table.insert(Z, {
			p1.values.enum("KeyCode", "Y"),
			p1.values.enum("KeyCode", "LeftControl")
		})
		bind("Redo", SessionResult.redo, Z)
		bind("Fit", CanvasModuleResult.fit, {
			{
				p1.values.enum("KeyCode", "One"),
				p1.values.enum("KeyCode", "LeftShift")
			}
		})
		bind("Actual", function()
			-- upvalues: execute (copy)
			execute({ action = "ActualSize", enabled = true })
		end, {
			{
				p1.values.enum("KeyCode", "Zero"),
				p1.values.enum("KeyCode", "LeftShift")
			}
		})
		bind("ZoomIn", function()
			-- upvalues: CanvasModuleResult (copy)
			CanvasModuleResult.zoomTo(CanvasModuleResult.zoom:peek() * 1.25)
		end, (command("Equals")))
		bind("ZoomOut", function()
			-- upvalues: CanvasModuleResult (copy)
			CanvasModuleResult.zoomTo(CanvasModuleResult.zoom:peek() / 1.25)
		end, (command("Minus")))
		bind("Parent", function()
			-- upvalues: SessionResult (copy)
			SessionResult.selectMany({})
		end, { { p1.values.enum("KeyCode", "Escape") } })
		bind("Child", function()
			-- upvalues: SessionResult (copy)
			SessionResult.selectRelative("child")
		end, { { p1.values.enum("KeyCode", "Return") } })
		bind("Next", function()
			-- upvalues: SessionResult (copy)
			SessionResult.selectRelative("next")
		end, { { p1.values.enum("KeyCode", "Tab") } })
		bind("Previous", function()
			-- upvalues: SessionResult (copy)
			SessionResult.selectRelative("previous")
		end, {
			{
				p1.values.enum("KeyCode", "Tab"),
				p1.values.enum("KeyCode", "LeftShift")
			}
		})
		p1.set(InputContext, "Parent", ComposeDesign)
		table.insert(List1, p1.connect(Zoom, "Activated", CanvasModuleResult.fit))
		local Link = p6.link
		local LinkResult = if Link then DesignModule.link(SessionResult, Link) else nil
		
		function Label.Import()
			-- upvalues: LinkResult (copy)
			assert(LinkResult, "Import requires a source link").import()
		end
		
		local OwnResult = if LinkResult then CoreModule.owner.own(p1.owner, LinkResult.dispose) else nil
		
		if LinkResult then
			table.insert(List1, p1.connect(Sync, "Activated", function()
				-- upvalues: LinkResult (copy), execute (copy)
				if LinkResult.status:peek() ~= "synchronized" then
					execute({ action = "Import" })
				end
			end))
		end
		local OwnResult1 = CoreModule.owner.own(p1.owner, CoreModule.createRootOwner(function()
			-- upvalues: CoreModule (upval), DesignModule (upval), SessionResult (copy), p3 (copy), p1 (upval), OpenDesign (copy), AllDevices (ref), CanvasModuleResult (copy), ActualSize (ref), Camera (ref), Scene (copy), Device (ref), LinkResult (copy), Sync (copy), Color (upval), LabelResult (copy), Zoom (copy), LabelResult1 (copy), Undo (copy), Redo (copy)
			CoreModule.watch(function(Callback)
				-- upvalues: DesignModule (upval), SessionResult (upval), p3 (upval), p1 (upval), OpenDesign (upval)
				local FindResult = DesignModule.document.find(Callback(SessionResult.document).root, Callback(SessionResult.selected))
				local Kind = if FindResult then p3.kinds[FindResult.kind] else nil
				p1.set(OpenDesign, "Visible", Kind ~= nil and (Kind.design ~= nil and Kind.design.save ~= nil))
			end)
			
			if AllDevices then
				local AllDevices1 = AllDevices
				CoreModule.watch(function(Callback)
					-- upvalues: p1 (upval), AllDevices1 (copy), CanvasModuleResult (upval)
					p1.set(AllDevices1, "Text", if Callback(CanvasModuleResult.all) then "Single device" else "All devices")
				end)
			end
			if ActualSize then
				local ActualSize1 = ActualSize
				CoreModule.watch(function(Callback)
					-- upvalues: CanvasModuleResult (upval), p1 (upval), ActualSize1 (copy)
					Callback(CanvasModuleResult.device)
					p1.set(ActualSize1, "Text", if Callback(CanvasModuleResult.current().actualSize) then "Fit size" else "Actual size")
				end)
			end
			if Camera and Scene then
				local Camera1 = Camera
				local config = {
					fit = "Fit",
					["eye-height"] = "Player eye height",
					["approach-20"] = "Approach at 20 studs",
					["close-up"] = "Close-up",
					["top-down"] = "Top-down",
					orbit = "Orbit",
					custom = "Custom"
				}
				CoreModule.watch(function(Callback)
					-- upvalues: Scene (copy), p1 (upval), Camera1 (copy), config (copy)
					local CallbackResult = Callback(Scene.preset)
					p1.set(Camera1, "Text", "Camera · " .. (config[CallbackResult] or CallbackResult))
				end)
			end
			if Device then
				local Device1 = Device
				CoreModule.watch(function(Callback)
					-- upvalues: p1 (upval), Device1 (copy), CanvasModuleResult (upval)
					p1.set(Device1, "Text", Callback(CanvasModuleResult.device).name)
				end)
			end
			if LinkResult then
				CoreModule.watch(function(Callback)
					-- upvalues: LinkResult (copy), p1 (upval), Sync (upval), Color (upval)
					local CallbackResult = Callback(LinkResult.status)
					p1.set(Sync, "Text", if CallbackResult == "synchronized" then "● Source synced" elseif CallbackResult == "conflict" then "▲ Source changed · Import" else "○ Custom source · Import")
					p1.set(Sync, "TextColor3", if CallbackResult == "synchronized" then p1.rgb(80, 200, 120) elseif CallbackResult == "conflict" then Color.danger else Color.tertiary)
				end)
			end
			CoreModule.watch(function(Callback)
				-- upvalues: SessionResult (upval), p1 (upval), LabelResult (upval), Color (upval)
				local CallbackResult = Callback(SessionResult.problem)
				p1.set(LabelResult, "Text", CallbackResult or "Ready")
				p1.set(LabelResult, "TextColor3", if CallbackResult then Color.danger else Color.tertiary)
			end)
			CoreModule.watch(function(Callback)
				-- upvalues: p1 (upval), Zoom (upval), CanvasModuleResult (upval)
				p1.set(Zoom, "Text", `{math.round(Callback(CanvasModuleResult.zoom) * 100)}%`)
			end)
			CoreModule.watch(function(Callback)
				-- upvalues: SessionResult (upval), p1 (upval), LabelResult1 (upval), p3 (upval)
				p1.set(LabelResult1, "Text", `{Callback(SessionResult.document).name}  <font color="#78787E">· {p3.name}</font>`)
			end)
			CoreModule.watch(function(Callback)
				-- upvalues: p1 (upval), Undo (upval), SessionResult (upval), Color (upval), Redo (upval)
				p1.set(Undo, "TextColor3", if Callback(SessionResult.canUndo) then Color.text else Color.tertiary)
				p1.set(Redo, "TextColor3", if Callback(SessionResult.canRedo) then Color.text else Color.tertiary)
			end)
		end, p1.runtime.reactor).dispose)
		
		return {
			root = ComposeDesign,
			session = SessionResult,
			canvas = CanvasModuleResult,
			execute = execute,
			nested = function()
				-- upvalues: v3 (ref)
				return v3
			end,
			dispose = function()
				-- upvalues: p1 (upval), InputContext (copy), v3 (ref), Activated (ref), v4 (ref), OwnResult1 (copy), OwnResult (copy), List1 (copy), NewPrompt (copy), CanvasModuleResult (copy), v5 (copy), v6 (copy), NewThemePanel (copy), v7 (copy), ComposeDesign (copy)
				p1.set(InputContext, "Enabled", true)
				
				if v3 then
					v3.dispose()
					v3 = nil
				end
				if Activated then
					Activated:Disconnect()
					Activated = nil
				end
				if v4 then
					p1.destroy(v4)
					v4 = nil
				end
				OwnResult1()
				
				if OwnResult then
					OwnResult()
				end
				for _, Connection in List1 do
					Connection:Disconnect()
				end
				if NewPrompt then
					NewPrompt.dispose()
				end
				CanvasModuleResult.dispose()
				v5.dispose()
				v6.dispose()
				
				if NewThemePanel then
					NewThemePanel.dispose()
				end
				v7.dispose()
				p1.destroy(ComposeDesign)
			end
		}
	end
end