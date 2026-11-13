local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local _ = require("./nav_surface_kit")
local GlassModule = require("./glass")
local GameplayHoldModule = require("./gameplay_hold")
local EntryUpgradeModule = require("./entry_upgrade")

return function(p1, p2)
	-- upvalues: GlassModule (copy), GameplayHoldModule (copy), EntryUpgradeModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Gui = p2.gui
	local WithinFunction = p2.within
	local DisplayedFunction = p2.displayed
	local FirstSelectableFunction = p2.firstSelectable
	
	return function(Callback, Callback1, p3)
		-- upvalues: Gui (copy), p1 (copy), p2 (copy), Runtime (copy), TypesUDim2 (copy), TypesEnum (copy), Host (copy), TypesVector2 (copy), GlassModule (upval), Compose (copy), GameplayHoldModule (upval), DisplayedFunction (copy), FirstSelectableFunction (copy), WithinFunction (copy), EntryUpgradeModule (upval)
		local P2 = p3 or {}
		local Exiting = P2.exiting
		local AppearanceFunction = P2.appearance
		local GetResult = if Gui then p1.selection.get() else nil
		local PreferenceResult = p2.preference()
		local SelectingResult = p2.selecting()
		local CallbackResult = Callback()
		Runtime.decorate(CallbackResult, { SelectionGroup = true, ZIndex = P2.ZIndex or 101 })
		local Frame = nil
		
		local function near(Vector): boolean
			-- upvalues: P2 (copy), CallbackResult (copy), Frame (ref)
			local OutsideMargin = P2.outsideMargin or 24
			local Guis = { CallbackResult }
			
			if Frame and Frame.AbsoluteSize.X > 0 then
				local AbsolutePosition = CallbackResult.AbsolutePosition
				local AbsoluteSize = CallbackResult.AbsoluteSize
				local AbsolutePosition1 = Frame.AbsolutePosition
				local AbsoluteSize1 = Frame.AbsoluteSize
				
				if AbsolutePosition.X <= AbsolutePosition1.X + 1 and (AbsolutePosition.Y <= AbsolutePosition1.Y + 1 and (AbsolutePosition1.X + AbsoluteSize1.X - 1 <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y + AbsoluteSize.Y >= AbsolutePosition1.Y + AbsoluteSize1.Y - 1)) then
					Guis = {}
					
					for _, Gui in CallbackResult:GetChildren() do
						if Gui:IsA("GuiObject") and Gui.Visible and Gui.Name ~= "OutlineFade" then
							table.insert(Guis, Gui)
						end
					end
				end
			end
			for _, gui in Guis do
				local AbsolutePosition = gui.AbsolutePosition
				local AbsoluteSize = gui.AbsoluteSize
				
				if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 and AbsolutePosition.X - OutsideMargin <= Vector.X and Vector.X <= AbsolutePosition.X + AbsoluteSize.X + OutsideMargin and AbsolutePosition.Y - OutsideMargin <= Vector.Y and Vector.Y <= AbsolutePosition.Y + AbsoluteSize.Y + OutsideMargin then
					return true
				end
			end
			return false
		end
		
		local function v22()
			-- upvalues: Frame (ref), p1 (upval), P2 (copy), Callback1 (copy)
			if Frame and not p1.available(Frame) then return end
			if p1.read(P2.canDismiss) ~= false then
				Callback1("cancel")
			end
		end
		
		local config = {
			Name = P2.Name or "Modal",
			BorderSizePixel = 0,
			Size = TypesUDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Active = true,
			SelectionGroup = true,
			SelectionBehaviorUp = TypesEnum.SelectionBehavior.Stop,
			SelectionBehaviorDown = TypesEnum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = TypesEnum.SelectionBehavior.Stop,
			SelectionBehaviorRight = TypesEnum.SelectionBehavior.Stop,
			ZIndex = P2.ZIndex or 100,
			Host.ScrollingFrame("Scrim")({
				BorderSizePixel = 0,
				Active = true,
				ScrollBarThickness = 0,
				Selectable = false,
				Size = TypesUDim2.fromScale(1, 1),
				CanvasSize = TypesUDim2.new(),
				BackgroundTransparency = if P2.backgroundTransparency == nil then nil else function(p4): number
					-- upvalues: p1 (upval), P2 (copy), AppearanceFunction (copy), PreferenceResult (copy)
					local ReadResult: number = p1.read(P2.backgroundTransparency, p4)
					local ClampedValue: number = if type(ReadResult) == "number" then math.clamp(ReadResult, 0, 1) else 1
					local AppearanceResult = if AppearanceFunction then AppearanceFunction(p4) else 1
					
					return if ClampedValue >= 1 then 1 else 1 - (1 - ClampedValue * PreferenceResult(p4)) * AppearanceResult
				end,
				BackgroundColor3 = if P2.backgroundTransparency == nil then nil else p1.types.Color3.new(0, 0, 0),
				ZIndex = P2.ZIndex or 100
			}),
			Host.TextButton("DismissTarget")({
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Active = true,
				Text = "",
				AutoButtonColor = false,
				Selectable = false,
				Interactable = true,
				Size = TypesUDim2.fromScale(1, 1),
				ZIndex = P2.ZIndex or 100,
				Activated = function(Input)
					-- upvalues: TypesEnum (upval), Frame (ref), p1 (upval), near (copy), TypesVector2 (upval), P2 (copy), Callback1 (copy)
					if Input and Input.UserInputType and Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1 and Input.UserInputType ~= TypesEnum.UserInputType.Touch then return end
					if Frame and not p1.available(Frame) then return end
					if Input and Input.Position and near(TypesVector2.new(Input.Position.X, Input.Position.Y)) then return end
					if p1.read(P2.outsideDismiss) ~= false and p1.read(P2.canDismiss) ~= false then
						if P2.onOutside then
							P2.onOutside()
							
							return
						end
						if Frame and not p1.available(Frame) then return end
						if p1.read(P2.canDismiss) ~= false then
							Callback1("cancel")
						end
					end
				end
			}),
			CallbackResult
		}
		
		if Exiting then
			function config.Interactable(Callback): boolean
				-- upvalues: Exiting (copy)
				return not Callback(Exiting)
			end
		end
		Frame = Host.Frame(config)
		GlassModule.hold(p1, Frame)
		local Scrim = Frame:FindFirstChild("Scrim")
		
		if P2.backgroundTransparency == nil and Scrim then
			Scrim:AddTag("facet-scrim")
			
			if AppearanceFunction then
				p2.attach(Scrim, {
					Compose.show(function(p4): boolean
						-- upvalues: AppearanceFunction (copy)
						return AppearanceFunction(p4) < 1
					end, function()
						-- upvalues: Host (upval), p1 (upval), AppearanceFunction (copy)
						return Host.UIGradient("ScrimFade")({
							Transparency = function(p4)
								-- upvalues: p1 (upval), AppearanceFunction (upval)
								return p1.types.NumberSequence.new(1 - AppearanceFunction(p4))
							end
						})
					end)
				})
			end
		end
		if Scrim and Scrim:IsA("GuiObject") and Gui then
			local Gui1 = Gui
			local PbarInset = p1.observe.TopbarInset(Gui1)
			local ParentResult = p1.observe.Parent(Frame)
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(Frame)
			local LayoutUnitResult = p1.layoutUnit(Frame)
			local CellResult1 = Compose.cell({
				scale = 1,
				near = TypesVector2.zero,
				far = TypesVector2.zero
			})
			Compose.watch(function(Callback)
				-- upvalues: PbarInset (copy), ParentResult (copy), AbsoluteSizeResult (copy), LayoutUnitResult (copy), Frame (ref), TypesVector2 (upval), GlassModule (upval), p1 (upval), Gui1 (copy), CellResult1 (copy)
				Callback(PbarInset)
				Callback(ParentResult)
				Callback(AbsoluteSizeResult)
				local Largest = math.max(Callback(LayoutUnitResult), 0.001)
				local ScreenGui = Frame:FindFirstAncestorWhichIsA("ScreenGui")
				local Zero = TypesVector2.zero
				local Zero1 = TypesVector2.zero
				
				if ScreenGui then
					Zero, Zero1 = GlassModule.bands(p1, Gui1, ScreenGui)
				end
				local PeekResult = CellResult1:peek()
				
				if PeekResult.near ~= Zero or PeekResult.far ~= Zero1 or PeekResult.scale ~= Largest then
					CellResult1:set({ near = Zero, far = Zero1, scale = Largest })
				end
			end)
			Runtime.decorate(Scrim, {
				Position = function(Callback)
					-- upvalues: CellResult1 (copy), TypesUDim2 (upval)
					local CallbackResult = Callback(CellResult1)
					
					return TypesUDim2.fromOffset(-CallbackResult.near.X / CallbackResult.scale, -CallbackResult.near.Y / CallbackResult.scale)
				end,
				Size = function(Callback)
					-- upvalues: CellResult1 (copy), TypesUDim2 (upval)
					local CallbackResult = Callback(CellResult1)
					
					return TypesUDim2.new(1, (CallbackResult.near.X + CallbackResult.far.X) / CallbackResult.scale, 1, (CallbackResult.near.Y + CallbackResult.far.Y) / CallbackResult.scale)
				end
			})
		end
		local Flag = false
		local HoldResult = nil
		
		local function _()
			-- upvalues: HoldResult (ref), GameplayHoldModule (upval), p1 (upval), Gui (upval), P2 (copy)
			if HoldResult == nil then
				HoldResult = GameplayHoldModule.hold(p1, Gui, P2.keepsGameplay ~= true)
			end
		end
		
		local _ = function()
			-- upvalues: HoldResult (ref)
			local Callback: () -> () = HoldResult
			HoldResult = nil
			
			if Callback then
				Callback()
			end
		end
		
		local function entryTarget()
			-- upvalues: P2 (copy), DisplayedFunction (upval), FirstSelectableFunction (upval), CallbackResult (copy)
			local EntryResult = if P2.entry then P2.entry() else nil
			
			if EntryResult and DisplayedFunction(EntryResult) then
				return EntryResult
			end
			local InitialFocus = P2.initialFocus
			local FirstSelectableResult = nil
			
			if InitialFocus then
				FirstSelectableResult = FirstSelectableFunction(CallbackResult, InitialFocus)
				
				if not FirstSelectableResult then
					return (FirstSelectableFunction(CallbackResult))
				end
			else
				FirstSelectableResult = FirstSelectableFunction(CallbackResult)
			end
			return FirstSelectableResult
		end
		
		local CellResult = Compose.cell(nil)
		
		local _ = function(p4)
			-- upvalues: P2 (copy), CellResult (copy)
			local EntryResult = if P2.entry and p4 then P2.entry() else nil
			CellResult:set(if P2.entry and p4 and EntryResult ~= p4 then p4 else nil)
		end
		
		local Flag1 = false
		local Flag2 = false
		local Target = nil
		
		local function reclaimable(GetResult1): boolean
			-- upvalues: WithinFunction (upval), Frame (ref), Flag2 (ref), GetResult (ref), p1 (upval)
			if GetResult1 == nil or GetResult1.Parent == nil or WithinFunction(GetResult1, Frame) then
				return true
			end
			if not Flag2 or GetResult1 == GetResult then
				return false
			end
			for _, value in p1.modalScopes:peek() do
				if value ~= Frame and WithinFunction(GetResult1, value) then
					return false
				end
			end
			return true
		end
		
		local _ = function()
			-- upvalues: p1 (upval), Frame (ref), Flag (ref), HoldResult (ref), GameplayHoldModule (upval), Gui (upval), P2 (copy)
			local Copy = table.clone(p1.modalScopes:peek())
			table.insert(Copy, Frame)
			p1.modalScopes:set(Copy)
			Flag = false
			
			if HoldResult == nil then
				HoldResult = GameplayHoldModule.hold(p1, Gui, P2.keepsGameplay ~= true)
			end
		end
		
		local Copy = table.clone(p1.modalScopes:peek())
		table.insert(Copy, Frame)
		p1.modalScopes:set(Copy)
		Flag = false
		
		if HoldResult == nil then
			HoldResult = GameplayHoldModule.hold(p1, Gui, P2.keepsGameplay ~= true)
		end
		local function release()
			-- upvalues: Flag (ref), HoldResult (ref), p1 (upval), Frame (ref), Gui (upval), reclaimable (copy), GetResult (ref), WithinFunction (upval)
			if Flag then return end
			Flag = true
			local Callback: () -> () = HoldResult
			HoldResult = nil
			
			if Callback then
				Callback()
			end
			local Frames = {}
			
			for _, value in p1.modalScopes:peek() do
				if value ~= Frame then
					table.insert(Frames, value)
				end
			end
			p1.modalScopes:set(Frames)
			local Target = if #Frames == 0 then p1.modalReturn.target else nil
			
			if #Frames == 0 then
				p1.modalReturn.target = nil
			end
			if Gui and reclaimable(p1.selection.get()) then
				local GetResult1 = if GetResult and GetResult.Parent ~= nil and not WithinFunction(GetResult, Frame) then GetResult elseif Target and Target.Parent ~= nil and not WithinFunction(Target, Frame) then Target else nil
				
				if not pcall(function()
					-- upvalues: p1 (upval), GetResult1 (copy)
					p1.selection.set(GetResult1)
				end) then
					p1.selection.set(nil)
				end
			end
		end
		
		Compose.cleanup(release)
		
		if Exiting then
			Compose.watch(function(Callback)
				-- upvalues: Exiting (copy), release (copy), Flag (ref), Gui (upval), p1 (upval), WithinFunction (upval), Frame (ref), GetResult (ref), HoldResult (ref), GameplayHoldModule (upval), P2 (copy), Flag1 (ref), Flag2 (ref), entryTarget (copy), CellResult (copy)
				if Callback(Exiting) then
					release()
					
					return
				end
				if Flag then
					local GetResult1 = if Gui then p1.selection.get() else nil
					
					if GetResult1 and not WithinFunction(GetResult1, Frame) then
						GetResult = GetResult1
					end
					local Copy = table.clone(p1.modalScopes:peek())
					table.insert(Copy, Frame)
					p1.modalScopes:set(Copy)
					Flag = false
					
					if HoldResult == nil then
						HoldResult = GameplayHoldModule.hold(p1, Gui, P2.keepsGameplay ~= true)
					end
					Flag1 = false
					Flag2 = false
					
					if Gui and GetResult1 then
						local EntryTargetResult = entryTarget()
						p1.selection.set(EntryTargetResult)
						local EntryResult = if P2.entry and EntryTargetResult then P2.entry() else nil
						CellResult:set(if P2.entry and EntryTargetResult and EntryResult ~= EntryTargetResult then EntryTargetResult else nil)
					end
				end
			end)
		end
		p1.action(Frame, "ModalBack", { TypesEnum.KeyCode.Escape, TypesEnum.KeyCode.ButtonB }, true, v22, { priority = P2.priority or 2000 })
		
		if Gui and P2.entry then
			EntryUpgradeModule(p1, {
				gui = Gui,
				panel = CallbackResult,
				held = CellResult,
				entry = P2.entry,
				displayed = DisplayedFunction,
				ready = function(Callback)
					-- upvalues: p1 (upval), Frame (ref), Exiting (copy), CallbackResult (copy)
					local CallbackResult1 = Callback(p1.modalScopes)
					
					return CallbackResult1[#CallbackResult1] == Frame and (not (Exiting and Callback(Exiting)) and (Callback(p1.observe.Interactable(Frame)) and Callback(p1.observe.Interactable(CallbackResult))))
				end
			})
		end
		if Gui then
			if p2.input then
				Runtime.connect(p2.input, "LastInputTypeChanged", function(MouseButton)
					-- upvalues: TypesEnum (upval), WithinFunction (upval), p1 (upval), Frame (ref), Target (ref)
					if (MouseButton == TypesEnum.UserInputType.MouseMovement or MouseButton == TypesEnum.UserInputType.MouseButton1 or MouseButton == TypesEnum.UserInputType.Touch) and WithinFunction(p1.selection.get(), Frame) then
						Target = nil
						p1.selection.set(nil)
					end
				end)
			end
			local ParentResult1 = p1.observe.Parent(Frame)
			local CellResult2 = Compose.cell(0)
			local CellResult3 = Compose.cell(0)
			Compose.watch(function(Callback)
				-- upvalues: p1 (upval), Runtime (upval), CellResult2 (copy)
				for _, value in Callback(p1.modalPortals) do
					Runtime.connect(value.anchor, "AncestryChanged", function()
						-- upvalues: CellResult2 (upval)
						CellResult2:set(CellResult2:peek() + 1)
					end)
				end
			end)
			Runtime.connect(Frame, "AncestryChanged", function()
				-- upvalues: CellResult2 (copy)
				CellResult2:set(CellResult2:peek() + 1)
			end)
			Runtime.connect(CallbackResult, "DescendantAdded", function()
				-- upvalues: CellResult3 (copy)
				CellResult3:set(CellResult3:peek() + 1)
			end)
			local InteractableResult = p1.observe.Interactable(Frame)
			local VisibleResult = p1.observe.Visible(Frame)
			local InteractableResult1 = p1.observe.Interactable(CallbackResult)
			Compose.watch(function(Callback)
				-- upvalues: p1 (upval), Frame (ref), InteractableResult (copy), InteractableResult1 (copy), reclaimable (copy), GetResult (ref), WithinFunction (upval), SelectingResult (copy), ParentResult1 (copy), VisibleResult (copy), CellResult2 (copy), Exiting (copy), entryTarget (copy), DisplayedFunction (upval), P2 (copy), CellResult (copy)
				local CallbackResult = Callback(p1.modalScopes)
				
				if CallbackResult[#CallbackResult] ~= Frame then return end
				local GetResult1 = p1.selection.get()
				
				if Callback(InteractableResult) and Callback(InteractableResult1) then
					if SelectingResult(Callback) and Callback(ParentResult1) and Callback(VisibleResult) and Callback(CellResult2) >= 0 and (not Exiting or not Callback(Exiting)) and (not GetResult1 or not p1.withinModal(GetResult1, Callback)) then
						local EntryTargetResult = entryTarget()
						
						if EntryTargetResult and DisplayedFunction(EntryTargetResult) then
							pcall(function()
								-- upvalues: p1 (upval), EntryTargetResult (copy)
								p1.selection.set(EntryTargetResult)
							end)
							local EntryResult = if P2.entry and EntryTargetResult then P2.entry() else nil
							CellResult:set(if P2.entry and EntryTargetResult and EntryResult ~= EntryTargetResult then EntryTargetResult else nil)
						end
					end
				elseif reclaimable(GetResult1) then
					p1.selection.set(if GetResult and GetResult.Parent ~= nil and not WithinFunction(GetResult, Frame) then GetResult else nil)
					
					return
				end
			end)
			local ObserveResult = p1.selection.observe()
			Compose.watch(function(Callback)
				-- upvalues: p1 (upval), Frame (ref), ObserveResult (copy), CellResult2 (copy), CellResult3 (copy), WithinFunction (upval), Target (ref), DisplayedFunction (upval), Flag1 (ref), Flag2 (ref), InteractableResult (copy), InteractableResult1 (copy), Exiting (copy), SelectingResult (copy), P2 (copy), CellResult (copy), entryTarget (copy), ParentResult1 (copy), VisibleResult (copy), Flag (ref), CallbackResult (copy), TypesVector2 (upval)
				local CallbackResult1 = Callback(p1.modalScopes)
				
				if CallbackResult1[#CallbackResult1] ~= Frame then return end
				local CallbackResult2 = Callback(ObserveResult)
				Callback(CellResult2)
				Callback(CellResult3)
				local v1 = true
				local CallbackResult2_1 = if CallbackResult2 and not WithinFunction(CallbackResult2, Frame) then nil else CallbackResult2 or Target
				while CallbackResult2_1 and CallbackResult2_1 ~= Frame do
					if CallbackResult2_1:IsA("GuiObject") then
						local CallbackResult3 = Callback(p1.observe.Visible(CallbackResult2_1))
						local CallbackResult4 = Callback(p1.observe.Interactable(CallbackResult2_1))
						v1 = v1 and (CallbackResult3 and CallbackResult4)
					end
					CallbackResult2_1 = Callback(p1.observe.Parent(CallbackResult2_1))
				end
				if CallbackResult2 and p1.withinModal(CallbackResult2, Callback) then
					local Inverted: boolean = Target ~= nil and (Target ~= CallbackResult2 and not DisplayedFunction(Target))
					Flag1 = true
					Flag2 = true
					Target = CallbackResult2
					
					if Inverted and Callback(InteractableResult) and Callback(InteractableResult1) and (not Exiting or not Callback(Exiting)) and SelectingResult(Callback) then
						local EntryResult = if P2.entry and CallbackResult2 then P2.entry() else nil
						CellResult:set(if P2.entry and CallbackResult2 and EntryResult ~= CallbackResult2 then CallbackResult2 else nil)
					end
					if not v1 and Callback(InteractableResult) and Callback(InteractableResult1) and (not Exiting or not Callback(Exiting)) then
						p1.selection.set(if SelectingResult(Callback) then entryTarget() else nil)
					end
					return
				else
					if CallbackResult2 and not p1.withinModal(CallbackResult2, Callback) then
						local v2 = true
						
						for _, value in CallbackResult1 do
							v2 = v2 and not WithinFunction(CallbackResult2, value)
						end
						if v2 then
							p1.modalReturn.target = CallbackResult2
						end
						p1.selection.set(nil)
					end
					local Inverted: boolean = if CallbackResult2 then not DisplayedFunction(CallbackResult2) else Target ~= nil and not DisplayedFunction(Target)
					
					if CallbackResult2 ~= nil and Callback(ParentResult1) and Callback(VisibleResult) and (not Exiting or not Callback(Exiting)) and not SelectingResult(Callback) then
						p1.selection.set(nil)
						
						return
					end
					if not Flag and (not Exiting or not Exiting:peek()) and (Frame.Interactable and CallbackResult.Interactable) then
						Flag2 = false
					end
					if Flag1 and not Inverted and CallbackResult2 == nil or (not Callback(ParentResult1) or not Callback(VisibleResult) or Exiting and Callback(Exiting)) or (not Callback(InteractableResult) or not Callback(InteractableResult1) or not SelectingResult(Callback)) then return end
					local EntryTargetResult = entryTarget()
					local CallbackResult5 = if EntryTargetResult then Callback(p1.observe.AbsoluteSize(EntryTargetResult)) else TypesVector2.zero
					
					if EntryTargetResult and CallbackResult5.X > 0 and CallbackResult5.Y > 0 and DisplayedFunction(EntryTargetResult) then
						pcall(function()
							-- upvalues: p1 (upval), EntryTargetResult (copy)
							p1.selection.set(EntryTargetResult)
						end)
						local EntryResult = if P2.entry and EntryTargetResult then P2.entry() else nil
						CellResult:set(if P2.entry and (EntryTargetResult and EntryResult ~= EntryTargetResult) then EntryTargetResult else nil)
					end
				end
			end)
		end
		return Frame
	end
end