local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local MotionModule = require("./motion")
local FontReadinessModule = require("./font_readiness")
local OverlayArrivalModule = require("./overlay_arrival")
local TextMeasureModule = require("./text_measure")
local GeometrySignatureModule = require("./geometry_signature")

return function(p1)
	-- upvalues: MotionModule (copy), OverlayArrivalModule (copy), FontReadinessModule (copy), GeometrySignatureModule (copy), TextMeasureModule (copy)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	
	local function attached(Parent)
		local Parent1 = Parent
		while Parent1 do
			if Parent1:IsA("GuiObject") and not Parent1.Visible then
				return false
			end
			if Parent1:IsA("LayerCollector") then
				return Parent1.Enabled
			end
			Parent1 = Parent1.Parent
		end
		return false
	end
	
	return {
		appearance = function(p2, p3, p4)
			-- upvalues: MotionModule (upval), p1 (copy), OverlayArrivalModule (upval), Compose (copy), Runtime (copy)
			local LevelResult = MotionModule.level(p1)
			local ReadyResult = OverlayArrivalModule.ready(p2)
			
			local function _(p5)
				-- upvalues: p4 (copy), p1 (upval), ReadyResult (copy)
				return if p4 == nil then ReadyResult == nil or p1.readSource(ReadyResult, p5) else p1.readSource(p4, p5) and (ReadyResult == nil or p1.readSource(ReadyResult, p5))
			end
			
			local Exiting = if p2 then p2.exiting else Compose.cell(false)
			local NoReadyResult = if p4 == nil then ReadyResult == nil or p1.readSource(ReadyResult, nil) else p1.readSource(p4, nil) and (ReadyResult == nil or p1.readSource(ReadyResult, nil))
			local CellResult = if NoReadyResult then Compose.cell(false) else nil
			local MotionPresentFadeIn = p1.metric("motion.presentFadeIn")
			local MotionPresentFadeOut = p1.metric("motion.presentFadeOut")
			local Present = p1.motionEase("present")
			local Fade = p1.motionEase("fade")
			local TweenResult = Runtime.tween(function(Callback): number
				-- upvalues: Exiting (copy), CellResult (copy), p4 (copy), p1 (upval), ReadyResult (copy)
				if Callback(Exiting) or CellResult and not Callback(CellResult) or not (if p4 == nil then ReadyResult == nil or p1.readSource(ReadyResult, Callback) else p1.readSource(p4, Callback) and (ReadyResult == nil or p1.readSource(ReadyResult, Callback))) then
					return 0
				else
					return 1
				end
			end, {
				seconds = function(_)
					-- upvalues: LevelResult (copy), p1 (upval), Exiting (copy), p3 (copy)
					return if LevelResult() == "limited" then p1.metric("motion.reducedFade") elseif Exiting:peek() then p3.exit else p3.enter
				end,
				ease = function(p5)
					-- upvalues: LevelResult (copy), Fade (copy), Present (copy)
					return if LevelResult() == "limited" then Fade(p5) else Present(p5)
				end
			})
			
			if CellResult then
				CellResult:set(true)
			end
			local _ = function(p5)
				-- upvalues: p4 (copy), p1 (upval), ReadyResult (copy), LevelResult (copy), TweenResult (copy)
				local NoReadyResult = if p4 == nil then ReadyResult == nil or p1.readSource(ReadyResult, p5) else p1.readSource(p4, p5) and (ReadyResult == nil or p1.readSource(ReadyResult, p5))
				
				return if NoReadyResult then if LevelResult(p5) == "none" then 1 else p1.readSource(TweenResult, p5) else 0
			end
			
			local function travel(p5)
				-- upvalues: p4 (copy), p1 (upval), ReadyResult (copy), LevelResult (copy), TweenResult (copy)
				local NoReadyResult = if p4 == nil then ReadyResult == nil or p1.readSource(ReadyResult, p5) else p1.readSource(p4, p5) and (ReadyResult == nil or p1.readSource(ReadyResult, p5))
				
				return if NoReadyResult then if LevelResult(p5) == "normal" then p1.readSource(TweenResult, p5) else 1 else 0
			end
			
			local v1 = 0
			local CellResult1 = Compose.cell({ p = 0, o = 0 })
			
			local function opacity(Callback)
				-- upvalues: p4 (copy), p1 (upval), ReadyResult (copy), LevelResult (copy), TweenResult (copy), v1 (ref), CellResult1 (copy), Exiting (copy), Present (copy), MotionPresentFadeOut (copy), MotionPresentFadeIn (copy)
				local NoReadyResult = if p4 == nil then ReadyResult == nil or p1.readSource(ReadyResult, Callback) else p1.readSource(p4, Callback) and (ReadyResult == nil or p1.readSource(ReadyResult, Callback))
				local Source = if NoReadyResult then if LevelResult(Callback) == "none" then 1 else p1.readSource(TweenResult, Callback) else 0
				
				if LevelResult(Callback) ~= "normal" then
					v1 = Source
					
					return Source
				end
				local CallbackResult = if Callback then Callback(CellResult1) else CellResult1:peek()
				local ScaledO = nil
				
				if p1.read(Exiting, Callback) then
					local v2 = 1 - Present(MotionPresentFadeOut)
					ScaledO = if v2 < CallbackResult.p then CallbackResult.o * math.clamp((Source - v2) / (CallbackResult.p - v2), 0, 1) elseif CallbackResult.p > 0 then CallbackResult.o * math.clamp(Source / CallbackResult.p, 0, 1) else 0
				else
					ScaledO = CallbackResult.o + (1 - CallbackResult.o) * math.clamp((Source - CallbackResult.p) / (math.max(Present(MotionPresentFadeIn), CallbackResult.p + 0.001) - CallbackResult.p), 0, 1)
				end
				v1 = ScaledO
				
				return ScaledO
			end
			
			Compose.watch(function(Callback: (any) -> ())
				-- upvalues: Exiting (copy), CellResult1 (copy), p4 (copy), p1 (upval), ReadyResult (copy), LevelResult (copy), TweenResult (copy), v1 (ref)
				Callback(Exiting)
				local config = {
					p = if NoReadyResult then if LevelResult(nil) == "none" then 1 else p1.readSource(TweenResult, nil) else 0,
					o = v1
				}
				local NoReadyResult = if p4 == nil then ReadyResult == nil or p1.readSource(ReadyResult, nil) else p1.readSource(p4, nil) and (ReadyResult == nil or p1.readSource(ReadyResult, nil))
				CellResult1:set(config)
			end)
			
			return { opacity = opacity, travel = travel }
		end,
		atRest = function(Callback, p2, Entry, Restart)
			-- upvalues: p1 (copy), FontReadinessModule (upval), GeometrySignatureModule (upval), TextMeasureModule (upval), Compose (copy)
			local AbsoluteSizeResults = {}
			
			for i, value in Entry do
				AbsoluteSizeResults[i] = p1.observe.AbsoluteSize(value)
			end
			local FontReadinessModuleResult = FontReadinessModule(p1, Entry)
			local AbsoluteSizes = {}
			local GeometrySignatureModuleResult = GeometrySignatureModule()
			local v1 = 0
			local v2 = false
			local Enabled = nil
			local SettledResult = p1.runtime.settled({
				sample = function()
					-- upvalues: v1 (ref)
					return v1
				end,
				ready = function(): boolean
					-- upvalues: Entry (copy), AbsoluteSizes (copy), TextMeasureModule (upval), GeometrySignatureModuleResult (copy), v1 (ref), v2 (ref), Enabled (ref), FontReadinessModuleResult (copy)
					local v3 = false
					local v4 = true
					local AbsolutePosition = Entry[1].AbsolutePosition
					local Descendants = Entry[1]:GetDescendants()
					
					for i, Frame in Entry do
						table.insert(Descendants, Frame)
						local AbsoluteSize = Frame.AbsoluteSize
						AbsoluteSizes[i] = AbsoluteSize
						v3 = v3 or AbsoluteSize.X > 0 and AbsoluteSize.Y > 0
					end
					for _, descendant in Descendants do
						v4 = v4 and not TextMeasureModule.pending(descendant)
						
						if descendant:IsA("GuiObject") then
							GeometrySignatureModuleResult.push(descendant.AbsolutePosition - AbsolutePosition)
							GeometrySignatureModuleResult.push(descendant.AbsoluteSize)
							GeometrySignatureModuleResult.push(descendant.Visible)
							
							if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
								GeometrySignatureModuleResult.push(descendant.TextBounds)
							end
						end
					end
					local FinishResult = GeometrySignatureModuleResult.finish()
					local V48: boolean = Entry[1].Visible and (FontReadinessModuleResult() and v4)
					v1 = FinishResult
					v2 = v3
					Enabled = V48
					
					return Enabled ~= false
				end,
				equals = function(p3, p4): boolean
					-- upvalues: v2 (ref)
					return v2 and p3 == p4
				end,
				restart = Restart,
				timeout = p1.metric("motion.restLimit")
			})
			local CellResults = {}
			local CellResults1 = {}
			
			for i1, absoluteSizeResult in AbsoluteSizeResults do
				local CellResult = Compose.cell(absoluteSizeResult:peek())
				CellResults1[i1] = CellResult
				CellResults[i1] = CellResult
			end
			local v5 = false
			Compose.watch(function(Callback1)
				-- upvalues: SettledResult (copy), AbsoluteSizeResults (copy), Callback (copy), CellResults1 (copy), Entry (copy), v5 (ref), AbsoluteSizes (copy), p2 (copy)
				local CallbackResult = Callback1(SettledResult)
				
				for i, absoluteSizeResult in AbsoluteSizeResults do
					local CallbackResult1 = Callback1(absoluteSizeResult)
					
					if not CallbackResult or Callback() >= 1 then
						CellResults1[i]:set(if CallbackResult then Entry[i].AbsoluteSize else CallbackResult1)
					end
				end
				if CallbackResult and not v5 then
					for i1, value in CellResults1 do
						value:set(AbsoluteSizes[i1])
					end
					p2:set(true)
				end
				v5 = CallbackResult
			end)
			
			return CellResults, SettledResult
		end,
		departure = function(p3, p4, Callback)
			-- upvalues: MotionModule (upval), p1 (copy), Runtime (copy), attached (copy), Compose (copy)
			local LevelResult = MotionModule.level(p1)
			local SchedulerResult = Runtime.scheduler()
			
			return {
				exit = function(_)
					-- upvalues: LevelResult (copy), Callback (copy), attached (upval), p4 (copy), SchedulerResult (copy), Compose (upval), p1 (upval), p3 (copy)
					local LevelResultResult = LevelResult()
					
					if Callback() and attached(p4) and LevelResultResult ~= "none" then
						local CellResult = Compose.cell(false)
						SchedulerResult.replace("exit", if LevelResultResult == "limited" then p1.metric("motion.reducedFade") else p3.exit, function()
							-- upvalues: CellResult (copy)
							CellResult:set(true)
						end)
						
						return { completed = CellResult }
					else
						SchedulerResult.cancel("exit")
						
						return { completed = Compose.cell(true) }
					end
				end
			}
		end
	}
end