local _ = require("./types")
local _ = require("./navigation_types")
local MotionModule = require("./motion")

local function paced(p1, Callback1, FormulaResult, Callback2, Callback, p2)
	local Compose = p1.Compose
	local FacetTransitionsRequireHostFrames = assert(p1.runtime.host.frames, "Facet transitions require host frames")
	local CellResult = Compose.cell(0)
	local v1 = 0
	local v2 = 0
	local Smallest = 0
	local v3 = 1
	local Flag = false
	local Flag1 = false
	local NowResult = if p2 then FacetTransitionsRequireHostFrames.now() else 0
	local OnFrameResult = nil
	
	local function halt()
		-- upvalues: OnFrameResult (ref)
		local Callback: () -> () = OnFrameResult
		OnFrameResult = nil
		
		if Callback then
			Callback()
		end
	end
	
	local function advance(p3: number)
		-- upvalues: p2 (copy), FacetTransitionsRequireHostFrames (copy), NowResult (ref), p1 (copy), Flag1 (ref), Smallest (ref), v3 (ref), CellResult (copy), v1 (ref), v2 (ref), Callback (copy), OnFrameResult (ref)
		if p2 then
			local NowResult1 = FacetTransitionsRequireHostFrames.now()
			
			if NowResult < NowResult1 then
				p3 = math.min(p3, NowResult1 - NowResult)
			end
			NowResult = NowResult1
		end
		local MotionFrameLimit: number = p1.metric("motion.frameLimit")
		Flag1 = false
		Smallest = math.min(Smallest + (if (Flag1 or p2) and MotionFrameLimit > 0 then math.min(p3, MotionFrameLimit) else p3), v3)
		CellResult:set(v1 + (v2 - v1) * Callback(Smallest / v3))
		
		if v3 <= Smallest then
			local Callback1: () -> () = OnFrameResult
			OnFrameResult = nil
			
			if Callback1 then
				Callback1()
			end
		end
	end
	
	Compose.watch(function(Callback)
		-- upvalues: Callback1 (copy), Flag (ref), FormulaResult (copy), OnFrameResult (ref), v2 (ref), CellResult (copy), v1 (ref), Smallest (ref), v3 (ref), Flag1 (ref), Callback2 (copy), NowResult (ref), p2 (copy), FacetTransitionsRequireHostFrames (copy), advance (copy)
		local CallbackResult = Callback1(Callback)
		
		if not Flag or Callback(FormulaResult) then
			Flag = true
			local Callback3: () -> () = OnFrameResult
			OnFrameResult = nil
			
			if Callback3 then
				Callback3()
			end
			v2 = CallbackResult
			CellResult:set(CallbackResult)
			
			return
		elseif CallbackResult == v2 then return end
		local PeekResult = CellResult:peek()
		local CallbackResult1 = Callback2(nil)
		v1 = PeekResult
		v2 = CallbackResult
		Smallest = 0
		v3 = CallbackResult1
		Flag1 = true
		NowResult = if p2 then FacetTransitionsRequireHostFrames.now() else 0
		assert(v3 > 0 and v3 < 1e999, "Facet transition seconds must be positive and finite")
		
		if OnFrameResult == nil then
			OnFrameResult = FacetTransitionsRequireHostFrames.onFrame(advance)
		end
	end)
	Compose.cleanup(halt)
	
	return CellResult
end

local function check(Enabled)
	if Enabled == nil or Enabled == false then return end
	assert(type(Enabled) == "table", "Facet transition must be a table or false")
	
	for i in Enabled do
		assert(table.find({
			"seconds", "ease", "motion", "fade", "progress", "apply", "scale", "zoom"
		}, (tostring(i))), "Unknown Facet transition option: " .. tostring(i))
	end
	assert(Enabled.apply == nil or type(Enabled.apply) == "function", "Transition.apply must be a function")
	assert(Enabled.fade == nil or type(Enabled.fade) == "boolean", "Transition.fade must be a boolean")
	assert(Enabled.scale == nil or (Enabled.scale == true or type(Enabled.scale) == "number" and Enabled.scale > 0 and Enabled.scale < 1e999), "Transition.scale must be true or a positive finite number")
	assert(Enabled.scale == nil or Enabled.apply == nil, "Transition.scale and Transition.apply cannot be combined")
	assert(Enabled.zoom == nil or type(Enabled.zoom) == "number" and Enabled.zoom > 0 and Enabled.zoom <= 1, "Transition.zoom must be a number above 0 and at most 1")
	assert(Enabled.zoom == nil or Enabled.apply == nil, "Transition.zoom and Transition.apply cannot be combined")
