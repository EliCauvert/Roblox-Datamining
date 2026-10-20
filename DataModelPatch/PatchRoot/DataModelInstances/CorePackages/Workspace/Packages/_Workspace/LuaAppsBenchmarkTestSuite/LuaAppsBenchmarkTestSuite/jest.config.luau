local Parent = script.Parent.Parent

local function getBenchmarkProject(AppChat, p1)
	local Success, Result = pcall(require, AppChat)
	
	if not Success then
		error(`Failed to load benchmark package "{p1}": {Result}\n` .. `Expected {p1} to export ["jest.bench.config"] from src/init.lua ` .. "and ensure rotriever.toml does not exclude jest.bench.config.lua.")
	end
	if type(Result) ~= "table" then
		error(`Benchmark package "{p1}" returned {type(Result)} instead of an exports table.`)
	end
	local JestBenchConfig = Result["jest.bench.config"]
	
	if typeof(JestBenchConfig) ~= "Instance" or not JestBenchConfig:IsA("ModuleScript") then
		error(`Benchmark package "{p1}" is missing an exported ["jest.bench.config"] ModuleScript. ` .. "Export it from src/init.lua and ensure rotriever.toml does not exclude jest.bench.config.lua.")
	end
	return JestBenchConfig
end

return {
	displayName = "LuaAppsBenchmarks",
	testTimeout = 30000,
	projects = {
		getBenchmarkProject(Parent.AppChat, "AppChat"),
		(getBenchmarkProject(Parent.ExpChat, "ExpChat"))
	}
}