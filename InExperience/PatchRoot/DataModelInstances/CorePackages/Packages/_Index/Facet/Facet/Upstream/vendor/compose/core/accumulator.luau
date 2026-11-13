local ActiveModule = require("./ownership/active")
local DiagnosticsModule = require("./diagnostics")
local OwnerModule = require("./ownership/owner")
local SupportModule = require("./structure/support")
local _ = require("./reactive/types")
local CellModule = require("./reactive/cell")
local EvaluationModule = require("./reactive/evaluation")
local config = {
	from = true,
	reduce = true,
	initial = true,
	equals = true
}

return function(p1)
	-- upvalues: SupportModule (copy), config (copy), ActiveModule (copy), DiagnosticsModule (copy), CellModule (copy), OwnerModule (copy), EvaluationModule (copy)
	local Accumulator = SupportModule.optionsOf(p1, "accumulator", "from = ..., reduce = ..., initial = ...")
	SupportModule.noUnknownFields(Accumulator, "accumulator", config)
	local CurrentResult = ActiveModule.current()
	
	if CurrentResult == nil then
		return DiagnosticsModule.raise("accumulator/no-active-owner", "accumulator ran with no owner to hold it", {
			contract = "an accumulator subscribes to its source, and the subscription lives exactly as long as the owner that created it",
			fix = "create it inside a component or Compose.withOwner(owner, ...); a process-wide accumulator is one created in a root owner kept for the life of the process"
		})
	end
	local From = Accumulator.from
	
	if not CellModule.isValue(From) then
		return DiagnosticsModule.raise("accumulator/from-not-readable", "accumulator was given a source it cannot track", {
			expected = "a cell or a formula",
			contract = "an accumulator tracks exactly one readable source and reduces each of its changes into its own state",
			fix = "pass the cell or formula that carries the events: from = castFired",
			actual = DiagnosticsModule.describe(From)
		})
	end
	local ReduceFunction = Accumulator.reduce
	
	if type(ReduceFunction) == "function" then
		local CellResult = CellModule.cell(Accumulator.initial, Accumulator.equals)
		OwnerModule.watchStatic(CurrentResult, From, function(p2)
			-- upvalues: CellResult (copy), EvaluationModule (upval), ReduceFunction (copy)
			CellResult:set(EvaluationModule.call(ReduceFunction, CellResult:peek(), p2))
		end)
		
		return CellResult
	else
		return DiagnosticsModule.raise("accumulator/reduce-not-a-function", "accumulator was given a reduce it cannot call", {
			expected = "a function (previous, event) -> next",
			fix = "pass the reducer that merges one event into the running state",
			actual = DiagnosticsModule.describe(ReduceFunction)
		})
	end
end