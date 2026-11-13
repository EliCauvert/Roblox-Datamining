local _ = require("./types")
local _ = require("./control_types")
local _ = require("./hud_props")
local _ = require("./media_props")
local FormatModule = require("./format")

return function(p1, p2)
	-- upvalues: FormatModule (copy)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	p2.Timer = p1.construct("Timer", function(p3)
		-- upvalues: Runtime (copy), Compose (copy), p1 (copy), p2 (copy), ReadFunction (copy), FormatModule (upval)
		assert(p3.deadline ~= nil ~= (p3.start ~= nil), "Facet Timer requires either deadline or start")
		local FacetTimerRequiresARuntimeClock = assert(Runtime.host.frames, "Facet Timer requires a runtime clock")
		local Now = p3.now or FacetTimerRequiresARuntimeClock.now
		local CellResult = Compose.cell(false)
		local CellResult1 = Compose.cell("")
		local config = { text = CellResult1, textRole = p3.textRole }
		local TextResult = p2.Text(p1.props(config, { "text", "textRole" }, (p1.props(p3, {
			"deadline", "start", "now", "hours", "textRole", "onComplete", "controls"
		}, config))))
		assert(TextResult:IsA("TextLabel"))
		
		if p3.controls then
			p3.controls.completed = CellResult
			Compose.cleanup(function()
				-- upvalues: p3 (copy)
				if p3.controls then
					p3.controls.completed = nil
				end
			end)
		end
		Compose.watch(function(p4)
			-- upvalues: ReadFunction (upval), p3 (copy), CellResult (copy), Runtime (upval), Compose (upval), Now (copy), CellResult1 (copy), FormatModule (upval)
			local ReadResult: number = ReadFunction(p3.deadline or p3.start, p4)
			local Largest: boolean = ReadResult ~= nil and (ReadResult == ReadResult and math.abs(ReadResult) < 1e999)
			assert(Largest, "Facet Timer requires a finite time")
			CellResult:set(false)
			local ClockResult = Runtime.clock(if p3.now then {} elseif p3.deadline == nil then { step = 1, start = ReadResult } else { step = 1, deadline = ReadResult })
			Largest = nil
			local Hours = nil
			Compose.watch(function(Callback)
				-- upvalues: CellResult (upval), ClockResult (copy), p3 (upval), Now (upval), ReadResult (copy), Largest (ref), Hours (ref), CellResult1 (upval), FormatModule (upval)
				if Callback(CellResult) then return end
				local CallbackResult = Callback(ClockResult)
				local NowResult = if p3.now then Now() else nil
				assert(NowResult == nil or NowResult == NowResult and math.abs(NowResult) < 1e999, "Facet Timer clock must be finite")
				local CallbackResult1 = if NowResult == nil then CallbackResult elseif p3.deadline == nil then NowResult - ReadResult else ReadResult - NowResult
				local Largest1 = math.max(0, if p3.deadline == nil then math.floor(CallbackResult1) else math.ceil(CallbackResult1))
				local Hours1 = p3.hours
				
				if Largest1 ~= Largest or Hours1 ~= Hours then
					CellResult1:set(FormatModule.duration(Largest1, { hours = Hours1 }))
					Largest = Largest1
					Hours = Hours1
				end
				if p3.deadline ~= nil and CallbackResult1 <= 0 then
					CellResult:set(true)
					
					if p3.onComplete then
						p3.onComplete()
					end
				end
			end)
		end)
		
		return TextResult
	end)
end