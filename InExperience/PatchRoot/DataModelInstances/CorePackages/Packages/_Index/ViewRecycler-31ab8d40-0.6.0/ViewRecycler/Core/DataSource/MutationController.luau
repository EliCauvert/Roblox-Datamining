local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.Types)
local CreateEventModule = require(ViewRecycler.Internal.createEvent)

return function(Callback, Callback1, Callback2, Callback3) --[[ Line: 15 | Named "createMutationController" ]]
	-- upvalues: CreateEventModule (copy)
	local EventModule = CreateEventModule()
	local Count = 0
	local List = {}
	local v1 = nil
	
	local function flush() --[[ Line: 26 ]]
		-- upvalues: v1 (ref), List (ref), EventModule (copy), Callback (copy)
		local PreviousItemCount = v1
		local Changes = List
		List = {}
		v1 = nil
		EventModule.fire({
			changes = Changes,
			previousItemCount = PreviousItemCount,
			itemCount = Callback()
		})
	end
	
	local function _(List1, p1) --[[ Line: 38 | Named "queueChanges" ]]
		-- upvalues: List (ref), v1 (ref)
		if #List == 0 then
			v1 = p1
		end
		for _, value in List1 do
			table.insert(List, value)
		end
	end
	
	return {
		subscribe = EventModule.connect,
		emit = function(p2, p3) --[[ Line: 54 ]]
			-- upvalues: List (ref), v1 (ref), Count (ref), flush (copy)
			local list = { p2 }
			
			if #List == 0 then
				v1 = p3
			end
			for _, value in list do
				table.insert(List, value)
			end
			if Count == 0 then
				flush()
			end
		end,
		emitMany = function(List1, p4) --[[ Line: 47 ]]
			-- upvalues: List (ref), v1 (ref), Count (ref), flush (copy)
			if #List == 0 then
				v1 = p4
			end
			for _, value in List1 do
				table.insert(List, value)
			end
			if Count == 0 then
				flush()
			end
		end,
		transaction = function(Callback) --[[ Line: 61 ]]
			-- upvalues: Callback1 (copy), List (ref), v1 (ref), Count (ref), Callback2 (copy), Callback3 (copy), flush (copy)
			local CallbackResult = Callback1()
			local Copy = table.clone(List)
			local v2 = v1
			Count += 1
			local Packed = table.pack(pcall(function(): boolean --[[ Line: 66 ]]
				-- upvalues: Callback (copy)
				Callback()
				
				return true
			end))
			Count -= 1
			
			if not Packed[1] then
				Callback2(CallbackResult)
				List = Copy
				v1 = v2
				error(Packed[2], 0)
			end
			if Callback3 ~= nil then
				Callback3(CallbackResult)
			end
			if Count == 0 and #List > 0 then
				flush()
			end
		end
	}
end