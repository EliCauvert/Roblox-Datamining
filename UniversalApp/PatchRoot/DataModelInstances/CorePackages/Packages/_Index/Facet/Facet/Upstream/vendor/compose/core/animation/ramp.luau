local _ = require("../types")
local ReactorModule = require("../reactive/reactor")
local DiagnosticsModule = require("../diagnostics")
local OwnerModule = require("../ownership/owner")
local _ = require("../reactive/types")
local CellModule = require("../reactive/cell")

return {
	createRamps = function(Callback1, Callback)
		-- upvalues: CellModule (copy), DiagnosticsModule (copy), ReactorModule (copy), OwnerModule (copy)
		return function(p1, p2)
			-- upvalues: Callback (copy), CellModule (upval), Callback1 (copy), DiagnosticsModule (upval), ReactorModule (upval), OwnerModule (upval)
			local Ramp = Callback("ramp")
			local CellResult = CellModule.cell(p1)
			local CellResult1 = CellModule.cell(0.25)
			local CellResult2 = CellModule.cell(false)
			
			return {
				value = Callback1(function(Callback)
					-- upvalues: CellResult (copy)
					return Callback(CellResult)
				end, {
					seconds = CellResult1,
					ease = if p2 == nil then nil else p2.ease,
					reducedMotion = CellResult2
				}),
				retarget = function(p3, p4)
					-- upvalues: DiagnosticsModule (upval), ReactorModule (upval), OwnerModule (upval), Ramp (copy), CellResult1 (copy), CellResult2 (copy), CellResult (copy)
					if type(p4) == "number" and p4 == p4 and p4 ~= 1e999 then
						ReactorModule.batch(OwnerModule.reactorOf(Ramp), function()
							-- upvalues: p4 (copy), CellResult1 (upval), CellResult2 (upval), CellResult (upval), p3 (copy)
							if p4 > 0 then
								CellResult1:set(p4)
							end
							CellResult2:set(p4 <= 0)
							CellResult:set(p3)
						end)
						
						return
					else
						return DiagnosticsModule.raise("ramp/invalid-seconds", "a ramp needs a finite duration", {
							expected = "seconds; zero or less jumps to the target at once",
							actual = DiagnosticsModule.describe(p4)
						})
					end
				end
			}
		end
	end
}