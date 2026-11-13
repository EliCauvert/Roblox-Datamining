local CoreModule = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./control_types")
local _ = require("./hud_props")
local _ = require("./media_props")
local ReducedFunction = require("./motion").reduced

return function(p1, p2)
	-- upvalues: ReducedFunction (copy), CoreModule (copy)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	p2.Typewriter = p1.construct("Typewriter", function(Tbl)
		-- upvalues: Runtime (copy), Compose (copy), p2 (copy), p1 (copy), ReducedFunction (upval), CoreModule (upval)
		assert(Tbl.reveal == nil and Tbl.truncate ~= "middle", "Facet Typewriter requires the full text")
		assert(Tbl.MaxVisibleGraphemes == nil, "Facet Typewriter owns MaxVisibleGraphemes")
		local FacetTypewriterRequiresARuntimeClock = assert(Runtime.host.frames, "Facet Typewriter requires a runtime clock")
		local v1 = assert(Compose.currentOwner())
		local CellResult = Compose.cell(false)
		local Copy = table.clone(Tbl)
		
		for _, value in { "onRevealed", "controls", "ref" } do
			Copy[value] = nil
		end
		Copy.MaxVisibleGraphemes = 0
		local TextResult = p2.Text(Copy)
		local ContentTextResult = p1.observe.ContentText(TextResult)
		local TextResult1 = p1.observe.Text(TextResult)
		local ReducedResult = ReducedFunction(p1)
		
		local function finish()
			-- upvalues: CoreModule (upval), v1 (copy), CellResult (copy), TextResult (copy), Tbl (copy), Compose (upval)
			if CoreModule.owner.isDisposed(v1) or CellResult:peek() then return end
			TextResult.MaxVisibleGraphemes = -1
			CellResult:set(true)
			
			if Tbl.onRevealed then
				Compose.withOwner(v1, Tbl.onRevealed)
			end
		end
		
		if Tbl.controls then
			Tbl.controls.revealed = CellResult
			Tbl.controls.finish = finish
			Compose.cleanup(function()
				-- upvalues: Tbl (copy)
				if Tbl.controls then
					Tbl.controls.revealed = nil
					Tbl.controls.finish = nil
				end
			end)
		end
		local v2 = nil
		local v3 = nil
		local NowResult = FacetTypewriterRequiresARuntimeClock.now()
		Compose.watch(function(Callback)
			-- upvalues: TextResult1 (copy), ContentTextResult (copy), ReducedResult (copy), p1 (upval), v2 (ref), v3 (ref), NowResult (ref), FacetTypewriterRequiresARuntimeClock (copy), CellResult (copy), TextResult (copy), CoreModule (upval), v1 (copy), Tbl (copy), Compose (upval), Runtime (upval)
			local CallbackResult = Callback(TextResult1)
			local CallbackResult1 = Callback(ContentTextResult)
			local ReducedResultResult = ReducedResult(Callback)
			local MotionTypewriterGrapheme: number = p1.metric("motion.typewriter.grapheme", Callback)
			local MotionTypewriterPause: number = p1.metric("motion.typewriter.pause", Callback)
			assert(MotionTypewriterGrapheme > 0 and MotionTypewriterPause >= 0, "Facet Typewriter timing requires a positive interval and nonnegative pause")
			
			if CallbackResult ~= v2 or CallbackResult1 ~= v3 then
				v2 = CallbackResult
				v3 = CallbackResult1
				NowResult = FacetTypewriterRequiresARuntimeClock.now() + MotionTypewriterPause
				CellResult:set(false)
				TextResult.MaxVisibleGraphemes = 0
			elseif CellResult:peek() then return end
			if not ReducedResultResult then
				Runtime.scheduler().after(0, function()
					-- upvalues: CellResult (upval), CallbackResult1 (copy), Runtime (upval), NowResult (upval), Compose (upval), MotionTypewriterGrapheme (copy), CoreModule (upval), v1 (upval), TextResult (upval), Tbl (upval)
					if CellResult:peek() then return end
					local Count = 0
					
					for _ in utf8.graphemes(CallbackResult1) do
						Count += 1
					end
					local ClockResult = Runtime.clock({ start = NowResult })
					Compose.watch(function(Callback)
						-- upvalues: CellResult (upval), Count (ref), ClockResult (copy), MotionTypewriterGrapheme (upval), CoreModule (upval), v1 (upval), TextResult (upval), Tbl (upval), Compose (upval)
						if Callback(CellResult) then return end
						local Smallest = math.min(Count, (math.floor(Callback(ClockResult) / MotionTypewriterGrapheme)))
						
						if Count > Smallest then
							TextResult.MaxVisibleGraphemes = Smallest
						elseif not CoreModule.owner.isDisposed(v1) then
							if CellResult:peek() then return end
							TextResult.MaxVisibleGraphemes = -1
							CellResult:set(true)
							
							if Tbl.onRevealed then
								Compose.withOwner(v1, Tbl.onRevealed)
								
								return
							end
						end
					end)
				end)
				
				return
			end
			if not CoreModule.owner.isDisposed(v1) then
				if CellResult:peek() then return end
				TextResult.MaxVisibleGraphemes = -1
				CellResult:set(true)
				
				if Tbl.onRevealed then
					Compose.withOwner(v1, Tbl.onRevealed)
				end
			end
		end)
		
		return TextResult
	end)
end