end

return {
	check = check,
	create = function(p1, p2, IsPresented, Enabled, p3, p4, p5, p6)
		-- upvalues: check (copy), MotionModule (copy), paced (copy)
		check(p2)
		local Compose = p1.Compose
		local HasScale: boolean = p2.scale ~= nil or p2.zoom ~= nil
		local NoEase: boolean = HasScale and p2.ease == nil
		local ZoomPresent = if HasScale and p2.motion == nil then "zoomPresent" else p2.motion or "tabFade"
		local LevelResult = MotionModule.level(p1)
		local CellResult = Compose.cell(Enabled == true)
		local FormulaResult = Compose.formula(function(Callback)
			-- upvalues: p2 (copy)
			local CallbackResult = if p2.progress then Callback(p2.progress) else nil
			assert(CallbackResult == nil or CallbackResult >= 0 and CallbackResult <= 1, "Transition.progress must be nil or a number from 0 to 1")
			
			return CallbackResult
		end)
		local FormulaResult1 = Compose.formula(function(Callback): boolean
			-- upvalues: FormulaResult (copy)
			return Callback(FormulaResult) ~= nil
		end)
		local FormulaResult2 = Compose.formula(function(Callback): number
			-- upvalues: p5 (copy), IsPresented (copy), Enabled (copy), CellResult (copy), p3 (copy)
			if Callback(p5 or IsPresented) and (Enabled or Callback(CellResult)) and (p3 == nil or Callback(p3)) then
				return 1
			else
				return 0
			end
		end)
		local PacedResult = paced(p1, function(Callback)
			-- upvalues: FormulaResult (copy), LevelResult (copy), p3 (copy), IsPresented (copy), FormulaResult2 (copy)
			local CallbackResult: number = Callback(FormulaResult)
			
			return if CallbackResult == nil or LevelResult(Callback) ~= "normal" or p3 ~= nil and not Callback(p3) then Callback(FormulaResult2) elseif Callback(IsPresented) then CallbackResult else 1 - CallbackResult
		end, Compose.formula(function(Callback): boolean
			-- upvalues: FormulaResult1 (copy), LevelResult (copy)
			return Callback(FormulaResult1) and LevelResult(Callback) == "normal"
		end), function(p7)
			-- upvalues: LevelResult (copy), p1 (copy), p2 (copy), ZoomPresent (copy)
			return if LevelResult(p7) == "limited" then p1.metric("motion.reducedFade", p7) elseif p2.seconds == nil then p1.metric("motion.durations." .. ZoomPresent, p7) else p1.read(p2.seconds, p7)
		end, p2.ease or (if NoEase then Compose.easing.linear else p1.motionEase("fade")))
		
		local function _(p7, p8, Callback)
			-- upvalues: NoEase (copy), FormulaResult1 (copy), p1 (copy)
			return if NoEase and not Callback(FormulaResult1) then p1.motionEase(p7, Callback)(p8) else p8
		end
		
		local FormulaResult3 = Compose.formula(function(Callback)
			-- upvalues: p4 (copy), LevelResult (copy), FormulaResult2 (copy), PacedResult (copy), NoEase (copy), FormulaResult1 (copy), p1 (copy)
			if p4 or LevelResult(Callback) == "none" then
				return (Callback(FormulaResult2))
			else
				local CallbackResult = Callback(PacedResult)
				
				return if NoEase and not Callback(FormulaResult1) then p1.motionEase("zoomFade", Callback)(CallbackResult) else CallbackResult
			end
		end)
		
		local _ = function(Callback)
			-- upvalues: p4 (copy), LevelResult (copy), p3 (copy)
			return not p4 and (LevelResult(Callback) == "normal" and (p3 == nil or Callback(p3)))
		end
		
		local FormulaResult4 = Compose.formula(function(Callback)
			-- upvalues: p4 (copy), LevelResult (copy), p3 (copy), FormulaResult3 (copy)
			local v1 = not p4 and (LevelResult(Callback) == "normal" and (p3 == nil or Callback(p3)))
			
			return if v1 then Callback(FormulaResult3) else 1
		end)
		local FormulaResult5 = nil
		local Zoom = nil
		local Zoom1 = p2.zoom or p2.scale
		
		if Zoom1 ~= nil then
			local FormulaResult6 = Compose.formula(function(Callback)
				-- upvalues: p4 (copy), LevelResult (copy), p3 (copy), PacedResult (copy), NoEase (copy), FormulaResult1 (copy), p1 (copy)
				if not p4 and (LevelResult(Callback) == "normal" and (p3 == nil or Callback(p3))) then
					local CallbackResult = Callback(PacedResult)
					
					return if NoEase and not Callback(FormulaResult1) then p1.motionEase("zoomScale", Callback)(CallbackResult) else CallbackResult
				else
					return 1
				end
			end)
			
			local _ = function(p7)
				-- upvalues: Zoom1 (copy), p1 (copy)
				return if type(Zoom1) == "number" then Zoom1 else p1.metric("motion.materialize.zoom", p7)
			end
			
			local FormulaResult7 = Compose.formula(function(Callback): number
				-- upvalues: Zoom1 (copy), p1 (copy), FormulaResult6 (copy)
				local Zoom = if type(Zoom1) == "number" then Zoom1 else p1.metric("motion.materialize.zoom", Callback)
				local CallbackResult: number = Callback(FormulaResult6)
				
				return if CallbackResult >= 1 then 1 else Zoom + (1 - Zoom) * CallbackResult
			end)
			Zoom = FormulaResult7
			
			if p2.scale == nil then
				FormulaResult5 = nil
			elseif p6 then
				local CellResult1 = Compose.cell(nil)
				Compose.watch(function(Callback)
					-- upvalues: IsPresented (copy), CellResult1 (copy), FormulaResult7 (copy)
					if Callback(IsPresented) then
						CellResult1:set(nil)
						
						return
					end
					if CellResult1:peek() == nil then
						CellResult1:set(FormulaResult7:peek())
					end
				end)
				FormulaResult5 = Compose.formula(function(Callback)
					-- upvalues: CellResult1 (copy), FormulaResult7 (copy)
					local CallbackResult = Callback(CellResult1)
					
					return if CallbackResult == nil then Callback(FormulaResult7) else CallbackResult
				end)
			else
				FormulaResult5 = FormulaResult7
			end
		end
		return {
			interacting = FormulaResult1,
			scale = FormulaResult5,
			zoom = Zoom,
			progress = FormulaResult4,
			opacity = FormulaResult3,
			transparency = Compose.formula(function(Callback): number
				-- upvalues: FormulaResult3 (copy), p2 (copy), LevelResult (copy)
				local CallbackResult: number = Callback(FormulaResult3)
				
				return if p2.fade == false and LevelResult(Callback) == "normal" and CallbackResult > 0 then 0 else 1 - CallbackResult
			end),
			completed = Compose.formula(function(Callback): boolean
				-- upvalues: FormulaResult1 (copy), IsPresented (copy), FormulaResult3 (copy)
				return not Callback(FormulaResult1) and (not Callback(IsPresented) and Callback(FormulaResult3) == 0)
			end),
			visible = Compose.formula(function(Callback)
				-- upvalues: IsPresented (copy), FormulaResult3 (copy)
				return Callback(IsPresented) or Callback(FormulaResult3) > 0
			end),
			apply = function(p7, p8)
				-- upvalues: p2 (copy), FormulaResult4 (copy), IsPresented (copy), p1 (copy), Compose (copy), CellResult (copy)
				if p2.apply then
					p2.apply(p7, { progress = FormulaResult4, isPresented = IsPresented })
				end
				local ParentResult = p1.observe.Parent(p8 or p7)
				Compose.watch(function(Callback)
					-- upvalues: CellResult (upval), ParentResult (copy)
					CellResult:set(Callback(ParentResult) ~= nil)
				end)
			end
		}
	end,
	completions = setmetatable({}, { __mode = "k" }),
	paced = paced
}