local runService = game:GetService("RunService")
local stringSplitModule = require(script.Parent.StringSplit)

function assertIsType(p1, p2, p3)
	-- upvalues: runService (ref)
	if runService:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ then
		assert(typeof(p1) == p2, string.format("expects %s to be a %s! it was: %s", p3, p2, typeof(p1)))
	end
end

local function urlDecode(p1)
	assertIsType(p1, "string", "input")
	
	return string.gsub(string.gsub(p1, "%%(%x%x)", function(p2)
		return string.char(tonumber(p2, 16))
	end), "+", " ")
end

return function(p1, p2)
	-- upvalues: stringSplitModule (ref), urlDecode (ref)
	if p1 ~= nil then
		assertIsType(p1, "string", "input")
	end
	if p2 ~= nil then
		assertIsType(p2, "function", "listKeyMapper")
	end
	local isFunction = type(p2) == "function"
	local t = {}
	
	if p1 and #p1 > 0 then
		for i, v in ipairs(stringSplitModule(p1, "[&;]")) do
			if v and #v > 0 then
				local var1, var2 = unpack(string.split(v, "="))
				
				if var2 == nil then
					var2 = ""
				end
				var1 = urlDecode(var1)
				var2 = urlDecode(var2)
				
				if not isFunction then
					if t[var1] == nil then
						t[var1] = {}
					end
					table.insert(t[var1], var2)
				elseif t[var1] == nil then
					t[var1] = var2
				else
					local var3 = p2(var1)
					
					if var3 == nil then
						var3 = var1
					end
					if type(t[var3]) ~= "table" then
						t[var3] = { t[var1] }
					end
					table.insert(t[var3], var2)
					
					if var1 ~= var3 then
						t[var1] = var2
					end
				end
			end
		end
	end
	return t
end