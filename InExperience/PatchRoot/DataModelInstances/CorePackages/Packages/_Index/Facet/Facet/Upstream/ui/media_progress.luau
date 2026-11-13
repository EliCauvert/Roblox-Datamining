local ReducedFunction = require("./motion").reduced
local _ = require("./types")
local _ = require("./engine_types")
local _ = require("./theme_types")
local _ = require("../vendor/compose/core")
local NavPathShapesModule = require("./nav_path_shapes")
local _ = require("./control_types")
local _ = require("./media_props")
local _ = require("./media_shared")

return function(p1, p2, p3)
	-- upvalues: ReducedFunction (copy), NavPathShapesModule (copy)
	local Host = p1.Host
	local Runtime = p1.runtime
	local Compose = p1.Compose
	local Types = p1.types
	local ReadFunction = p1.read
	local TypesEnum = Types.Enum
	local TypesUDim2 = Types.UDim2
	local TypesVector2 = Types.Vector2
	local MetricFunction = p1.metric
	local ControlSizeFunction = p1.controlSize
	local SkinFunction = p3.skin
	p2.ProgressView = p1.construct("ProgressView", function(p4)
		-- upvalues: ReducedFunction (upval), p1 (copy), ReadFunction (copy), Runtime (copy), Compose (copy), TypesEnum (copy), MetricFunction (copy), TypesVector2 (copy), TypesUDim2 (copy), Host (copy), SkinFunction (copy), ControlSizeFunction (copy), NavPathShapesModule (upval), Types (copy), p2 (copy)
		local ReducedResult = ReducedFunction(p1)
		local Presentation = p4.presentation or "bar"
		assert(Presentation == "bar" or (Presentation == "circular" or (Presentation == "gauge" or Presentation == "spinner")), "Facet ProgressView presentation must be bar, circular, gauge or spinner")
		assert(p4.sweep == nil or Presentation == "gauge", "Facet ProgressView sweep requires the gauge presentation")
		assert(p4.needle == nil or Presentation == "gauge", "Facet ProgressView needle requires the gauge presentation")
		local Sweep = p4.sweep or 240
		assert(type(Sweep) == "number" and Sweep >= 60 and Sweep <= 330, "Facet ProgressView sweep must be a number of degrees from 60 to 330")
		assert(Presentation ~= "gauge" or p4.value ~= nil, "Facet ProgressView gauge requires a value")
		assert(p4.segments == nil or Presentation == "bar", "Facet ProgressView segments require bar presentation")
		assert(p4.diameter == nil or Presentation ~= "bar", "Facet ProgressView diameter requires a circular presentation")
		assert(Presentation ~= "bar" or (p4.controlSize == nil or p4.thickness == nil), "Facet ProgressView: give thickness or controlSize, not both (a bar's rung is its track thickness)")
		assert(Presentation == "bar" or (p4.controlSize == nil or p4.diameter == nil), "Facet ProgressView: give diameter or controlSize, not both (a ring's rung is its diameter)")
		assert(p4.endLabel == nil or type(ReadFunction(p4.endLabel)) == "string", "Facet ProgressView endLabel must be a string")
		local Segments = p4.segments or 1
		local MotionDurationsTrailSettle: boolean = type(Segments) == "number" and (Segments >= 1 and Segments < 1e999) and Segments % 1 == 0
		assert(MotionDurationsTrailSettle, "Facet ProgressView segments must be a positive integer")
		local MotionDurationsTrailDelay = p1.metric("motion.durations.trailDelay")
		MotionDurationsTrailSettle = p1.metric("motion.durations.trailSettle")
		
		if p4.trail then
			assert(type(p4.trail) == "table", "Facet ProgressView trail must be a table")
			MotionDurationsTrailDelay = p4.trail.delay or MotionDurationsTrailDelay
			MotionDurationsTrailSettle = p4.trail.duration or MotionDurationsTrailSettle
			assert(type(MotionDurationsTrailDelay) == "number" and (MotionDurationsTrailDelay >= 0 and (MotionDurationsTrailDelay < 1e999 and (type(MotionDurationsTrailSettle) == "number" and MotionDurationsTrailSettle > 0))) and MotionDurationsTrailSettle < 1e999, "Facet ProgressView trail delay/duration invalid")
		end
		local NoValue = p4.value == nil
		local Value = p4.value or 0
		local TimelineResult = if NoValue then Runtime.timeline({
			repeats = 1e999,
			duration = p1.metric("motion.durations.progressLoop")
		}) else nil
		
		local function progress(Callback): number
			-- upvalues: TimelineResult (copy), ReducedResult (copy), ReadFunction (upval), p4 (copy), Value (copy)
			if TimelineResult then
				local CallbackResult: number = Callback(TimelineResult.progress)
				
				return if ReducedResult(Callback) then math.floor(CallbackResult * 4) / 4 else CallbackResult
			else
				local ReadResult = ReadFunction(p4.min, Callback) or 0
				local ReadResult1 = ReadFunction(p4.max, Callback) or 1
				assert(ReadResult < ReadResult1, "Facet ProgressView max must exceed min")
				
				return (math.clamp((ReadFunction(Value, Callback) - ReadResult) / (ReadResult1 - ReadResult), 0, 1))
			end
		end
		
		if Presentation ~= "bar" or p4.showValue or p4.trail or Segments > 1 then
			local FormulaResult1 = Compose.formula(progress)
			
			progress = function(Callback)
				-- upvalues: FormulaResult1 (copy)
				return Callback(FormulaResult1)
			end
		end
		local v1 = nil
		
		if p4.trail and not NoValue then
			local TimelineResult1 = Runtime.timeline({
				autoplay = false,
				delay = MotionDurationsTrailDelay,
				duration = MotionDurationsTrailSettle
			})
			local ReadResult = ReadFunction(progress)
			local CellResult = Compose.cell(ReadResult)
			local CellResult1 = Compose.cell(ReadResult)
			local FormulaResult2 = Compose.formula(function(Callback)
				-- upvalues: CellResult (copy), CellResult1 (copy), TimelineResult1 (copy)
				return Callback(CellResult) + (Callback(CellResult1) - Callback(CellResult)) * Callback(TimelineResult1.progress)
			end)
			v1 = FormulaResult2
			Compose.watch(function(p5)
				-- upvalues: progress (ref), ReducedResult (copy), ReadResult (ref), CellResult (copy), CellResult1 (copy), TimelineResult1 (copy), MotionDurationsTrailSettle (ref), FormulaResult2 (copy)
				local ProgressResult = progress(p5)
				
				if ReducedResult(p5) or ReadResult <= ProgressResult then
					CellResult:set(ProgressResult)
					CellResult1:set(ProgressResult)
					TimelineResult1:seek(MotionDurationsTrailSettle)
				else
					CellResult:set(FormulaResult2:peek())
					CellResult1:set(ProgressResult)
					TimelineResult1:restart()
				end
				ReadResult = ProgressResult
			end)
		end
		local v2 = nil
		local EndLabel = if p4.endLabel then p1.text({
			Name = "EndLabel",
			Text = function(p5)
				-- upvalues: ReadFunction (upval), p4 (copy)
				return ReadFunction(p4.endLabel, p5) or ""
			end,
			AutomaticSize = TypesEnum.AutomaticSize.XY
		}, true) else nil
		
		if p4.showValue then
			v2 = p1.text({
				Name = "Value",
				Text = function(p5)
					-- upvalues: NoValue (copy), ReadFunction (upval), Value (copy), p4 (copy), progress (ref)
					if NoValue then
						return "Loading"
					else
						local ReadResult = ReadFunction(Value, p5)
						
						return if p4.format then p4.format(ReadResult) else tostring((math.floor(progress(p5) * 100 + 0.5))) .. "%"
					end
				end,
				AutomaticSize = TypesEnum.AutomaticSize.XY
			}, true)
		end
		local FormulaResult3 = Compose.formula(function(p5)
			-- upvalues: ReadFunction (upval), p1 (upval)
			local ReadResult = ReadFunction(p1.config.theme, p5)
			local BarFill = if ReadResult and ReadResult.chrome then ReadResult.chrome.barFill else nil
			local Direction = BarFill and BarFill.direction or "ltr"
			assert(({ ltr = true, rtl = true, ttb = true, btt = true })[Direction], "Facet progress invalid fill direction")
			
			return Direction
		end)
		
		local function _(Callback)
			-- upvalues: Compose (upval)
			return Compose.isValue(Callback) or type(Callback) == "function"
		end
		
		local ControlSizeFunction1 = p4.controlSize
		local IsValue = Compose.isValue(ControlSizeFunction1) or type(ControlSizeFunction1) == "function"
		
		if not IsValue then
			local ThicknessFunction = p4.thickness
			IsValue = Compose.isValue(ThicknessFunction) or type(ThicknessFunction) == "function"
			
			if not IsValue then
				local ThemeFunction = p1.config.theme
				IsValue = Compose.isValue(ThemeFunction) or type(ThemeFunction) == "function"
			end
		end
		local NoIsValue = not IsValue
		
		local _ = function(Callback, p5)
			-- upvalues: NoIsValue (copy)
			return if NoIsValue and not p5 then Callback(function(p6)
				return p6:peek()
			end) else Callback
		end
		
		local _ = function(Callback): boolean
			-- upvalues: FormulaResult3 (copy)
			return Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
		end
		
		local _ = function(Callback): boolean
			-- upvalues: FormulaResult3 (copy)
			return Callback(FormulaResult3) == "rtl" or Callback(FormulaResult3) == "btt"
		end
		
		local HasEndLabel: boolean = Presentation == "bar" and (p4.label == nil and (if p4.showValue then true else p4.endLabel ~= nil))
		local FrameResult = nil
		
		if Presentation == "bar" then
			local _ = function(p5)
				-- upvalues: ReadFunction (upval), p4 (copy), MetricFunction (upval)
				local ReadResult = ReadFunction(p4.controlSize, p5)
				local ReadResult1 = ReadFunction(p4.thickness, p5)
				
				if not ReadResult1 then
					if ReadResult == "xsmall" or ReadResult == "compact" then
						return (MetricFunction("space.xs", p5))
					end
					ReadResult1 = MetricFunction("controls.progress.trackHeight", p5)
				end
				return ReadResult1
			end
			
			local CellResult2 = Compose.cell(TypesVector2.zero)
			
			local _ = function(p5): boolean
				-- upvalues: ReadFunction (upval), p1 (upval)
				local ReadResult = ReadFunction(p1.config.theme, p5)
				local BarFill = if ReadResult and ReadResult.chrome then ReadResult.chrome.barFill else nil
				
				return BarFill ~= nil and BarFill.span == "fill"
			end
			
			local function ornament(p5, Callback)
				-- upvalues: ReadFunction (upval), p1 (upval), FormulaResult3 (copy), p4 (copy), MetricFunction (upval), CellResult2 (copy)
				local ReadResult = ReadFunction(p1.config.theme, Callback)
				local Chrome = if ReadResult then ReadResult.chrome else nil
				local ChromeEntry = if Chrome then Chrome[p5] else nil
				
				if ChromeEntry == nil or ChromeEntry.kind == "native" or ChromeEntry.kind == "none" then
					return 1, 0
				end
				local Size = if type(ChromeEntry.size) == "table" then ChromeEntry.size else { w = 16, h = 16 }
				local W = Size.w
				local H = Size.h
				
				if Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt" then
					local H1 = H
					H = W
					W = H1
				end
				local ReadResult1 = ReadFunction(p4.controlSize, Callback)
				local ReadResult11 = ReadFunction(p4.thickness, Callback) or (if ReadResult1 == "xsmall" or ReadResult1 == "compact" then MetricFunction("space.xs", Callback) else MetricFunction("controls.progress.trackHeight", Callback))
				local CallbackResult = Callback(CellResult2)
				local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
				local Y = if IsTtb then CallbackResult.Y else CallbackResult.X
				local IsTtb1: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
				local X = if IsTtb1 then CallbackResult.X else CallbackResult.Y
				local Smallest = math.min(1, ReadResult11 / H)
				
				if X > 0 then
					Smallest = math.min(Smallest, Y * ReadResult11 / X / 4 / W)
				end
				local Smallest1: number = if Smallest < 0.5 then 0 else Smallest
				
				if Smallest < 0.5 then
					return Smallest1, 0
				else
					return Smallest1, (math.round(W * Smallest))
				end
			end
			
			local Fills = {
				Name = "FillClip",
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = function(Callback)
					-- upvalues: ornament (copy), FormulaResult3 (copy), TypesUDim2 (upval)
					local _, BarCap2 = ornament("barCap", Callback)
					local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
					
					return if IsTtb then TypesUDim2.new(1, 0, 1, -2 * BarCap2) else TypesUDim2.new(1, -2 * BarCap2, 1, 0)
				end,
				Position = function(Callback)
					-- upvalues: ornament (copy), FormulaResult3 (copy), TypesUDim2 (upval)
					local _, BarCap2 = ornament("barCap", Callback)
					local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
					
					return if IsTtb then TypesUDim2.fromOffset(0, BarCap2) else TypesUDim2.fromOffset(BarCap2, 0)
				end
			}
			local v3 = v1
			
			if v3 then
				Fills[#Fills + 1] = p1.styled(Host.Frame("Trail")({
					BackgroundTransparency = 0.6,
					BorderSizePixel = 0,
					ZIndex = 0,
					Size = function(Callback)
						-- upvalues: ReducedResult (copy), progress (ref), v3 (copy), FormulaResult3 (copy), TypesUDim2 (upval)
						local ProgressResult = if ReducedResult(Callback) then progress(Callback) else math.max(Callback(v3), progress(Callback))
						local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
						
						return if IsTtb then TypesUDim2.fromScale(1, ProgressResult) else TypesUDim2.fromScale(ProgressResult, 1)
					end,
					AnchorPoint = function(Callback)
						-- upvalues: FormulaResult3 (copy), TypesVector2 (upval)
						if Callback(FormulaResult3) == "rtl" or Callback(FormulaResult3) == "btt" then
							local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
							
							return if IsTtb then TypesVector2.new(0, 1) else TypesVector2.new(1, 0)
						else
							return (TypesVector2.new(0, 0))
						end
					end,
					Position = function(Callback)
						-- upvalues: FormulaResult3 (copy), TypesUDim2 (upval)
						if Callback(FormulaResult3) == "rtl" or Callback(FormulaResult3) == "btt" then
							local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
							
							return if IsTtb then TypesUDim2.fromScale(0, 1) else TypesUDim2.fromScale(1, 0)
						else
							return (TypesUDim2.fromScale(0, 0))
						end
					end
				}), "fill")
			end
			local Fills1 = {}
			
			for i = 1, Segments do
				local StyledFunction = p1.styled
				local FrameFunction = Host.Frame
				
				local function v58(Callback)
					-- upvalues: FormulaResult3 (copy), TypesVector2 (upval)
					if Callback(FormulaResult3) == "rtl" or Callback(FormulaResult3) == "btt" then
						local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
						
						return if IsTtb then TypesVector2.new(0, 1) else TypesVector2.new(1, 0)
					else
						return (TypesVector2.new(0, 0))
					end
				end
				
				local config1 = {
					ClipsDescendants = true,
					BorderSizePixel = 0,
					Name = "Fill" .. i,
					AnchorPoint = if NoIsValue then v58(function(p5)
						return p5:peek()
					end) else v58
				}
				
				local function v60(Callback)
					-- upvalues: NoValue (copy), progress (ref), Segments (copy), i (copy), FormulaResult3 (copy), TypesUDim2 (upval)
					local ClampedValue: number = if NoValue then 0.3 else math.clamp(progress(Callback) * Segments - (i - 1), 0, 1)
					local v4: number = if Segments > 1 and ClampedValue > 0 then -2 else 0
					local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
					
					return if IsTtb then TypesUDim2.new(1, 0, ClampedValue / Segments, v4) else TypesUDim2.new(ClampedValue / Segments, v4, 1, 0)
				end
				
				local IsValue1 = NoValue
				local IsValue11: boolean = IsValue1
				
				if not IsValue11 then
					local ValueFunction = p4.value
					IsValue1 = Compose.isValue(ValueFunction) or type(ValueFunction) == "function"
					IsValue11 = IsValue1
				end
				local IsValue2: boolean = IsValue11
				
				if not IsValue2 then
					local MinFunction = p4.min
					IsValue1 = Compose.isValue(MinFunction) or type(MinFunction) == "function"
					IsValue2 = IsValue1
				end
				if not IsValue2 then
					local MaxFunction = p4.max
					IsValue1 = Compose.isValue(MaxFunction) or type(MaxFunction) == "function"
				end
				config1.Size = if NoIsValue and not IsValue1 then v60(function(p5)
					return p5:peek()
				end) else v60
				
				local function v65(Callback)
					-- upvalues: NoValue (copy), ReducedResult (copy), progress (ref), i (copy), Segments (copy), FormulaResult3 (copy), TypesUDim2 (upval)
					local ScaledProgressResult = if NoValue then if ReducedResult(Callback) then progress(Callback) * 0.7 else progress(Callback) * 1.3 - 0.3 else (i - 1) / Segments
					
					if Callback(FormulaResult3) == "rtl" or Callback(FormulaResult3) == "btt" then
						ScaledProgressResult = 1 - ScaledProgressResult
					end
					local FromScaleFunction = TypesUDim2.fromScale
					local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
					local IsTtb1: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
					
					return FromScaleFunction(if IsTtb then 0 else ScaledProgressResult, if IsTtb1 then ScaledProgressResult else 0)
				end
				
				config1.Position = if NoIsValue and not NoValue then v65(function(p5)
					return p5:peek()
				end) else v65
				local Fill = StyledFunction(FrameFunction(config1), "fill")
				Fills[#Fills + 1] = Fill
				Fills1[i] = Fill
			end
			local function v63(Callback)
				-- upvalues: ReadFunction (upval), p4 (copy), MetricFunction (upval), FormulaResult3 (copy), TypesUDim2 (upval), HasEndLabel (copy)
				local ReadResult = ReadFunction(p4.controlSize, Callback)
				local ReadResult1 = ReadFunction(p4.thickness, Callback) or (if ReadResult == "xsmall" or ReadResult == "compact" then MetricFunction("space.xs", Callback) else MetricFunction("controls.progress.trackHeight", Callback))
				local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
				
				return if IsTtb then TypesUDim2.new(0, ReadResult1, 1, 0) elseif HasEndLabel then TypesUDim2.fromOffset(0, ReadResult1) else TypesUDim2.new(1, 0, 0, ReadResult1)
			end
			
			FrameResult = SkinFunction(p1.styled(Host.Frame({
				Name = "Track",
				Size = if NoIsValue then v63(function(p5)
					return p5:peek()
				end) else v63,
				ClipsDescendants = false,
				Host.Frame(Fills)
			}), "track"), "barTrack")
			local LayoutSizeResult = p1.layoutSize(FrameResult)
			Compose.watch(function(Callback)
				-- upvalues: CellResult2 (copy), LayoutSizeResult (copy)
				CellResult2:set(Callback(LayoutSizeResult))
			end)
			
			for i1, value1 in Fills1 do
				SkinFunction(value1, "barFill", {
					Size = function(Callback)
						-- upvalues: ReadFunction (upval), p1 (upval), TypesUDim2 (upval), NoValue (copy), progress (ref), Segments (copy), i1 (copy), FormulaResult3 (copy)
						local ReadResult = ReadFunction(p1.config.theme, Callback)
						local BarFill = if ReadResult and ReadResult.chrome then ReadResult.chrome.barFill else nil
						
						if BarFill ~= nil and BarFill.span == "fill" then
							return TypesUDim2.fromScale(1, 1)
						else
							local v4 = 1 / math.max(if NoValue then 0.3 else math.clamp(progress(Callback) * Segments - (i1 - 1), 0, 1), 0.000001)
							local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
							
							return if IsTtb then TypesUDim2.fromScale(1, v4) else TypesUDim2.fromScale(v4, 1)
						end
					end,
					AnchorPoint = function(Callback)
						-- upvalues: FormulaResult3 (copy), ReadFunction (upval), p1 (upval), TypesVector2 (upval)
						if Callback(FormulaResult3) == "rtl" or Callback(FormulaResult3) == "btt" then
							local ReadResult = ReadFunction(p1.config.theme, Callback)
							local BarFill = if ReadResult and ReadResult.chrome then ReadResult.chrome.barFill else nil
							
							if BarFill == nil or BarFill.span ~= "fill" then
								local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
								
								return if IsTtb then TypesVector2.new(0, 1) else TypesVector2.new(1, 0)
							end
						end
						return (TypesVector2.new(0, 0))
					end,
					Position = function(Callback)
						-- upvalues: FormulaResult3 (copy), ReadFunction (upval), p1 (upval), TypesUDim2 (upval)
						if Callback(FormulaResult3) == "rtl" or Callback(FormulaResult3) == "btt" then
							local ReadResult = ReadFunction(p1.config.theme, Callback)
							local BarFill = if ReadResult and ReadResult.chrome then ReadResult.chrome.barFill else nil
							
							if BarFill == nil or BarFill.span ~= "fill" then
								local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
								
								return if IsTtb then TypesUDim2.fromScale(0, 1) else TypesUDim2.fromScale(1, 0)
							end
						end
						return (TypesUDim2.fromScale(0, 0))
					end
				})
			end
			SkinFunction(FrameResult, "barCap", {
				ZIndex = 2,
				direction = function(Callback)
					-- upvalues: FormulaResult3 (copy)
					return Callback(FormulaResult3)
				end,
				fit = function(p5)
					-- upvalues: ornament (copy)
					return (ornament("barCap", p5))
				end
			})
			SkinFunction(FrameResult, "barCenter", {
				ZIndex = 2,
				fit = function(p5)
					-- upvalues: ornament (copy)
					return (ornament("barCenter", p5))
				end
			})
		else
			local _ = function(p5)
				-- upvalues: ReadFunction (upval), p4 (copy), ControlSizeFunction (upval), MetricFunction (upval)
				local ReadResult = ReadFunction(p4.diameter, p5)
				
				if not ReadResult then
					if p4.controlSize then
						return (ControlSizeFunction(p4.controlSize, "height", p5))
					end
					ReadResult = MetricFunction("controls.progress.circularSize", p5)
				end
				return ReadResult
			end
			
			local config = {
				Name = "Indicator",
				BackgroundTransparency = 1,
				Size = function(p5)
					-- upvalues: ReadFunction (upval), p4 (copy), ControlSizeFunction (upval), MetricFunction (upval), TypesUDim2 (upval)
					local ReadResult = ReadFunction(p4.diameter, p5) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "height", p5) else MetricFunction("controls.progress.circularSize", p5))
					
					return TypesUDim2.fromOffset(ReadResult, ReadResult)
				end
			}
			
			if Presentation == "spinner" then
				for i2 = 1, 8 do
					local Angle = (i2 - 1) / 8 * 3.141592653589793 * 2 - 1.5707963267948966
					config[#config + 1] = p1.styled(Host.Frame("Segment" .. i2)({
						AnchorPoint = TypesVector2.new(0.5, 0.5),
						BorderSizePixel = 0,
						Position = TypesUDim2.fromScale(math.cos(Angle) * 0.4 + 0.5, math.sin(Angle) * 0.4 + 0.5),
						Size = function(p5)
							-- upvalues: ReadFunction (upval), p4 (copy), MetricFunction (upval), TypesUDim2 (upval)
							local ReadResult = ReadFunction(p4.thickness, p5) or MetricFunction("controls.progress.spinnerDotSize", p5)
							
							return TypesUDim2.fromOffset(ReadResult, ReadResult)
						end,
						BackgroundTransparency = function(p5): number
							-- upvalues: progress (ref), NoValue (copy), i2 (copy)
							local ProgressResult = progress(p5)
							
							return if NoValue then (i2 / 8 - ProgressResult) % 1 * 0.85 elseif i2 / 8 <= ProgressResult then 0 else 0.85
						end,
						Host.UICorner({ CornerRadius = p1.round })
					}), "fill")
				end
			else
				local function Thickness(p5)
					-- upvalues: ReadFunction (upval), p4 (copy), MetricFunction (upval), ControlSizeFunction (upval)
					return ReadFunction(p4.thickness, p5) or math.max(MetricFunction("controls.progress.circularThickness", p5), (math.round((ReadFunction(p4.diameter, p5) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "height", p5) else MetricFunction("controls.progress.circularSize", p5))) * 0.08)))
				end
				
				local IsGauge = Presentation == "gauge"
				for _, value2 in { true, false } do
					local StyledResult = p1.styled(Host.Path2D({
						Closed = false,
						Name = if IsGauge then if value2 then "GaugeTrack" else "GaugeFill" elseif value2 then "RingTrack" else "RingFill",
						Thickness = Thickness,
						ZIndex = if value2 then 1 else 2,
						Visible = function(p5)
							-- upvalues: value2 (copy), NoValue (copy), progress (ref)
							return value2 or (NoValue or progress(p5) > 0)
						end
					}), if value2 then "progress-ring-track" else "progress-ring-fill")
					Compose.watch(function(p5)
						-- upvalues: ReadFunction (upval), p4 (copy), ControlSizeFunction (upval), MetricFunction (upval), IsGauge (copy), NavPathShapesModule (upval), Sweep (copy), value2 (copy), progress (ref), NoValue (copy), Types (upval), TypesUDim2 (upval), StyledResult (copy)
						local ReadResult = ReadFunction(p4.diameter, p5) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "height", p5) else MetricFunction("controls.progress.circularSize", p5))
						assert(ReadResult > 0, "Facet ProgressView diameter must be positive")
						local Largest = math.max(0, 1 - (ReadFunction(p4.thickness, p5) or math.max(MetricFunction("controls.progress.circularThickness", p5), (math.round((ReadFunction(p4.diameter, p5) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "height", p5) else MetricFunction("controls.progress.circularSize", p5))) * 0.08)))) / ReadResult)
						local ArcResult = if IsGauge then NavPathShapesModule.arc(-Sweep / 2, if value2 then Sweep else math.max(progress(p5) * Sweep, 0.5), { radius = Largest }) elseif value2 then NavPathShapesModule.ring({ radius = Largest }) else NavPathShapesModule.arc(if NoValue then progress(p5) * 360 else 0, if NoValue then 90 else progress(p5) * 360, { radius = Largest })
						local List = {}
						
						for _, value in ArcResult do
							table.insert(List, Types.Path2DControlPoint.new(TypesUDim2.fromScale(value.x, value.y), TypesUDim2.fromScale(value.inX, value.inY), TypesUDim2.fromScale(value.outX, value.outY)))
						end
						StyledResult:SetControlPoints(List)
					end)
					config[#config + 1] = StyledResult
				end
				if IsGauge and p4.needle ~= false then
					local ProgressGaugeNeedle = p1.styled(Host.Path2D({
						Name = "GaugeNeedle",
						Closed = false,
						ZIndex = 3,
						Thickness = Thickness
					}), "progress-gauge-needle")
					Compose.watch(function(p5)
						-- upvalues: ReadFunction (upval), p4 (copy), ControlSizeFunction (upval), MetricFunction (upval), NavPathShapesModule (upval), Sweep (copy), progress (ref), Types (upval), TypesUDim2 (upval), ProgressGaugeNeedle (copy)
						local List = {}
						
						for _, value in NavPathShapesModule.needle(-Sweep / 2 + progress(p5) * Sweep, {
							radius = math.max(0, 1 - 2.5 * (ReadFunction(p4.thickness, p5) or math.max(MetricFunction("controls.progress.circularThickness", p5), (math.round((ReadFunction(p4.diameter, p5) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "height", p5) else MetricFunction("controls.progress.circularSize", p5))) * 0.08)))) / (ReadFunction(p4.diameter, p5) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "height", p5) else MetricFunction("controls.progress.circularSize", p5))))
						}) do
							table.insert(List, Types.Path2DControlPoint.new(TypesUDim2.fromScale(value.x, value.y), TypesUDim2.fromScale(value.inX, value.inY), TypesUDim2.fromScale(value.outX, value.outY)))
						end
						ProgressGaugeNeedle:SetControlPoints(List)
					end)
					config[#config + 1] = ProgressGaugeNeedle
					config[#config + 1] = p1.styled(Host.Frame("GaugeHub")({
						AnchorPoint = TypesVector2.new(0.5, 0.5),
						Position = TypesUDim2.fromScale(0.5, 0.5),
						BorderSizePixel = 0,
						ZIndex = 4,
						Size = function(p6)
							-- upvalues: ReadFunction (upval), p4 (copy), MetricFunction (upval), ControlSizeFunction (upval), TypesUDim2 (upval)
							local Largest = math.max(6, (math.round((ReadFunction(p4.thickness, p6) or math.max(MetricFunction("controls.progress.circularThickness", p6), (math.round((ReadFunction(p4.diameter, p6) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "height", p6) else MetricFunction("controls.progress.circularSize", p6))) * 0.08)))) * 1.6)))
							
							return TypesUDim2.fromOffset(Largest, Largest)
						end,
						Host.UICorner({ CornerRadius = p1.round })
					}), "progress-gauge-hub")
				end
			end
			FrameResult = Host.Frame(config)
			
			if v2 and (Presentation == "circular" or Presentation == "gauge") then
				local TextBoundsResult = p1.observe.TextBounds(v2)
				local FormulaResult = Compose.formula(function(Callback): boolean
					-- upvalues: TextBoundsResult (copy), ReadFunction (upval), p4 (copy), ControlSizeFunction (upval), MetricFunction (upval)
					local CallbackResult = Callback(TextBoundsResult)
					local v4 = (ReadFunction(p4.diameter, Callback) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "height", Callback) else MetricFunction("controls.progress.circularSize", Callback))) * 0.6
					
					return CallbackResult.X <= v4 and CallbackResult.Y <= v4
				end)
				Runtime.decorate(FrameResult, {
					AnchorPoint = TypesVector2.new(0.5, 0),
					Position = TypesUDim2.fromScale(0.5, 0)
				})
				Runtime.decorate(v2, {
					TextWrapped = false,
					AutomaticSize = TypesEnum.AutomaticSize.XY,
					TextXAlignment = TypesEnum.TextXAlignment.Center,
					AnchorPoint = function(Callback)
						-- upvalues: TypesVector2 (upval), FormulaResult (copy)
						return TypesVector2.new(0.5, if Callback(FormulaResult) then 0.5 else 0)
					end,
					Position = function(Callback)
						-- upvalues: TypesUDim2 (upval), FormulaResult (copy), ReadFunction (upval), p4 (copy), ControlSizeFunction (upval), MetricFunction (upval)
						return TypesUDim2.new(0.5, 0, 0, if Callback(FormulaResult) then (ReadFunction(p4.diameter, Callback) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "height", Callback) else MetricFunction("controls.progress.circularSize", Callback))) / 2 else (ReadFunction(p4.diameter, Callback) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "height", Callback) else MetricFunction("controls.progress.circularSize", Callback))) + 8)
					end
				})
				FrameResult = Host.Frame("Gauge")({
					BackgroundTransparency = 1,
					ClipsDescendants = false,
					Size = function(Callback)
						-- upvalues: ReadFunction (upval), p4 (copy), ControlSizeFunction (upval), MetricFunction (upval), TextBoundsResult (copy), TypesUDim2 (upval), FormulaResult (copy)
						local ReadResult = ReadFunction(p4.diameter, Callback) or (if p4.controlSize then ControlSizeFunction(p4.controlSize, "height", Callback) else MetricFunction("controls.progress.circularSize", Callback))
						local CallbackResult = Callback(TextBoundsResult)
						
						return TypesUDim2.fromOffset(math.max(ReadResult, CallbackResult.X), ReadResult + (if Callback(FormulaResult) then 0 else CallbackResult.Y + 8))
					end,
					FrameResult,
					v2
				})
				v2 = nil
			end
		end
		local List = {}
		local List1 = {}
		
		if v2 then
			table.insert(List1, v2)
		end
		if EndLabel then
			table.insert(List1, EndLabel)
		end
		if Presentation == "bar" and p4.label and #List1 > 0 then
			local List2 = {
				p2.Text({
					text = p4.label,
					LayoutOrder = 1,
					Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
				})
			}
			
			for _, value3 in List1 do
				table.insert(List2, value3)
			end
			table.insert(List, p1.row(List2, {
				Name = "Header",
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			}))
			List1 = {}
		elseif p4.label then
			table.insert(List, p2.Text({ text = p4.label }))
		end
		if Presentation == "bar" and #List1 > 0 and FormulaResult3:peek() ~= "ttb" and FormulaResult3:peek() ~= "btt" then
			Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill }).Parent = FrameResult
			Host.UISizeConstraint({
				MinSize = function(p5)
					-- upvalues: TypesVector2 (upval), p1 (upval)
					return TypesVector2.new(p1.metric("controls.progress.minTrackWidth", p5), 0)
				end
			}).Parent = FrameResult
			
			if EndLabel then
				EndLabel.TextTruncate = TypesEnum.TextTruncate.AtEnd
				Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Shrink }).Parent = EndLabel
			end
			local List3 = { FrameResult }
			
			for _, value in List1 do
				table.insert(List3, value)
			end
			FrameResult = p1.row(List3, {
				Name = "Line",
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			})
			local UIListLayout = FrameResult:FindFirstChildWhichIsA("UIListLayout")
			
			if UIListLayout then
				UIListLayout.VerticalAlignment = TypesEnum.VerticalAlignment.Center
			end
			List1 = {}
		end
		table.insert(List, FrameResult)
		
		for _, value4 in List1 do
			table.insert(List, value4)
		end
		local ColumnFunction = p1.column
		local List4 = List
		local PropsFunction = p1.props
		local list = {
			"value", "role", "min", "max", "presentation", "label", "endLabel",
			"showValue", "format", "diameter", "thickness", "segments", "trail",
			"controlSize", "sweep", "needle"
		}
		
		local function v82(Callback)
			-- upvalues: Presentation (copy), FormulaResult3 (copy), TypesUDim2 (upval)
			if Presentation == "bar" then
				local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
				
				return if IsTtb then TypesUDim2.fromOffset(24, 160) else TypesUDim2.new(1, 0, 0, 0)
			else
				return (TypesUDim2.fromOffset(0, 0))
			end
		end
		
		local config = {
			Size = if NoIsValue then v82(function(p5)
				return p5:peek()
			end) else v82
		}
		
		local function v84(Callback)
			-- upvalues: Presentation (copy), FormulaResult3 (copy), TypesEnum (upval)
			if Presentation == "bar" then
				local IsTtb: boolean = Callback(FormulaResult3) == "ttb" or Callback(FormulaResult3) == "btt"
				
				return if IsTtb then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.Y
			else
				return TypesEnum.AutomaticSize.XY
			end
		end
		local None = nil
		
		if NoIsValue then
			local _ = function(p5)
				return p5:peek()
			end
			
			if Presentation == "bar" then
				local IsTtb: boolean = FormulaResult3:peek() == "ttb" or FormulaResult3:peek() == "btt"
				None = if IsTtb then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.Y
			else
				None = TypesEnum.AutomaticSize.XY
			end
		else
			None = v84
		end
		config.AutomaticSize = None
		local ColumnResult = ColumnFunction(List4, PropsFunction(p4, list, config))
		
		if p4.role ~= nil then
			local Tag = nil
			
			local function applyRole(p5)
				-- upvalues: ReadFunction (upval), p4 (copy), Tag (ref), ColumnResult (copy)
				local ReadResult = ReadFunction(p4.role, p5) or "accent"
				assert(ReadResult == "accent" or (ReadResult == "success" or (ReadResult == "warning" or ReadResult == "danger")), "Facet ProgressView role must be accent, success, warning or danger")
				
				if Tag then
					ColumnResult:RemoveTag(Tag)
				end
				local Text = "facet-progress-role-" .. ReadResult
				ColumnResult:AddTag(Text)
				Tag = Text
			end
			
			local RoleFunction = p4.role
			
			if Compose.isValue(RoleFunction) or type(RoleFunction) == "function" then
				Compose.watch(applyRole)
			else
				applyRole()
			end
		end
		if TimelineResult then
			ColumnResult:AddTag("facet-progress-indeterminate")
			p1.playWhileShown(TimelineResult, ColumnResult)
		end
		return ColumnResult
	end)
end