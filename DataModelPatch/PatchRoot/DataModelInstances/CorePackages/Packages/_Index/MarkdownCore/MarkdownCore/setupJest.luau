local JestGlobalsModule = require(script:FindFirstAncestor("MarkdownCore").Parent.Dev.JestGlobals)
local ExpectFunction = JestGlobalsModule.expect
local Jest = JestGlobalsModule.jest

local function toWarnWith(_, p1, p2)
	-- upvalues: Jest (copy), ExpectFunction (copy)
	local Pass = false
	local v1 = ""
	local MockImplementationResult = Jest.spyOn(Jest.globalEnv, "warn").mockImplementation(function(p3)
		-- upvalues: ExpectFunction (upval), p2 (copy), Pass (ref), v1 (ref)
		print("WARN", p3)
		local Success, Result = pcall(function()
			-- upvalues: ExpectFunction (upval), p3 (copy), p2 (upval)
			ExpectFunction(p3).toEqual(p2)
		end)
		
		if Success then
			Pass = true
			v1 = Result
		end
	end)
	local Success, Result = pcall(p1)
	
	if not Success then
		MockImplementationResult:mockRestore()
		error(Result)
	end
	local Message = if Pass then function(): string
		-- upvalues: p2 (copy), v1 (ref)
		return `Expected never to warn with string containing "{p2}" but got "{v5}"`
	end else function(): string
		-- upvalues: p2 (copy)
		return `Expected to warn with string containing "{p2}" but did not find a match`
	end
	MockImplementationResult:mockRestore()
	
	return { message = Message, pass = Pass }
end

local function toWarn(_, p1)
	-- upvalues: Jest (copy)
	local Count = 0
	local MockImplementationResult = Jest.spyOn(Jest.globalEnv, "warn").mockImplementation(function(p2)
		-- upvalues: Count (ref)
		print("WARN", p2)
		Count += 1
	end)
	local Success, Result = pcall(p1)
	
	if not Success then
		MockImplementationResult:mockRestore()
		error(Result)
	end
	local Message = if Count > 0 then function(): string
		-- upvalues: Count (ref)
		return `Expected never to warn but got {Count} warnings`
	end else function(): string
		return "Expected to warn but never did"
	end
	MockImplementationResult:mockRestore()
	
	return { message = Message, pass = Count > 0 }
end

JestGlobalsModule.beforeAll(function()
	-- upvalues: ExpectFunction (copy), toWarnWith (copy), toWarn (copy)
	ExpectFunction.extend({ toWarnWith = toWarnWith, toWarn = toWarn })
end)