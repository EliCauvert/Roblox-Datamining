local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local OverlayPartsModule = require("./overlay_parts")
local SheetReleaseModule = require("./sheet_release")
local SettleModule = require("./settle")
local MotionModule = require("./motion")
local ReducedFunction = MotionModule.reduced
local _ = require("./navigation_props")
local _ = require("./nav_sheet_detents")
local KeyboardInsetModule = require("./keyboard_inset")
local _ = require("./glass")
local config = { left = 0, right = 0, bottom = 0 }

return function(p1, p2, p3, Callback)
	-- upvalues: ReducedFunction (copy), MotionModule (copy), KeyboardInsetModule (copy), config (copy), OverlayPartsModule (copy), SettleModule (copy), SheetReleaseModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local ReadSourceFunction = p1.readSource
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Frames = Runtime.host.frames
	
	local function _()
		-- upvalues: Frames (copy)
		return if Frames then Frames.now() else os.clock()
	end
	
	return function(p4, p5, p6, Callback2, p7, p8)
		-- upvalues: p3 (copy), p1 (copy), ReducedFunction (upval), MotionModule (upval), Compose (copy), KeyboardInsetModule (upval), TypesVector2 (copy), config (upval), OverlayPartsModule (upval), ReadSourceFunction (copy), ReadSourceFunction (copy), Frames (copy), SettleModule (upval), ReadFunction (copy), TypesEnum (copy), SheetReleaseModule (upval), Host (copy), TypesUDim2 (copy), Runtime (copy), p2 (copy), Callback (copy)
		local Detents = p6.detents
		local ById = p6.byId
		local Placement = p4.placement or "automatic"
		local Edge = p4.edge or "right"
		local _ = p3.service("GuiService")
		local UserInputService = p3.service("UserInputService")
		local PreferredInputResult = if UserInputService and UserInputService.GetPropertyChangedSignal then p1.observe.PreferredInput(UserInputService) else nil
		local ReducedResult = ReducedFunction(p1)
		local LevelResult = MotionModule.level(p1)
		local CellResult = Compose.cell(1)
		local Er = KeyboardInsetModule.reader(p1, UserInputService)
		
		local function keyboard(Callback)
			-- upvalues: Er (copy), CellResult (copy)
			return Er(Callback) / Callback(CellResult)
		end
		
		local ParentResult = if p8 then p3.parent(p8) else p1.config.overlayParent
		local AbsoluteSize = if ParentResult and ParentResult:IsA("GuiBase2d") then ParentResult.AbsoluteSize else TypesVector2.zero
		local CellResult1 = Compose.cell(if AbsoluteSize.Y > 0 then AbsoluteSize else TypesVector2.new(0, 720))
		
		local function v36(): boolean
			return false
		end
		
		if Placement == "adaptive" and UserInputService and UserInputService.GetPropertyChangedSignal then
			local MouseEnabledResult = p1.observe.MouseEnabled(UserInputService)
			local UchEnabled = p1.observe.TouchEnabled(UserInputService)
			
			v36 = function(Callback): boolean
				-- upvalues: MouseEnabledResult (copy), UchEnabled (copy)
				return Callback(MouseEnabledResult) == true and Callback(UchEnabled) ~= true
			end
		end
		local TenFootResult = p1.tenFoot()
		local FormulaResult = Compose.formula(function(Callback)
			-- upvalues: Placement (copy), TenFootResult (copy), CellResult1 (copy), v36 (ref)
			return if (Placement == "automatic" or Placement == "adaptive") and TenFootResult(Callback) then "center" elseif Placement == "adaptive" then if Callback(CellResult1).X >= 600 and v36(Callback) then "side" else "bottom" elseif Placement == "automatic" then "bottom" else Placement
		end)
		
		local function _(p9)
			-- upvalues: p1 (upval), FormulaResult (copy), Edge (copy)
			return if p1.readSource(FormulaResult, p9) == "side" then Edge else "bottom"
		end
		
		local DragIndicator = p4.dragIndicator or "automatic"
		
		local function showGrabber(p9): boolean
			-- upvalues: p1 (upval), FormulaResult (copy), DragIndicator (copy), p4 (copy)
			return p1.readSource(FormulaResult, p9) ~= "center" and (DragIndicator ~= "hidden" and (p4.closeButton == nil or p4.closeButton == false))
		end
		
		local config1 = { top = 12, bottom = 12, left = 16, right = 16 }
		local config2 = { bottom = "top", right = "left", left = "right" }
		local FormulaResult1 = nil
		local Reached = nil
		local FormulaResult2 = nil
		
		if p1.config.guiService then
			local CellResult2 = Compose.cell(nil)
			Reached = CellResult2
			FormulaResult2 = Compose.formula(function(Callback)
				-- upvalues: CellResult2 (copy), FormulaResult (copy), Er (copy), CellResult (copy), config (upval), OverlayPartsModule (upval), p1 (upval), p4 (copy), CellResult1 (copy)
				local CallbackResult = Callback(CellResult2)
				
				if CallbackResult == nil or Callback(FormulaResult) ~= "bottom" or Er(Callback) / Callback(CellResult) > 0 then
					return config
				else
					local Largest = math.max(Callback(CellResult), 0.001)
					local IsXBelow = Callback(CellResult1).X <= OverlayPartsModule.width(p1, p4.width, Callback)
					local Ceiled: number = if IsXBelow then math.ceil(CallbackResult.glass.left / Largest) else 0
					local Ceiled1: number = if IsXBelow then math.ceil(CallbackResult.glass.right / Largest) else 0
					local CeiledRemainder = (Ceiled1 - Ceiled) % 2
					local Ceiled2 = math.ceil(CallbackResult.glass.bottom / Largest)
					
					return {
						left = Ceiled + (if Ceiled < Ceiled1 then CeiledRemainder else 0),
						right = Ceiled1 + (if Ceiled < Ceiled1 then 0 else CeiledRemainder),
						bottom = if Ceiled2 > 0 then Ceiled2 + p1.metric("radii.panel", Callback) else 0
					}
				end
			end)
		end
		local function outset(p9, p10)
			-- upvalues: FormulaResult2 (ref), ReadSourceFunction (upval)
			return FormulaResult2 and ReadSourceFunction(FormulaResult2, p10)[p9] or 0
		end
		
		local function reserve(p9, p10): number
			-- upvalues: config1 (copy), p1 (upval), FormulaResult (copy), DragIndicator (copy), p4 (copy), config2 (copy), Edge (copy)
			local NoCloseButton: boolean = p1.readSource(FormulaResult, p10) ~= "center" and (DragIndicator ~= "hidden" and (p4.closeButton == nil or p4.closeButton == false))
			
			return config1[p9] + (if NoCloseButton and config2[if p1.readSource(FormulaResult, p10) == "side" then Edge else "bottom"] == p9 then 28 else 0)
		end
		
		local function pad(p11, p12): number
			-- upvalues: FormulaResult1 (ref), ReadSourceFunction (upval), FormulaResult2 (ref), ReadSourceFunction (upval), p3 (upval), config1 (copy), p1 (upval), FormulaResult (copy), DragIndicator (copy), p4 (copy), config2 (copy), Edge (copy)
			local FormulaResult3 = FormulaResult1
			local NoCloseButton: boolean = p1.readSource(FormulaResult, p12) ~= "center" and (DragIndicator ~= "hidden" and (p4.closeButton == nil or p4.closeButton == false))
			
			return p3.inset(0, p11, nil, p12) + (config1[p11] + (if NoCloseButton and config2[if p1.readSource(FormulaResult, p12) == "side" then Edge else "bottom"] == p11 then 28 else 0)) + (FormulaResult3 and ReadSourceFunction(FormulaResult3, p12)[p11] or 0) + (if p11 == "bottom" then 0 else FormulaResult2 and ReadSourceFunction(FormulaResult2, p12)[p11] or 0)
		end
		
		local _ = function(p13): number
			-- upvalues: CellResult1 (copy), Er (copy), CellResult (copy)
			local Callback = p13 or function(CellResult)
				return CellResult:peek()
			end
			
			return (math.max(1, Callback(CellResult1).Y - Er(Callback) / Callback(CellResult)))
		end
		
		local _ = function(p13)
			-- upvalues: p1 (upval)
			return p1.metric("targetSizes.minimum", p13) * 4 + p1.metric("space.m", p13) * 2
		end
		
		local CellResult3 = Compose.cell(nil)
		
		local function heightOf(p13, p14): number
			-- upvalues: CellResult1 (copy), Er (copy), CellResult (copy), ReadSourceFunction (upval), CellResult3 (copy), p1 (upval)
			local Callback = p14 or function(CellResult)
				return CellResult:peek()
			end
			local Largest = math.max(1, Callback(CellResult1).Y - Er(Callback) / Callback(CellResult))
			
			return (math.min(Largest, (math.max(p1.metric("targetSizes.minimum", p14) * 4 + p1.metric("space.m", p14) * 2, if p13.hug then ReadSourceFunction(CellResult3, p14) or p1.metric("targetSizes.minimum", p14) * 4 + p1.metric("space.m", p14) * 2 elseif p13.fraction then Largest * p13.fraction else assert(p13.height)))))
		end
		
		local _ = function()
			-- upvalues: Detents (copy), heightOf (copy)
			local Copy = table.clone(Detents)
			table.sort(Copy, function(A, B): boolean
				-- upvalues: heightOf (upval)
				local v1 = heightOf(A)
				local v2 = heightOf(B)
				
				return if v1 == v2 then A.index < B.index else v1 < v2
			end)
			
			return Copy
		end
		
		local PeekResult = if ById[p5:peek()] then p5:peek() else Detents[1].id
		
		local _ = function(p13)
			-- upvalues: ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref)
			local Source = ReadSourceFunction(p5, p13)
			local ByIdEntry = ById[Source]
			
			if ByIdEntry then
				PeekResult = Source
				
				return ByIdEntry
			else
				return ById[PeekResult]
			end
		end
		
		local CellResult4 = Compose.cell(nil)
		local CellResult5 = Compose.cell(Frames == nil)
		local SettleModuleResult = SettleModule(p1, function()
			-- upvalues: heightOf (copy), ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref)
			local Source = ReadSourceFunction(p5, nil)
			local ByIdEntry = ById[Source]
			local ByIdEntry1 = nil
			
			if ByIdEntry then
				PeekResult = Source
				ByIdEntry1 = ByIdEntry
			else
				ByIdEntry1 = ById[PeekResult]
			end
			return (heightOf(ByIdEntry1))
		end, p1.motionSpring("sheet"))
		local HaltFunction = SettleModuleResult.halt
		local LaunchFunction = SettleModuleResult.launch
		
		local function painted(p13)
			-- upvalues: ReadSourceFunction (upval), CellResult4 (copy), ReducedResult (copy), heightOf (copy), p5 (copy), ById (copy), PeekResult (ref), SettleModuleResult (copy), CellResult1 (copy), Er (copy), CellResult (copy), p1 (upval)
			local Source = ReadSourceFunction(CellResult4, p13)
			
			if Source then
				return Source
			end
			if ReducedResult(p13) then
				local Source1 = ReadSourceFunction(p5, p13)
				local ByIdEntry = ById[Source1]
				local ByIdEntry1 = nil
				
				if ByIdEntry then
					PeekResult = Source1
					ByIdEntry1 = ByIdEntry
				else
					ByIdEntry1 = ById[PeekResult]
				end
				return (heightOf(ByIdEntry1, p13))
			else
				local Source1: number = ReadSourceFunction(SettleModuleResult.value, p13)
				
				if Source1 then
					local Callback = p13 or function(CellResult)
						return CellResult:peek()
					end
					
					return (math.min(math.max(1, Callback(CellResult1).Y - Er(Callback) / Callback(CellResult)), (math.max(p1.metric("targetSizes.minimum", p13) * 4 + p1.metric("space.m", p13) * 2, Source1))))
				end
				local Source2 = ReadSourceFunction(p5, p13)
				local ByIdEntry = ById[Source2]
				local ByIdEntry2 = nil
				
				if ByIdEntry then
					PeekResult = Source2
					ByIdEntry2 = ByIdEntry
				else
					ByIdEntry2 = ById[PeekResult]
				end
				return (heightOf(ByIdEntry2, p13))
			end
		end
		
		local Callback1 = heightOf
		local Source = ReadSourceFunction(p5, nil)
		local ByIdEntry = ById[Source]
		local ByIdEntry1 = nil
		
		if ByIdEntry then
			PeekResult = Source
			ByIdEntry1 = ByIdEntry
		else
			ByIdEntry1 = ById[PeekResult]
		end
		local CallbackResult = Callback1(ByIdEntry1)
		Compose.watch(function(Callback)
			-- upvalues: CellResult4 (copy), heightOf (copy), ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref), CallbackResult (ref), CellResult5 (copy), SettleModuleResult (copy), LaunchFunction (copy)
			local CallbackResult1 = Callback(CellResult4)
			local Source = ReadSourceFunction(p5, Callback)
			local ByIdEntry = ById[Source]
			local ByIdEntry1 = nil
			
			if ByIdEntry then
				PeekResult = Source
				ByIdEntry1 = ByIdEntry
			else
				ByIdEntry1 = ById[PeekResult]
			end
			local HeightOfResult = heightOf(ByIdEntry1, Callback)
			
			if CallbackResult1 then
				CallbackResult = CallbackResult1
				
				return
			end
			if Callback(CellResult5) and SettleModuleResult.value:peek() == nil and math.abs(HeightOfResult - CallbackResult) > 0.5 then
				LaunchFunction(CallbackResult, 0)
			end
			CallbackResult = HeightOfResult
		end)
		
		local function CanDismiss(p13): boolean
			-- upvalues: ReadFunction (upval), p4 (copy)
			return ReadFunction(p4.interactiveDismissDisabled, p13) ~= true
		end
		
		local function close(p13)
			-- upvalues: Callback2 (copy), p4 (copy)
			if Callback2 then
				return Callback2(p13)
			end
			if p4.onPresentedChange then
				p4.onPresentedChange(false)
			else
				p4.isPresented:set(false)
			end
			return not p4.isPresented:peek()
		end
		
		local function interactive(p13)
			-- upvalues: ReadFunction (upval), p4 (copy), Callback2 (copy)
			if ReadFunction(p4.interactiveDismissDisabled, nil) ~= true then
				if Callback2 then
					local _ = Callback2(p13)
					
					return
				end
				if p4.onPresentedChange then
					p4.onPresentedChange(false)
				else
					p4.isPresented:set(false)
				end
				local _ = not p4.isPresented:peek()
			end
		end
		
		local _ = function(p13)
			-- upvalues: CellResult4 (copy), p5 (copy)
			CellResult4:set(nil)
			p5:set(p13)
		end
		
		local _ = function(p13)
			-- upvalues: Detents (copy), heightOf (copy), ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref)
			local Copy = table.clone(Detents)
			table.sort(Copy, function(A, B): boolean
				-- upvalues: heightOf (upval)
				local v1 = heightOf(A)
				local v2 = heightOf(B)
				
				return if v1 == v2 then A.index < B.index else v1 < v2
			end)
			local FindFunction = table.find
			local Source = ReadSourceFunction(p5, p13)
			local ByIdEntry = ById[Source]
			local ByIdEntry1 = nil
			
			if ByIdEntry then
				PeekResult = Source
				ByIdEntry1 = ByIdEntry
			else
				ByIdEntry1 = ById[PeekResult]
			end
			return Copy[(FindFunction(Copy, ByIdEntry1) or 1) + 1]
		end
		
		local NowResult = -1e999
		local v1 = nil
		
		local _ = function()
			-- upvalues: v1 (ref), CellResult4 (copy)
			v1 = nil
			CellResult4:set(nil)
		end
		
		local function stops()
			-- upvalues: Detents (copy), heightOf (copy)
			local List = {}
			local Copy = table.clone(Detents)
			table.sort(Copy, function(A, B): boolean
				-- upvalues: heightOf (upval)
				local v2 = heightOf(A)
				local v3 = heightOf(B)
				
				return if v2 == v3 then A.index < B.index else v2 < v3
			end)
			
			for _, value in Copy do
				table.insert(List, {
					id = value.id,
					height = heightOf(value),
					index = value.index
				})
			end
			return List
		end
		
		local function grab(Source, Origin): boolean
			-- upvalues: v1 (ref), PreferredInputResult (copy), painted (copy), ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref), TypesEnum (upval), HaltFunction (copy), CellResult4 (copy), Frames (upval)
			if v1 then
				return false
			end
			local PeekResult1 = if PreferredInputResult then PreferredInputResult:peek() else nil
			local config = {
				moved = false,
				source = Source,
				origin = Origin,
				start = painted()
			}
			local Source1 = ReadSourceFunction(p5, nil)
			local ByIdEntry = ById[Source1]
			local ByIdEntry1 = nil
			
			if ByIdEntry then
				PeekResult = Source1
				ByIdEntry1 = ByIdEntry
			else
				ByIdEntry1 = ById[PeekResult]
			end
			config.detent = ByIdEntry1.id
			config.acquired = Source == "grip"
			config.slop = if Source == "grip" then 0 elseif PeekResult1 == TypesEnum.PreferredInput.Touch then 14 else 6
			config.samples = {}
			v1 = config
			local v2 = assert(v1)
			
			if v2.acquired then
				HaltFunction()
				CellResult4:set(v2.start)
				table.insert(v2.samples, {
					height = v2.start,
					at = if Frames then Frames.now() else os.clock()
				})
			end
			return true
		end
		
		local function move(Source, Y)
			-- upvalues: v1 (ref), NowResult (ref), Frames (upval), HaltFunction (copy), CellResult4 (copy), stops (copy), SheetReleaseModule (upval), CellResult1 (copy), Er (copy), CellResult (copy), ReadFunction (upval), p4 (copy), p1 (upval)
			local v2 = v1
			
			if v2 == nil or v2.source ~= Source then return end
			if Source == "grip" and math.abs(Y - v2.origin) > 4 then
				NowResult = if Frames then Frames.now() else os.clock()
				v2.moved = true
			end
			if not v2.acquired then
				if math.abs(Y - v2.origin) < v2.slop then return end
				v2.acquired = true
				v2.origin += if v2.origin < Y then v2.slop else -v2.slop
				HaltFunction()
				CellResult4:set(v2.start)
				table.insert(v2.samples, {
					height = v2.start,
					at = if Frames then Frames.now() else os.clock()
				})
			end
			local StopsResult = stops()
			
			local function v148(CellResult)
				return CellResult:peek()
			end
			
			local ResistResult = SheetReleaseModule.resist(v2.start + v2.origin - Y, StopsResult[1].height, StopsResult[#StopsResult].height, math.max(1, v148(CellResult1).Y - Er(v148) / v148(CellResult)), ReadFunction(p4.interactiveDismissDisabled, nil) ~= true, p1.metric("targetSizes.minimum"))
			CellResult4:set(ResistResult)
			table.insert(v2.samples, {
				height = ResistResult,
				at = if Frames then Frames.now() else os.clock()
			})
			
			if #v2.samples > 8 then
				table.remove(v2.samples, 1)
			end
		end
		
		local function velocity(Samples)
			-- upvalues: Frames (upval)
			local CountSamples = #Samples
			
			if CountSamples < 2 then
				return 0
			end
			local Sample = Samples[CountSamples]
			local Sample1 = Sample
			
			for i = CountSamples - 1, 1, -1 do
				if Sample.at - Samples[i].at > 0.1 then break end
				Sample1 = Samples[i]
			end
			local AtDelta = Sample.at - Sample1.at
			
			if AtDelta < 0.004166666666666667 or (if Frames then Frames.now() else os.clock()) - Sample.at > 0.1 then
				return 0
			else
				return (Sample.height - Sample1.height) / AtDelta
			end
		end
		
		local _ = function()
			-- upvalues: ReadFunction (upval), p4 (copy), Detents (copy), heightOf (copy), ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref), CellResult4 (copy), Callback2 (copy)
			local v2 = nil
			if ReadFunction(p4.interactiveDismissDisabled, nil) ~= true then
				v2 = nil
			else
				local Copy = table.clone(Detents)
				table.sort(Copy, function(A, B): boolean
					-- upvalues: heightOf (upval)
					local v3 = heightOf(A)
					local v4 = heightOf(B)
					
					return if v3 == v4 then A.index < B.index else v3 < v4
				end)
				local FindFunction = table.find
				local Source = ReadSourceFunction(p5, nil)
				local ByIdEntry = ById[Source]
				local ByIdEntry1 = nil
				
				if ByIdEntry then
					PeekResult = Source
					ByIdEntry1 = ByIdEntry
				else
					ByIdEntry1 = ById[PeekResult]
				end
				v2 = Copy[(FindFunction(Copy, ByIdEntry1) or 1) + 1]
			end
			if v2 then
				local Id = v2.id
				CellResult4:set(nil)
				p5:set(Id)
				
				return
			end
			if ReadFunction(p4.interactiveDismissDisabled, nil) ~= true then
				if Callback2 then
					local _ = Callback2("close")
					
					return
				end
				if p4.onPresentedChange then
					p4.onPresentedChange(false)
				else
					p4.isPresented:set(false)
				end
				local _ = not p4.isPresented:peek()
			end
		end
		
		local function finish(Source)
			-- upvalues: v1 (ref), CellResult4 (copy), NowResult (ref), Frames (upval), ReadFunction (upval), p4 (copy), Detents (copy), heightOf (copy), ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref), Callback2 (copy), velocity (copy), SheetReleaseModule (upval), stops (copy), LaunchFunction (copy), p1 (upval)
			local v2 = v1
			
			if v2 == nil or v2.source ~= Source then return end
			if Source == "grip" and not v2.moved then
				v1 = nil
				CellResult4:set(nil)
				NowResult = if Frames then Frames.now() else os.clock()
				local v3 = nil
				
				if ReadFunction(p4.interactiveDismissDisabled, nil) ~= true then
					v3 = nil
				else
					local Copy = table.clone(Detents)
					table.sort(Copy, function(A, B): boolean
						-- upvalues: heightOf (upval)
						local v4 = heightOf(A)
						local v5 = heightOf(B)
						
						return if v4 == v5 then A.index < B.index else v4 < v5
					end)
					local FindFunction = table.find
					local Source1 = ReadSourceFunction(p5, nil)
					local ByIdEntry = ById[Source1]
					local ByIdEntry1 = nil
					
					if ByIdEntry then
						PeekResult = Source1
						ByIdEntry1 = ByIdEntry
					else
						ByIdEntry1 = ById[PeekResult]
					end
					v3 = Copy[(FindFunction(Copy, ByIdEntry1) or 1) + 1]
				end
				if v3 then
					local Id = v3.id
					CellResult4:set(nil)
					p5:set(Id)
					
					return
				end
				if ReadFunction(p4.interactiveDismissDisabled, nil) ~= true then
					if Callback2 then
						local _ = Callback2("close")
						
						return
					end
					if p4.onPresentedChange then
						p4.onPresentedChange(false)
					else
						p4.isPresented:set(false)
					end
					local _ = not p4.isPresented:peek()
				end
				return
			else
				if not v2.acquired then
					v1 = nil
					CellResult4:set(nil)
					
					return
				end
				local PeekResult1 = CellResult4:peek() or v2.start
				local VelocityResult: number = velocity(v2.samples)
				local ChooseFunction = SheetReleaseModule.choose
				local StopsResult = stops()
				local Source2 = ReadSourceFunction(p5, nil)
				local ByIdEntry = ById[Source2]
				local ByIdEntry2 = nil
				
				if ByIdEntry then
					PeekResult = Source2
					ByIdEntry2 = ByIdEntry
				else
					ByIdEntry2 = ById[PeekResult]
				end
				local ChooseResult = ChooseFunction(StopsResult, PeekResult1, VelocityResult, ByIdEntry2.id, ReadFunction(p4.interactiveDismissDisabled, nil) ~= true)
				
				if ChooseResult ~= "dismiss" then
					LaunchFunction(PeekResult1, VelocityResult, if p1.metric("motion.fling.bounceSpeed") < math.abs(VelocityResult) then p1.motionSpring("flick") else nil)
					v1 = nil
					CellResult4:set(nil)
					CellResult4:set(nil)
					p5:set(ChooseResult)
					
					return
				end
				v1 = nil
				local Drag = nil
				
				if Callback2 then
					Drag = Callback2("drag")
				else
					if p4.onPresentedChange then
						p4.onPresentedChange(false)
					else
						p4.isPresented:set(false)
					end
					Drag = not p4.isPresented:peek()
				end
				if not Drag then
					local Source3 = ReadSourceFunction(p5, nil)
					local ByIdEntry3 = ById[Source3]
					local ByIdEntry31 = nil
					
					if ByIdEntry3 then
						PeekResult = Source3
						ByIdEntry31 = ByIdEntry3
					else
						ByIdEntry31 = ById[PeekResult]
					end
					local Id = ByIdEntry31.id
					CellResult4:set(nil)
					p5:set(Id)
				end
			end
		end
		
		if p7 then
			Compose.watch(function(Callback)
				-- upvalues: p7 (copy), v1 (ref), CellResult4 (copy)
				if not Callback(p7.exiting) and v1 == nil then
					CellResult4:set(nil)
				end
			end)
		end
		local function lowest(p13): number
			-- upvalues: Detents (copy), heightOf (copy)
			local Smallest = 1e999
			
			for _, detent in Detents do
				Smallest = math.min(Smallest, (heightOf(detent, p13)))
			end
			return Smallest
		end
		
		local function standing(p14): number
			-- upvalues: painted (copy), Detents (copy), heightOf (copy)
			local PaintedResult: number = painted(p14)
			local Smallest = 1e999
			
			for _, detent in Detents do
				Smallest = math.min(Smallest, (heightOf(detent, p14)))
			end
			return (math.max(PaintedResult, Smallest))
		end
		
		local GuiService = p1.config.guiService
		
		if GuiService and GuiService.GetInsetArea and ParentResult and ParentResult:IsA("ScreenGui") then
			local PbarInset = p1.observe.TopbarInset(GuiService)
			FormulaResult1 = Compose.formula(function(Callback)
				-- upvalues: PbarInset (copy), CellResult1 (copy), CellResult (copy), FormulaResult (copy), GuiService (copy), ParentResult (copy), TypesEnum (upval), painted (copy), Detents (copy), heightOf (copy), OverlayPartsModule (upval), p1 (upval), p4 (copy), Edge (copy), Er (copy)
				Callback(PbarInset)
				local CallbackResult = Callback(CellResult1)
				local Largest = math.max(Callback(CellResult), 0.001)
				local CallbackResult1 = Callback(FormulaResult)
				local Success, Result, Result3 = pcall(function()
					-- upvalues: GuiService (upval), ParentResult (upval), TypesEnum (upval)
					return GuiService:GetInsetArea(ParentResult.ScreenInsets), GuiService:GetInsetArea(TypesEnum.ScreenInsets.CoreUISafeInsets)
				end)
				
				if not Success then
					return {}
				end
				local MinRatio = (Result3.Min - Result.Min) / Largest
				local MaxRatio = (Result.Max - Result3.Max) / Largest
				local PaintedResult: number = painted(Callback)
				local Smallest = 1e999
				
				for _, detent in Detents do
					Smallest = math.min(Smallest, (heightOf(detent, Callback)))
				end
				local Largest1 = math.max(PaintedResult, Smallest)
				local Smallest1 = math.min(OverlayPartsModule.width(p1, p4.width, Callback), CallbackResult.X)
				local YRatio: number = if CallbackResult1 == "side" then 0 elseif CallbackResult1 == "center" then (CallbackResult.Y - Largest1) / 2 else CallbackResult.Y - Largest1
				local XDelta: number = if CallbackResult1 == "side" then if Edge == "left" then 0 else CallbackResult.X - Smallest1 else (CallbackResult.X - Smallest1) / 2
				local ScaledErResult = Er(Callback) / Callback(CellResult) * (if CallbackResult1 == "center" then 0.5 else 1)
				
				return {
					top = math.max(0, MinRatio.Y - YRatio + ScaledErResult),
					bottom = math.max(0, MaxRatio.Y - (CallbackResult.Y - YRatio - Largest1) - ScaledErResult),
					left = math.max(0, MinRatio.X - XDelta),
					right = math.max(0, MaxRatio.X - (CallbackResult.X - XDelta - Smallest1))
				}
			end)
		end
		local PeekResult1 = p5:peek()
		local CellResult6 = Compose.cell(0)
		local v2 = nil
		local CellResult7 = Compose.cell(false)
		local SettleModuleResult1 = SettleModule(p1, function(): number
			return 0
		end, p1.motionSpring("sheet"))
		
		local function pulled(p15)
			-- upvalues: ReadFunction (upval), CellResult7 (copy), ReadSourceFunction (upval), CellResult6 (copy), SettleModuleResult1 (copy)
			return if ReadFunction(CellResult7, p15) then ReadSourceFunction(CellResult6, p15) else ReadSourceFunction(SettleModuleResult1.value, p15) or ReadSourceFunction(CellResult6, p15)
		end
		
		local function toward(): number
			-- upvalues: Edge (copy)
			return if Edge == "left" then -1 else 1
		end
		
		local function pullTo(X)
			-- upvalues: v2 (ref), NowResult (ref), Frames (upval), Edge (copy), CellResult6 (copy), ReadFunction (upval), p4 (copy)
			local v3 = v2
			
			if v3 == nil then return end
			if math.abs(X - v3.origin) > 4 then
				NowResult = if Frames then Frames.now() else os.clock()
				v3.moved = true
			end
			local Largest = math.max(0, (X - v3.origin) * (if Edge == "left" then -1 else 1))
			local IsNotReadResult = ReadFunction(p4.interactiveDismissDisabled, nil) ~= true
			CellResult6:set(if IsNotReadResult then Largest else Largest * 0.2)
			table.insert(v3.samples, {
				height = CellResult6:peek(),
				at = if Frames then Frames.now() else os.clock()
			})
		end
		
		local function release()
			-- upvalues: v2 (ref), CellResult7 (copy), SettleModuleResult1 (copy), CellResult6 (copy), NowResult (ref), Frames (upval), ReadFunction (upval), p4 (copy), Detents (copy), heightOf (copy), ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref), CellResult4 (copy), Callback2 (copy), velocity (copy), OverlayPartsModule (upval), p1 (upval), CellResult1 (copy)
			local v3 = v2
			v2 = nil
			
			if v3 == nil then return end
			CellResult7:set(false)
			
			if v3.moved then
				local PeekResult1 = CellResult6:peek()
				local VelocityResult: number = velocity(v3.samples)
				local Smallest = math.min(OverlayPartsModule.width(p1, p4.width), CellResult1:peek().X)
				
				if ReadFunction(p4.interactiveDismissDisabled, nil) ~= true and (Smallest / 3 < PeekResult1 or VelocityResult > 600) then
					local Drag = nil
					if Callback2 then
						Drag = Callback2("drag")
					else
						if p4.onPresentedChange then
							p4.onPresentedChange(false)
						else
							p4.isPresented:set(false)
						end
						Drag = not p4.isPresented:peek()
					end
					if Drag then return end
				end
				SettleModuleResult1.launch(PeekResult1, VelocityResult)
				CellResult6:set(0)
				
				return
			else
				SettleModuleResult1.launch(CellResult6:peek(), 0)
				CellResult6:set(0)
				NowResult = if Frames then Frames.now() else os.clock()
				local v4 = nil
				
				if ReadFunction(p4.interactiveDismissDisabled, nil) ~= true then
					v4 = nil
				else
					local Copy = table.clone(Detents)
					table.sort(Copy, function(A, B): boolean
						-- upvalues: heightOf (upval)
						local v5 = heightOf(A)
						local v6 = heightOf(B)
						
						return if v5 == v6 then A.index < B.index else v5 < v6
					end)
					local FindFunction = table.find
					local Source = ReadSourceFunction(p5, nil)
					local ByIdEntry = ById[Source]
					local ByIdEntry1 = nil
					
					if ByIdEntry then
						PeekResult = Source
						ByIdEntry1 = ByIdEntry
					else
						ByIdEntry1 = ById[PeekResult]
					end
					v4 = Copy[(FindFunction(Copy, ByIdEntry1) or 1) + 1]
				end
				if v4 then
					local Id = v4.id
					CellResult4:set(nil)
					p5:set(Id)
					
					return
				end
				if ReadFunction(p4.interactiveDismissDisabled, nil) ~= true then
					if Callback2 then
						local _ = Callback2("close")
						
						return
					end
					if p4.onPresentedChange then
						p4.onPresentedChange(false)
					else
						p4.isPresented:set(false)
					end
					local _ = not p4.isPresented:peek()
				end
			end
		end
		
		Compose.cleanup(function()
			-- upvalues: v1 (ref), v2 (ref)
			v1 = nil
			v2 = nil
		end)
		
		local function detector(Name, Source)
			-- upvalues: p1 (upval), FormulaResult (copy), Edge (copy), Host (upval), TypesEnum (upval), TypesVector2 (upval), GuiService (copy), PreferredInputResult (copy), DragIndicator (copy), p4 (copy), v2 (ref), ReadFunction (upval), CellResult7 (copy), ReadSourceFunction (upval), CellResult6 (copy), SettleModuleResult1 (copy), grab (copy), pullTo (copy), move (copy), release (copy), finish (copy)
			local function _(): boolean
				-- upvalues: Source (copy), p1 (upval), FormulaResult (upval), Edge (upval)
				return Source == "grip" and (if p1.readSource(FormulaResult, nil) == "side" then Edge else "bottom") ~= "bottom"
			end
			
			return Host.UIDragDetector({
				Name = Name,
				CursorIcon = function(p15): string
					-- upvalues: Source (copy), p1 (upval), FormulaResult (upval), Edge (upval)
					return if Source == "panel" then "" elseif (if p1.readSource(FormulaResult, p15) == "side" then Edge else "bottom") == "bottom" then "rbxasset://SystemCursors/SizeNS" else "rbxasset://SystemCursors/SizeEW"
				end,
				ActivatedCursorIcon = function(): string
					-- upvalues: Source (copy)
					return if Source == "grip" then "rbxasset://SystemCursors/ClosedHand" else ""
				end,
				DragStyle = TypesEnum.UIDragDetectorDragStyle.TranslateLine,
				DragAxis = function(p15)
					-- upvalues: Source (copy), p1 (upval), FormulaResult (upval), Edge (upval), TypesVector2 (upval)
					if Source == "grip" and (if p1.readSource(FormulaResult, p15) == "side" then Edge else "bottom") ~= "bottom" then
						return (TypesVector2.new(1, 0))
					else
						return (TypesVector2.new(0, 1))
					end
				end,
				ResponseStyle = TypesEnum.UIDragDetectorResponseStyle.CustomOffset,
				Enabled = if Source == "grip" and GuiService and GuiService.GetPropertyChangedSignal and PreferredInputResult then nil else function(Callback): boolean
					-- upvalues: FormulaResult (upval), Source (copy), p1 (upval), DragIndicator (upval), p4 (upval), PreferredInputResult (upval), TypesEnum (upval)
					return Callback(FormulaResult) ~= "center" and (if Source == "grip" then p1.readSource(FormulaResult, Callback) ~= "center" and (DragIndicator ~= "hidden" and (p4.closeButton == nil or p4.closeButton == false)) and (Source ~= "panel" or (PreferredInputResult == nil or Callback(PreferredInputResult) ~= TypesEnum.PreferredInput.Gamepad)) else Source ~= "panel" or (PreferredInputResult == nil or Callback(PreferredInputResult) ~= TypesEnum.PreferredInput.Gamepad))
				end,
				DragStart = function(Vector)
					-- upvalues: Source (copy), p1 (upval), FormulaResult (upval), Edge (upval), v2 (upval), ReadFunction (upval), CellResult7 (upval), ReadSourceFunction (upval), CellResult6 (upval), SettleModuleResult1 (upval), p4 (upval), grab (upval)
					if Source ~= "grip" or (if p1.readSource(FormulaResult, nil) == "side" then Edge else "bottom") == "bottom" then
						grab(Source, Vector.Y)
					elseif v2 == nil then
						local Source1 = if ReadFunction(CellResult7, nil) then ReadSourceFunction(CellResult6, nil) else ReadSourceFunction(SettleModuleResult1.value, nil) or ReadSourceFunction(CellResult6, nil)
						SettleModuleResult1.halt()
						local IsNotReadResult = ReadFunction(p4.interactiveDismissDisabled, nil) ~= true
						v2 = {
							moved = false,
							origin = Vector.X - (if IsNotReadResult then Source1 else Source1 / 0.2) * (if Edge == "left" then -1 else 1),
							samples = {}
						}
						CellResult6:set(Source1)
						CellResult7:set(true)
						
						return
					end
				end,
				DragContinue = function(Vector)
					-- upvalues: Source (copy), p1 (upval), FormulaResult (upval), Edge (upval), pullTo (upval), move (upval)
					if Source == "grip" and (if p1.readSource(FormulaResult, nil) == "side" then Edge else "bottom") ~= "bottom" then
						pullTo(Vector.X)
						
						return
					else
						move(Source, Vector.Y)
					end
				end,
				DragEnd = function()
					-- upvalues: Source (copy), p1 (upval), FormulaResult (upval), Edge (upval), release (upval), finish (upval)
					if Source == "grip" and (if p1.readSource(FormulaResult, nil) == "side" then Edge else "bottom") ~= "bottom" then
						release()
						
						return
					else
						finish(Source)
					end
				end
			})
		end
		
		local FormulaResult3 = Compose.formula(function(p15): boolean
			-- upvalues: heightOf (copy), ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref), Detents (copy)
			local Source = ReadSourceFunction(p5, p15)
			local ByIdEntry = ById[Source]
			local ByIdEntry1 = nil
			
			if ByIdEntry then
				PeekResult = Source
				ByIdEntry1 = ByIdEntry
			else
				ByIdEntry1 = ById[PeekResult]
			end
			local HeightOfResult = heightOf(ByIdEntry1, p15)
			
			for _, detent in Detents do
				if HeightOfResult < heightOf(detent, p15) then
					return false
				end
			end
			return true
		end)
		local Grabber = Host.TextButton("Grabber")({
			SelectionOrder = -2,
			Attributes = { FacetFocusPart = "DragHandle" },
			AnchorPoint = TypesVector2.new(0.5, 0.5),
			Position = function(p16)
				-- upvalues: p1 (upval), FormulaResult (copy), Edge (copy), p3 (upval), config2 (copy), TypesUDim2 (upval), FormulaResult2 (ref), ReadSourceFunction (upval)
				local Edge1 = if p1.readSource(FormulaResult, p16) == "side" then Edge else "bottom"
				local NewInsetResult = p3.inset(0, config2[Edge1], nil, p16) + 10
				
				return if Edge1 == "bottom" then TypesUDim2.new(0.5, ((FormulaResult2 and ReadSourceFunction(FormulaResult2, p16).left or 0) - (FormulaResult2 and ReadSourceFunction(FormulaResult2, p16).right or 0)) / 2, 0, NewInsetResult) elseif Edge1 == "left" then TypesUDim2.new(1, -NewInsetResult, 0.5, 0) else TypesUDim2.new(0, NewInsetResult, 0.5, 0)
			end,
			Visible = showGrabber,
			Size = function(p16)
				-- upvalues: p1 (upval), FormulaResult (copy), Edge (copy), TypesUDim2 (upval)
				return if (if p1.readSource(FormulaResult, p16) == "side" then Edge else "bottom") == "bottom" then TypesUDim2.fromOffset(88, 44) else TypesUDim2.fromOffset(44, 88)
			end,
			BackgroundTransparency = 1,
			ZIndex = 2,
			Text = "",
			AutoButtonColor = false,
			Activated = function(Input)
				-- upvalues: Frames (upval), NowResult (ref), TypesEnum (upval), ReadFunction (upval), p4 (copy), Detents (copy), heightOf (copy), ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref), CellResult4 (copy), Callback2 (copy)
				if (if Frames then Frames.now() else os.clock()) - NowResult < 0.3 then return end
				if Input == nil or Input.UserInputType ~= TypesEnum.UserInputType.Touch and Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1 then
					local Copy = table.clone(Detents)
					table.sort(Copy, function(A, B): boolean
						-- upvalues: heightOf (upval)
						local v3 = heightOf(A)
						local v4 = heightOf(B)
						
						return if v3 == v4 then A.index < B.index else v3 < v4
					end)
					local FindFunction1 = table.find
					local Source = ReadSourceFunction(p5, nil)
					local ByIdEntry = ById[Source]
					local ByIdEntry3 = nil
					
					if ByIdEntry then
						PeekResult = Source
						ByIdEntry3 = ByIdEntry
					else
						ByIdEntry3 = ById[PeekResult]
					end
					local Entry = Copy[(FindFunction1(Copy, ByIdEntry3) or 1) + 1]
					
					if Entry then
						local Id = Entry.id
						CellResult4:set(nil)
						p5:set(Id)
						
						return
					end
					if ReadFunction(p4.interactiveDismissDisabled, nil) ~= true then
						if Callback2 then
							local _ = Callback2("close")
							
							return
						end
						if p4.onPresentedChange then
							p4.onPresentedChange(false)
						else
							p4.isPresented:set(false)
						end
						local _ = not p4.isPresented:peek()
					end
					return
				else
					local v3 = nil
					if ReadFunction(p4.interactiveDismissDisabled, nil) ~= true then
						v3 = nil
					else
						local Copy1 = table.clone(Detents)
						table.sort(Copy1, function(A, B): boolean
							-- upvalues: heightOf (upval)
							local v4 = heightOf(A)
							local v5 = heightOf(B)
							
							return if v4 == v5 then A.index < B.index else v4 < v5
						end)
						local FindFunction = table.find
						local Source1 = ReadSourceFunction(p5, nil)
						local ByIdEntry1 = ById[Source1]
						local ByIdEntry2 = nil
						
						if ByIdEntry1 then
							PeekResult = Source1
							ByIdEntry2 = ByIdEntry1
						else
							ByIdEntry2 = ById[PeekResult]
						end
						v3 = Copy1[(FindFunction(Copy1, ByIdEntry2) or 1) + 1]
					end
					if v3 then
						local Id = v3.id
						CellResult4:set(nil)
						p5:set(Id)
						
						return
					end
					if ReadFunction(p4.interactiveDismissDisabled, nil) ~= true then
						if Callback2 then
							local _ = Callback2("close")
							
							return
						end
						if p4.onPresentedChange then
							p4.onPresentedChange(false)
						else
							p4.isPresented:set(false)
						end
						local _ = not p4.isPresented:peek()
					end
				end
			end,
			detector("UIDragDetector", "grip"),
			p1.styled(Host.Frame("DragHandle")({
				AnchorPoint = TypesVector2.new(0.5, 0.5),
				Position = TypesUDim2.fromScale(0.5, 0.5),
				Size = function(p16)
					-- upvalues: p1 (upval), FormulaResult (copy), Edge (copy), TypesUDim2 (upval)
					return if (if p1.readSource(FormulaResult, p16) == "side" then Edge else "bottom") == "bottom" then TypesUDim2.fromOffset(36, 5) else TypesUDim2.fromOffset(5, 36)
				end,
				BorderSizePixel = 0,
				Host.UICorner({ CornerRadius = p1.round })
			}), "grabber")
		})
		
		if GuiService and GuiService.GetPropertyChangedSignal and PreferredInputResult then
			local ObserveResult = p1.selection.observe()
			Runtime.decorate(assert(Grabber:FindFirstChildWhichIsA("UIDragDetector")), {
				Enabled = function(Callback): boolean
					-- upvalues: p1 (upval), FormulaResult (copy), DragIndicator (copy), p4 (copy), PreferredInputResult (copy), TypesEnum (upval), ObserveResult (copy), Grabber (copy)
					return p1.readSource(FormulaResult, Callback) ~= "center" and (DragIndicator ~= "hidden" and (p4.closeButton == nil or p4.closeButton == false)) and not (Callback(PreferredInputResult) == TypesEnum.PreferredInput.Gamepad and Callback(ObserveResult) == Grabber)
				end
			})
		end
		local _ = function(p16, p17)
			-- upvalues: Detents (copy), heightOf (copy), ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref)
			local Copy = table.clone(Detents)
			table.sort(Copy, function(A, B): boolean
				-- upvalues: heightOf (upval)
				local v3 = heightOf(A)
				local v4 = heightOf(B)
				
				return if v3 == v4 then A.index < B.index else v3 < v4
			end)
			local FindFunction = table.find
			local Source = ReadSourceFunction(p5, p17)
			local ByIdEntry = ById[Source]
			local ByIdEntry1 = nil
			
			if ByIdEntry then
				PeekResult = Source
				ByIdEntry1 = ByIdEntry
			else
				ByIdEntry1 = ById[PeekResult]
			end
			return Copy[(FindFunction(Copy, ByIdEntry1) or 1) + p16]
		end
		
		p2.adjustable(Grabber, {
			axis = "horizontal",
			enabled = function(p16): boolean
				-- upvalues: p1 (upval), FormulaResult (copy), DragIndicator (copy), p4 (copy), Detents (copy), ReadFunction (upval)
				return p1.readSource(FormulaResult, p16) ~= "center" and (DragIndicator ~= "hidden" and (p4.closeButton == nil or p4.closeButton == false)) and (#Detents > 1 or ReadFunction(p4.interactiveDismissDisabled, p16) ~= true)
			end,
			onAdjust = function(p16)
				-- upvalues: Detents (copy), heightOf (copy), ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref), CellResult4 (copy)
				local Copy = table.clone(Detents)
				table.sort(Copy, function(A, B): boolean
					-- upvalues: heightOf (upval)
					local v3 = heightOf(A)
					local v4 = heightOf(B)
					
					return if v3 == v4 then A.index < B.index else v3 < v4
				end)
				local FindFunction = table.find
				local Source = ReadSourceFunction(p5, nil)
				local ByIdEntry = ById[Source]
				local ByIdEntry1 = nil
				
				if ByIdEntry then
					PeekResult = Source
					ByIdEntry1 = ByIdEntry
				else
					ByIdEntry1 = ById[PeekResult]
				end
				local Entry = Copy[(FindFunction(Copy, ByIdEntry1) or 1) + p16]
				
				if Entry then
					local Id = Entry.id
					CellResult4:set(nil)
					p5:set(Id)
				end
			end,
			canAdjust = function(p16, p17): boolean
				-- upvalues: Detents (copy), heightOf (copy), ReadSourceFunction (upval), p5 (copy), ById (copy), PeekResult (ref)
				local Copy = table.clone(Detents)
				table.sort(Copy, function(A, B): boolean
					-- upvalues: heightOf (upval)
					local v3 = heightOf(A)
					local v4 = heightOf(B)
					
					return if v3 == v4 then A.index < B.index else v3 < v4
				end)
				local FindFunction = table.find
				local Source = ReadSourceFunction(p5, p17)
				local ByIdEntry = ById[Source]
				local ByIdEntry1 = nil
				
				if ByIdEntry then
					PeekResult = Source
					ByIdEntry1 = ByIdEntry
				else
					ByIdEntry1 = ById[PeekResult]
				end
				return Copy[(FindFunction(Copy, ByIdEntry1) or 1) + p16] ~= nil
			end
		})
		Compose.watch(function(Callback1)
			-- upvalues: p5 (copy), PeekResult1 (ref), v1 (ref), CellResult4 (copy), Grabber (copy), Detents (copy), heightOf (copy), ReadSourceFunction (upval), ById (copy), PeekResult (ref), Callback (upval)
			local CallbackResult = Callback1(p5)
			
			if CallbackResult ~= PeekResult1 then
				PeekResult1 = CallbackResult
				
				if v1 then
					v1 = nil
					CellResult4:set(nil)
				end
			end
			local AttributeName = "AccessibleLabel"
			local Copy = table.clone(Detents)
			table.sort(Copy, function(A, B): boolean
				-- upvalues: heightOf (upval)
				local v3 = heightOf(A)
				local v4 = heightOf(B)
				
				return if v3 == v4 then A.index < B.index else v3 < v4
			end)
			local FindFunction = table.find
			local Source = ReadSourceFunction(p5, Callback1)
			local ByIdEntry = ById[Source]
			local ByIdEntry1 = nil
			
			if ByIdEntry then
				PeekResult = Source
				ByIdEntry1 = ByIdEntry
			else
				ByIdEntry1 = ById[PeekResult]
			end
			local Value = nil
			if Copy[(FindFunction(Copy, ByIdEntry1) or 1) + 1] then
				local v3 = "Resize: "
				local Source1 = ReadSourceFunction(p5, Callback1)
				local ByIdEntry2 = ById[Source1]
				local ByIdEntry21 = nil
				
				if ByIdEntry2 then
					PeekResult = Source1
					ByIdEntry21 = ByIdEntry2
				else
					ByIdEntry21 = ById[PeekResult]
				end
				Value = v3 .. Callback(ByIdEntry21.id)
			else
				Value = "Close sheet"
			end
			Grabber:SetAttribute(AttributeName, Value)
		end)
		
		return {
			edge = Edge,
			level = LevelResult,
			unit = CellResult,
			keyboard = keyboard,
			extent = CellResult1,
			placed = FormulaResult,
			showGrabber = showGrabber,
			reserve = reserve,
			pad = pad,
			outset = outset,
			reached = Reached,
			hugHeight = CellResult3,
			ready = CellResult5,
			painted = painted,
			canDismiss = CanDismiss,
			close = close,
			interactive = interactive,
			lowest = lowest,
			standing = standing,
			pulled = pulled,
			toward = toward,
			detector = detector,
			tallest = FormulaResult3,
			grabber = Grabber,
			handle = Grabber
		}
	end
end