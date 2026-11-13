local _ = require("./types")
local _ = require("./engine_types")
local _ = require("./drag_types")
local _ = require("./environment_types")
local ActivationModule = require("./activation")
local MotionModule = require("./motion")
local DragTravelModule = require("./drag_travel")
local GestureServiceModule = require("./gesture_service")
local DragWorldVisualModule = require("./drag_world_visual")
local self = setmetatable({}, { __mode = "kv" })

local function _(Callback, p1)
	if type(Callback) ~= "function" then
		return Callback
	end
	local Success, Result = pcall(Callback, p1)
	
	if not Success then
		error(Result, 0)
	end
	return Result
end

return function(Key)
	-- upvalues: self (copy), MotionModule (copy), DragTravelModule (copy), ActivationModule (copy), DragWorldVisualModule (copy), GestureServiceModule (copy)
	if self[Key] then
		return self[Key]
	else
		local Compose = Key.Compose
		local TypesVector2 = Key.types.Vector2
		local TypesUDim2 = Key.types.UDim2
		local Guis = {}
		local Guis1 = {}
		local Tbl = nil
		local ReleaseResults = {}
		local CellResult = Compose.cell(nil)
		local config = { state = CellResult }
		self[Key] = config
		
		local function ancestor(Gui)
			-- upvalues: Tbl (ref), Guis1 (copy), Guis (copy)
			local Gui1 = nil
			while Gui do
				local Tbl1 = Tbl
				Gui1 = Guis1[Gui] or Gui
				local Gui2 = Guis[Gui1]
				local PassThrough = Tbl1
				
				if PassThrough then
					PassThrough = Gui2
					
					if PassThrough then
						PassThrough = Gui2.passThrough
						
						if PassThrough then
							PassThrough = Gui2.passThrough(Tbl1.payload)
						end
					end
				end
				if Tbl1 and Gui2 and Gui2.collectionAxis and Tbl1.mode == "pointer" and Tbl1.position then
					local Position = Tbl1.position
					local CollectionAxis = Gui2.collectionAxis
					local X = if CollectionAxis == "X" then Gui1.AbsoluteSize.X else Gui1.AbsoluteSize.Y
					local XDelta = if CollectionAxis == "X" then Position.X - Gui1.AbsolutePosition.X else Position.Y - Gui1.AbsolutePosition.Y
					local Parent = Gui1.Parent
					while Parent and not Guis[Parent] do
						Parent = Parent.Parent
					end
					PassThrough = PassThrough or Parent ~= nil and (XDelta < X * 0.25 or X * 0.75 < XDelta)
				end
				if Gui2 and not PassThrough then
					return Gui1
				end
				Gui = Gui.Parent
			end
			return nil
		end
		
		local self1 = setmetatable({}, { __mode = "k" })
		local ReadPropertyFunction = assert(Key.runtime.host.observation).readProperty
		
		local function available(Parent): boolean
			-- upvalues: self1 (copy), ReadPropertyFunction (copy)
			local Parent1 = Parent.Parent
			
			if Parent1 == nil then
				return false
			end
			local Parent2 = Parent
			while Parent2 do
				local SelfEntry = self1[Parent2]
				
				if SelfEntry == nil then
					SelfEntry = if Parent2:IsA("GuiObject") then 1 elseif Parent2:IsA("ScreenGui") then 2 else 0
					self1[Parent2] = SelfEntry
				end
				if SelfEntry == 1 and not ReadPropertyFunction(Parent2, "Visible") then
					return false
				end
				if SelfEntry == 2 and not ReadPropertyFunction(Parent2, "Enabled") then
					return false
				end
				if Parent2 == Parent then
					Parent2 = Parent1
				else
					Parent2 = Parent2.Parent
				end
			end
			return true
		end
		
		local function contains(Frame: Frame, Vector): boolean
			local AbsolutePosition = Frame.AbsolutePosition
			local AbsoluteWindowSize = if Frame:IsA("ScrollingFrame") then Frame.AbsoluteWindowSize else Frame.AbsoluteSize
			
			return AbsolutePosition.X <= Vector.X and (AbsolutePosition.Y <= Vector.Y and Vector.X <= AbsolutePosition.X + AbsoluteWindowSize.X) and Vector.Y <= AbsolutePosition.Y + AbsoluteWindowSize.Y
		end
		
		local function hitTest(Vector)
			-- upvalues: Tbl (ref), Key (copy), available (copy), ancestor (copy), Guis (copy), contains (copy)
			local Source = Tbl.source
			local BasePlayerGui = Source:FindFirstAncestorWhichIsA("BasePlayerGui")
			local Players = Key.config.services.Players
			
			if BasePlayerGui == nil and Players and Players.LocalPlayer then
				BasePlayerGui = Players.LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
			end
			if BasePlayerGui then
				local Flag = nil
				local AncestorResult = nil
				for _, Object in BasePlayerGui:GetGuiObjectsAtPosition(Vector.X, Vector.Y) do
					Flag = false
					local IsFacetDropPassThroughAttribute = Object:GetAttribute("FacetDropPassThrough") == true
					local Parent = Object
					while Parent do
						if Parent:GetAttribute("FacetDragFeedback") ~= true then
							Parent = Parent.Parent
							continue
						end
						Flag = true
						break
					end
					if not Flag and available(Object) then
						AncestorResult = ancestor(Object)
						
						if AncestorResult then
							return AncestorResult, nil
						elseif not IsFacetDropPassThroughAttribute and (Object.Active or Object:IsA("GuiButton") or Object:IsA("TextBox") or Object:GetStyled("BackgroundTransparency") < 1) then
							return nil, nil
						end
						continue
					end
				end
			else
				local Ancestor = nil
				local Flag1 = nil
				
				for gui in Guis do
					if gui:IsA("GuiObject") and available(gui) and contains(gui, Vector) and ancestor(gui) == gui then
						Flag1 = false
						local Parent = gui.Parent
						while Parent do
							if not Parent:IsA("GuiObject") or not Parent.ClipsDescendants or contains(Parent, Vector) then
								Parent = Parent.Parent
								continue
							end
							Flag1 = true
							break
						end
						if not Flag1 and (Ancestor == nil or gui:IsDescendantOf(Ancestor) or Ancestor.ZIndex < gui.ZIndex) then
							Ancestor = gui
						end
					end
				end
				if Ancestor then
					return Ancestor, nil
				end
			end
			local Workspace = Key.config.services.Workspace
			local CurrentCamera = if Workspace then Workspace.CurrentCamera else nil
			local Flag = false
			
			for gui1 in Guis do
				if not gui1:IsA("GuiObject") then
					Flag = true
					break
				end
			end
			if not CurrentCamera or not Flag then
				return nil, nil
			end
			local v1 = CurrentCamera:ScreenPointToRay(Vector.X, Vector.Y)
			local NewResult = Key.types.RaycastParams.new()
			
			if not Source:IsA("GuiObject") then
				NewResult.FilterDescendantsInstances = { Source }
			end
			local RaycastResult = assert(Workspace):Raycast(v1.Origin, v1.Direction * 10000, NewResult)
			
			return if RaycastResult then ancestor(RaycastResult.Instance) else nil, RaycastResult
		end
		
		local function info(Target)
			-- upvalues: Tbl (ref), Key (copy), Guis (copy)
			local Tbl1 = Tbl
			
			return {
				source = Tbl1.source,
				target = Target,
				mode = Tbl1.mode,
				operation = Key.read(Guis[Target].operation or "move"),
				position = Tbl1.position,
				hit = Tbl1.hit,
				placement = Key.read(Guis[Target].placement),
				worldPlacement = Key.read(Guis[Target].worldPlacement),
				complete = function(): boolean
					return false
				end
			}
		end
		
		local function validate(Frame, p1)
			-- upvalues: Tbl (ref), Guis (copy), available (copy)
			local Tbl1 = Tbl
			local ValidFunction = Tbl1.spec.valid
			local Operations = Tbl1.spec.operations
			local Gui = Guis[Frame]
			
			if not Gui or not available(Frame) then
				return false, "The destination is no longer available"
			end
			if ValidFunction and not ValidFunction() then
				return false, "The source changed"
			end
			if Operations and not table.find(Operations, p1.operation) then
				return false, "This operation is not supported"
			end
			if Gui.propose then
				Gui.propose(Tbl1.payload, p1)
			end
			if Gui.accepts then
				return Gui.accepts(Tbl1.payload, p1)
			else
				return true, nil
			end
		end
		
		local function leave(p1)
			-- upvalues: Guis (copy)
			local Target = p1.target
			
			if Target then
				Target:SetAttribute("FacetDropState", nil)
				Target:SetAttribute("FacetDropReason", nil)
				local Gui = Guis[Target]
				
				if Gui and Gui.feedback then
					Gui.feedback.Enabled = false
				end
				if Gui and Gui.onLeave then
					Gui.onLeave(p1.payload)
				end
			end
		end
		
		local function _(p1, Scale)
			-- upvalues: Key (copy)
			local v2 = nil
			
			return Key.runtime.mount(function()
				-- upvalues: Key (upval), Scale (copy), v2 (ref)
				local UIScaleResult = Key.Host.UIScale({ Scale = Scale })
				v2 = UIScaleResult
				
				return UIScaleResult
			end, p1), assert(v2)
		end
		
		local _ = function(Object)
			local UIScale = Object and Object:FindFirstChildWhichIsA("UIScale")
			
			return if UIScale and UIScale.Scale > 0 then UIScale.Scale else 1
		end
		
		local _ = function(Object, Parent): number
			local v2 = 1
			while Object and Object ~= Parent do
				local UIScale = Object and Object:FindFirstChildWhichIsA("UIScale")
				v2 *= if UIScale and UIScale.Scale > 0 then UIScale.Scale else 1
				Object = Object.Parent
			end
			return v2
		end
		
		local _ = function(p1)
			-- upvalues: TypesVector2 (copy)
			local Parent = p1.Parent
			local AbsolutePosition = if Parent and Parent:IsA("GuiBase2d") then Parent.AbsolutePosition else TypesVector2.zero
			local UIScale = Parent and Parent:FindFirstChildWhichIsA("UIScale")
			
			if UIScale and UIScale.Scale > 0 then
				return AbsolutePosition, UIScale.Scale
			else
				return AbsolutePosition, 1
			end
		end
		
		local function toLocal(AbsolutePosition, Scale, Vector)
			-- upvalues: TypesUDim2 (copy)
			return TypesUDim2.fromOffset((Vector.X - AbsolutePosition.X) / Scale, (Vector.Y - AbsolutePosition.Y) / Scale)
		end
		
		local _ = function(p1, p2)
			-- upvalues: TypesVector2 (copy), toLocal (copy)
			local Parent = p1.Parent
			local UIScale = Parent and Parent:FindFirstChildWhichIsA("UIScale")
			
			return toLocal(if Parent and Parent:IsA("GuiBase2d") then Parent.AbsolutePosition else TypesVector2.zero, if UIScale and UIScale.Scale > 0 then UIScale.Scale else 1, p2)
		end
		
		local _ = function(Object, Vector)
			-- upvalues: TypesUDim2 (copy)
			local Parent = Object.Parent
			local UIScale = Parent and Parent:FindFirstChildWhichIsA("UIScale")
			local Scale = if UIScale and UIScale.Scale > 0 then UIScale.Scale else 1
			local UIScale1 = Object and Object:FindFirstChildWhichIsA("UIScale")
			local ScaledScale = Scale * (if UIScale1 and UIScale1.Scale > 0 then UIScale1.Scale else 1)
			
			return TypesUDim2.fromOffset(Vector.X / ScaledScale, Vector.Y / ScaledScale)
		end
		
		local function raiseStatus(Ghost)
			-- upvalues: Tbl (ref)
			local Status = Tbl.status
			
			if not Status then return end
			local ZIndex = Ghost.ZIndex
			
			for _, descendant in Ghost:GetDescendants() do
				if descendant:IsA("GuiObject") or descendant:IsA("Path2D") then
					ZIndex = math.max(ZIndex, descendant.ZIndex)
				end
			end
			Status.Parent.ZIndex = ZIndex + 1
			Status.ZIndex = ZIndex + 2
		end
		
		local function placeStatus(Key1)
			-- upvalues: Tbl (ref), Guis (copy), Key (copy), TypesVector2 (copy), TypesUDim2 (copy)
			local Status = Key1.status
			
			if not Status or Tbl ~= Key1 then return end
			local Parent = Status.Parent
			
			if not Parent.Visible and Key1.mode ~= "armed" then return end
			local Parent1 = Parent.Parent
			local Gui = Key1.target and Guis[Key1.target]
			local FocusTarget = Gui and (Gui.focusTarget or Key1.target)
			local Source = Key1.source
			local CurrentCamera = Key.config.services.Workspace and Key.config.services.Workspace.CurrentCamera
			local NewResultDelta = nil
			local GuiService = Key.config.guiService
			
			if Key1.spec.world and CurrentCamera and not Source:IsA("GuiObject") then
				local ViewportPosition, OnScreen = CurrentCamera:WorldToViewportPoint(Source:GetPivot().Position)
				
				if OnScreen then
					NewResultDelta = TypesVector2.new(ViewportPosition.X, ViewportPosition.Y) - (if Parent1:IsA("ScreenGui") and not Parent1.IgnoreGuiInset and GuiService then GuiService:GetGuiInset() else TypesVector2.zero)
				end
			end
			local NewResultDelta1 = NewResultDelta or (Key1.position or (if FocusTarget and FocusTarget:IsA("GuiObject") then FocusTarget.AbsolutePosition else Key1.origin))
			local Parent2 = Parent.Parent
			local AbsolutePosition = if Parent2 and Parent2:IsA("GuiBase2d") then Parent2.AbsolutePosition else TypesVector2.zero
			local UIScale = Parent2 and Parent2:FindFirstChildWhichIsA("UIScale")
			local Scale = if UIScale and UIScale.Scale > 0 then UIScale.Scale else 1
			local FromOffsetResult = TypesUDim2.fromOffset((NewResultDelta1.X - AbsolutePosition.X) / Scale, (NewResultDelta1.Y - AbsolutePosition.Y) / Scale)
			local AbsolutePosition1 = Parent1.AbsolutePosition
			local NewAbsolutePosition = AbsolutePosition1 + Parent1.AbsoluteSize
			local FromOffsetResult1 = TypesUDim2.fromOffset((NewAbsolutePosition.X - AbsolutePosition.X) / Scale, (NewAbsolutePosition.Y - AbsolutePosition.Y) / Scale)
			local NewAbsolutePosition1 = AbsolutePosition1 + Parent.AbsoluteSize
			local FromOffsetResult2 = TypesUDim2.fromOffset((NewAbsolutePosition1.X - AbsolutePosition.X) / Scale, (NewAbsolutePosition1.Y - AbsolutePosition.Y) / Scale)
			local NewTypesVector = TypesVector2.new(FromOffsetResult2.X.Offset, FromOffsetResult2.Y.Offset)
			local NewTypesVector1 = TypesVector2.new(FromOffsetResult1.X.Offset, FromOffsetResult1.Y.Offset)
			local SpaceS: number = Key.metric("space.s")
			local Ghost = Key1.ghost
			
			if Key1.mode == "armed" and Ghost then
				local ArmedPreview = Key1.armedPreview
				local AbsolutePosition2 = if ArmedPreview and ArmedPreview.Parent and (Key1.target == nil or rawequal(Key1.target, Key1.source)) then ArmedPreview.AbsolutePosition else NewResultDelta1
				local Parent3 = Ghost.Parent
				local AbsolutePosition21 = if Parent3 and Parent3:IsA("GuiBase2d") then Parent3.AbsolutePosition else TypesVector2.zero
				local UIScale1 = Parent3 and Parent3:FindFirstChildWhichIsA("UIScale")
				local Scale1 = if UIScale1 and UIScale1.Scale > 0 then UIScale1.Scale else 1
				local FromOffsetResult3 = TypesUDim2.fromOffset((AbsolutePosition2.X - AbsolutePosition21.X) / Scale1, (AbsolutePosition2.Y - AbsolutePosition21.Y) / Scale1)
				local PreviewSize = Key1.previewSize
				local NewOffset = FromOffsetResult3.X.Offset + SpaceS
				local NewOffset1 = FromOffsetResult3.Y.Offset + SpaceS
				
				if FocusTarget and (FocusTarget:IsA("GuiObject") and not rawequal(Key1.target, Key1.source)) then
					local NewAbsolutePosition2 = FocusTarget.AbsolutePosition + FocusTarget.AbsoluteSize
					local Parent4 = Ghost.Parent
					local AbsolutePosition3 = if Parent4 and Parent4:IsA("GuiBase2d") then Parent4.AbsolutePosition else TypesVector2.zero
					local UIScale2 = Parent4 and Parent4:FindFirstChildWhichIsA("UIScale")
					local Scale2 = if UIScale2 and UIScale2.Scale > 0 then UIScale2.Scale else 1
					local FromOffsetResult31 = TypesUDim2.fromOffset((NewAbsolutePosition2.X - AbsolutePosition3.X) / Scale2, (NewAbsolutePosition2.Y - AbsolutePosition3.Y) / Scale2)
					NewOffset = FromOffsetResult31.X.Offset + SpaceS
					NewOffset1 = FromOffsetResult3.Y.Offset - PreviewSize.Y - NewTypesVector.Y - SpaceS * 3
					
					if NewOffset1 < SpaceS and FromOffsetResult31.Y.Offset + PreviewSize.Y + NewTypesVector.Y + SpaceS * 3 <= NewTypesVector1.Y then
						NewOffset1 = FromOffsetResult31.Y.Offset + SpaceS
					end
				end
				Ghost.AnchorPoint = TypesVector2.zero
				Ghost.Position = TypesUDim2.fromOffset(math.clamp(NewOffset, SpaceS, (math.max(SpaceS, NewTypesVector1.X - PreviewSize.X - SpaceS))), (math.clamp(NewOffset1, SpaceS, (math.max(SpaceS, NewTypesVector1.Y - PreviewSize.Y - NewTypesVector.Y - SpaceS * 3)))))
				FromOffsetResult = TypesUDim2.fromOffset(Ghost.Position.X.Offset - SpaceS, Ghost.Position.Y.Offset + PreviewSize.Y + SpaceS - Key.metric("targetSizes.minimum"))
			end
			Status:FindFirstChildWhichIsA("UISizeConstraint").MaxSize = TypesVector2.new(math.max(1, (math.min(280, NewTypesVector1.X - SpaceS * 4))), 1e999)
			Parent.Position = TypesUDim2.fromOffset(math.clamp(FromOffsetResult.X.Offset + SpaceS, SpaceS, (math.max(SpaceS, NewTypesVector1.X - NewTypesVector.X - SpaceS))), (math.clamp(FromOffsetResult.Y.Offset + Key.metric("targetSizes.minimum"), SpaceS, (math.max(SpaceS, NewTypesVector1.Y - NewTypesVector.Y - SpaceS)))))
		end
		
		local t = {}
		local Connection = nil
		
		local function schedulePlacement(Key1)
			-- upvalues: Key (copy), placeStatus (copy), t (ref), Connection (ref)
			local RunService = Key.config.services.RunService
			
			if RunService == nil then
				placeStatus(Key1)
				
				return
			end
			t[Key1] = true
			
			if Connection == nil then
				Connection = (RunService.PreRender or RunService.Heartbeat):Connect(function()
					-- upvalues: Connection (upval), t (upval), placeStatus (upval)
					if Connection then
						Connection:Disconnect()
						Connection = nil
					end
					local t1 = t
					t = {}
					
					for i in t1 do
						placeStatus(i)
					end
				end)
			end
		end
		
		local _ = function(Key)
			-- upvalues: t (ref), Connection (ref)
			t[Key] = nil
			
			if Connection and next(t) == nil then
				Connection:Disconnect()
				Connection = nil
			end
		end
		
		local function updateStatus(p1)
			-- upvalues: Guis (copy), Key (copy), schedulePlacement (copy)
			local Status = p1.status
			
			if not Status then return end
			local WaitingForConfirmation = if p1.spec.statusLabels == false then "" elseif p1.pending then "Waiting for confirmation…" elseif p1.accepted then ({ move = "Move", copy = "Copy", apply = "Apply" })[p1.operation] elseif p1.target then p1.reason or "Cannot drop here" elseif p1.mode == "armed" then "Choose a destination" else "Cannot drop here"
			
			if p1.spec.statusLabels ~= false and p1.accepted and p1.target and Guis[p1.target].label and not p1.pending then
				WaitingForConfirmation ..= " to " .. Key.read(assert(Guis[p1.target].label))
			end
			if p1.mode == "armed" and not p1.pending then
				local EffectiveInputResult = p1.effectiveInput(nil)
				WaitingForConfirmation = (WaitingForConfirmation .. (if WaitingForConfirmation == "" then "" else " · ")) .. (if EffectiveInputResult == "Gamepad" then "A: drop · B: cancel" elseif EffectiveInputResult == "Touch" then "Tap a destination" else "Enter: drop · Esc: cancel · Tab: destination")
				
				if EffectiveInputResult == "Gamepad" and p1.spec.navigationHint then
					WaitingForConfirmation ..= " · " .. p1.spec.navigationHint
				end
			end
			if Status.Text ~= WaitingForConfirmation then
				Status.Text = WaitingForConfirmation
			end
			local Parent = Status.Parent
			Parent.Visible = WaitingForConfirmation ~= "" and (p1.pending or (p1.mode == "armed" or (not p1.accepted or p1.operation ~= "move")))
			
			if Parent.Visible or p1.mode == "armed" then
				schedulePlacement(p1)
				
				return
			end
		end
		
		local t1 = {}
		local Count = 0
		
		local _ = function()
			-- upvalues: t1 (copy)
			for i, value in t1 do
				t1[i] = nil
				value.stop()
			end
		end
		
		local function statusPanel(LayerCollector)
			-- upvalues: Key (copy), TypesUDim2 (copy), TypesVector2 (copy), Compose (copy), Tbl (ref), updateStatus (copy)
			local v3 = nil
			local v4 = nil
			local v5 = nil
			
			return {
				frame = assert(v4),
				label = assert(v3),
				input = assert(v5),
				stop = Key.runtime.mount(function()
					-- upvalues: Key (upval), v5 (ref), TypesUDim2 (upval), TypesVector2 (upval), LayerCollector (copy), v3 (ref), Compose (upval), Tbl (upval), updateStatus (upval), v4 (ref)
					local EffectiveInputResult = Key.effectiveInput()
					v5 = EffectiveInputResult
					local Text = Key.styled(Key.Host.TextLabel({
						Name = "DragStatusText",
						Size = TypesUDim2.fromOffset(0, 0),
						AutomaticSize = Key.types.Enum.AutomaticSize.XY,
						TextWrapped = true,
						Text = "Choose a destination",
						ZIndex = 1002,
						Key.Host.UISizeConstraint({
							MaxSize = TypesVector2.new(math.max(1, (math.min(280, LayerCollector.AbsoluteSize.X - 32))), 1e999)
						})
					}), "text")
					v3 = Text
					Compose.watch(function(p1)
						-- upvalues: EffectiveInputResult (copy), Tbl (upval), Text (copy), updateStatus (upval)
						EffectiveInputResult(p1)
						local Tbl1 = Tbl
						
						if Tbl1 and Tbl1.status == Text then
							updateStatus(Tbl1)
						end
					end)
					local Tooltip = Key.styled(Key.Host.Frame({
						Name = "DragStatus",
						Size = TypesUDim2.fromOffset(0, 0),
						AutomaticSize = Key.types.Enum.AutomaticSize.XY,
						ZIndex = 1001,
						Attributes = { FacetDragFeedback = true },
						Key.Host.UIPadding({
							PaddingTop = Key.types.UDim.new(0, Key.metric("space.s")),
							PaddingBottom = Key.types.UDim.new(0, Key.metric("space.s")),
							PaddingLeft = Key.types.UDim.new(0, Key.metric("space.s")),
							PaddingRight = Key.types.UDim.new(0, Key.metric("space.s"))
						}),
						Text
					}), "tooltip")
					v4 = Tooltip
					
					return Tooltip
				end, LayerCollector)
			}
		end
		
		function config.own(p1)
			-- upvalues: Count (ref), Compose (copy), ReleaseResults (copy), Tbl (ref), t1 (copy)
			Count += 1
			Compose.cleanup(function()
				-- upvalues: ReleaseResults (upval), p1 (copy), Count (upval), Tbl (upval), t1 (upval)
				if ReleaseResults[p1] then
					ReleaseResults[p1]()
				end
				Count -= 1
				
				if Count == 0 and Tbl == nil then
					for i, value in t1 do
						t1[i] = nil
						value.stop()
					end
				end
			end)
		end
		
		local function releaseGhost(p2, p3, Callback: () -> ())
			-- upvalues: Key (copy), MotionModule (upval), available (copy), TypesVector2 (copy), TypesUDim2 (copy), ReleaseResults (copy), DragTravelModule (upval)
			local ReturnTravel = p2.spec.returnTravel or p2.travelled
			
			if not ReturnTravel then
				Callback()
			end
			local Ghost = p2.ghost
			
			if Ghost then
				local function _()
					-- upvalues: p2 (copy), Ghost (copy), ReturnTravel (copy), Callback (copy)
					if p2.stopPreview then
						p2.stopPreview()
					end
					Ghost:Destroy()
					
					if ReturnTravel then
						Callback()
					end
				end
				
				local GuiService = Key.config.guiService
				local UIScale: boolean = GuiService ~= nil and GuiService.ReducedMotionEnabled == true
				
				if MotionModule.resolve(Key.read(Key.config.motionLevel), UIScale) ~= "normal" or ReturnTravel and p2.travelled and p3 or not p3 and not available(p2.source) or not Ghost.Parent then
					if p2.stopPreview then
						p2.stopPreview()
					end
					Ghost:Destroy()
					
					if ReturnTravel then
						Callback()
					end
					return
				else
					local NewPickupSize = ((if p2.spec.returnPosition then p2.spec.returnPosition() elseif p2.source:IsA("GuiObject") then p2.source.AbsolutePosition + p2.source.AbsoluteSize / 2 else p2.origin) or p2.origin) - p2.pickupSize / 2 + Ghost.AnchorPoint * (assert(p2.previewSize) / (p2.liftScale or (p2.spec.previewScale or 1)))
					local Position = Ghost.Position
					local Parent = Ghost.Parent
					local AbsolutePosition = if Parent and Parent:IsA("GuiBase2d") then Parent.AbsolutePosition else TypesVector2.zero
					local UIScale1 = Parent and Parent:FindFirstChildWhichIsA("UIScale")
					local Scale = if UIScale1 and UIScale1.Scale > 0 then UIScale1.Scale else 1
					local FromOffsetResult = TypesUDim2.fromOffset((NewPickupSize.X - AbsolutePosition.X) / Scale, (NewPickupSize.Y - AbsolutePosition.Y) / Scale)
					UIScale = nil
					local Callback2 = nil
					local Scale1 = 1
					
					if p3 or p2.spec.previewScale ~= nil then
						UIScale = Ghost:FindFirstChildWhichIsA("UIScale")
						
						if not UIScale then
							local v3 = nil
							local Scale11 = 1
							Callback2 = Key.runtime.mount(function()
								-- upvalues: Key (upval), Scale11 (copy), v3 (ref)
								local UIScaleResult = Key.Host.UIScale({ Scale = Scale11 })
								v3 = UIScaleResult
								
								return UIScaleResult
							end, Ghost)
							UIScale = assert(v3)
						end
						Scale1 = assert(UIScale).Scale
					end
					local Callback1 = nil
					local Flag = false
					
					local function stop()
						-- upvalues: Flag (ref), ReleaseResults (upval), p2 (copy), Callback1 (ref), Callback2 (ref), Ghost (copy), ReturnTravel (copy), Callback (copy)
						if Flag then return end
						Flag = true
						ReleaseResults[p2.source] = nil
						
						if Callback1 then
							Callback1()
						end
						if Callback2 then
							Callback2()
						end
						if p2.stopPreview then
							p2.stopPreview()
						end
						Ghost:Destroy()
						
						if ReturnTravel then
							Callback()
						end
					end
					
					ReleaseResults[p2.source] = stop
					Callback1 = DragTravelModule(Key, assert(Ghost.Parent), function(Alpha: number)
						-- upvalues: UIScale (ref), p3 (copy), Scale1 (ref), p2 (copy), Ghost (copy), Position (copy), FromOffsetResult (copy)
						if UIScale then
							UIScale.Scale = if p3 then Scale1 * (1 - Alpha) else Scale1 * (1 + (1 / (p2.liftScale or (p2.spec.previewScale or 1)) - 1) * Alpha)
							
							if not p3 then
								Ghost.Position = Position:Lerp(FromOffsetResult, Alpha)
								
								return
							end
						else
							Ghost.Position = Position:Lerp(FromOffsetResult, Alpha)
						end
					end, stop)
					
					return
				end
			elseif ReturnTravel then
				Callback()
			end
		end
		
		function config.finish(Enabled, DropRejected)
			-- upvalues: Tbl (ref), t (ref), Connection (ref), CellResult (copy), leave (copy), ReleaseResults (copy), releaseGhost (copy), Key (copy), ActivationModule (upval)
			local Tbl1 = Tbl
			
			if not Tbl1 then return end
			Tbl = nil
			t[Tbl1] = nil
			
			if Connection and next(t) == nil then
				Connection:Disconnect()
				Connection = nil
			end
			if Tbl1.stopLift then
				Tbl1.stopLift()
				Tbl1.stopLift = nil
			end
			if Tbl1.stopTravel then
				Tbl1.stopTravel()
				Tbl1.stopTravel = nil
			end
			CellResult:set(nil)
			
			if Tbl1.stop then
				Tbl1.stop()
			end
			leave(Tbl1)
			
			if Tbl1.pendingTarget and Tbl1.pendingTarget ~= Tbl1.target then
				Tbl1.pendingTarget:SetAttribute("FacetDropState", nil)
				Tbl1.pendingTarget:SetAttribute("FacetDropReason", nil)
			end
			if Tbl1.stopStatus then
				Tbl1.stopStatus()
			end
			local Flag = false
			
			local function conclude()
				-- upvalues: Flag (ref), ReleaseResults (upval), Tbl1 (copy), Enabled (copy), DropRejected (copy)
				if Flag then return end
				Flag = true
				ReleaseResults[Tbl1.source] = nil
				Tbl1.source:RemoveTag("facet-drag-held")
				Tbl1.source:SetAttribute("FacetDragHeld", nil)
				
				if Tbl1.spec.onEnd then
					Tbl1.spec.onEnd(Enabled == true, DropRejected)
				end
			end
			
			if Tbl1.world then
				local ReleaseResult = Tbl1.world.release(Enabled == true, conclude)
				
				if not Flag then
					ReleaseResults[Tbl1.source] = ReleaseResult
				end
			elseif (Enabled or not Tbl1.spec.returnTravel) and not Flag then
				Flag = true
				ReleaseResults[Tbl1.source] = nil
				Tbl1.source:RemoveTag("facet-drag-held")
				Tbl1.source:SetAttribute("FacetDragHeld", nil)
				
				if Tbl1.spec.onEnd then
					Tbl1.spec.onEnd(Enabled == true, DropRejected)
				end
			end
			if not Tbl1.world then
				releaseGhost(Tbl1, Enabled, conclude)
			end
			if Tbl1.highlight then
				Tbl1.highlight:Destroy()
			end
			if Tbl1.press and Enabled == true then
				local Callback = nil
				Callback = assert(Key.runtime.host.frames).onFrame(function()
					-- upvalues: ActivationModule (upval), Tbl1 (copy), Callback (ref)
					ActivationModule.release(Tbl1.press)
					
					if Callback then
						Callback()
					end
				end)
			end
		end
		
		function config.hover(Target, Hit)
			-- upvalues: Tbl (ref), leave (copy), Guis (copy), info (copy), validate (copy), Key (copy), updateStatus (copy), CellResult (copy)
			if not Tbl or Tbl.pending then return end
			if Tbl.target ~= Target then
				leave(Tbl)
				Tbl.target = Target
				
				if Tbl.highlight then
					Tbl.highlight:Destroy()
					Tbl.highlight = nil
				end
				local OnEnter: (any) -> () = Target and Guis[Target].onEnter
				
				if OnEnter then
					OnEnter(Tbl.payload)
				end
			end
			Tbl.hit = Hit
			Tbl.accepted = false
			Tbl.reason = nil
			Tbl.operation = nil
			
			if Target then
				local InfoResult = info(Target)
				local ValidateResult, ValidateResult2 = validate(Target, InfoResult)
				Tbl.accepted = ValidateResult
				Tbl.reason = ValidateResult2
				Tbl.operation = InfoResult.operation
				local Accepted: string = if ValidateResult then "accepted" else "rejected"
				
				if Target:GetAttribute("FacetDropState") ~= Accepted then
					Target:SetAttribute("FacetDropState", Accepted)
				end
				if Target:GetAttribute("FacetDropReason") ~= ValidateResult2 then
					Target:SetAttribute("FacetDropReason", ValidateResult2)
				end
				local Feedback = Guis[Target].feedback
				
				if Feedback then
					if Feedback.Enabled ~= ValidateResult then
						Feedback.Enabled = ValidateResult
					end
					if Feedback:IsA("UIStroke") then
						local FacetDropAccepted: string = if ValidateResult then "facet-drop-accepted" else "facet-drop-rejected"
						local FacetDropRejected: string = if ValidateResult then "facet-drop-rejected" else "facet-drop-accepted"
						
						if Feedback:HasTag(FacetDropRejected) then
							Feedback:RemoveTag(FacetDropRejected)
						end
						if not Feedback:HasTag(FacetDropAccepted) then
							Feedback:AddTag(FacetDropAccepted)
						end
					end
				end
				local OnUpdateFunction: (any, any, any, any) -> () = Guis[Target].onUpdate
				
				if OnUpdateFunction then
					OnUpdateFunction(Tbl.payload, InfoResult, ValidateResult, ValidateResult2)
				end
			end
			if Tbl.world then
				local Gui = Target and Guis[Target]
				local WorldPlacement = Gui and Gui.worldPlacement
				Tbl.world.move(Tbl.position, if Tbl.accepted and WorldPlacement then Key.read(WorldPlacement) else nil)
			end
			updateStatus(Tbl)
			local PeekResult = CellResult:peek()
			
			if PeekResult == nil or PeekResult.source ~= Tbl.source or PeekResult.target ~= Tbl.target or PeekResult.hit ~= Tbl.hit or PeekResult.accepted ~= Tbl.accepted or PeekResult.reason ~= Tbl.reason or PeekResult.operation ~= Tbl.operation or (PeekResult.pending ~= Tbl.pending or PeekResult.mode ~= Tbl.mode) then
				CellResult:set(table.clone(Tbl))
				
				return
			end
			local Tbl1 = Tbl
			
			for i1 in PeekResult do
				if Tbl1[i1] == nil then
					PeekResult[i1] = nil
				end
			end
			for i, value in Tbl1 do
				PeekResult[i] = value
			end
		end
		
		function config.update(Position)
			-- upvalues: Tbl (ref), TypesVector2 (copy), TypesUDim2 (copy), config (copy), hitTest (copy)
			if not Tbl or Tbl.pending then return end
			Tbl.position = Position
			local Ghost = Tbl.ghost
			
			if Ghost then
				local Parent = Ghost.Parent
				local AbsolutePosition = if Parent and Parent:IsA("GuiBase2d") then Parent.AbsolutePosition else TypesVector2.zero
				local UIScale = Parent and Parent:FindFirstChildWhichIsA("UIScale")
				local Scale = if UIScale and UIScale.Scale > 0 then UIScale.Scale else 1
				Ghost.Position = TypesUDim2.fromOffset((Position.X - AbsolutePosition.X) / Scale, (Position.Y - AbsolutePosition.Y) / Scale)
			end
			config.hover(hitTest(Position))
		end
		
		function config.commit(Frame, Position): boolean
			-- upvalues: Tbl (ref), config (copy), hitTest (copy), Guis (copy), info (copy), validate (copy), CellResult (copy), Key (copy), MotionModule (upval), TypesVector2 (copy), TypesUDim2 (copy), DragTravelModule (upval), updateStatus (copy)
			if not Tbl or Tbl.pending then
				return false
			end
			if Position then
				Tbl.position = Position
			end
			if Frame == nil and Tbl.mode == "pointer" and Tbl.position then
				config.hover(hitTest(Tbl.position))
			end
			local Frame1 = Frame or Tbl.target
			
			if not Frame1 or not Guis[Frame1] then
				config.finish(false, "No destination")
				
				return false
			end
			local Tbl1 = Tbl
			local Gui = Guis[Frame1]
			local InfoResult = info(Frame1)
			local ValidateResult, ValidateResult2 = validate(Frame1, InfoResult)
			
			if ValidateResult then
				if Tbl1.world and not Tbl1.travelled then
					Tbl1.world.move(Tbl1.position, InfoResult.worldPlacement)
					Tbl1.pending = true
					Tbl1.pendingTarget = Frame1
					Frame1:SetAttribute("FacetDropState", "pending")
					CellResult:set(table.clone(Tbl1))
					Tbl1.world.land(function()
						-- upvalues: Tbl (upval), Tbl1 (copy), config (upval), Frame1 (copy)
						if Tbl == Tbl1 then
							Tbl1.pending = false
							Tbl1.travelled = true
							config.commit(Frame1)
							
							return
						end
					end)
					
					return true
				end
				if Gui.travel and not Tbl1.travelled and Tbl1.ghost then
					local Ghost = Tbl1.ghost
					local GuiService = Key.config.guiService
					local IsNotNormal = MotionModule.resolve(Key.read(Key.config.motionLevel), GuiService ~= nil and GuiService.ReducedMotionEnabled == true) ~= "normal"
					local LandingResult = if Gui.landing then Gui.landing(InfoResult) elseif Frame1:IsA("GuiObject") then {
						x = Frame1.AbsolutePosition.X,
						y = Frame1.AbsolutePosition.Y,
						w = Frame1.AbsoluteSize.X,
						h = Frame1.AbsoluteSize.Y
					} else nil
					
					if LandingResult and not IsNotNormal then
						Tbl1.pending = true
						Tbl1.pendingTarget = Frame1
						Frame1:SetAttribute("FacetDropState", "pending")
						CellResult:set(table.clone(Tbl1))
						local Position1 = Ghost.Position
						local PreviewSize = Tbl1.previewSize or Tbl1.pickupSize
						local PreviewScale = Tbl1.spec.previewScale or 1
						local NewTypesVectorRatio = TypesVector2.new(LandingResult.w * (if Tbl1.pickupSize.X > 0 then PreviewSize.X / Tbl1.pickupSize.X else 1), LandingResult.h * (if Tbl1.pickupSize.Y > 0 then PreviewSize.Y / Tbl1.pickupSize.Y else 1)) / (Tbl1.liftScale or PreviewScale)
						local NewNewTypesVector = TypesVector2.new(LandingResult.x, LandingResult.y) + Ghost.AnchorPoint * NewTypesVectorRatio
						local Parent = Ghost.Parent
						local AbsolutePosition = if Parent and Parent:IsA("GuiBase2d") then Parent.AbsolutePosition else TypesVector2.zero
						local UIScale = Parent and Parent:FindFirstChildWhichIsA("UIScale")
						local Scale = if UIScale and UIScale.Scale > 0 then UIScale.Scale else 1
						local FromOffsetResult = TypesUDim2.fromOffset((NewNewTypesVector.X - AbsolutePosition.X) / Scale, (NewNewTypesVector.Y - AbsolutePosition.Y) / Scale)
						local UIScale1 = Ghost:FindFirstChildWhichIsA("UIScale")
						local UIScale11 = Ghost and Ghost:FindFirstChildWhichIsA("UIScale")
						local Scale1 = if UIScale11 and UIScale11.Scale > 0 then UIScale11.Scale else 1
						local ScaledScale = if Tbl1.pickupSize.X > 0 and Tbl1.pickupSize.Y > 0 and LandingResult.w > 0 and LandingResult.h > 0 then Scale1 / (Tbl1.liftScale or PreviewScale) * math.min(LandingResult.w / Tbl1.pickupSize.X, LandingResult.h / Tbl1.pickupSize.Y) else Scale1
						
						if not UIScale1 then
							local v3 = nil
							local MountResult = Key.runtime.mount(function()
								-- upvalues: Key (upval), Scale1 (copy), v3 (ref)
								local UIScaleResult = Key.Host.UIScale({ Scale = Scale1 })
								v3 = UIScaleResult
								
								return UIScaleResult
							end, Ghost)
							UIScale1 = assert(v3)
							local StopPreviewFunction = Tbl1.stopPreview
							
							function Tbl1.stopPreview()
								-- upvalues: StopPreviewFunction (copy), MountResult (copy)
								if StopPreviewFunction then
									StopPreviewFunction()
								end
								MountResult()
							end
						end
						local v4 = assert(UIScale1)
						Tbl1.stopTravel = DragTravelModule(Key, assert(Ghost.Parent), function(Alpha)
							-- upvalues: v4 (copy), Scale1 (copy), ScaledScale (copy), Ghost (copy), Position1 (copy), FromOffsetResult (copy), PreviewSize (copy), NewTypesVectorRatio (copy), TypesUDim2 (upval)
							v4.Scale = Scale1 + (ScaledScale - Scale1) * Alpha
							Ghost.Position = Position1:Lerp(FromOffsetResult, Alpha)
							local Interpolated = PreviewSize:Lerp(NewTypesVectorRatio, Alpha)
							local Parent = Ghost.Parent
							local UIScale = Parent and Parent:FindFirstChildWhichIsA("UIScale")
							local Scale1 = if UIScale and UIScale.Scale > 0 then UIScale.Scale else 1
							local UIScale1 = Ghost and Ghost:FindFirstChildWhichIsA("UIScale")
							local ScaledScale1 = Scale1 * (if UIScale1 and UIScale1.Scale > 0 then UIScale1.Scale else 1)
							Ghost.Size = TypesUDim2.fromOffset(Interpolated.X / ScaledScale1, Interpolated.Y / ScaledScale1)
						end, function()
							-- upvalues: Tbl (upval), Tbl1 (copy), config (upval), Frame1 (copy)
							if Tbl == Tbl1 then
								Tbl1.pending = false
								Tbl1.travelled = true
								config.commit(Frame1)
								
								return
							end
						end)
						
						return true
					end
				end
				local Flag = false
				
				function InfoResult.complete(p2, p3)
					-- upvalues: Flag (ref), Tbl (upval), Tbl1 (copy), validate (upval), Frame1 (copy), InfoResult (copy), config (upval), Gui (copy)
					if Flag or Tbl ~= Tbl1 then
						return false
					end
					Flag = true
					
					if p2 then
						p2, p43 = validate(Frame1, InfoResult)
					end
					config.finish(p2, p3)
					
					if not p2 and Gui.onReject then
						Gui.onReject(Tbl1.payload, p3)
					end
					return p2
				end
				
				Tbl1.pending = true
				Tbl1.pendingTarget = Frame1
				Tbl1.executing = true
				updateStatus(Tbl1)
				CellResult:set(Tbl1)
				Frame1:SetAttribute("FacetDropState", "pending")
				local Success, Result = pcall(Gui.onDrop, Tbl1.payload, InfoResult)
				Tbl1.executing = false
				
				if not Success then
					InfoResult.complete(false, (tostring(Result)))
					
					return false
				end
				if Result ~= "pending" and not Flag and Tbl == Tbl1 then
					Flag = true
					config.finish(Result ~= false, if Result == false then "Drop rejected" else nil)
					
					if Result == false and Gui.onReject then
						Gui.onReject(Tbl1.payload, "Drop rejected")
					end
				end
				return Result ~= false
			else
				config.finish(false, ValidateResult2)
				
				if Gui.onReject then
					Gui.onReject(Tbl1.payload, ValidateResult2)
				end
				return false
			end
		end
		
		function config.begin(Frame: Frame, Spec, Mode, Press, Enabled, p2)
			-- upvalues: Tbl (ref), ReleaseResults (copy), TypesVector2 (copy), DragWorldVisualModule (upval), Key (copy), statusPanel (copy), t1 (copy), updateStatus (copy), ActivationModule (upval), TypesUDim2 (copy), Compose (copy), raiseStatus (copy), CellResult (copy), GestureServiceModule (upval), config (copy), available (copy), Guis (copy)
			if Tbl then return end
			if ReleaseResults[Frame] then
				ReleaseResults[Frame]()
			end
			local PayloadFunction = Spec.payload
			local Payload = nil
			
			if type(PayloadFunction) == "function" then
				local Success, Result = pcall(PayloadFunction, Frame)
				
				if not Success then
					error(Result, 0)
				end
				Payload = Result
			else
				Payload = PayloadFunction
			end
			if Payload == nil then return end
			local Source = if p2 then p2.source else Frame
			local AbsoluteSize = if Source:IsA("GuiObject") then Source.AbsoluteSize else TypesVector2.zero
			local PositionDelta = if p2 then p2.position - p2.source.AbsolutePosition else AbsoluteSize / 2
			local PeekResult = if Spec.liftValue then Spec.liftValue:peek() else Spec.previewScale or 1
			local PeekResult1 = if Spec.liftValue then PeekResult else 1
			local NewTypesVector = TypesVector2.new(if AbsoluteSize.X > 0 then math.clamp((PositionDelta.X / AbsoluteSize.X + (PeekResult1 - 1) / 2) / PeekResult1, 0, 1) else 0.5, if AbsoluteSize.Y > 0 then math.clamp((PositionDelta.Y / AbsoluteSize.Y + (PeekResult1 - 1) / 2) / PeekResult1, 0, 1) else 0.5)
			local config1 = {
				pickupSize = AbsoluteSize,
				liftScale = PeekResult,
				pickupAnchor = NewTypesVector,
				position = if Mode == "pointer" and p2 then p2.position elseif Mode == "pointer" and Press then TypesVector2.new(Press.Position.X, Press.Position.Y) else nil,
				source = Frame,
				spec = Spec,
				mode = Mode,
				payload = Payload,
				press = Press,
				origin = if Spec.returnPosition then Spec.returnPosition() elseif Frame:IsA("GuiObject") then Frame.AbsolutePosition + Frame.AbsoluteSize / 2 else TypesVector2.zero
			}
			Tbl = config1
			
			if not Frame:IsA("GuiObject") then
				config1.world = DragWorldVisualModule(Key, Frame, assert(Spec.world), config1.position)
			end
			local LayerCollector = (if Spec.world then Spec.world.focusTarget else Frame):FindFirstAncestorWhichIsA("LayerCollector")
			local Callback = nil
			
			if Spec.world and (LayerCollector == nil or not LayerCollector:IsA("ScreenGui")) then
				local OverlayParent = Key.config.overlayParent
				
				if OverlayParent and OverlayParent:IsA("GuiBase2d") then
					LayerCollector = OverlayParent
				else
					local Players = Key.config.services.Players
					local LocalPlayer = Players and Players.LocalPlayer
					local PlayerGui = LocalPlayer and LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
					
					if PlayerGui then
						Callback, LayerCollector = Key.runtime.mount(function()
							-- upvalues: Key (upval)
							return Key.Host.ScreenGui({
								Name = "FacetWorldDragStatus",
								ResetOnSpawn = false,
								DisplayOrder = 1000
							})
						end, PlayerGui)
					end
				end
			end
			if LayerCollector then
				local StatusPanelResult1 = nil
				if Spec.world then
					local StatusPanelResult = statusPanel(LayerCollector)
					StatusPanelResult1 = StatusPanelResult
					
					function config1.stopStatus()
						-- upvalues: StatusPanelResult (copy), Callback (ref)
						StatusPanelResult.stop()
						
						if Callback then
							Callback()
						end
					end
				else
					local Entry = t1[LayerCollector]
					
					if Entry == nil or Entry.frame.Parent ~= LayerCollector then
						Entry = statusPanel(LayerCollector)
						t1[LayerCollector] = Entry
					end
					StatusPanelResult1 = Entry
					Entry.frame.Visible = true
					
					function config1.stopStatus()
						-- upvalues: Entry (copy)
						Entry.frame.Visible = false
					end
				end
				config1.status = StatusPanelResult1.label
				config1.effectiveInput = StatusPanelResult1.input
				updateStatus(config1)
			end
			ActivationModule.consume(Press)
			
			if Enabled ~= false and Frame:IsA("GuiObject") then
				local LayerCollector1 = Frame:FindFirstAncestorWhichIsA("LayerCollector")
				
				if LayerCollector1 then
					local LiftVisual = if PeekResult == 1 or not Spec.liftVisual or not Spec.liftVisual.Visible then nil else Spec.liftVisual
					local LiftVisual1 = LiftVisual or (Spec.preview or (Enabled or Frame))
					local DragGhost = LiftVisual1:Clone()
					local Descendants = DragGhost:GetDescendants()
					table.insert(Descendants, DragGhost)
					
					for _, descendant in Descendants do
						if descendant:IsA("GuiObject") then
							descendant.Interactable = false
							descendant.Active = false
							descendant.Selectable = false
						elseif descendant:IsA("UIDragDetector") then
							descendant.Enabled = false
						elseif descendant:IsA("InputContext") then
							descendant.Enabled = false
						end
					end
					DragGhost:RemoveTag("facet-drag-held")
					DragGhost:SetAttribute("FacetDragHeld", nil)
					DragGhost.Name = "DragGhost"
					DragGhost.ZIndex = 1000
					DragGhost.AnchorPoint = NewTypesVector
					DragGhost:SetAttribute("FacetDragFeedback", true)
					DragGhost.Parent = LayerCollector1
					local Parent: boolean = PeekResult > 0 and PeekResult < 1e999
					assert(Parent, "Facet drag previewScale must be positive and finite")
					Parent = LiftVisual1
					local v3 = 1
					while Parent and Parent ~= LayerCollector1 do
						local UIScale2 = Parent and Parent:FindFirstChildWhichIsA("UIScale")
						v3 *= if UIScale2 and UIScale2.Scale > 0 then UIScale2.Scale else 1
						Parent = Parent.Parent
					end
					local v4 = v3 / (if LiftVisual then PeekResult else 1)
					local ScaledPeekResult = v4 * PeekResult
					local UIScale1 = DragGhost:FindFirstChildWhichIsA("UIScale")
					
					if UIScale1 then
						UIScale1.Scale = ScaledPeekResult
					elseif ScaledPeekResult ~= 1 then
						Parent = nil
						local _ = assert(Parent)
						config1.stopPreview = Key.runtime.mount(function()
							-- upvalues: Key (upval), ScaledPeekResult (copy), Parent (ref)
							local UIScaleResult = Key.Host.UIScale({ Scale = ScaledPeekResult })
							Parent = UIScaleResult
							
							return UIScaleResult
						end, DragGhost)
					end
					local UIScale3 = LayerCollector1 and LayerCollector1:FindFirstChildWhichIsA("UIScale")
					local v5 = (if UIScale3 and UIScale3.Scale > 0 then UIScale3.Scale else 1) * v4
					DragGhost.Size = TypesUDim2.fromOffset(Frame.AbsoluteSize.X / v5, Frame.AbsoluteSize.Y / v5)
					config1.previewSize = Frame.AbsoluteSize * PeekResult
					local Position = config1.position or config1.origin
					local Parent1 = DragGhost.Parent
					local AbsolutePosition = if Parent1 and Parent1:IsA("GuiBase2d") then Parent1.AbsolutePosition else TypesVector2.zero
					local UIScale4 = Parent1 and Parent1:FindFirstChildWhichIsA("UIScale")
					local Scale = if UIScale4 and UIScale4.Scale > 0 then UIScale4.Scale else 1
					DragGhost.Position = TypesUDim2.fromOffset((Position.X - AbsolutePosition.X) / Scale, (Position.Y - AbsolutePosition.Y) / Scale)
					config1.ghost = DragGhost
					
					if Spec.liftValue and Spec.liftCarry and config1.mode ~= "armed" then
						Spec.liftCarry()
					end
					local LiftValue = Spec.liftValue
					
					if LiftValue then
						local UIScale = DragGhost:FindFirstChildWhichIsA("UIScale")
						
						if not UIScale then
							local v6 = nil
							local v7 = assert(v6)
							config1.stopPreview = Key.runtime.mount(function()
								-- upvalues: Key (upval), ScaledPeekResult (copy), v6 (ref)
								local UIScaleResult = Key.Host.UIScale({ Scale = ScaledPeekResult })
								v6 = UIScaleResult
								
								return UIScaleResult
							end, DragGhost)
							UIScale = v7
						end
						local v8 = assert(UIScale)
						config1.stopLift = Key.runtime.mountFragment(function()
							-- upvalues: Compose (upval), LiftValue (copy), v8 (copy), v4 (copy), config1 (copy), AbsoluteSize (copy)
							Compose.watch(function(Callback)
								-- upvalues: LiftValue (upval), v8 (upval), v4 (upval), config1 (upval), AbsoluteSize (upval)
								local CallbackResult = Callback(LiftValue)
								v8.Scale = v4 * CallbackResult
								config1.previewSize = AbsoluteSize * CallbackResult
								config1.liftScale = CallbackResult
							end)
							
							return {}
						end, DragGhost)
					end
					raiseStatus(DragGhost)
				end
			end
			if Spec.mark ~= false then
				Frame:AddTag("facet-drag-held")
				Frame:SetAttribute("FacetDragHeld", true)
			end
			CellResult:set(table.clone(config1))
			local OnStartFunction = Spec.onStart
			
			if OnStartFunction then
				GestureServiceModule(Key).capture(Frame, function()
					-- upvalues: OnStartFunction (copy), Payload (copy), Mode (copy)
					OnStartFunction(Payload, Mode)
				end)
			end
			local Tbl1 = Tbl
			
			if Tbl1 then
				Tbl1.stop = assert(Key.runtime.host.frames).onFrame(function(p3)
					-- upvalues: Tbl (upval), Tbl1 (copy), Spec (copy), config (upval), available (upval), updateStatus (upval), Guis (upval), TypesVector2 (upval)
					if Tbl ~= Tbl1 then return end
					if Spec.valid and not Spec.valid() then
						config.finish(false, "The source changed")
						
						return
					end
					local PendingTarget = Tbl1.pendingTarget or Tbl1.target
					
					if PendingTarget and not available(PendingTarget) then
						config.finish(false, "The destination was removed")
						
						return
					end
					updateStatus(Tbl1)
					
					if Tbl1.mode == "armed" and not Tbl1.pending then
						config.hover(Tbl1.target, nil)
					end
					if Tbl1.position and not Tbl1.pending then
						config.update(Tbl1.position)
						local Target = Tbl1.target
						local Gui = if Target then Guis[Target] else nil
						
						if Gui and Gui.autoscroll == false then return end
						local NewTypesVector = nil
						if Gui and Gui.scroll then
							if Gui.scroll(Tbl1.position, p3) then return end
							Target = Target.Parent
						end
						while Target do
							if Target:IsA("ScrollingFrame") and Target.ScrollingEnabled then
								local PositionDelta = Tbl1.position - Target.AbsolutePosition
								local AbsoluteWindowSize = Target.AbsoluteWindowSize
								
								local function _(p4: number, p5: number)
									local Smallest = math.min(40, p5 / 4)
									
									return if Smallest <= 0 or p4 < 0 or p5 < p4 then 0 elseif p4 < Smallest then -(Smallest - p4) / Smallest elseif p5 - Smallest < p4 then (p4 - p5 + Smallest) / Smallest else 0
								end
								
								local X: number = PositionDelta.X
								local X1: number = AbsoluteWindowSize.X
								local Smallest = math.min(40, X1 / 4)
								local XRatio = if Smallest <= 0 or X < 0 or X1 < X then 0 elseif X < Smallest then -(Smallest - X) / Smallest elseif X1 - Smallest < X then (X - X1 + Smallest) / Smallest else 0
								local Y: number = PositionDelta.Y
								local Y1: number = AbsoluteWindowSize.Y
								local Smallest1 = math.min(40, Y1 / 4)
								local YRatio = if Smallest1 <= 0 or Y < 0 or Y1 < Y then 0 elseif Y < Smallest1 then -(Smallest1 - Y) / Smallest1 elseif Y1 - Smallest1 < Y then (Y - Y1 + Smallest1) / Smallest1 else 0
								local ScrollArmed = Tbl1.scrollArmed or {}
								Tbl1.scrollArmed = ScrollArmed
								
								if not ScrollArmed[Target] then
									local IsYBelow: boolean = PositionDelta.X >= 0 and (PositionDelta.Y >= 0 and PositionDelta.X <= AbsoluteWindowSize.X) and PositionDelta.Y <= AbsoluteWindowSize.Y
									ScrollArmed[Target] = Tbl1.source:IsDescendantOf(Target) or IsYBelow and (XRatio == 0 and YRatio == 0)
								end
								local CanvasPosition = Target.CanvasPosition
								local AbsoluteCanvasSizeDelta = Target.AbsoluteCanvasSize - AbsoluteWindowSize
								NewTypesVector = if ScrollArmed[Target] then TypesVector2.new(math.clamp(CanvasPosition.X + XRatio * 600 * p3, 0, (math.max(0, AbsoluteCanvasSizeDelta.X))), (math.clamp(CanvasPosition.Y + YRatio * 600 * p3, 0, (math.max(0, AbsoluteCanvasSizeDelta.Y))))) else CanvasPosition
								
								if NewTypesVector ~= CanvasPosition then
									Target.CanvasPosition = NewTypesVector
									break
								end
							end
							Target = Target.Parent
						end
					end
				end)
				
				return
			end
		end
		
		function config.preview(Object, Object1, Vector)
			-- upvalues: Tbl (ref), TypesVector2 (copy), TypesUDim2 (copy), Key (copy), Compose (copy), raiseStatus (copy)
			if not Tbl then return end
			local LayerCollector = Object1:FindFirstAncestorWhichIsA("LayerCollector")
			
			if not LayerCollector then return end
			if Tbl.ghost then
				if Tbl.stopPreview then
					Tbl.stopPreview()
					Tbl.stopPreview = nil
				end
				Tbl.ghost:Destroy()
			end
			if Tbl.stopLift then
				Tbl.stopLift()
				Tbl.stopLift = nil
			end
			local DragGhost = Object:Clone()
			local Size = Object.Size
			local LayoutUnit = Object1:FindFirstChild("LayoutUnit")
			local X = if LayoutUnit and LayoutUnit.AbsoluteSize.X > 0 then LayoutUnit.AbsoluteSize.X else 1
			local PreviewScale = Tbl.spec.previewScale or 1
			assert(PreviewScale > 0 and PreviewScale < 1e999, "Facet drag previewScale must be positive and finite")
			local NewTypesVector = TypesVector2.new(Size.X.Offset * X + Size.X.Scale * Object1.AbsoluteWindowSize.X, Size.Y.Offset * X + Size.Y.Scale * Object1.AbsoluteWindowSize.Y)
			DragGhost.Size = TypesUDim2.fromOffset(NewTypesVector.X / X, NewTypesVector.Y / X)
			local NewTypesVector1 = if Vector then TypesVector2.new(Vector.X.Offset * X + Vector.X.Scale * NewTypesVector.X, Vector.Y.Offset * X + Vector.Y.Scale * NewTypesVector.Y) else NewTypesVector
			DragGhost.Name = "DragGhost"
			DragGhost.Visible = true
			DragGhost.AnchorPoint = TypesVector2.new(if NewTypesVector.X > 0 then Tbl.pickupAnchor.X * NewTypesVector1.X / NewTypesVector.X else 0.5, if NewTypesVector.Y > 0 then Tbl.pickupAnchor.Y * NewTypesVector1.Y / NewTypesVector.Y else 0.5)
			DragGhost:SetAttribute("FacetDragFeedback", true)
			DragGhost.Parent = LayerCollector
			local LiftValue = Tbl.spec.liftValue
			
			if LiftValue then
				local Tbl1 = Tbl
				local ScaledX = X * LiftValue:peek()
				local v9 = nil
				local v10 = assert(v9)
				Tbl1.stopPreview = Key.runtime.mount(function()
					-- upvalues: Key (upval), ScaledX (copy), v9 (ref)
					local UIScaleResult = Key.Host.UIScale({ Scale = ScaledX })
					v9 = UIScaleResult
					
					return UIScaleResult
				end, DragGhost)
				Tbl1.stopLift = Key.runtime.mountFragment(function()
					-- upvalues: Compose (upval), LiftValue (copy), v10 (copy), X (copy), Tbl1 (copy), NewTypesVector (copy)
					Compose.watch(function(Callback)
						-- upvalues: LiftValue (upval), v10 (upval), X (upval), Tbl1 (upval), NewTypesVector (upval)
						local CallbackResult = Callback(LiftValue)
						v10.Scale = X * CallbackResult
						Tbl1.previewSize = NewTypesVector * CallbackResult
						Tbl1.liftScale = CallbackResult
					end)
					
					return {}
				end, DragGhost)
			elseif X * PreviewScale ~= 1 then
				local ScaledX1 = X * PreviewScale
				local v11 = nil
				local _ = assert(v11)
				Tbl.stopPreview = Key.runtime.mount(function()
					-- upvalues: Key (upval), ScaledX1 (copy), v11 (ref)
					local UIScaleResult = Key.Host.UIScale({ Scale = ScaledX1 })
					v11 = UIScaleResult
					
					return UIScaleResult
				end, DragGhost)
			end
			Tbl.previewSize = NewTypesVector * (Tbl.liftScale or PreviewScale)
			Tbl.armedPreview = if Tbl.mode == "armed" then Object else nil
			local Position = Tbl.position or Tbl.origin
			local Parent = DragGhost.Parent
			local AbsolutePosition = if Parent and Parent:IsA("GuiBase2d") then Parent.AbsolutePosition else TypesVector2.zero
			local UIScale = Parent and Parent:FindFirstChildWhichIsA("UIScale")
			local Scale = if UIScale and UIScale.Scale > 0 then UIScale.Scale else 1
			DragGhost.Position = TypesUDim2.fromOffset((Position.X - AbsolutePosition.X) / Scale, (Position.Y - AbsolutePosition.Y) / Scale)
			Tbl.ghost = DragGhost
			
			if LiftValue and Tbl.spec.liftCarry and Tbl.mode ~= "armed" then
				Tbl.spec.liftCarry()
			end
			raiseStatus(DragGhost)
		end
		
		function config.register(Gui, Tbl1)
			-- upvalues: Key (copy), Compose (copy), Guis (copy), Guis1 (copy), Tbl (ref), config (copy)
			local Copy = table.clone(Tbl1)
			local FacetDropOutline = if Tbl1.feedback == false then nil elseif Gui:IsA("GuiObject") then Key.Host.UIStroke({
				Name = "FacetDropOutline",
				Enabled = false,
				Thickness = function(p3)
					-- upvalues: Key (upval)
					return Key.metric("strokes.hairline", p3)
				end,
				ApplyStrokeMode = Key.types.Enum.ApplyStrokeMode.Border,
				BorderStrokePosition = Key.types.Enum.BorderStrokePosition.Inner
			}) else Key.Host.Highlight({
				Name = "FacetDropHighlight",
				FillTransparency = 1,
				Enabled = false,
				Adornee = Compose.static(Gui),
				DepthMode = Key.types.Enum.HighlightDepthMode.Occluded
			})
			
			if FacetDropOutline then
				FacetDropOutline.Parent = Gui
			end
			Copy.feedback = FacetDropOutline
			Guis[Gui] = Copy
			
			if Tbl1.focusTarget then
				Guis1[Tbl1.focusTarget] = Gui
			end
			Compose.cleanup(function()
				-- upvalues: Tbl (upval), Gui (copy), config (upval), Guis (upval), Tbl1 (copy), Guis1 (upval)
				if Tbl and not Tbl.executing and Tbl.target == Gui then
					config.finish(false, "The destination was removed")
				end
				Guis[Gui] = nil
				
				if Tbl1.focusTarget then
					Guis1[Tbl1.focusTarget] = nil
				end
			end)
		end
		
		config.targetOf = ancestor
		
		return config
	end
end