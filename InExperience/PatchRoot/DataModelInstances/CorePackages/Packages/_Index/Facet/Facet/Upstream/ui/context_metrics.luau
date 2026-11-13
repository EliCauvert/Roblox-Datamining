local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./theme_types")
local t = {}

return function(p1, p2, p3)
	-- upvalues: t (copy)
	local Compose = p1.Compose
	local Types = p1.types
	local Easing = Compose.easing
	local Environment = p2.environment
	local HasGuiService = p2.guiService ~= nil or (p2.userInputService ~= nil or (Compose.isValue(p2.theme) or type(p2.theme) == "function"))
	
	if type(Environment) == "table" then
		for _, value in Environment do
			HasGuiService = HasGuiService or (Compose.isValue(value) or type(value) == "function")
		end
	end
	local Metrics = p3.neutralPackage().metrics
	
	local function valueAt(Metrics, Text: string)
		-- upvalues: t (upval)
		local Entry = t[Text]
		
		if Entry == nil then
			local Parts = string.split(Text, ".")
			t[Text] = Parts
			Entry = Parts
		end
		for _, value in assert(Entry) do
			if type(Metrics) ~= "table" then
				return nil
			end
			Metrics = Metrics[value]
		end
		return Metrics
	end
	
	local function metricAt(p4, p5)
		-- upvalues: valueAt (copy)
		local ValueAtResult: number = valueAt(p4, p5)
		
		return if type(ValueAtResult) == "number" and ValueAtResult == ValueAtResult and math.abs(ValueAtResult) ~= 1e999 then ValueAtResult else nil
	end
	
	local Metrics1 = p3.forDistance(p3.neutralPackage(), "ten-foot").metrics
	
	local function Distance(): boolean
		return false
	end
	
	function p1.neutralMetrics(p4)
		-- upvalues: Distance (ref), Metrics1 (copy), Metrics (copy)
		return if Distance(p4) then Metrics1 else Metrics
	end
	
	local function metric(Text: string, p4, Enabled)
		-- upvalues: p1 (copy), p2 (copy), valueAt (copy), Environment (copy)
		local ReadResult = p1.read(p2.theme, p4)
		local ValueAtResult: number = valueAt(if ReadResult then ReadResult.metrics else nil, Text)
		local ValueAtResult1 = if type(ValueAtResult) == "number" and ValueAtResult == ValueAtResult and math.abs(ValueAtResult) ~= 1e999 then ValueAtResult else nil
		
		if not ValueAtResult1 then
			local ValueAtResult2: number = valueAt(p1.neutralMetrics(p4), Text)
			ValueAtResult1 = if type(ValueAtResult2) == "number" and ValueAtResult2 == ValueAtResult2 and math.abs(ValueAtResult2) ~= 1e999 then ValueAtResult2 else nil
		end
		local v1 = assert(ValueAtResult1, `Facet numeric metric {Text} is missing`)
		
		if Enabled ~= true and Environment and string.match(Text, "^typography%.[^.]+%.size$") then
			local ReadResult1 = p1.read(Environment.preferredTextSize, p4)
			
			if ReadResult1 ~= nil then
				local config = { Medium = 0, Large = 1, Larger = 2, Largest = 3 }
				
				local function _(p5)
					-- upvalues: config (copy)
					return config[if typeof(p5) == "EnumItem" then p5.Name else p5] or 0
				end
				
				local PreferredTextSize = if p2.guiService then p2.guiService.PreferredTextSize else nil
				
				return (math.max(1, v1 + ((config[if typeof(ReadResult1) == "EnumItem" then ReadResult1.Name else ReadResult1] or 0) - (config[if typeof(PreferredTextSize) == "EnumItem" then PreferredTextSize.Name else PreferredTextSize] or 0)) * p1.metric("controls.typography.preferredSizeStep", p4)))
			end
		end
		return v1
	end
	
	p1.runtime:watch(function()
		-- upvalues: Compose (copy), HasGuiService (ref), metric (copy), p1 (copy)
		local v2 = assert(Compose.currentOwner())
		local WithOwnerResults = {}
		local t = {}
		
		function p1.metric(MotionName, Callback, p5)
			-- upvalues: HasGuiService (upval), t (copy), metric (upval), WithOwnerResults (copy), Compose (upval), v2 (copy)
			local Text = if p5 then MotionName .. ":authored" else MotionName
			
			if HasGuiService then
				local WithOwnerResult = WithOwnerResults[Text]
				
				if Callback == nil then
					return if WithOwnerResult then WithOwnerResult:peek() else metric(MotionName, nil, p5)
				end
				if WithOwnerResult == nil then
					WithOwnerResult = Compose.withOwner(v2, function()
						-- upvalues: Compose (upval), metric (upval), MotionName (copy), p5 (copy)
						return Compose.formula(function(p6)
							-- upvalues: metric (upval), MotionName (upval), p5 (upval)
							return (metric(MotionName, p6, p5))
						end)
					end)
					WithOwnerResults[Text] = WithOwnerResult
				end
				return Callback(WithOwnerResult)
			else
				local Entry = t[Text]
				
				if Entry == nil then
					Entry = metric(MotionName, nil, p5)
					t[Text] = Entry
				end
				return assert(Entry)
			end
		end
	end)
	
	function p1.phrase(p5, Text: string, p6, p7)
		-- upvalues: p1 (copy), p2 (copy)
		local ReadResult = p1.read(p2.translator, p7)
		
		if ReadResult then
			local Success, Result = pcall(ReadResult.FormatByKey, ReadResult, p5, p6)
			
			if Success and type(Result) == "string" and Result ~= "" then
				return Result
			end
		end
		return (string.gsub(Text, "{(%w+)}", function(Match): string
			-- upvalues: p6 (copy)
			local v2 = p6[Match]
			
			return if v2 == nil then `\{{Match}}` else tostring(v2)
		end))
	end
	
	local function motionName(MotionName, p5)
		-- upvalues: p1 (copy), p2 (copy), valueAt (copy)
		local ReadResult = p1.read(p2.theme, p5)
		local ValueAtResult = valueAt(if ReadResult then ReadResult.metrics else nil, MotionName)
		
		if type(ValueAtResult) ~= "string" then
			ValueAtResult = valueAt(p1.neutralMetrics(p5), MotionName)
		end
		return (assert(if type(ValueAtResult) == "string" then ValueAtResult else nil, `Facet motion name {MotionName} is missing`))
	end
	
	function p1.motionTiming(p5, p6)
		-- upvalues: p1 (copy)
		return {
			enter = p1.metric(`motion.{p5}.enter`, p6),
			exit = p1.metric(`motion.{p5}.exit`, p6)
		}
	end
	
	function p1.motionSpring(p5, p6)
		-- upvalues: p1 (copy)
		return {
			period = p1.metric(`motion.springs.{p5}.period`, p6),
			damping = p1.metric(`motion.springs.{p5}.damping`, p6)
		}
	end
	
	local t1 = {}
	
	function p1.motionEase(Key, p5)
		-- upvalues: p1 (copy), p2 (copy), t1 (copy), valueAt (copy), Easing (copy)
		local ReadResult = p1.read(p2.theme, p5)
		local Entry = t1[Key]
		
		if Entry and Entry.package == ReadResult and (Entry.neutral == nil or Entry.neutral == p1.neutralMetrics(p5)) then
			return Entry.ease
		end
		local MotionName: string = `motion.easing.{Key}`
		local ValueAtResult = valueAt(if ReadResult then ReadResult.metrics else nil, MotionName)
		local NeutralMetricsResult = nil
		
		if type(ValueAtResult) ~= "string" then
			NeutralMetricsResult = p1.neutralMetrics(p5)
			ValueAtResult = valueAt(NeutralMetricsResult, MotionName)
		end
		local v2 = assert(if type(ValueAtResult) == "string" then ValueAtResult else nil, `Facet motion name {MotionName} is missing`)
		local Ease = assert(Easing[v2], `Facet motion easing {v2} is not a Compose easing`)
		t1[Key] = {
			package = ReadResult,
			neutral = NeutralMetricsResult,
			ease = Ease
		}
		
		return Ease
	end
	
	function p1.motionStyle(p5, p6)
		-- upvalues: motionName (copy), Types (copy)
		local MotionNameResult = motionName(`motion.styles.{p5}`, p6)
		
		return (assert(Types.Enum.EasingStyle:FromName(MotionNameResult), `Facet motion style {MotionNameResult} is not an EasingStyle`))
	end
	
	function p1.controlSize(p5, Text, p6)
		-- upvalues: p1 (copy), p2 (copy), valueAt (copy)
		local ReadResult = p1.read(p5, p6)
		local Regular = if ReadResult == nil then "regular" else ReadResult
		assert(Regular == "xsmall" or (Regular == "compact" or (Regular == "regular" or Regular == "large")), "Facet controlSize must be xsmall, compact, regular or large")
		
		if Regular == "xsmall" then
			local ReadResult1 = p1.read(p2.theme, p6)
			local ValueAtResult: number = valueAt(if ReadResult1 then ReadResult1.metrics else nil, "controlSizes.xsmall." .. Text)
			local ValueAtResult1 = if type(ValueAtResult) == "number" and ValueAtResult == ValueAtResult and math.abs(ValueAtResult) ~= 1e999 then ValueAtResult else nil
			
			return if ValueAtResult1 then ValueAtResult1 else math.max(0, 2 * p1.metric("controlSizes.compact." .. Text, p6) - p1.metric("controlSizes.regular." .. Text, p6))
		else
			return p1.metric("controlSizes." .. Regular .. "." .. Text, p6)
		end
	end
	
	return {
		metricAt = metricAt,
		setDistance = function(Value)
			-- upvalues: Distance (ref)
			Distance = Value
		end
	}
end