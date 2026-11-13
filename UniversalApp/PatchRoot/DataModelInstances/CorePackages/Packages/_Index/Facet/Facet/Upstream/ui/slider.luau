local PointerDragModule = require("./pointer_drag")
local _ = require("./input_kit")
local InputValueModule = require("./input_value")
local _ = require("./input_types")
local _ = require("./types")
local _ = require("./control_types")
local _ = require("../vendor/compose/core")
local list = {
	"value", "min", "max", "step", "format", "enabled", "onChange", "onCommit",
	"label", "tapToPosition", "row", "thumbImage", "trackImage", "axis", "range",
	"minGap", "thumb", "thumbContent", "trackContent", "rotation", "controlSize",
	"contained"
}
local config = { xsmall = 3, compact = 4, regular = 6, large = 8 }

local function _(Value: number)
	return if type(Value) == "number" and Value == Value and math.abs(Value) < 1e999 then Value else nil
end

return function(p1, p2, p3)
	-- upvalues: config (copy), InputValueModule (copy), PointerDragModule (copy), list (copy)
	local config1 = {
		enabled = p3.enabled,
		stopEnabled = p3.stopEnabled,
		writable = p3.writable,
		attributes = p3.attributes,
		valueAttributes = p3.valueAttributes,
		adjustment = p3.adjustment,
		paintedPart = p3.paintedPart
	}
	local Runtime = p1.runtime
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local ReadSourceFunction = p1.readSource
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	
	local function _(Callback)
		-- upvalues: Compose (copy)
		return Compose.isValue(Callback) or type(Callback) == "function"
	end
	
	local function derive(Callback, ...)
		-- upvalues: Compose (copy)
		for i = 1, select("#", ...) do
			local Selected = select(i, ...)
			
			if Compose.isValue(Selected) or type(Selected) == "function" then
				return Callback
			end
		end
		return Callback(nil)
	end
	
	local _ = function(p4)
		-- upvalues: Compose (copy)
		local EnabledFunction = p4.enabled
		local IsValue = Compose.isValue(EnabledFunction) or type(EnabledFunction) == "function"
		
		if not IsValue then
			local DisabledFunction = p4.disabled
			IsValue = Compose.isValue(DisabledFunction) or type(DisabledFunction) == "function"
			
			if not IsValue then
				local BusyFunction = p4.busy
				IsValue = Compose.isValue(BusyFunction) or type(BusyFunction) == "function"
			end
		end
		return IsValue
	end
	
	local _ = function(p4)
		-- upvalues: config1 (copy), Compose (copy)
		local function compute(p5)
			-- upvalues: config1 (upval), p4 (copy)
			return config1.enabled(p4, p5)
		end
		
		local EnabledFunction = p4.enabled
		local IsValue = Compose.isValue(EnabledFunction) or type(EnabledFunction) == "function"
		
		if not IsValue then
			local DisabledFunction = p4.disabled
			IsValue = Compose.isValue(DisabledFunction) or type(DisabledFunction) == "function"
			
			if not IsValue then
				local BusyFunction = p4.busy
				IsValue = Compose.isValue(BusyFunction) or type(BusyFunction) == "function"
			end
		end
		return if IsValue then compute else config1.enabled(p4, nil)
	end
	
	local function construction(Frame)
		-- upvalues: Compose (copy), p1 (copy)
		for _, value in {
			"axis",
			"range",
			"minGap",
			"thumb",
			"tapToPosition"
		} do
			local Callback = Frame[value]
			
			if Compose.isValue(Callback) or type(Callback) == "function" then
				error(`Facet UI.Slider: {value} is decided at construction; pass a plain value`, 0)
			end
		end
		assert(Frame.axis == nil or (Frame.axis == "x" or Frame.axis == "y"), "Facet UI.Slider: axis must be x or y")
		assert(Frame.thumb == nil or (Frame.thumb == "always" or (Frame.thumb == "auto" or Frame.thumb == "none")), "Facet UI.Slider: thumb must be always | auto | none")
		assert(Frame.range == nil or type(Frame.range) == "boolean", "Facet UI.Slider: range must be a boolean")
		assert(Frame.thumbContent == nil or type(Frame.thumbContent) == "function", "Facet UI.Slider: thumbContent must be a function")
		assert(Frame.trackContent == nil or type(Frame.trackContent) == "function", "Facet UI.Slider: trackContent must be a function")
		
		if Frame.thumbContent and Frame.thumbImage then
			error("Facet UI.Slider: thumbImage and thumbContent both draw the handle; pass one", 0)
		end
		if Frame.trackContent and Frame.trackImage then
			error("Facet UI.Slider: trackImage and trackContent both draw the track; pass one", 0)
		end
		if Frame.controlSize ~= nil then
			p1.controlSize(Frame.controlSize, "height")
		end
	end
	
	local _ = function(p4, p5)
		-- upvalues: ReadFunction (copy), config (upval)
		return config[ReadFunction(p4.controlSize, p5) or "regular"] or 6
	end
	
	local function unrotate(Frame: Frame, Vector, Degrees: number)
		local AbsoluteSize = Frame.AbsoluteSize
		local AbsolutePosition = Frame.AbsolutePosition
		local XDelta = Vector.X - (AbsolutePosition.X + AbsoluteSize.X / 2)
		local YDelta = Vector.Y - (AbsolutePosition.Y + AbsoluteSize.Y / 2)
		
		if Degrees % 360 ~= 0 then
			local Negated = -math.rad(Degrees)
			local XDeltaDelta = XDelta * math.cos(Negated) - YDelta * math.sin(Negated)
			YDelta = XDelta * math.sin(Negated) + YDelta * math.cos(Negated)
			XDelta = XDeltaDelta
		end
		return XDelta + AbsoluteSize.X / 2, YDelta + AbsoluteSize.Y / 2
	end
	
	local _ = function(Frame: Frame, p4, p5, p6)
		-- upvalues: unrotate (copy)
		local AbsoluteSize = Frame.AbsoluteSize
		local UnrotateResult, UnrotateResult2 = unrotate(Frame, p4, p6)
		
		if p5 then
			return AbsoluteSize.Y - UnrotateResult2, AbsoluteSize.Y
		else
			return UnrotateResult, AbsoluteSize.X
		end
	end
	
	local _ = function(p4, p5: number, p6: number)
		local v1 = p5 - p6
		
		return if p5 <= 0 then nil elseif v1 > 0 then (p4 - p6 / 2) / v1 else 0.5
	end
	
	local _ = function(p4: number, p5): number
		return (math.round((0.5 - p4) * p5))
	end
	
	local function knob(Frame, Name, Thumb, Callback1, Callback, CellResult, Shown, IsY, NoThumbContent, p4)
		-- upvalues: p1 (copy), derive (copy), TypesUDim2 (copy), TypesVector2 (copy), Compose (copy), config1 (copy), Host (copy), TypesEnum (copy), TypesUDim (copy)
		local function _(p5): number
			-- upvalues: Frame (copy), p1 (upval)
			return if Frame.controlSize == nil then 24 else math.max(8, 24 + p1.controlSize(Frame.controlSize, "iconSize", p5) - p1.controlSize("regular", "iconSize", p5))
		end
		
		local Thumb1 = Frame.thumb or "always"
		local Theme = if Frame.controlSize == nil then nil else p1.config.theme
		local DeriveResult = derive(function(p5)
			-- upvalues: Frame (copy), p1 (upval), TypesUDim2 (upval)
			local Largest: number = if Frame.controlSize == nil then 24 else math.max(8, 24 + p1.controlSize(Frame.controlSize, "iconSize", p5) - p1.controlSize("regular", "iconSize", p5))
			
			return TypesUDim2.fromOffset(Largest, Largest)
		end, Frame.controlSize, Theme)
		local DeriveResult1 = derive(function(p5)
			-- upvalues: Frame (copy), p1 (upval), TypesVector2 (upval)
			local Largest: number = if Frame.controlSize == nil then 24 else math.max(8, 24 + p1.controlSize(Frame.controlSize, "iconSize", p5) - p1.controlSize("regular", "iconSize", p5))
			
			return TypesVector2.new(Largest, Largest)
		end, Frame.controlSize, Theme)
		local Shown1 = if Thumb1 == "always" then nil else Thumb1 ~= "none" and Shown
		local v1: number = if NoThumbContent then 44 else 24
		local Thumb2: string = if Name == "ThumbStop" then "Thumb" else "Knob"
		local SliderThumbs = {
			ZIndex = 3,
			Name = Name,
			AnchorPoint = TypesVector2.new(0.5, 0.5),
			Position = function(Callback1)
				-- upvalues: Callback (copy), p4 (copy), IsY (copy), TypesUDim2 (upval)
				local CallbackResult: number = Callback(Callback1)
				local Rounded = math.round((0.5 - CallbackResult) * Callback1(p4))
				
				return if IsY then TypesUDim2.new(0.5, 0, 1 - CallbackResult, -Rounded) else TypesUDim2.new(CallbackResult, Rounded, 0.5, 0)
			end,
			Size = TypesUDim2.fromOffset(v1, v1)
		}
		
		local _ = function(p5)
			-- upvalues: Frame (copy), p1 (upval), Compose (upval), IsY (copy), p4 (copy)
			if Frame.thumb ~= "none" then
				local AbsoluteSizeResult = p1.observe.AbsoluteSize(p5)
				Compose.watch(function(Callback)
					-- upvalues: AbsoluteSizeResult (copy), IsY (upval), p4 (upval), Frame (upval), p1 (upval)
					local CallbackResult = Callback(AbsoluteSizeResult)
					local Y = if IsY then CallbackResult.Y else CallbackResult.X
					p4:set(if Y > 0 then Y elseif Frame.controlSize == nil then 24 else math.max(8, 24 + p1.controlSize(Frame.controlSize, "iconSize", Callback) - p1.controlSize("regular", "iconSize", Callback)))
				end)
				
				return
			end
		end
		
		local ThumbContentFunction = Frame.thumbContent
		
		if NoThumbContent or ThumbContentFunction then
			local SliderThumb = if ThumbContentFunction then Host.Frame(Thumb2)({
				BackgroundTransparency = 1,
				AnchorPoint = TypesVector2.new(0.5, 0.5),
				Position = TypesUDim2.fromScale(0.5, 0.5),
				Size = TypesUDim2.fromOffset(0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				Visible = Shown1,
				Host.UISizeConstraint({ MinSize = DeriveResult1 }),
				Host.UIListLayout({
					HorizontalAlignment = TypesEnum.HorizontalAlignment.Center,
					VerticalAlignment = TypesEnum.VerticalAlignment.Center
				}),
				(ThumbContentFunction({
					thumb = Thumb,
					value = Compose.formula(function(p5)
						-- upvalues: Callback1 (copy)
						return Callback1(p5)
					end),
					fraction = Compose.formula(function(p5)
						-- upvalues: Callback (copy)
						return Callback(p5)
					end),
					dragging = CellResult,
					enabled = Compose.formula(function(p5)
						-- upvalues: config1 (upval), Frame (copy)
						return config1.enabled(Frame, p5)
					end)
				}))
			}) else config1.paintedPart({
				Name = Thumb2,
				AnchorPoint = TypesVector2.new(0.5, 0.5),
				Position = TypesUDim2.fromScale(0.5, 0.5),
				Size = DeriveResult,
				Visible = Shown1,
				Host.UICorner({ CornerRadius = p1.round })
			}, Frame.thumbImage, "slider-thumb", "sliderThumb")
			local GuiObject = ThumbContentFunction and SliderThumb:FindFirstChildWhichIsA("GuiObject") or SliderThumb
			
			if Frame.thumb ~= "none" then
				local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(GuiObject)
				Compose.watch(function(Callback)
					-- upvalues: AbsoluteSizeResult1 (copy), IsY (copy), p4 (copy), Frame (copy), p1 (upval)
					local CallbackResult = Callback(AbsoluteSizeResult1)
					local Y = if IsY then CallbackResult.Y else CallbackResult.X
					p4:set(if Y > 0 then Y elseif Frame.controlSize == nil then 24 else math.max(8, 24 + p1.controlSize(Frame.controlSize, "iconSize", Callback) - p1.controlSize("regular", "iconSize", Callback)))
				end)
			end
			if NoThumbContent then
				SliderThumbs.BackgroundTransparency = 1
				SliderThumbs[#SliderThumbs + 1] = SliderThumb
				SliderThumbs[#SliderThumbs + 1] = Host.UICorner({ CornerRadius = TypesUDim.new(0.5, 0) })
				
				return Host.Frame(SliderThumbs)
			else
				SliderThumbs.BackgroundTransparency = 1
				SliderThumbs.Size = TypesUDim2.fromOffset(0, 0)
				SliderThumbs.AutomaticSize = TypesEnum.AutomaticSize.XY
				SliderThumbs[#SliderThumbs + 1] = Host.UISizeConstraint({ MinSize = DeriveResult1 })
				SliderThumbs[#SliderThumbs + 1] = SliderThumb
				
				return Host.Frame(SliderThumbs)
			end
		else
			local SliderThumb1 = config1.paintedPart({
				Name = Name,
				AnchorPoint = TypesVector2.new(0.5, 0.5),
				Position = SliderThumbs.Position,
				Size = DeriveResult,
				Visible = Shown1,
				ZIndex = 3,
				Host.UICorner({ CornerRadius = p1.round })
			}, Frame.thumbImage, "slider-thumb", "sliderThumb")
			
			if Frame.thumb == "none" then
				return SliderThumb1
			else
				local AbsoluteSizeResult = p1.observe.AbsoluteSize(SliderThumb1)
				Compose.watch(function(Callback)
					-- upvalues: AbsoluteSizeResult (copy), IsY (copy), p4 (copy), Frame (copy), p1 (upval)
					local CallbackResult = Callback(AbsoluteSizeResult)
					local Y = if IsY then CallbackResult.Y else CallbackResult.X
					p4:set(if Y > 0 then Y elseif Frame.controlSize == nil then 24 else math.max(8, 24 + p1.controlSize(Frame.controlSize, "iconSize", Callback) - p1.controlSize("regular", "iconSize", Callback)))
				end)
				
				return SliderThumb1
			end
		end
	end
	
	p2.Slider = p1.construct("Slider", function(Frame)
		-- upvalues: construction (copy), InputValueModule (upval), ReadFunction (copy), config1 (copy), PointerDragModule (upval), p1 (copy), Compose (copy), TypesEnum (copy), ReadSourceFunction (copy), unrotate (copy), Host (copy), config (upval), TypesVector2 (copy), TypesUDim2 (copy), derive (copy), knob (copy), Runtime (copy), list (upval)
		construction(Frame)
		local IsRange = Frame.range == true
		local IsY = Frame.axis == "y"
		local Thumb = Frame.thumb or "always"
		local InputValueModuleResult = InputValueModule(Frame, ReadFunction)
		local MinGap = Frame.minGap or 0
		local IsMaxAbove = true
		
		if Frame.minGap ~= nil then
			local MinGap1: number = Frame.minGap
			IsMaxAbove = if type(MinGap1) == "number" and MinGap1 == MinGap1 and math.abs(MinGap1) < 1e999 then MinGap1 and (MinGap >= 0 and MinGap <= InputValueModuleResult.max - InputValueModuleResult.min) else nil
		end
		assert(IsMaxAbove, "Facet UI.Slider: minGap must be a number from 0 to the width of the range")
		
		local function problem(CellResults)
			-- upvalues: MinGap (copy)
			if type(CellResults) == "table" then
				local Lower: number = CellResults.lower
				local Lower1 = if type(Lower) == "number" and Lower == Lower and math.abs(Lower) < 1e999 then Lower else nil
				local Upper: number = CellResults.upper
				local Upper1 = if type(Upper) == "number" and Upper == Upper and math.abs(Upper) < 1e999 then Upper else nil
				
				return if Lower1 == nil or Upper1 == nil then "a range value has finite lower and upper numbers" elseif Upper1 < Lower1 then `lower {Lower1} is above upper {Upper1}` elseif Upper1 - Lower1 < MinGap - 0.000000001 then `the pair {Lower1}-{Upper1} is narrower than minGap {MinGap}` else nil
			else
				return "a range value is { lower, upper }"
			end
		end
		
		if IsRange then
			local ProblemResult = problem((ReadFunction(Frame.value)))
			
			if ProblemResult then
				error(`Facet UI.Slider: {ProblemResult}`, 0)
			end
			assert(config1.writable(Frame.value) or type(Frame.onChange) == "function", "Facet.Slider: editing a read-only value requires onChange")
		else
			assert(type(ReadFunction(Frame.value)) == "number", "Facet.Slider: value must resolve to a number")
			assert(config1.writable(Frame.value) or type(Frame.onChange) == "function", "Facet.Slider: editing a read-only value requires onChange")
		end
		local PointerDragModuleResult, PointerDragModuleResult2 = PointerDragModule(p1)
		
		local function pointerDrag(p4)
			-- upvalues: config1 (upval), Frame (copy), PointerDragModuleResult (copy)
			return config1.enabled(Frame, p4) and PointerDragModuleResult(p4)
		end
		
		local function _(p4): number
			-- upvalues: ReadFunction (upval), Frame (copy)
			local ReadResult: number = ReadFunction(Frame.rotation, p4)
			assert(ReadResult == nil or (if type(ReadResult) == "number" and ReadResult == ReadResult and math.abs(ReadResult) < 1e999 then ReadResult else nil), "Facet UI.Slider: rotation must be a finite number of degrees")
			
			return ReadResult or 0
		end
		
		local SliderTrack = nil
		local CellResults = {}
		
		local _ = function(Key)
			-- upvalues: CellResults (copy), Compose (upval), Thumb (copy)
			CellResults[Key] = Compose.cell(if Thumb == "none" then 0 else 24)
		end
		
		if IsRange then
			CellResults.lower = Compose.cell(if Thumb == "none" then 0 else 24)
			CellResults.upper = Compose.cell(if Thumb == "none" then 0 else 24)
		else
			CellResults.value = Compose.cell(if Thumb == "none" then 0 else 24)
		end
		local function extentOf(Lower)
			-- upvalues: CellResults (copy)
			return assert(CellResults[Lower])
		end
		
		local CellResult = Compose.cell(false)
		local CellResult1 = Compose.cell(false)
		local CellResult2 = Compose.cell(false)
		
		local function shown(Callback)
			-- upvalues: Thumb (copy), CellResult1 (copy), CellResult2 (copy), CellResult (copy), PointerDragModuleResult2 (copy), TypesEnum (upval)
			return Thumb ~= "none" and (Thumb == "always" or (Callback(CellResult1) or (Callback(CellResult2) or (Callback(CellResult) or Callback(PointerDragModuleResult2) == TypesEnum.PreferredInput.Touch))))
		end
		
		local List = {}
		local CellResult3 = Compose.cell(if IsRange then table.clone(ReadFunction(Frame.value)) else nil)
		
		if IsRange then
			Compose.watch(function(p4)
				-- upvalues: ReadFunction (upval), Frame (copy), problem (copy), List (copy), CellResult3 (copy)
				local ReadResult = ReadFunction(Frame.value, p4)
				local ProblemResult = problem(ReadResult)
				
				if not ProblemResult then
					CellResult3:set({ lower = ReadResult.lower, upper = ReadResult.upper })
					
					return
				end
				if List[#List] ~= ProblemResult then
					table.insert(List, ProblemResult)
					
					if #List > 16 then
						table.remove(List, 1)
					end
				end
			end)
		end
		local function pair(p4)
			-- upvalues: ReadSourceFunction (upval), CellResult3 (copy)
			return assert(ReadSourceFunction(CellResult3, p4))
		end
		
		local function single(p4)
			-- upvalues: ReadFunction (upval), Frame (copy)
			return ReadFunction(Frame.value, p4)
		end
		
		local HapticResult = p1.haptic(true)
		
		local function proposeSingle(SteppedResult): boolean
			-- upvalues: config1 (upval), Frame (copy), InputValueModuleResult (copy), ReadFunction (upval), HapticResult (copy)
			if not config1.enabled(Frame) then
				return false
			end
			local QuantizeResult = InputValueModuleResult.quantize(SteppedResult)
			
			if ReadFunction(Frame.value, nil) == QuantizeResult then
				return false
			end
			if Frame.onChange then
				Frame.onChange(QuantizeResult)
			else
				Frame.value:set(QuantizeResult)
			end
			local IsReadResultMatch = ReadFunction(Frame.value, nil) == QuantizeResult
			
			if IsReadResultMatch and HapticResult and Frame.step ~= nil then
				HapticResult:Play()
			end
			return IsReadResultMatch
		end
		
		local function proposePair(CellResults, Thumb): boolean
			-- upvalues: config1 (upval), Frame (copy), ReadSourceFunction (upval), CellResult3 (copy), HapticResult (copy)
			if not config1.enabled(Frame) then
				return false
			end
			local CellResults1 = assert(ReadSourceFunction(CellResult3, nil))
			
			if CellResults1.lower == CellResults.lower and CellResults1.upper == CellResults.upper then
				return false
			end
			if Frame.onChange then
				Frame.onChange({ lower = CellResults.lower, upper = CellResults.upper }, { thumb = Thumb })
			else
				Frame.value:set({ lower = CellResults.lower, upper = CellResults.upper })
			end
			if HapticResult and Frame.step ~= nil then
				HapticResult:Play()
			end
			return true
		end
		
		local function moveThumb(Thumb, SteppedResult)
			-- upvalues: ReadSourceFunction (upval), CellResult3 (copy), InputValueModuleResult (copy), MinGap (copy), proposePair (copy)
			local CellResults = assert(ReadSourceFunction(CellResult3, nil))
			local config = { lower = CellResults.lower, upper = CellResults.upper }
			
			if Thumb == "lower" then
				config.lower = math.min(InputValueModuleResult.quantize(SteppedResult), CellResults.upper - MinGap)
				config.lower = math.max(config.lower, InputValueModuleResult.min)
			else
				config.upper = math.max(InputValueModuleResult.quantize(SteppedResult), CellResults.lower + MinGap)
				config.upper = math.min(config.upper, InputValueModuleResult.max)
			end
			return (proposePair(config, Thumb))
		end
		
		local function commit(Thumb)
			-- upvalues: Frame (copy), IsRange (copy), ReadSourceFunction (upval), CellResult3 (copy), single (copy)
			local OnCommitFunction: (any, any) -> () = Frame.onCommit
			
			if OnCommitFunction then
				if IsRange then
					local CellResults = assert(ReadSourceFunction(CellResult3, nil))
					OnCommitFunction({ lower = CellResults.lower, upper = CellResults.upper }, { thumb = Thumb })
					
					return
				else
					OnCommitFunction(single())
				end
			end
		end
		
		local Config = nil
		
		local function cancel()
			-- upvalues: Config (ref), CellResult (copy), proposePair (copy), ReadFunction (upval), Frame (copy)
			local Config1 = Config
			
			if Config1 == nil then return end
			Config = nil
			CellResult:set(false)
			local Snapshot = Config1.snapshot
			
			if type(Snapshot) == "table" then
				proposePair({ lower = Snapshot.lower, upper = Snapshot.upper }, Config1.thumb)
				
				return
			end
			if ReadFunction(Frame.value, nil) ~= Snapshot then
				if Frame.onChange then
					Frame.onChange(Snapshot)
					
					return
				end
				Frame.value:set(Snapshot)
			end
		end
		
		local function begin(Thumb)
			-- upvalues: Config (ref), IsRange (copy), pair (copy), ReadFunction (upval), Frame (copy), CellResult (copy)
			Config = {
				thumb = Thumb,
				snapshot = if IsRange then table.clone(pair()) else ReadFunction(Frame.value, nil)
			}
			CellResult:set(true)
		end
		
		local function drive(p4)
			-- upvalues: Config (ref), SliderTrack (ref), IsY (copy), ReadFunction (upval), Frame (copy), unrotate (upval), CellResults (copy), InputValueModuleResult (copy), IsRange (copy), moveThumb (copy), proposeSingle (copy)
			local Config1 = Config
			
			if Config1 == nil then return end
			local Frame1 = SliderTrack
			local ReadResult: number = ReadFunction(Frame.rotation, nil)
			assert(ReadResult == nil or (if type(ReadResult) == "number" and ReadResult == ReadResult and math.abs(ReadResult) < 1e999 then ReadResult else nil), "Facet UI.Slider: rotation must be a finite number of degrees")
			local ReadResult1: number = ReadResult or 0
			local AbsoluteSize = Frame1.AbsoluteSize
			local UnrotateResult, UnrotateResult2 = unrotate(Frame1, p4, ReadResult1)
			local YDelta = nil
			local Y = nil
			
			if IsY then
				YDelta = AbsoluteSize.Y - UnrotateResult2
				Y = AbsoluteSize.Y
			else
				YDelta = UnrotateResult
				Y = AbsoluteSize.X
			end
			local PeekResult: number = assert(CellResults[Config1.thumb]):peek()
			local YDelta1 = Y - PeekResult
			local Value = if Y <= 0 then nil elseif YDelta1 > 0 then (YDelta - PeekResult / 2) / YDelta1 else 0.5
			
			if Value == nil then return end
			local NewMin = InputValueModuleResult.min + math.clamp(Value, 0, 1) * (InputValueModuleResult.max - InputValueModuleResult.min)
			
			if IsRange then
				moveThumb(Config1.thumb, NewMin)
				
				return
			else
				proposeSingle(NewMin)
			end
		end
		
		local function finish()
			-- upvalues: Config (ref), CellResult (copy), commit (copy)
			local Config1 = Config
			
			if Config1 ~= nil then
				Config = nil
				CellResult:set(false)
				commit(Config1.thumb)
				
				return
			end
		end
		
		local function nearest(p4): string
			-- upvalues: SliderTrack (ref), IsY (copy), ReadFunction (upval), Frame (copy), unrotate (upval), ReadSourceFunction (upval), CellResult3 (copy), CellResults (copy), InputValueModuleResult (copy)
			local Frame1 = SliderTrack
			local ReadResult: number = ReadFunction(Frame.rotation, nil)
			assert(ReadResult == nil or (if type(ReadResult) == "number" and ReadResult == ReadResult and math.abs(ReadResult) < 1e999 then ReadResult else nil), "Facet UI.Slider: rotation must be a finite number of degrees")
			local ReadResult1: number = ReadResult or 0
			local AbsoluteSize = Frame1.AbsoluteSize
			local UnrotateResult, UnrotateResult2 = unrotate(Frame1, p4, ReadResult1)
			local YDelta = nil
			local Y = nil
			
			if IsY then
				YDelta = AbsoluteSize.Y - UnrotateResult2
				Y = AbsoluteSize.Y
			else
				YDelta = UnrotateResult
				Y = AbsoluteSize.X
			end
			local CellResults1 = assert(ReadSourceFunction(CellResult3, nil))
			
			local function _(p5): number
				-- upvalues: CellResults (upval), CellResults1 (copy), InputValueModuleResult (upval), Y (copy)
				local PeekResult: number = assert(CellResults[p5]):peek()
				
				return PeekResult / 2 + InputValueModuleResult.fraction(if p5 == "lower" then CellResults1.lower else CellResults1.upper) * math.max(0, Y - PeekResult)
			end
			
			local PeekResult: number = assert(CellResults.lower):peek()
			local NewPeekResult = PeekResult / 2 + InputValueModuleResult.fraction(CellResults1.lower) * math.max(0, Y - PeekResult)
			local PeekResult1: number = assert(CellResults.upper):peek()
			local NewPeekResult1 = PeekResult1 / 2 + InputValueModuleResult.fraction(CellResults1.upper) * math.max(0, Y - PeekResult1)
			
			return if CellResults1.lower == CellResults1.upper then if YDelta < NewPeekResult then "lower" elseif NewPeekResult1 < YDelta then "upper" elseif CellResults1.lower <= InputValueModuleResult.min then "upper" else "lower" elseif math.abs(YDelta - NewPeekResult) <= math.abs(YDelta - NewPeekResult1) then "lower" else "upper"
		end
		
		local v1 = Host.UIDragDetector("Drag")({
			ResponseStyle = TypesEnum.UIDragDetectorResponseStyle.CustomOffset,
			Enabled = pointerDrag,
			DragStart = function(p4)
				-- upvalues: config1 (upval), Frame (copy), begin (copy), IsRange (copy), nearest (copy), drive (copy)
				if not config1.enabled(Frame) then return end
				begin(if IsRange then nearest(p4) else "value")
				
				if Frame.tapToPosition ~= false then
					drive(p4)
				end
			end,
			DragContinue = function(p4)
				-- upvalues: drive (copy)
				drive(p4)
			end,
			DragEnd = finish
		})
		
		local function fraction(Lower)
			-- upvalues: InputValueModuleResult (copy)
			return InputValueModuleResult.fraction(Lower)
		end
		
		assert(Frame.contained == nil or type(Frame.contained) == "boolean", "Facet UI.Slider: contained must be a boolean")
		local IsContained = Frame.contained == true
		
		local function v106(p4)
			-- upvalues: IsContained (copy), p1 (upval), IsRange (copy), CellResults (copy), Frame (copy), ReadFunction (upval), config (upval)
			local Source = if IsContained then p1.readSource(assert(CellResults[if IsRange then "lower" else "value"]), p4) else 0
			
			return if Source > 0 then Source else config[ReadFunction(Frame.controlSize, p4) or "regular"] or config.regular
		end
		
		local _ = function()
			-- upvalues: IsContained (copy), Host (upval), p1 (upval)
			return if IsContained then Host.UICorner({ CornerRadius = p1.round }) else p1.corner(3)
		end
		
		local List1 = {}
		
		if Frame.trackContent then
			table.insert(List1, Host.Frame("TrackContent")({
				BackgroundTransparency = 1,
				AnchorPoint = TypesVector2.new(0.5, 0.5),
				Position = TypesUDim2.fromScale(0.5, 0.5),
				Size = TypesUDim2.fromScale(1, 1),
				Host.UIListLayout({
					HorizontalAlignment = TypesEnum.HorizontalAlignment.Center,
					VerticalAlignment = TypesEnum.VerticalAlignment.Center
				}),
				(Frame.trackContent())
			}))
		else
			table.insert(List1, config1.paintedPart({
				Name = "Rail",
				Size = derive(function(p5)
					-- upvalues: IsY (copy), TypesUDim2 (upval), IsContained (copy), p1 (upval), IsRange (copy), CellResults (copy), Frame (copy), ReadFunction (upval), config (upval)
					if IsY then
						local Source = if IsContained then p1.readSource(assert(CellResults[if IsRange then "lower" else "value"]), p5) else 0
						
						return (TypesUDim2.new(0, if Source > 0 then Source else config[ReadFunction(Frame.controlSize, p5) or "regular"] or config.regular, 1, 0))
					else
						local Source = if IsContained then p1.readSource(assert(CellResults[if IsRange then "lower" else "value"]), p5) else 0
						
						return (TypesUDim2.new(1, 0, 0, if Source > 0 then Source else config[ReadFunction(Frame.controlSize, p5) or "regular"] or config.regular))
					end
				end, Frame.controlSize, if IsContained then v106 else nil),
				Position = TypesUDim2.fromScale(if IsY then 0.5 else 0, 0.5),
				AnchorPoint = TypesVector2.new(if IsY then 0.5 else 0, 0.5),
				if IsContained then Host.UICorner({ CornerRadius = p1.round }) else p1.corner(3)
			}, Frame.trackImage, "slider-rail", "sliderTrack"))
			local SliderFill = p1.styled(Host.Frame("Fill")({
				Size = function(Callback)
					-- upvalues: IsRange (copy), ReadSourceFunction (upval), CellResult3 (copy), InputValueModuleResult (copy), extentOf (copy), ReadFunction (upval), Frame (copy), IsY (copy), TypesUDim2 (upval), IsContained (copy), p1 (upval), CellResults (copy), config (upval)
					local FractionResult = 0
					local Rounded = 0
					local FractionResult1 = nil
					local Rounded1 = nil
					
					if IsRange then
						local CellResults1 = assert(ReadSourceFunction(CellResult3, Callback))
						FractionResult = InputValueModuleResult.fraction(CellResults1.lower)
						FractionResult1 = InputValueModuleResult.fraction(CellResults1.upper)
						Rounded = math.round((0.5 - FractionResult) * Callback(extentOf("lower")))
						Rounded1 = math.round((0.5 - FractionResult1) * Callback(extentOf("upper")))
					else
						FractionResult1 = InputValueModuleResult.fraction((ReadFunction(Frame.value, Callback)))
						Rounded1 = math.round((0.5 - FractionResult1) * Callback(extentOf("value")))
					end
					if IsY then
						local Source = if IsContained then p1.readSource(assert(CellResults[if IsRange then "lower" else "value"]), Callback) else 0
						
						return (TypesUDim2.new(0, if Source > 0 then Source else config[ReadFunction(Frame.controlSize, Callback) or "regular"] or config.regular, FractionResult1 - FractionResult, Rounded1 - Rounded))
					else
						local Source = if IsContained then p1.readSource(assert(CellResults[if IsRange then "lower" else "value"]), Callback) else 0
						
						return (TypesUDim2.new(FractionResult1 - FractionResult, Rounded1 - Rounded, 0, if Source > 0 then Source else config[ReadFunction(Frame.controlSize, Callback) or "regular"] or config.regular))
					end
				end,
				Position = function(Callback)
					-- upvalues: IsRange (copy), ReadSourceFunction (upval), CellResult3 (copy), InputValueModuleResult (copy), extentOf (copy), IsY (copy), TypesUDim2 (upval)
					local FractionResult = if IsRange then InputValueModuleResult.fraction(assert(ReadSourceFunction(CellResult3, Callback)).lower) else 0
					local Rounded: number = if IsRange then math.round((0.5 - FractionResult) * Callback(extentOf("lower"))) else 0
					
					return if IsY then TypesUDim2.new(0.5, 0, 1 - FractionResult, -Rounded) else TypesUDim2.new(FractionResult, Rounded, 0.5, 0)
				end,
				AnchorPoint = TypesVector2.new(if IsY then 0.5 else 0, if IsY then 1 else 0.5),
				if IsContained then Host.UICorner({ CornerRadius = p1.round }) else p1.corner(3)
			}), "slider-fill")
			p1.skin(SliderFill, "barFill")
			table.insert(List1, SliderFill)
		end
		local NoThumbContent: boolean = not IsRange and ((Frame.thumb or "always") == "always" and Frame.thumbContent == nil)
		local t = {}
		
		if IsRange then
			for i = 1, 2 do
				local Lower: string = if i == 1 then "lower" else "upper"
				local KnobResult = knob(Frame, if Lower == "lower" then "HandleLower" else "HandleUpper", Lower, function(p6)
					-- upvalues: ReadSourceFunction (upval), CellResult3 (copy), Lower (copy)
					local CellResults = assert(ReadSourceFunction(CellResult3, p6))
					
					return if Lower == "lower" then CellResults.lower else CellResults.upper
				end, function(p6)
					-- upvalues: ReadSourceFunction (upval), CellResult3 (copy), fraction (copy), Lower (copy)
					local CellResults = assert(ReadSourceFunction(CellResult3, p6))
					
					return fraction(if Lower == "lower" then CellResults.lower else CellResults.upper)
				end, CellResult, shown, IsY, true, extentOf(Lower))
				Runtime.mountFragment(function()
					-- upvalues: Host (upval), TypesEnum (upval), pointerDrag (copy), config1 (upval), Frame (copy), begin (copy), Lower (copy), drive (copy), finish (copy)
					return {
						Host.UIDragDetector("Drag")({
							ResponseStyle = TypesEnum.UIDragDetectorResponseStyle.CustomOffset,
							Enabled = pointerDrag,
							DragStart = function()
								-- upvalues: config1 (upval), Frame (upval), begin (upval), Lower (upval)
								if config1.enabled(Frame) then
									begin(Lower)
									
									return
								end
							end,
							DragContinue = function(p6)
								-- upvalues: drive (upval)
								drive(p6)
							end,
							DragEnd = finish
						})
					}
				end, KnobResult)
				t[Lower] = KnobResult
				table.insert(List1, KnobResult)
			end
		else
			local Value = knob(Frame, if NoThumbContent then "ThumbStop" else "Thumb", "value", function(p6)
				-- upvalues: single (copy)
				return single(p6)
			end, function(p6)
				-- upvalues: fraction (copy), single (copy)
				return fraction(single(p6))
			end, CellResult, shown, IsY, NoThumbContent, extentOf("value"))
			t.value = Value
			table.insert(List1, Value)
		end
		table.insert(List1, v1)
		table.insert(List1, Host.UISizeConstraint({ MinSize = TypesVector2.new(44, 44) }))
		local config2 = {
			Name = "Track",
			BackgroundTransparency = 1,
			Size = if IsY then TypesUDim2.new(0, 44, 1, 0) else TypesUDim2.new(1, 0, 0, 44),
			Rotation = if Frame.rotation == nil then nil else function(p6): number
				-- upvalues: ReadFunction (upval), Frame (copy)
				local ReadResult: number = ReadFunction(Frame.rotation, p6)
				assert(ReadResult == nil or (if type(ReadResult) == "number" and ReadResult == ReadResult and math.abs(ReadResult) < 1e999 then ReadResult else nil), "Facet UI.Slider: rotation must be a finite number of degrees")
				
				return ReadResult or 0
			end
		}
		
		for _, value in List1 do
			config2[#config2 + 1] = value
		end
		SliderTrack = p1.styled(Host.Frame(config2), "slider-track")
		local SliderTrack1 = SliderTrack
		
		if Frame.rotation ~= nil then
			Runtime.decorate(SliderTrack, { Size = TypesUDim2.fromScale(1, 1) })
			SliderTrack1 = Host.Frame("TrackSlot")({
				Size = config2.Size,
				BackgroundTransparency = 1,
				Host.UISizeConstraint({ MinSize = TypesVector2.new(44, 44) }),
				SliderTrack
			})
		end
		local GuiStateResult = if Thumb == "always" or Thumb == "none" then nil else p1.observe.GuiState(SliderTrack)
		local PeekResult = PointerDragModuleResult2:peek()
		Compose.watch(function(Callback)
			-- upvalues: GuiStateResult (copy), CellResult1 (copy), TypesEnum (upval), PointerDragModuleResult2 (copy), PeekResult (ref), cancel (copy)
			if GuiStateResult then
				CellResult1:set(Callback(GuiStateResult) == TypesEnum.GuiState.Hover)
			end
			local CallbackResult = Callback(PointerDragModuleResult2)
			
			if CallbackResult ~= PeekResult then
				PeekResult = CallbackResult
				cancel()
			end
		end)
		local Title = (if Frame.row then Frame.row.title else nil) or Frame.label
		local EnabledFunction = Frame.enabled
		local IsValue = Compose.isValue(EnabledFunction) or type(EnabledFunction) == "function"
		
		if not IsValue then
			local DisabledFunction = Frame.disabled
			IsValue = Compose.isValue(DisabledFunction) or type(DisabledFunction) == "function"
			
			if not IsValue then
				local BusyFunction = Frame.busy
				IsValue = Compose.isValue(BusyFunction) or type(BusyFunction) == "function"
			end
		end
		if IsValue then
			Compose.watch(function(p6)
				-- upvalues: config1 (upval), Frame (copy), cancel (copy)
				if not config1.enabled(Frame, p6) then
					cancel()
				end
			end)
		end
		local Value = p1.text({
			Name = "Value",
			Text = if IsRange then function(p6): string
				-- upvalues: ReadSourceFunction (upval), CellResult3 (copy), InputValueModuleResult (copy)
				local CellResults = assert(ReadSourceFunction(CellResult3, p6))
				
				return `{InputValueModuleResult.format(CellResults.lower)} – {InputValueModuleResult.format(CellResults.upper)}`
			end else "",
			AutomaticSize = TypesEnum.AutomaticSize.XY
		})
		
		if not Frame.row and not IsY then
			Runtime.decorate(Value, {
				Size = TypesUDim2.fromOffset(44, 0),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				TextXAlignment = TypesEnum.TextXAlignment.Right
			})
		end
		local List2 = {}
		local List3 = {}
		
		if Frame.row then
			local Row = Frame.row
			local List4 = { Value }
			
			if Frame.label or Row.title then
				table.insert(List4, 1, p1.text({
					Name = "Title",
					Text = Row.title or Frame.label,
					Size = TypesUDim2.fromOffset(0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y,
					TextWrapped = true,
					Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
				}))
			end
			table.insert(List3, p1.row(List4, {
				Name = "Header",
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			}))
			
			if Row.description then
				table.insert(List3, p1.text({
					Name = "Description",
					TextWrapped = true,
					Text = Row.description,
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y
				}))
			end
			table.insert(List3, SliderTrack1)
		else
			if Frame.label then
				table.insert(List2, p1.text({
					Name = "Label",
					Text = Frame.label,
					TextTruncate = TypesEnum.TextTruncate.AtEnd,
					Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Shrink }),
					Host.UIPadding({ PaddingRight = p1.types.UDim.new(0, 20) }),
					AutomaticSize = TypesEnum.AutomaticSize.XY
				}))
			end
			if not IsY then
				Runtime.decorate(SliderTrack1, { Size = TypesUDim2.fromOffset(0, 44) })
			end
			Runtime.mount(function()
				-- upvalues: Host (upval), TypesEnum (upval)
				return Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
			end, SliderTrack1)
			table.insert(List2, SliderTrack1)
			table.insert(List2, Value)
		end
		local PropsResult = p1.props(Frame, list, {
			BackgroundTransparency = 1,
			Selectable = function(p6)
				-- upvalues: config1 (upval), Frame (copy)
				return config1.stopEnabled(Frame, p6)
			end,
			Size = if IsY then TypesUDim2.new(0, 0, 1, 0) else TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = if IsY then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.Y
		})
		local Slider = nil
		
		if Frame.row and not IsY then
			local ListRowResult, ListRowResult2, ListRowResult3 = p1.listRow({
				described = true,
				leading = if Frame.row.icon then { p1.icon(Frame.row.icon, { Name = "LeadingIcon" }) } else nil,
				captions = List3,
				controlSize = Frame.controlSize
			})
			
			if Frame.Size == nil then
				PropsResult.Size = ListRowResult2
				PropsResult.AutomaticSize = Frame.AutomaticSize or TypesEnum.AutomaticSize.Y
			end
			PropsResult[#PropsResult + 1] = ListRowResult
			PropsResult[#PropsResult + 1] = Host.UIPadding({})
			Slider = p1.styled(Host.Frame(PropsResult), "slider")
			ListRowResult3(Slider)
			Slider:AddTag("facet-slider-settings")
		else
			Slider = p1.styled(if Frame.row then p1.column(List3, PropsResult) elseif IsY then p1.column(List2, PropsResult) else p1.row(List2, PropsResult), "slider")
		end
		if IsY then
			assert(Slider:FindFirstChildWhichIsA("UIListLayout")).HorizontalAlignment = TypesEnum.HorizontalAlignment.Center
		elseif not Frame.row then
			assert(Slider:FindFirstChildWhichIsA("UIListLayout")).VerticalAlignment = TypesEnum.VerticalAlignment.Center
		end
		local ObserveResult = if p1.config.services.GuiService then p1.selection.observe() else nil
		
		if ObserveResult then
			Compose.watch(function(Callback)
				-- upvalues: CellResult2 (copy), ObserveResult (copy), Slider (ref)
				CellResult2:set(Callback(ObserveResult) == Slider)
			end)
		end
		local function relative(Parent): string
			-- upvalues: Slider (ref)
			local List = {}
			local Parent1 = Parent
			while Parent1 and Parent1 ~= Slider do
				table.insert(List, 1, Parent1.Name)
				Parent1 = Parent1.Parent
			end
			return table.concat(List, "/")
		end
		
		if not IsRange then
			config1.attributes(Slider, {
				AccessibleLabel = function(p6)
					-- upvalues: Title (copy), p1 (upval), InputValueModuleResult (copy), single (copy)
					local Title1 = if Title == nil then nil elseif type(Title) == "string" then Title else p1.readSource(Title, p6)
					
					return if Title1 and Title1 ~= "" then Title1 else InputValueModuleResult.format(single(p6))
				end
			})
			Slider:SetAttribute("FacetFocusPart", relative(if NoThumbContent then t.value else SliderTrack))
			config1.adjustment(Slider, Frame, function(p6)
				-- upvalues: proposeSingle (copy), InputValueModuleResult (copy), ReadFunction (upval), Frame (copy), commit (copy)
				if proposeSingle(InputValueModuleResult.stepped(ReadFunction(Frame.value, nil), p6)) then
					commit("value")
				end
			end, cancel, InputValueModuleResult.min, InputValueModuleResult.max, { guard = true, vertical = IsY })
		end
		if IsRange then
			local Lower1 = Compose.cell("lower")
			
			if ObserveResult then
				Compose.watch(function(Callback)
					-- upvalues: ObserveResult (copy), Slider (ref), Lower1 (copy)
					if Callback(ObserveResult) ~= Slider then
						Lower1:set("lower")
					end
				end)
			end
			Compose.watch(function(Callback)
				-- upvalues: Lower1 (copy), Slider (ref), relative (copy), t (copy)
				local Upper: string = if Callback(Lower1) == "upper" then "upper" else "lower"
				Slider:SetAttribute("adjusting", Upper)
				Slider:SetAttribute("FacetFocusPart", relative(t[Upper]))
			end)
			config1.attributes(Slider, {
				AccessibleLabel = function(Callback)
					-- upvalues: ReadFunction (upval), Frame (copy), Lower1 (copy), p1 (upval)
					local ReadResult = ReadFunction(Frame.label, Callback)
					
					return p1.phrase("Facet.RangeThumb", "{range} {thumb}", {
						range = if ReadResult and ReadResult ~= "" then ReadResult else "Range",
						thumb = Callback(Lower1)
					}, Callback)
				end
			})
			config1.adjustment(Slider, Frame, function(p6)
				-- upvalues: Lower1 (copy), ReadSourceFunction (upval), CellResult3 (copy), moveThumb (copy), InputValueModuleResult (copy), commit (copy)
				local PeekResult = Lower1:peek()
				local CellResults = assert(ReadSourceFunction(CellResult3, nil))
				
				if moveThumb(PeekResult, InputValueModuleResult.stepped(if PeekResult == "lower" then CellResults.lower else CellResults.upper, p6)) then
					commit(PeekResult)
				end
			end, cancel, InputValueModuleResult.min, InputValueModuleResult.max, {
				guard = true,
				vertical = IsY,
				arrows = function(Callback, p6: number): boolean
					-- upvalues: ReadSourceFunction (upval), CellResult3 (copy), Lower1 (copy), InputValueModuleResult (copy)
					local CellResults = assert(ReadSourceFunction(CellResult3, Callback))
					local Upper: string = if Callback(Lower1) == "upper" then "upper" else "lower"
					local Lower = if Upper == "lower" then CellResults.lower else CellResults.upper
					
					return if p6 < 0 then InputValueModuleResult.min < Lower else Lower < InputValueModuleResult.max
				end,
				extra = function(p6)
					-- upvalues: p1 (upval), Slider (ref), TypesEnum (upval), Lower1 (copy)
					p1.action(Slider, "SwitchThumb", { TypesEnum.KeyCode.ButtonA, TypesEnum.KeyCode.Return }, p6, function()
						-- upvalues: p1 (upval), Lower1 (upval)
						local UserInputService = p1.config.services.UserInputService
						
						if not UserInputService or not UserInputService.GetFocusedTextBox or not UserInputService:GetFocusedTextBox() then
							Lower1:set(if Lower1:peek() == "lower" then "upper" else "lower")
							
							return
						end
					end, { priority = 5000 })
				end
			})
			
			for i1 = 1, 2 do
				local Lower2: string = if i1 == 1 then "lower" else "upper"
				config1.attributes(t[Lower2], {
					AccessibleLabel = function(p6)
						-- upvalues: ReadFunction (upval), Frame (copy), p1 (upval), Lower2 (copy)
						local ReadResult = ReadFunction(Frame.label, p6)
						
						return p1.phrase("Facet.RangeThumb", "{range} {thumb}", {
							range = if ReadResult and ReadResult ~= "" then ReadResult else "Range",
							thumb = Lower2
						}, p6)
					end,
					value = function(p6)
						-- upvalues: ReadSourceFunction (upval), CellResult3 (copy), Lower2 (copy)
						local CellResults = assert(ReadSourceFunction(CellResult3, p6))
						
						return if Lower2 == "lower" then CellResults.lower else CellResults.upper
					end,
					minimum = InputValueModuleResult.min,
					maximum = InputValueModuleResult.max
				})
			end
		end
		if IsRange then
			config1.attributes(Slider, {
				lower = function(p6)
					-- upvalues: ReadSourceFunction (upval), CellResult3 (copy)
					return assert(ReadSourceFunction(CellResult3, p6)).lower
				end,
				upper = function(p6)
					-- upvalues: ReadSourceFunction (upval), CellResult3 (copy)
					return assert(ReadSourceFunction(CellResult3, p6)).upper
				end,
				minimum = InputValueModuleResult.min,
				maximum = InputValueModuleResult.max,
				semanticValue = function(p6): string
					-- upvalues: ReadSourceFunction (upval), CellResult3 (copy), InputValueModuleResult (copy)
					local CellResults = assert(ReadSourceFunction(CellResult3, p6))
					
					return `{InputValueModuleResult.format(CellResults.lower)} to {InputValueModuleResult.format(CellResults.upper)} of {InputValueModuleResult.min} to {InputValueModuleResult.max}`
				end,
				diagnostics = function(Callback: (any) -> ()): string
					-- upvalues: CellResult3 (copy), ReadFunction (upval), Frame (copy), List (copy)
					Callback(CellResult3)
					ReadFunction(Frame.value, Callback)
					
					return table.concat(List, "\n")
				end
			})
		else
			config1.valueAttributes(Slider, single, InputValueModuleResult, Value)
		end
		Compose.cleanup(cancel)
		
		return Slider
	end)
end