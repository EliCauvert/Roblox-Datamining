local t = {}
local thunkTag = require(script.Parent.Symbol).named("ThunkTag")

function t.middleware(p1)
	-- upvalues: thunkTag (ref)
	p1 = p1 or {}
	
	return function(p2, p3)
		-- upvalues: thunkTag (copy), p1 (write)
		return function(p4)
			-- upvalues: thunkTag (copy), p1 (copy), p3 (ref), p2 (ref)
			if p4[thunkTag] ~= true then
				return p2(p4)
			end
			local t = {}
			
			for i, v in pairs(p4.requiredServices) do
				local var1 = p1[v]
				
				if var1 == nil then
					error(("Service with key %s is a dependency but was not provided"):format(v))
				end
				t[v] = var1
			end
			return p4(p3, t)
		end
	end
end

function t.new(p2, p3, p4)
	-- upvalues: thunkTag (ref)
	assert(typeof(p2) == "string", "Bad arg #1: name must be a string")
	assert(if p3 ~= nil then typeof(p3) == "table" else true, "Bad arg #2: requiredServices must be a table or nil")
	assert(typeof(p4) == "function", "Bad arg #3: onInvoke must be a function")
	
	return setmetatable({
		[thunkTag] = true,
		type = p2,
		requiredServices = p3 or {}
	}, {
		__call = function(_, ...)
			-- upvalues: p4 (ref)
			p4(...)
		end
	})
end

function t.test(p2, p3, p4)
	-- upvalues: thunkTag (ref)
	assert(typeof(p2) == "table" and p2[thunkTag] == true, "Test Error - Bad arg #1: Must provide a valid thunk")
	
	if #p2.requiredServices > 0 then
		for i, v in ipairs(p2.requiredServices) do
			assert(p4[v] ~= nil, "Test Error - Bad arg #3: Missing required service " .. tostring(v))
		end
	end
	return p2(p3, p4)
end

return t