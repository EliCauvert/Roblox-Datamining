local t = {}
local thunkTag = require(script.Parent.Symbol).named("ThunkTag")

function t.middleware(p0)
	-- upvalues: thunkTag (ref)
	p0 = p0 or {}
	
	return function(p1, p2)
		-- upvalues: thunkTag (copy), p0 (write)
		return function(p3)
			-- upvalues: thunkTag (copy), p0 (copy), p2 (ref), p1 (ref)
			if p3[thunkTag] ~= true then
				return p1(p3)
			end
			local t = {}
			
			for i, v in pairs(p3.requiredServices) do
				local var3 = p0[v]
				
				if var3 == nil then
					error(("Service with key %s is a dependency but was not provided"):format(v))
				end
				t[v] = var3
			end
			return p3(p2, t)
		end
	end
end

function t.new(p4, p5, p6)
	-- upvalues: thunkTag (ref)
	assert(typeof(p4) == "string", "Bad arg #1: name must be a string")
	assert(if p5 ~= nil then typeof(p5) == "table" else true, "Bad arg #2: requiredServices must be a table or nil")
	assert(typeof(p6) == "function", "Bad arg #3: onInvoke must be a function")
	
	return setmetatable({
		[thunkTag] = true,
		type = p4,
		requiredServices = p5 or {}
	}, {
		__call = function(_, ...)
			-- upvalues: p6 (ref)
			p6(...)
		end
	})
end

function t.test(p7, p8, p9)
	-- upvalues: thunkTag (ref)
	assert(typeof(p7) == "table" and p7[thunkTag] == true, "Test Error - Bad arg #1: Must provide a valid thunk")
	
	if #p7.requiredServices > 0 then
		for i, v in ipairs(p7.requiredServices) do
			assert(p9[v] ~= nil, "Test Error - Bad arg #3: Missing required service " .. tostring(v))
		end
	end
	return p7(p8, p9)
end

return t