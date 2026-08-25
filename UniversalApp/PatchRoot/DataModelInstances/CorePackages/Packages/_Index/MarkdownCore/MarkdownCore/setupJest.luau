local jestGlobalsModule = require(script:FindFirstAncestor("MarkdownCore").Parent.Dev.JestGlobals)
local beforeAll = jestGlobalsModule.beforeAll
local expect = jestGlobalsModule.expect
local jest = jestGlobalsModule.jest

local function toWarnWith(_, p1, p2)
	-- upvalues: jest (ref), expect (ref)
	local var1 = false
	local var2 = ""
	local var3 = jest.spyOn(jest.globalEnv, "warn").mockImplementation(function(p1)
		-- upvalues: expect (copy), p2 (ref), var1 (write), var2 (write)
		print("WARN", p1)
		local ok, status = pcall(function()
			-- upvalues: expect (copy), p1 (ref), p2 (copy)
			expect(p1).toEqual(p2)
		end)
		
		if ok then
			var1 = true
			var2 = status
		end
	end)
	local ok, status = pcall(p1)
	
	if not ok then
		var3:mockRestore()
		error(status)
	end
	local var4 = if var1 then function()
		-- upvalues: p2 (ref), var2 (write)
		return `Expected never to warn with string containing "{p1}" but got "{var4}"`
	end else function()
		-- upvalues: p2 (ref)
		return `Expected to warn with string containing "{p1}" but did not find a match`
	end
	var3:mockRestore()
	
	return { message = var4, pass = var1 }
end

local function toWarn(_, p1)
	-- upvalues: jest (ref)
	local var1 = 0
	local var2 = jest.spyOn(jest.globalEnv, "warn").mockImplementation(function(p1)
		-- upvalues: var1 (write)
		print("WARN", p1)
		var1 += 1
	end)
	local ok, status = pcall(p1)
	
	if not ok then
		var2:mockRestore()
		error(status)
	end
	local var3 = if var1 > 0 then function()
		-- upvalues: var1 (write)
		return `Expected never to warn but got {var1} warnings`
	end else function()
		return "Expected to warn but never did"
	end
	var2:mockRestore()
	
	return { message = var3, pass = var1 > 0 }
end

beforeAll(function()
	-- upvalues: expect (ref), toWarnWith (ref), toWarn (ref)
	expect.extend({ toWarnWith = toWarnWith, toWarn = toWarn })
end)