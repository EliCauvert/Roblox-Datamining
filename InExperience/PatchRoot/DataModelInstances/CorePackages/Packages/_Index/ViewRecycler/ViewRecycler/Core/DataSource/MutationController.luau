local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.Types)
local createEventModule = require(viewRecycler.Internal.createEvent)

return function(p1, p2, p3)
	-- upvalues: createEventModule (ref)
	local var1 = createEventModule()
	local var2 = 0
	local t = {}
	local var3 = nil
	
	local function flush()
		-- upvalues: var3 (write), t (write), var1 (ref), p1 (ref)
		t = {}
		var3 = nil
		var1.fire({ changes = t, previousItemCount = var3, itemCount = p1() })
	end
	
	local function _(p4, p5)
		-- upvalues: t (write), var3 (write)
		if #t == 0 then
			var3 = p5
		end
		for i, v in p4 do
			table.insert(t, v)
		end
	end
	
	return {
		subscribe = var1.connect,
		emit = function(p6, p7)
			-- upvalues: t (write), var3 (write), var2 (write), flush (ref)
			local list = { p6 }
			
			if #t == 0 then
				var3 = p7
			end
			for i, v in list do
				table.insert(t, v)
			end
			if var2 == 0 then
				flush()
			end
		end,
		emitMany = function(p8, p9)
			-- upvalues: t (write), var3 (write), var2 (write), flush (ref)
			if #t == 0 then
				var3 = p9
			end
			for i, v in p8 do
				table.insert(t, v)
			end
			if var2 == 0 then
				flush()
			end
		end,
		transaction = function(p10)
			-- upvalues: p2 (ref), t (write), var3 (write), var2 (write), p3 (ref), flush (ref)
			local var4 = p2()
			local cloned = table.clone(t)
			var2 += 1
			local packed = table.pack(pcall(function()
				-- upvalues: p10 (ref)
				p10()
				
				return true
			end))
			var2 -= 1
			
			if not packed[1] then
				p3(var4)
				t = cloned
				var3 = var3
				error(packed[2], 0)
			end
			if var2 == 0 and #t > 0 then
				flush()
			end
		end
	}
end