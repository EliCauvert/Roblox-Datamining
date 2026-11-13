local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./theme_types")

return function(p1, p2, p3, p4, Callback, p5)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local Types = p1.types
	local Host = p1.Host
	local TypesEnum = Types.Enum
	local ReadFunction1 = p1.read
	local ReadFunction = p1.read
	local config = {
		warning = {
			0, 0, 10, 0.7, 40, 0, 90, 0.7, 130, 0
		},
		error = {
			0, 0, 8, 1, 40, 0, 80, 1, 112, 0, 152, 1, 190, 0
		}
	}
	local config1 = {
		selection = "UIClick",
		impact = "GameplayCollision",
		success = "UINotification"
	}
	local HapticEffects = {}
	
	function p1.haptic(Enabled)
		-- upvalues: p2 (copy), HapticEffects (copy), config (copy), config1 (copy), Runtime (copy), TypesEnum (copy), Types (copy), p3 (copy)
		if Enabled == true then
			Enabled = p2.pressHaptic
		end
		if Enabled == nil or Enabled == false then
			return nil
		end
		if type(Enabled) ~= "string" then
			return Enabled
		end
		local HapticEffect = HapticEffects[Enabled]
		
		if HapticEffect then
			return HapticEffect
		end
		local Entry = config[Enabled]
		assert(Entry or config1[Enabled], `Facet haptic: unknown feedback kind '{Enabled}'. Use selection, impact, success, warning or error`)
		local HapticEffect1 = Runtime.host.render.createNode("HapticEffect")
		HapticEffect1.Name = `FacetHaptic_{Enabled}`
		
		if Entry then
			HapticEffect1.Type = TypesEnum.HapticEffectType.Custom
			local List = {}
			
			for i = 1, #Entry, 2 do
				table.insert(List, Types.FloatCurveKey.new(Entry[i], Entry[i + 1], TypesEnum.KeyInterpolationMode.Linear))
			end
			HapticEffect1:SetWaveformKeys(List)
		else
			HapticEffect1.Type = TypesEnum.HapticEffectType[config1[Enabled]]
		end
		HapticEffect1.Parent = p3.Workspace
		HapticEffects[Enabled] = HapticEffect1
		
		return HapticEffect1
	end
	
	function p1.playWhileShown(p6, Parent)
		-- upvalues: Compose (copy), Runtime (copy), p1 (copy)
		local CellResult = Compose.cell(0)
		Runtime.connect(Parent, "AncestryChanged", function()
			-- upvalues: CellResult (copy)
			CellResult:set(CellResult:peek() + 1)
		end)
		Compose.watch(function(Callback: (any) -> ())
			-- upvalues: CellResult (copy), Parent (copy), p1 (upval), Compose (upval), p6 (copy)
			Callback(CellResult)
			local List = {}
			local Parent1 = Parent
			while Parent1 do
				if Parent1:IsA("GuiObject") then
					table.insert(List, p1.observe.Visible(Parent1))
				elseif Parent1:IsA("LayerCollector") then
					table.insert(List, p1.observe.Enabled(Parent1))
					break
				end
				Parent1 = Parent1.Parent
			end
			Compose.watch(function(Callback)
				-- upvalues: List (copy), p6 (upval)
				for _, value in List do
					if not Callback(value) then
						p6:pause()
						
						return
					end
				end
				p6:play()
			end)
		end)
	end
	
	local self = setmetatable({}, { __mode = "k" })
	
	function p1.fadeTo(p7, p8)
		-- upvalues: self (copy)
		assert(self[p7], "Facet: fadeTo needs a node made by ctx.fade").source:set({ p8 })
	end
	
	function p1.fade(p7, Enabled1, Enabled, p8)
		-- upvalues: Compose (copy), Host (copy), ReadFunction (copy), p1 (copy), p3 (copy), self (copy), Types (copy), Runtime (copy), TypesEnum (copy), p2 (copy)
		local CellResult = Compose.cell({ p7.GroupTransparency or 0 })
		p7.GroupTransparency = nil
		local ScrollingFrameResult = if p8 then Host.ScrollingFrame(p7) else Host.Frame(p7)
		
		local function _(Callback)
			-- upvalues: ReadFunction (upval), CellResult (copy)
			return ReadFunction(Callback(CellResult)[1], Callback) or 0
		end
		
		local VisibleResult = p1.observe.Visible(ScrollingFrameResult)
		local CellResult1 = Compose.cell(false)
		local RunService = p3.RunService
		self[ScrollingFrameResult] = {
			source = CellResult,
			transparency = function(Callback)
				-- upvalues: CellResult1 (copy), ReadFunction (upval), CellResult (copy)
				return if Callback(CellResult1) then 1 else ReadFunction(Callback(CellResult)[1], Callback) or 0
			end
		}
		
		local function paint(Callback)
			-- upvalues: Types (upval), CellResult1 (copy), ReadFunction (upval), CellResult (copy)
			return Types.NumberSequence.new(if Callback(CellResult1) then 1 else ReadFunction(Callback(CellResult)[1], Callback) or 0)
		end
		
		local CellResult2 = Compose.cell(true)
		Compose.cleanup((Runtime.mountFragment(function()
			-- upvalues: Compose (upval), Enabled (copy), VisibleResult (copy), CellResult1 (copy), ReadFunction (upval), CellResult (copy), ScrollingFrameResult (copy), Host (upval), paint (copy), p1 (upval), CellResult2 (copy), Types (upval), Enabled1 (copy), RunService (copy), TypesEnum (upval), p2 (upval), Runtime (upval)
			return {
				Compose.show(function(Callback): boolean
					-- upvalues: Enabled (upval), VisibleResult (upval), CellResult1 (upval), ReadFunction (upval), CellResult (upval)
					return Enabled ~= false and (Callback(VisibleResult) and (if Callback(CellResult1) then 1 else ReadFunction(Callback(CellResult)[1], Callback) or 0) > 0)
				end, function()
					-- upvalues: ScrollingFrameResult (upval), Compose (upval), Host (upval), paint (upval), p1 (upval), CellResult2 (upval), Types (upval), CellResult1 (upval), ReadFunction (upval), CellResult (upval)
					ScrollingFrameResult:AddTag("facet-fading")
					Compose.cleanup(function()
						-- upvalues: ScrollingFrameResult (upval)
						ScrollingFrameResult:RemoveTag("facet-fading")
					end)
					
					return Compose.fragment(function()
						-- upvalues: Host (upval), paint (upval), p1 (upval), CellResult2 (upval), Types (upval), CellResult1 (upval), ReadFunction (upval), CellResult (upval)
						return {
							Host.UIGradient("FadePaint")({ Transparency = paint }),
							p1.styled(Host.UIStroke("FadeStroke")({
								Host.UIGradient("FadePaint")({
									Transparency = function(Callback)
										-- upvalues: CellResult2 (upval), Types (upval), CellResult1 (upval), ReadFunction (upval), CellResult (upval)
										return if Callback(CellResult2) then Types.NumberSequence.new(1) else Types.NumberSequence.new(if Callback(CellResult1) then 1 else ReadFunction(Callback(CellResult)[1], Callback) or 0)
									end
								})
							}), "fade-stroke")
						}
					end)
				end),
				Compose.show(function(Callback): boolean
					-- upvalues: VisibleResult (upval), Enabled1 (upval), ReadFunction (upval), CellResult (upval)
					return Callback(VisibleResult) and (Enabled1 == true or (ReadFunction(Callback(CellResult)[1], Callback) or 0) > 0)
				end, function()
					-- upvalues: p1 (upval), ScrollingFrameResult (upval), RunService (upval), ReadFunction (upval), CellResult (upval), CellResult1 (upval), Compose (upval), Host (upval), TypesEnum (upval), Types (upval), p2 (upval), Runtime (upval), CellResult2 (upval)
					local AutomaticSizeResult = p1.observe.AutomaticSize(ScrollingFrameResult)
					local v1: boolean = RunService ~= nil and (ReadFunction(CellResult:peek()[1]) or 0) < 0.5
					local Callback = nil
					
					if RunService then
						CellResult1:set(not v1)
						local Connection = nil
						Connection = RunService.Heartbeat:Connect(function()
							-- upvalues: Connection (ref), CellResult1 (upval), Callback (ref)
							if Connection then
								Connection:Disconnect()
								Connection = nil
							end
							CellResult1:set(false)
							
							if Callback then
								Callback()
							end
						end)
						Compose.cleanup(function()
							-- upvalues: Connection (ref), CellResult1 (upval)
							if Connection then
								Connection:Disconnect()
							end
							CellResult1:set(false)
						end)
					end
					local Parent = Host.CanvasGroup("Fade")({
						BackgroundTransparency = 1,
						Visible = false,
						Size = function(Callback)
							-- upvalues: AutomaticSizeResult (copy), TypesEnum (upval), Types (upval)
							local CallbackResult = Callback(AutomaticSizeResult)
							local IsCallbackResultMatch: boolean = CallbackResult == TypesEnum.AutomaticSize.X or CallbackResult == TypesEnum.AutomaticSize.XY
							local IsCallbackResultMatch1: boolean = CallbackResult == TypesEnum.AutomaticSize.Y or CallbackResult == TypesEnum.AutomaticSize.XY
							
							return Types.UDim2.fromScale(if IsCallbackResultMatch then 0 else 1, if IsCallbackResultMatch1 then 0 else 1)
						end,
						AutomaticSize = AutomaticSizeResult,
						GroupTransparency = function(Callback)
							-- upvalues: CellResult1 (upval), ReadFunction (upval), CellResult (upval)
							return if Callback(CellResult1) then 1 else ReadFunction(Callback(CellResult)[1], Callback) or 0
						end
					})
					local GuiService = p2.guiService
					
					local function keepSelection(Callback: () -> ())
						-- upvalues: GuiService (copy), p1 (upval), ScrollingFrameResult (upval)
						local GetResult = if GuiService then p1.selection.get() else nil
						Callback()
						
						if GuiService and GetResult and p1.selection.get() ~= GetResult and GetResult:IsDescendantOf(ScrollingFrameResult) then
							p1.selection.set(GetResult)
						end
					end
					
					Parent.Parent = ScrollingFrameResult
					
					local function carried(Object)
						-- upvalues: Parent (copy)
						return Object ~= Parent and (not Object:HasTag("facet-independent-fade") and (Object:IsA("GuiBase2d") or (Object:IsA("Path2D") or (Object:IsA("Folder") or Object:IsA("UIGridStyleLayout")))))
					end
					
					Callback = function()
						-- upvalues: Callback (ref), keepSelection (copy), ScrollingFrameResult (upval), carried (copy), Parent (copy)
						Callback = nil
						keepSelection(function()
							-- upvalues: ScrollingFrameResult (upval), carried (upval), Parent (upval)
							for _, child in ScrollingFrameResult:GetChildren() do
								if carried(child) then
									child.Parent = Parent
								end
							end
							Parent.Visible = true
						end)
					end
					
					assert(Callback)()
					local Flag = true
					local SchedulerResult = if task == nil and RunService == nil then Runtime.scheduler() else nil
					Runtime.connect(ScrollingFrameResult, "ChildAdded", Compose.bindOwner(function(p9)
						-- upvalues: Flag (ref), carried (copy), ScrollingFrameResult (upval), keepSelection (copy), Parent (copy), SchedulerResult (copy), RunService (upval), Runtime (upval), Compose (upval)
						if Flag and carried(p9) then
							local function collect()
								-- upvalues: Flag (upval), p9 (copy), ScrollingFrameResult (upval), keepSelection (upval), Parent (upval)
								if Flag and p9.Parent == ScrollingFrameResult then
									keepSelection(function()
										-- upvalues: p9 (upval), Parent (upval)
										p9.Parent = Parent
									end)
								end
							end
							
							if SchedulerResult then
								SchedulerResult.after(0, collect)
								
								return
							end
							if task == nil and RunService then
								local Callback1 = nil
								Callback1 = Runtime.connect(RunService, "Heartbeat", function()
									-- upvalues: Callback1 (ref), Flag (upval), p9 (copy), ScrollingFrameResult (upval), keepSelection (upval), Parent (upval)
									if Callback1 then
										Callback1()
										Callback1 = nil
									end
									if Flag and p9.Parent == ScrollingFrameResult then
										keepSelection(function()
											-- upvalues: p9 (upval), Parent (upval)
											p9.Parent = Parent
										end)
									end
								end)
								
								return
							end
							local Callback1 = nil
							local DeferredThread = nil
							DeferredThread = task.defer(function()
								-- upvalues: DeferredThread (ref), Callback1 (ref), Flag (upval), p9 (copy), ScrollingFrameResult (upval), keepSelection (upval), Parent (upval)
								DeferredThread = nil
								
								if Callback1 then
									Callback1()
								end
								if Flag and p9.Parent == ScrollingFrameResult then
									keepSelection(function()
										-- upvalues: p9 (upval), Parent (upval)
										p9.Parent = Parent
									end)
								end
							end)
							Callback1 = Compose.cleanup(function()
								-- upvalues: DeferredThread (ref)
								if DeferredThread then
									task.cancel(DeferredThread)
								end
							end)
						end
					end))
					Compose.cleanup(function()
						-- upvalues: Flag (ref), keepSelection (copy), Parent (copy), ScrollingFrameResult (upval)
						Flag = false
						keepSelection(function()
							-- upvalues: Parent (upval), ScrollingFrameResult (upval)
							for _, child in Parent:GetChildren() do
								child.Parent = ScrollingFrameResult
							end
						end)
					end)
					CellResult2:set(false)
					
					return Compose.fragment(function()
						return {}
					end)
				end)
			}
		end, ScrollingFrameResult)))
		
		return ScrollingFrameResult
	end
	
	local t = {}
	
	function p1.whenTheme(Key, Callback, Callback1: () -> ())
		-- upvalues: ReadFunction1 (copy), p2 (copy), Compose (copy), t (copy), p1 (copy)
		if Callback(ReadFunction1(p2.theme)) then
			Callback1()
			
			return
		end
		local FacetBuildControlsInsideRuntimeMount = assert(Compose.currentOwner(), "Facet: build controls inside runtime.mount")
		local Entry = t[Key]
		
		if Entry == nil then
			local Tbl = {}
			Entry = Tbl
			t[Key] = Tbl
			Compose.withOwner(p1.lifetime, function()
				-- upvalues: Compose (upval), Callback (copy), ReadFunction1 (upval), p2 (upval), Tbl (copy)
				Compose.watch(function(p9)
					-- upvalues: Callback (upval), ReadFunction1 (upval), p2 (upval), Tbl (upval)
					if Callback(ReadFunction1(p2.theme, p9)) then
						local List = {}
						
						for i in Tbl do
							table.insert(List, i)
						end
						table.clear(Tbl)
						
						for _, value in List do
							value()
						end
					end
				end)
			end)
		end
		local v1 = assert(Entry)
		
		local function entry()
			-- upvalues: Compose (upval), FacetBuildControlsInsideRuntimeMount (copy), Callback1 (copy)
			Compose.withOwner(FacetBuildControlsInsideRuntimeMount, Callback1)
		end
		
		v1[entry] = true
		Compose.cleanup(function()
			-- upvalues: v1 (copy), entry (copy)
			v1[entry] = nil
		end)
	end
	
	function p1.skin(Object, Theme, p9)
		-- upvalues: p2 (copy), p1 (copy), Compose (copy), self (copy), Callback (copy), p4 (copy), Runtime (copy), Types (copy), p5 (copy), TypesEnum (copy), Host (copy)
		if p2.theme == nil then
			return nil, nil
		end
		local function skinned(p10): boolean
			-- upvalues: Theme (copy)
			local ChromeEntry = if p10 and p10.chrome then p10.chrome[Theme] else nil
			
			return ChromeEntry ~= nil and (if ChromeEntry.kind == "native" then ChromeEntry.shadow ~= nil else ChromeEntry.kind ~= "none" or ChromeEntry.shadow ~= nil)
		end
		
		local function _(): boolean
			-- upvalues: p1 (upval), p2 (upval), Theme (copy)
			local ReadResult = p1.read(p2.theme)
			local ChromeEntry = if ReadResult and ReadResult.chrome then ReadResult.chrome[Theme] else nil
			
			return ChromeEntry ~= nil and (if ChromeEntry.kind == "native" then ChromeEntry.shadow ~= nil else ChromeEntry.kind ~= "none" or ChromeEntry.shadow ~= nil)
		end
		
		if not Compose.isValue(p2.theme) and type(p2.theme) ~= "function" then
			local ReadResult = p1.read(p2.theme)
			local ChromeEntry = if ReadResult and ReadResult.chrome then ReadResult.chrome[Theme] else nil
			
			if ChromeEntry == nil or not (if ChromeEntry.kind == "native" then ChromeEntry.shadow ~= nil else ChromeEntry.kind ~= "none" or ChromeEntry.shadow ~= nil) then
				return nil, nil
			end
		end
		local P17 = p9 or {}
		local SelfEntry = self[Object]
		local Transparency = if P17.fullPanelArtFade and SelfEntry then SelfEntry.transparency else nil
		
		local _ = function(Object)
			-- upvalues: Transparency (copy)
			if Transparency then
				Object:AddTag("facet-independent-fade")
			end
			return Object
		end
		
		local function createSkin(ZIndex)
			-- upvalues: p1 (upval), Object (copy), Callback (upval), p4 (upval), Runtime (upval), p2 (upval), Theme (copy), Types (upval), Transparency (copy), P17 (copy), p5 (upval), SelfEntry (copy), TypesEnum (upval)
			local GuiStateResult = p1.observe.GuiState(Object)
			local BackgroundTransparency = Callback(Object, "BackgroundTransparency")
			local SkinResult = p4.skin(Runtime, p2.theme, Theme, {
				types = Types,
				target = Object,
				artTransparency = Transparency,
				emphasisTheme = if P17.emphasis then p5 else nil,
				shadowTransparency = function(Callback): number
					-- upvalues: p1 (upval), p2 (upval), Theme (upval), BackgroundTransparency (copy), SelfEntry (upval)
					local ReadResult = p1.read(p2.theme, Callback)
					local ChromeEntry = ReadResult and (ReadResult.chrome or {})[Theme]
					local ClampedValue: number = if ChromeEntry and ChromeEntry.kind == "native" then math.clamp(Callback(BackgroundTransparency), 0, 1) else 0
					local v1 = 1 - (if SelfEntry then SelfEntry.transparency(Callback) else 0)
					
					return 1 - (1 - ClampedValue) * v1 * v1 * v1
				end,
				label = if P17.label == nil then if Object:IsA("TextButton") or Object:IsA("TextLabel") then p1.observe.Text(Object) else nil else P17.label,
				onCaption = P17.onCaption,
				state = function(Callback): string
					-- upvalues: p1 (upval), P17 (upval), GuiStateResult (copy), TypesEnum (upval)
					if p1.read(P17.disabled, Callback) == true then
						return "disabled"
					else
						local CallbackResult = Callback(GuiStateResult)
						
						return if CallbackResult == TypesEnum.GuiState.Press then "pressed" elseif CallbackResult == TypesEnum.GuiState.Hover then "hover" elseif p1.read(P17.selected, Callback) == true then "selected" else "default"
					end
				end,
				selected = function(p10): boolean
					-- upvalues: p1 (upval), P17 (upval)
					return p1.read(P17.selected, p10) == true
				end,
				ZIndex = ZIndex
			})
			
			if Transparency then
				SkinResult:AddTag("facet-independent-fade")
			end
			return SkinResult
		end
		
		if Object:FindFirstChildWhichIsA("UIPadding") == nil then
			Runtime.mount(function()
				-- upvalues: Host (upval)
				return Host.UIPadding({})
			end, Object)
		end
		local function place(p10)
			-- upvalues: P17 (copy), Runtime (upval), p1 (upval), Object (copy), Host (upval)
			if p10 and P17.visible ~= nil then
				Runtime.decorate(p10, {
					Visible = function(p11): boolean
						-- upvalues: p1 (upval), P17 (upval)
						return p1.read(P17.visible, p11) ~= false
					end
				})
			end
			if p10 and Object:FindFirstChildWhichIsA("UIGridStyleLayout") then
				local _, MountResult2 = Runtime.mount(function()
					-- upvalues: Host (upval)
					return Host.Folder("Chrome")({})
				end, Object)
				p10.Parent = MountResult2
			end
		end
		
		local ReadResult = p1.read(p2.theme)
		local ChromeEntry = if ReadResult and ReadResult.chrome then ReadResult.chrome[Theme] else nil
		
		if ChromeEntry ~= nil and (if ChromeEntry.kind == "native" then ChromeEntry.shadow ~= nil else ChromeEntry.kind ~= "none" or ChromeEntry.shadow ~= nil) then
			local MountResult, MountResult2 = Runtime.mount(function()
				-- upvalues: createSkin (copy), P17 (copy)
				return (createSkin(P17.ZIndex or 0))
			end, Object)
			place(MountResult2)
			
			return MountResult, MountResult2
		else
			p1.whenTheme("skin:" .. Theme, skinned, function()
				-- upvalues: Runtime (upval), Host (upval), Types (upval), P17 (copy), createSkin (copy), Transparency (copy), Object (copy), place (copy)
				local _, MountResult2 = Runtime.mount(function()
					-- upvalues: Host (upval), Types (upval), P17 (upval), createSkin (upval), Transparency (upval)
					local Object = Host.Frame("SkinHost")({
						Size = Types.UDim2.fromOffset(0, 0),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ZIndex = P17.ZIndex or 0,
						(createSkin(0))
					})
					
					if Transparency then
						Object:AddTag("facet-independent-fade")
					end
					return Object
				end, Object)
				place(MountResult2)
			end)
			
			return nil, nil
		end
	end
end