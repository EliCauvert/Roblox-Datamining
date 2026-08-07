local jestGlobalsModule = require(script:FindFirstAncestor("MarkdownCore").Parent.Dev.JestGlobals)
local beforeAll = jestGlobalsModule.beforeAll
local expect = jestGlobalsModule.expect
local jest = jestGlobalsModule.jest

local function toWarnWith(_, p0, p1) --[[ line: 7 ]]
	-- upvalues: jest (ref), expect (ref)
	local var3 = false
	local var4 = ""
	local var5 = jest.spyOn(jest.globalEnv, "warn").mockImplementation(function(p2) --[[ line: 10 ]]
		-- upvalues: expect (copy), p1 (ref), var3 (write), var4 (write)
		print("WARN", p2)
		local ok, status = pcall(function() --[[ line: 12 ]]
			-- upvalues: expect (copy), p2 (ref), p1 (copy)
			expect(p2).toEqual(p1)
		end)
		
		if ok then
			var3 = true
			var4 = status
		end
	end)
	local ok, status = pcall(p0)
	
	if not ok then
		var5:mockRestore()
		error(status)
	end
	local var6 = if var3 then function() --[[ line: 29 ]]
		-- upvalues: p1 (ref), var4 (write)
		return `Expected never to warn with string containing "{p1}" but got "{var4}"`
	end else function() --[[ line: 33 ]]
		-- upvalues: p1 (ref)
		return `Expected to warn with string containing "{p1}" but did not find a match`
	end
	var5:mockRestore()
	
	return { message = var6, pass = var3 }
end

local function toWarn(_, p3) --[[ line: 44 ]]
	-- upvalues: jest (ref)
	local var7 = 0
	local var8 = jest.spyOn(jest.globalEnv, "warn").mockImplementation(function(p4) --[[ line: 46 ]]
		-- upvalues: var7 (write)
		print("WARN", p4)
		var7 += 1
	end)
	local ok, status = pcall(p3)
	
	if not ok then
		var8:mockRestore()
		error(status)
	end
	local var9 = if var7 > 0 then function() --[[ line: 59 ]]
		-- upvalues: var7 (write)
		return `Expected never to warn but got {var7} warnings`
	end else function() --[[ line: 63 ]]
		return "Expected to warn but never did"
	end
	var8:mockRestore()
	
	return { message = var9, pass = var7 > 0 }
end

beforeAll(function() --[[ line: 75 ]]
	-- upvalues: expect (ref), toWarnWith (ref), toWarn (ref)
	expect.extend({ toWarnWith = toWarnWith, toWarn = toWarn })
end)