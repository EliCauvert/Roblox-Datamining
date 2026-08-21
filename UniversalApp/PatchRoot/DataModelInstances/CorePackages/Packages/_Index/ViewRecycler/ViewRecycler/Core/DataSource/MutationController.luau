local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.Types)
local createEventModule = require(viewRecycler.Internal.createEvent)

return function(p0, p1, p2) --[[ line: 15 | named "createMutationController" ]]
	-- upvalues: createEventModule (ref)
	local var2 = createEventModule()
	local var3 = 0
	local t = {}
	local var5 = nil
	
	local function flush() --[[ line: 25 ]]
		-- upvalues: var5 (write), t (write), var2 (ref), p0 (ref)
		t = {}
		var5 = nil
		var2.fire({ changes = t, previousItemCount = var5, itemCount = p0() })
	end
	
	local function _(p3, p4) --[[ line: 37 | named "queueChanges" ]]
		-- upvalues: t (write), var5 (write)
		if #t == 0 then
			var5 = p4
		end
		for i, v in p3 do
			table.insert(t, v)
		end
	end
	
	return {
		subscribe = var2.connect,
		emit = function(p5, p6) --[[ line: 53 ]]
			-- upvalues: t (write), var5 (write), var3 (write), flush (ref)
			local list = { p5 }
			
			if #t == 0 then
				var5 = p6
			end
			for i, v in list do
				table.insert(t, v)
			end
			if var3 == 0 then
				flush()
			end
		end,
		emitMany = function(p7, p8) --[[ line: 46 ]]
			-- upvalues: t (write), var5 (write), var3 (write), flush (ref)
			if #t == 0 then
				var5 = p8
			end
			for i, v in p7 do
				table.insert(t, v)
			end
			if var3 == 0 then
				flush()
			end
		end,
		transaction = function(p9) --[[ line: 60 ]]
			-- upvalues: p1 (ref), t (write), var5 (write), var3 (write), p2 (ref), flush (ref)
			local var8 = p1()
			local cloned = table.clone(t)
			var3 += 1
			local packed = table.pack(pcall(function() --[[ line: 65 ]]
				-- upvalues: p9 (ref)
				p9()
				
				return true
			end))
			var3 -= 1
			
			if not packed[1] then
				p2(var8)
				t = cloned
				var5 = var5
				error(packed[2], 0)
			end
			if var3 == 0 and #t > 0 then
				flush()
			end
		end
	}
end