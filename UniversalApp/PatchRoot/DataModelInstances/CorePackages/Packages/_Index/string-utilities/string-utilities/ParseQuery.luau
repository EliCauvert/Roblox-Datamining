local runService = game:GetService("RunService")
local stringSplitModule = require(script.Parent.StringSplit)

function assertIsType(p0, p1, p2) --[[ line: 5 ]]
	-- upvalues: runService (ref)
	if runService:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ then
		assert(typeof(p0) == p1, string.format("expects %s to be a %s! it was: %s", p2, p1, typeof(p0)))
	end
end

local function urlDecode(p3) --[[ line: 14 ]]
	assertIsType(p3, "string", "input")
	
	return string.gsub(string.gsub(p3, "%%(%x%x)", function(p4) --[[ line: 16 ]]
		return string.char(tonumber(p4, 16))
	end), "+", " ")
end

return function(p5, p6) --[[ line: 36 | named "ParseQuery" ]]
	-- upvalues: stringSplitModule (ref), urlDecode (ref)
	if p5 ~= nil then
		assertIsType(p5, "string", "input")
	end
	if p6 ~= nil then
		assertIsType(p6, "function", "listKeyMapper")
	end
	local isFunction = type(p6) == "function"
	local t = {}
	
	if p5 and #p5 > 0 then
		for i, v in ipairs(stringSplitModule(p5, "[&;]")) do
			if v and #v > 0 then
				local var5, var6 = unpack(string.split(v, "="))
				
				if var6 == nil then
					var6 = ""
				end
				var5 = urlDecode(var5)
				var6 = urlDecode(var6)
				
				if not isFunction then
					if t[var5] == nil then
						t[var5] = {}
					end
					table.insert(t[var5], var6)
				elseif t[var5] == nil then
					t[var5] = var6
				else
					local var7 = p6(var5)
					
					if var7 == nil then
						var7 = var5
					end
					if type(t[var7]) ~= "table" then
						t[var7] = { t[var5] }
					end
					table.insert(t[var7], var6)
					
					if var5 ~= var7 then
						t[var5] = var6
					end
				end
			end
		end
	end
	return t
end