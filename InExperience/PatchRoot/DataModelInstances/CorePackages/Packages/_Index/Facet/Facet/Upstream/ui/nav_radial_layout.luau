local _ = require("./theme_types")
local NavRadialGeometryModule = require("./nav_radial_geometry")
local _ = require("./types")
local _ = require("./radial_types")
local _ = require("./radial_props")
local _ = require("../vendor/compose/core")
local _ = require("./nav_radial_menu")
local MotionModule = require("./motion")

return function(p1, p2, Object)
	-- upvalues: NavRadialGeometryModule (copy), MotionModule (copy)
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local SectorsFunction = NavRadialGeometryModule.sectors
	local TypeNameOf = p1.runtime.host.typeNameOf or typeof
	local TypesVector2 = p1.types.Vector2
	local Spec = p2.spec
	local Session = p2.session
	local Corner = p2.corner
	local RingWidthFunction = p2.ringWidth
	local Follow = p2.follow
	local ReducedFunction = p2.reduced
	local GlyphOnlyFunction = p2.glyphOnly
	local Appearance = p2.appearance
	local ContentFit = p2.contentFit
	local GestureSelection = p2.gestureSelection
	local Interacting = p2.interacting
	local Path = p2.path
	local Candidate = p2.candidate
	local OverlayParent = p1.config.overlayParent or Object:FindFirstAncestorWhichIsA("LayerCollector")
	local Frame = nil
	
	if OverlayParent then
		assert(OverlayParent:IsA("GuiBase2d"), "RadialMenu overlay parent must be a GuiBase2d")
		Frame = OverlayParent
	end
	local IsYAbove: boolean = Frame ~= nil and (Frame.AbsoluteSize.X > 0 and Frame.AbsoluteSize.Y > 0)
	local CellResult = Compose.cell(if Frame and IsYAbove then Frame.AbsoluteSize else TypesVector2.new(640, 480))
	local CellResult1 = Compose.cell(if Frame and IsYAbove then Frame.AbsolutePosition else TypesVector2.zero)
	local ReadResult = ReadFunction(Spec.anchor)
	local Launcher = if ReadResult == nil then Object:FindFirstChild("Launcher") else nil
	local ReadResult1 = ReadResult or Launcher
	local IsInstance: boolean = ReadResult1 ~= nil and TypeNameOf(ReadResult1) == "Instance"
	local AbsolutePositionResult = if IsInstance then p1.observe.AbsolutePosition(ReadResult1) else nil
	local AbsoluteSizeResult = if IsInstance then p1.observe.AbsoluteSize(ReadResult1) else nil
	local List = {}
	local Parent = if IsInstance and not Corner then ReadResult1.Parent else nil
	while Parent and Parent ~= Frame and Parent:IsA("GuiObject") do
		table.insert(List, {
			position = p1.observe.AbsolutePosition(Parent),
			size = p1.observe.AbsoluteSize(Parent)
		})
		Parent = Parent.Parent
	end
	local FormulaResult = Compose.formula(function(Callback): number
		-- upvalues: ReadFunction (copy), Spec (copy), ReadFunction (copy), TypeNameOf (copy), AbsoluteSizeResult (copy)
		local ReadResult = ReadFunction(Spec.clearance, Callback)
		local Largest = math.max(24, if type(ReadResult) == "number" then ReadResult else 40)
		local ReadResult1 = ReadFunction(Spec.anchor, Callback)
		
		if TypeNameOf(ReadResult1) ~= "Instance" and type(ReadResult1) == "table" then
			local Clearance: number = ReadResult1.clearance
			
			if type(Clearance) == "number" then
				Largest = math.max(Largest, Clearance)
			end
		end
		if AbsoluteSizeResult then
			local CallbackResult = Callback(AbsoluteSizeResult)
			Largest = math.max(Largest, math.max(CallbackResult.X, CallbackResult.Y) / 2)
		end
		return Largest
	end)
	local FormulaResult1 = Compose.formula(function(Callback)
		-- upvalues: CellResult (copy), ReadFunction (copy), Spec (copy), TypesVector2 (copy), AbsolutePositionResult (copy), AbsoluteSizeResult (copy), Launcher (copy), CellResult1 (copy), TypeNameOf (copy), NavRadialGeometryModule (upval), FormulaResult (copy), RingWidthFunction (copy)
		local CallbackResult = Callback(CellResult)
		local ReadResult = ReadFunction(Spec.anchor, Callback)
		local Preset = Spec.preset or "donut"
		local CallbackResultDelta = if AbsolutePositionResult and AbsoluteSizeResult and (Launcher == nil or Callback(AbsoluteSizeResult).X > 0) then Callback(AbsolutePositionResult) + Callback(AbsoluteSizeResult) / 2 - Callback(CellResult1) elseif TypeNameOf(ReadResult) == "Instance" or type(ReadResult) ~= "table" or not ReadResult.x or not ReadResult.y then TypesVector2.new(if string.find(Preset, "left") then 16 elseif string.find(Preset, "right") then CallbackResult.X - 16 else CallbackResult.X / 2, if string.find(Preset, "top") then 16 elseif string.find(Preset, "bottom") then CallbackResult.Y - 16 else CallbackResult.Y / 2) else TypesVector2.new(ReadResult.x, ReadResult.y) - Callback(CellResult1)
		local _, ArcResult2 = NavRadialGeometryModule.arc(Preset)
		
		if ArcResult2 < 360 then
			return CallbackResultDelta
		else
			local NewCallbackResult = Callback(FormulaResult) + (RingWidthFunction(Callback) or 44)
			
			return TypesVector2.new(math.clamp(CallbackResultDelta.X, NewCallbackResult + 12, (math.max(NewCallbackResult + 12, CallbackResult.X - NewCallbackResult - 12))), (math.clamp(CallbackResultDelta.Y, NewCallbackResult + 20, (math.max(NewCallbackResult + 20, CallbackResult.Y - NewCallbackResult - 20)))))
		end
	end)
	local CellResult2 = Compose.cell(FormulaResult1:peek())
	local CellResult3 = Compose.cell(FormulaResult:peek())
	Compose.watch(function(Callback)
		-- upvalues: FormulaResult1 (copy), FormulaResult (copy), Follow (copy), Interacting (copy), CellResult2 (copy), CellResult3 (copy)
		local CallbackResult = Callback(FormulaResult1)
		local CallbackResult1 = Callback(FormulaResult)
		
		if Follow ~= "fixed" and (Follow == "always" or not Callback(Interacting)) then
			CellResult2:set(CallbackResult)
			CellResult3:set(CallbackResult1)
		end
	end)
	local CellResult4 = Compose.cell(CellResult2:peek())
	local Quick = p1.motionSpring("quick")
	local SpringResult = MotionModule.forValue(p1, p1.types.Vector2.zero).spring(function(Callback)
		-- upvalues: CellResult2 (copy)
		return Callback(CellResult2)
	end, { period = Quick.period, damping = Quick.damping })
	local CellResult5 = Compose.cell(false)
	local FormulaResult2 = Compose.formula(function(Callback)
		-- upvalues: Interacting (copy), Follow (copy), CellResult4 (copy), ReducedFunction (copy), CellResult5 (copy), CellResult2 (copy), SpringResult (copy)
		return if Callback(Interacting) and Follow ~= "always" then Callback(CellResult4) elseif ReducedFunction(Callback) or not Callback(CellResult5) then Callback(CellResult2) else Callback(SpringResult)
	end)
	
	function Session.freezeCenter()
		-- upvalues: CellResult4 (copy), FormulaResult2 (copy)
		CellResult4:set(FormulaResult2:peek())
	end
	
	local function captionPadding(p3)
		-- upvalues: ReadFunction (copy), p1 (copy)
		local ReadResult = ReadFunction(p1.config.theme, p3)
		local Control = ReadResult and (ReadResult.chrome and ReadResult.chrome.control)
		local ContentInsets = Control and Control.contentInsets
		
		return 2 * p1.controlSize(nil, "paddingX", p3) + (ContentInsets and ContentInsets.left or 0) + (ContentInsets and ContentInsets.right or 0)
	end
	
	local CellResult6 = Compose.cell({})
	local CellResult7 = Compose.cell({})
	Compose.watch(function(p3)
		-- upvalues: ReadFunction (copy), Spec (copy), CellResult6 (copy), CellResult7 (copy)
		local t = {}
		
		local function visit(List, Id)
			-- upvalues: t (copy), visit (copy), ReadFunction (upval), p3 (copy)
			for _, value in List do
				local Text = Id .. "/" .. value.id
				t[Text] = true
				
				if value.children then
					visit(ReadFunction(value.children, p3), if Id == "" then value.id else Text)
				end
			end
		end
		
		visit(ReadFunction(Spec.items, p3), "")
		local t1 = {}
		local Flag = false
		
		for i, value in CellResult6:peek() do
			if t[i] then
				t1[i] = value
			else
				Flag = true
			end
		end
		if Flag then
			CellResult6:set(t1)
		end
		local t2 = {}
		local Flag1 = false
		
		for i1, value1 in CellResult7:peek() do
			if t[i1] then
				t2[i1] = value1
			else
				Flag1 = true
			end
		end
		if Flag1 then
			CellResult7:set(t2)
		end
	end)
	
	local function solve(Callback, p4)
		-- upvalues: CellResult (copy), CellResult2 (copy), CellResult3 (copy), NavRadialGeometryModule (upval), Spec (copy), p1 (copy), List (copy), CellResult1 (copy), RingWidthFunction (copy), ReadFunction (copy), CellResult7 (copy), GlyphOnlyFunction (copy), captionPadding (copy), ReadFunction (copy), ReadFunction (copy), Corner (copy), Path (copy), SectorsFunction (copy), Appearance (copy), ContentFit (copy), GestureSelection (copy)
		local CallbackResult = Callback(CellResult)
		local CallbackResult1 = Callback(CellResult2)
		local CallbackResult2: number = Callback(CellResult3)
		local ArcResult, ArcResult2 = NavRadialGeometryModule.arc(Spec.preset or "donut")
		local Smallest: number = if ArcResult2 == 360 then math.min(CallbackResult1.X - 12, CallbackResult.X - CallbackResult1.X - 12, CallbackResult1.Y - 20, CallbackResult.Y - CallbackResult1.Y - 20) else math.min(CallbackResult.X - 28, CallbackResult.Y - 28)
		local TargetSizesMinimum: number = p1.metric("targetSizes.minimum", Callback)
		local Smallest1 = nil
		
		for _, value in List do
			local CallbackResultDelta = Callback(value.position) - Callback(CellResult1)
			local CallbackResult3 = Callback(value.size)
			Smallest1 = math.min(CallbackResult1.X - CallbackResultDelta.X, CallbackResultDelta.X + CallbackResult3.X - CallbackResult1.X, CallbackResult1.Y - CallbackResultDelta.Y, CallbackResultDelta.Y + CallbackResult3.Y - CallbackResult1.Y)
			
			if CallbackResult2 + TargetSizesMinimum <= Smallest1 then
				Smallest = math.min(Smallest, Smallest1)
				break
			end
		end
		local Largest = math.max(TargetSizesMinimum, math.max(CallbackResult2 + 1, (math.min(240, Smallest))) - CallbackResult2)
		local Smallest2 = math.min(Largest, (math.max(TargetSizesMinimum, RingWidthFunction(Callback) or 0)))
		local ReadResult = ReadFunction(Spec.items, Callback)
		local List1 = {}
		local List2 = {}
		local Inner: number = CallbackResult2
		local SpaceS = p1.metric("space.s", Callback)
		local TypographyControlSize = p1.metric("typography.control.size", Callback)
		local IconSize = p1.controlSize(nil, "iconSize", Callback)
		local CallbackResult4 = Callback(CellResult7)
		
		local function estimate(Item, Key)
			-- upvalues: GlyphOnlyFunction (upval), IconSize (copy), CallbackResult4 (copy), captionPadding (upval), Callback (copy), TypographyControlSize (copy), ReadFunction (upval)
			if GlyphOnlyFunction(Item) then
				return IconSize, IconSize
			end
			local CallbackResultEntry = if Key then CallbackResult4[Key] else nil
			
			if CallbackResultEntry and CallbackResultEntry > 0 then
				return CallbackResultEntry + captionPadding(Callback), TypographyControlSize
			else
				local ReadResult = ReadFunction(Item.label, Callback) or ""
				
				return (utf8.len(ReadResult) or #ReadResult) * TypographyControlSize * 0.6 + captionPadding(Callback), TypographyControlSize
			end
		end
		
		local Navigation = Spec.navigation or "replace"
		local Expansion = Spec.expansion or "fan"
		local AngleDelta: number = ArcResult
		local Smallest3: number = ArcResult2
		local OuterDelta = 0
		
		local function append()
			-- upvalues: ReadResult (ref), ReadFunction (upval), Callback (copy), Spec (upval), Corner (upval), List1 (copy), Path (upval), Inner (ref), AngleDelta (ref), Smallest3 (ref), Largest (copy), SectorsFunction (upval), estimate (copy), SpaceS (copy), TargetSizesMinimum (copy), OuterDelta (ref), Smallest2 (copy), Appearance (upval), ContentFit (upval), GlyphOnlyFunction (upval), NavRadialGeometryModule (upval), List2 (ref)
			local List = {}
			local t = {}
			
			for _, value in ReadResult do
				assert(type(value.id) == "string" and not t[value.id], "RadialMenu items require unique ids per level")
				t[value.id] = true
				assert(not (value.checked and value.selected), "RadialMenu state items require checked or selected")
				assert(not (if value.checked then value.children or value.onSelect else value.selected and (value.children or value.onSelect)), "RadialMenu state items use onChange")
				
				if ReadFunction(value.hidden, Callback) ~= true then
					table.insert(List, value)
				end
			end
			if Spec.center and Spec.center ~= "back" and not Corner and #List1 == #Callback(Path) then
				local Slot = nil
				
				if #List1 == 0 and Spec.distribution == "compass" then
					local t3 = {}
					
					for _, value1 in List do
						if value1.slot then
							t3[value1.slot] = true
						end
					end
					for _, value2 in {
						"SW", "S", "SE", "NW", "W", "E", "NE", "N"
					} do
						if not t3[value2] then
							Slot = value2
							break
						end
					end
				end
				local config = {
					id = "$navigation",
					labelStyle = "icon",
					label = if #List1 > 0 then "Back" else "Close",
					icon = if #List1 > 0 then "chevron.leading" else "close",
					slot = Slot
				}
				
				if #List1 == 0 and Spec.distribution == "compass" then
					if Slot then
						table.insert(List, config)
					end
				else
					table.insert(List, config)
				end
			end
			local Inner1: number = Inner
			local Distribution = #List1 == 0 and Spec.distribution or "even"
			local AngleDelta1: number = AngleDelta
			local Entry = List[#List]
			
			if Entry and Entry.id == "$navigation" and Distribution == "even" and Smallest3 == 360 then
				AngleDelta1 = 225 - (#List - 1) * 360 / #List
			end
			local Largest1 = 0
			local Largest2 = 0
			
			for _, value3 in SectorsFunction(List, AngleDelta1, Smallest3, Distribution, Inner1, Inner1 + 1) do
				local EstimateResult, EstimateResult2 = estimate(value3.item, table.concat(List1, "/") .. "/" .. value3.item.id)
				local Sine = math.sin((math.rad(value3.angle)))
				local Negated = -math.cos((math.rad(value3.angle)))
				local NewEstimateResult = EstimateResult / 2 + SpaceS
				local NewEstimateResult1 = EstimateResult2 / 2 + SpaceS
				local NewInner = Inner1 + math.abs(NewEstimateResult * Sine) + math.abs(NewEstimateResult1 * Negated)
				
				for _, value4 in { -NewEstimateResult, NewEstimateResult } do
					for _, value5 in { -NewEstimateResult1, NewEstimateResult1 } do
						local NewNewInner = NewInner * Sine + value4
						local NewNewInner1 = NewInner * Negated + value5
						Largest1 = math.max(Largest1, math.sqrt(NewNewInner * NewNewInner + NewNewInner1 * NewNewInner1) - Inner1)
					end
				end
				Largest2 = math.max(Largest2, 2 * (math.max(TargetSizesMinimum, EstimateResult, EstimateResult2) / (math.sin((math.rad(math.min(value3.span, 180) / 2))) * 2 * 0.86) - Inner1))
			end
			local ClampedValue = math.clamp(math.max(math.ceil(math.max(Largest1, Largest2) / 2) * 2, OuterDelta), Smallest2, Largest)
			local Flag = nil
			
			for _ = 1, 24 do
				if Largest <= ClampedValue or Appearance ~= "wedges" or ContentFit == "none" then break end
				Flag = false
				
				for _, value6 in SectorsFunction(List, AngleDelta1, Smallest3, Distribution, Inner1, Inner1 + ClampedValue) do
					local Item = value6.item
					
					if not GlyphOnlyFunction(Item) then
						local EstimateResult1, EstimateResult2_1 = estimate(Item, table.concat(List1, "/") .. "/" .. value6.item.id)
						local LabelBoundsResult = NavRadialGeometryModule.labelBounds(value6, EstimateResult2_1)
						
						if LabelBoundsResult.w < EstimateResult1 or LabelBoundsResult.h < EstimateResult2_1 then
							Flag = true
							break
						end
					end
				end
				if not Flag then break end
				ClampedValue = math.min(Largest, ClampedValue + 8)
			end
			Inner = Inner1 + ClampedValue + 4
			local SectorsResult = SectorsFunction(List, AngleDelta1, Smallest3, Distribution, Inner1, Inner1 + ClampedValue)
			local t4 = {}
			
			for _, value7 in List do
				local Icon = value7.icon or value7.compactLabel and value7.compactLabel.icon
				
				if type(Icon) == "string" then
					t4[Icon] = (t4[Icon] or 0) + 1
				end
			end
			for _, value8 in SectorsResult do
				value8.path = table.clone(List1)
				value8.key = table.concat(List1, "/") .. "/" .. value8.id
				local Icon = value8.item.icon or value8.item.compactLabel and value8.item.compactLabel.icon
				value8.sharedIcon = type(Icon) == "string" and (t4[Icon] or 0) > 1
			end
			table.insert(List2, SectorsResult)
			
			return SectorsResult
		end
		
		local AppendResult = append()
		local v1 = nil
		
		for _, value1 in Callback(Path) do
			v1 = nil
			local AppendResultEntry = nil
			
			for i = 1, #AppendResult do
				AppendResultEntry = AppendResult[i]
				
				if AppendResultEntry.id ~= value1 or ReadFunction(AppendResultEntry.item.enabled, Callback) == false then
					continue
				end
				v1 = AppendResultEntry
				break
			end
			if not v1 or not v1.item.children then break end
			if p4 then
				Navigation = "replace"
			else
				Navigation = v1.item.navigation or Navigation
			end
			Expansion = v1.item.expansion or Expansion
			table.insert(List1, value1)
			ReadResult = ReadFunction(v1.item.children, Callback)
			OuterDelta = if Navigation == "replace" then v1.outer - v1.inner else 0
			
			if Navigation == "replace" then
				List2 = {}
				Inner = CallbackResult2
				AngleDelta = ArcResult
				Smallest3 = ArcResult2
			elseif Expansion == "fan" then
				Smallest3 = math.min(ArcResult2, (math.max(v1.span, #ReadResult * 32)))
				AngleDelta = v1.angle - Smallest3 / 2
				
				if ArcResult2 < 360 then
					AngleDelta = math.clamp(AngleDelta, ArcResult, ArcResult + ArcResult2 - Smallest3)
				end
			else
				AngleDelta = ArcResult
				Smallest3 = ArcResult2
			end
			AppendResult = append()
		end
		local List3 = {}
		local IsSmallestBelow: boolean = Smallest < CallbackResult2 + Largest or Largest < TargetSizesMinimum
		for i1 = 1, #List2 do
			local Entry = List2[i1]
			
			for i2 = 1, #Entry do
				local Entry1 = Entry[i2]
				IsSmallestBelow = IsSmallestBelow or (Entry1.size < 44 or Smallest < Entry1.outer)
				
				if Appearance == "wedges" and (not Entry1.item.icon or Entry1.sharedIcon == true) and (not GlyphOnlyFunction(Entry1.item) and ContentFit ~= "none") then
					local EstimateResult, EstimateResult2 = estimate(Entry1.item, Entry1.key)
					local LabelBoundsResult = NavRadialGeometryModule.labelBounds(Entry1, EstimateResult2)
					local v2 = (CallbackResult4[Entry1.key] or 0) > 0
					IsSmallestBelow = IsSmallestBelow or (Smallest - CallbackResult2 < EstimateResult or v2 and (LabelBoundsResult.w < EstimateResult or LabelBoundsResult.h < EstimateResult2))
				end
				table.insert(List3, Entry1)
			end
		end
		local IsNotDirection: boolean = IsSmallestBelow and GestureSelection ~= "direction"
		
		if IsNotDirection then
			List3 = {}
			
			for _, value2 in AppendResult do
				if value2.id ~= "$navigation" then
					table.insert(List3, value2)
				end
			end
		end
		for Index, value3 in List3 do
			value3.index = Index
			value3.list = IsNotDirection
		end
		return {
			sectors = List3,
			list = IsNotDirection,
			inner = CallbackResult2,
			path = List1
		}
	end
	
	local FormulaResult3 = Compose.formula(function(Callback)
		-- upvalues: solve (copy), Path (copy)
		local SolveResult = solve(Callback, false)
		
		if SolveResult.list and #Callback(Path) ~= 0 then
			local SolveResult1 = solve(Callback, true)
			
			return if SolveResult1.list then SolveResult else SolveResult1
		else
			return SolveResult
		end
	end)
	local FormulaResult4 = Compose.formula(function(Callback)
		-- upvalues: FormulaResult3 (copy)
		return Callback(FormulaResult3).sectors
	end)
	local FormulaResult5 = Compose.formula(function(Callback)
		-- upvalues: FormulaResult3 (copy)
		return Callback(FormulaResult3).list
	end)
	
	function Session.candidateSector()
		-- upvalues: FormulaResult4 (copy), Candidate (copy)
		local PeekResult = FormulaResult4:peek()
		local PeekResultEntry = nil
		
		for i = 1, #PeekResult do
			PeekResultEntry = PeekResult[i]
			
			if PeekResultEntry.key == Candidate:peek() then
				return PeekResultEntry
			end
		end
		return nil
	end
	
	return {
		viewport = CellResult,
		origin = CellResult1,
		launcher = Launcher,
		anchorSize = AbsoluteSizeResult,
		centerTarget = CellResult2,
		following = CellResult5,
		center = FormulaResult2,
		captionPadding = captionPadding,
		wordWidths = CellResult6,
		captionWidths = CellResult7,
		layout = FormulaResult3,
		sectors = FormulaResult4,
		fallback = FormulaResult5
	}
end