local ActiveModule = require("./active")
local DiagnosticsModule = require("../diagnostics")
local _ = require("./owner")

return {
	validate = function(List, Text)
		-- upvalues: DiagnosticsModule (copy), ActiveModule (copy)
		local IsPool = Text == "pool"
		local CreatePool: string = if IsPool then "createPool" else "createKeyedCache"
		local Create: string = if IsPool then "create" else "build"
		local Reset: string = if IsPool then "reset" else "touch"
		local Pool: string = if IsPool then "pool" else "cache"
		local Creates = {}
		
		if type(List) == "table" then
			for i, value in List do
				Creates[i] = value
			end
		end
		if type(Creates[Create]) ~= "function" or type(Creates.destroy) ~= "function" then
			return DiagnosticsModule.raise(Text .. "/invalid-options", CreatePool .. " needs " .. Create .. " and destroy functions", {
				expected = ("{ %s = function, destroy = function, maxRetained = finite number, %s? = function }"):format(Create, Reset)
			})
		end
		for create in Creates do
			if create ~= Create and create ~= "destroy" and create ~= "maxRetained" and create ~= Reset then
				return DiagnosticsModule.raise(Text .. "/unknown-option", CreatePool .. " was given an option it does not have", {
					option = tostring(create),
					expected = `{Create}, destroy, maxRetained, {Reset}`
				})
			end
		end
		if Creates[Reset] ~= nil and type(Creates[Reset]) ~= "function" then
			return DiagnosticsModule.raise(Text .. "/invalid-" .. Reset, `{CreatePool}.{Reset} must be a function`, { actual = DiagnosticsModule.describe(Creates[Reset]) })
		end
		local CurrentResult = ActiveModule.current()
		
		if CurrentResult == nil then
			return DiagnosticsModule.raise(Text .. "/no-active-owner", CreatePool .. " ran outside an owner", {
				fix = "create it inside a component or Compose.withOwner(owner, ...)",
				contract = `a {Pool} cannot outlive the owner responsible for its resources`
			})
		end
		local MaxRetained: number = Creates.maxRetained
		
		if type(MaxRetained) == "number" and MaxRetained == MaxRetained and MaxRetained >= 0 and math.abs(MaxRetained) ~= 1e999 then
			return CurrentResult, (math.floor(MaxRetained))
		else
			return DiagnosticsModule.raise(Text .. "/invalid-limit", CreatePool .. ".maxRetained must be a finite non-negative number", {
				actual = DiagnosticsModule.describe(MaxRetained),
				contract = `a {Pool} always has an explicit {if IsPool then "retained-memory" else "retained-entry"} bound`
			})
		end
	end,
	destroyAll = function(p1, p2, Callback: (any) -> ())
		local List = {}
		Callback(function(p3)
			-- upvalues: p2 (copy), List (copy)
			local Success, Result = pcall(p2, p3)
			
			if not Success then
				table.insert(List, (tostring(Result)))
			end
		end)
		
		if #List > 0 then
			error(("Compose: %d %s resource destroy failures: %s"):format(#List, p1, table.concat(List, "; ")), 0)
		end
	end
}