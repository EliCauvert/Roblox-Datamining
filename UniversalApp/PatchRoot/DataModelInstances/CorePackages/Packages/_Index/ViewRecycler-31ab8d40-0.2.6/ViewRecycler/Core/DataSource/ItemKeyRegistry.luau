local Count = 0

return {
	create = function(Callback, p1) --[[ Line: 22 ]]
		-- upvalues: Count (ref)
		local Tbl = {}
		local Message: string = `{p1}: keys must be strings`
		local Message1: string = `{p1}: setItem must preserve the existing key`
		
		local function _(p2, p3) --[[ Line: 27 | Named "resolve" ]]
			-- upvalues: Callback (copy), Count (upval), Message (copy)
			local CallbackResult = nil
			if Callback == nil then
				Count += 1
				CallbackResult = `view-recycler:{Count}`
			else
				CallbackResult = Callback(p2, p3)
			end
			assert(type(CallbackResult) == "string", Message)
			
			return CallbackResult
		end
		
		return {
			claim = function(p2, p3): string --[[ Line: 33 ]]
				-- upvalues: Callback (copy), Count (upval), Message (copy), Tbl (ref), p1 (copy)
				local CallbackResult = nil
				if Callback == nil then
					Count += 1
					CallbackResult = `view-recycler:{Count}`
				else
					CallbackResult = Callback(p2, p3)
				end
				assert(type(CallbackResult) == "string", Message)
				local RecyclerName: string = CallbackResult
				
				if Tbl[RecyclerName] ~= nil then
					assert(false, `{p1}: duplicate key "{RecyclerName}"`)
				end
				Tbl[RecyclerName] = true
				
				return RecyclerName
			end,
			assertPreserved = function(RecyclerName, p2, p3) --[[ Line: 74 ]]
				-- upvalues: Callback (copy), Count (upval), Message (copy), Message1 (copy)
				if Callback ~= nil then
					local CallbackResult = nil
					if Callback == nil then
						Count += 1
						CallbackResult = `view-recycler:{Count}`
					else
						CallbackResult = Callback(p2, p3)
					end
					assert(type(CallbackResult) == "string", Message)
					assert(CallbackResult == RecyclerName, Message1)
				end
			end,
			release = function(Key) --[[ Line: 79 ]]
				-- upvalues: Tbl (ref), p1 (copy)
				if Tbl[Key] == nil then
					assert(false, `{p1}: cannot release missing key "{Key}"`)
				end
				Tbl[Key] = nil
			end,
			replace = function(Key, p2, p3): string --[[ Line: 42 ]]
				-- upvalues: Callback (copy), Count (upval), Message (copy), Tbl (ref), p1 (copy)
				local CallbackResult = nil
				if Callback == nil then
					Count += 1
					CallbackResult = `view-recycler:{Count}`
				else
					CallbackResult = Callback(p2, p3)
				end
				assert(type(CallbackResult) == "string", Message)
				local Key1: string = CallbackResult
				
				if Tbl[Key] == nil then
					assert(false, `{p1}: cannot replace missing key "{Key}"`)
				end
				if Key1 ~= Key and Tbl[Key1] ~= nil then
					assert(false, `{p1}: duplicate key "{Key1}"`)
				end
				if Key1 ~= Key then
					Tbl[Key] = nil
					Tbl[Key1] = true
				end
				return Key1
			end,
			rebuild = function(List) --[[ Line: 57 ]]
				-- upvalues: Callback (copy), Count (upval), Message (copy), p1 (copy), Tbl (ref)
				local Buffer = table.create(#List)
				local t = {}
				
				for i, value in List do
					local CallbackResult = nil
					if Callback == nil then
						Count += 1
						CallbackResult = `view-recycler:{Count}`
					else
						CallbackResult = Callback(value, i)
					end
					assert(type(CallbackResult) == "string", Message)
					local RecyclerName: string = CallbackResult
					
					if t[RecyclerName] ~= nil then
						assert(false, `{p1}: duplicate key "{RecyclerName}"`)
					end
					Buffer[i] = RecyclerName
					t[RecyclerName] = true
				end
				Tbl = t
				
				return Buffer
			end,
			clear = function() --[[ Line: 87 ]]
				-- upvalues: Tbl (ref)
				Tbl = {}
			end,
			snapshot = function() --[[ Line: 90 ]]
				-- upvalues: Tbl (ref)
				return table.clone(Tbl)
			end,
			restore = function(Tbl1) --[[ Line: 93 ]]
				-- upvalues: Tbl (ref)
				Tbl = table.clone(Tbl1)
			end
		}
	end,
	generatedKey = function(): string --[[ Line: 17 ]]
		-- upvalues: Count (ref)
		Count += 1
		
		return `view-recycler:{Count}`
	end
}