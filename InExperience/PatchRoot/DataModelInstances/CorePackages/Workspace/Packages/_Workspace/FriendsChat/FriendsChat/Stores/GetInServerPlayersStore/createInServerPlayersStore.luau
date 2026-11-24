local SignalsModule = require(script:FindFirstAncestor("FriendsChat").Parent.Signals)

return function(p1)
	-- upvalues: SignalsModule (copy)
	local function _(LocalUserId): boolean
		-- upvalues: p1 (copy)
		return LocalUserId == p1.getLocalUserId()
	end
	
	local List = {}
	local t = {}
	
	for _, value in p1.getPlayerUserIds() do
		if value ~= p1.getLocalUserId() then
			table.insert(List, (tostring(value)))
			
			if p1.isBlocked(value) then
				t[tostring(value)] = true
			end
		end
	end
	local Signal, Signal2 = SignalsModule.createSignal(List)
	local Signal1, Signal2_1 = SignalsModule.createSignal(t)
	local Tbl = {
		p1.onPlayerAdded(function(LocalUserId)
			-- upvalues: p1 (copy), Signal2_1 (copy), Signal2 (copy)
			if LocalUserId ~= p1.getLocalUserId() then
				local IsBlocked = p1.isBlocked(LocalUserId)
				local Text = tostring(LocalUserId)
				Signal2_1(function(Tbl)
					-- upvalues: Text (copy), IsBlocked (copy)
					if Tbl[Text] == true == IsBlocked then
						return Tbl
					end
					local Copy = table.clone(Tbl)
					
					if IsBlocked then
						Copy[Text] = true
						
						return Copy
					else
						Copy[Text] = nil
						
						return Copy
					end
				end)
				local Text1 = tostring(LocalUserId)
				Signal2(function(List)
					-- upvalues: Text1 (copy)
					if table.find(List, Text1) == nil then
						local Copy = table.clone(List)
						table.insert(Copy, Text1)
						
						return Copy
					else
						return List
					end
				end)
				
				return
			end
		end),
		p1.onPlayerRemoving(function(p2)
			-- upvalues: Signal2 (copy)
			local Text = tostring(p2)
			Signal2(function(List)
				-- upvalues: Text (copy)
				local FoundIndex: number? = table.find(List, Text)
				
				if FoundIndex == nil then
					return List
				else
					local Copy = table.clone(List)
					table.remove(Copy, FoundIndex)
					
					return Copy
				end
			end)
		end),
		p1.onBlockedStatusChanged(function(p2, p3)
			-- upvalues: Signal2_1 (copy)
			local Text = tostring(p2)
			Signal2_1(function(Tbl)
				-- upvalues: Text (copy), p3 (copy)
				if Tbl[Text] == true == p3 then
					return Tbl
				end
				local Copy = table.clone(Tbl)
				
				if p3 then
					Copy[Text] = true
					
					return Copy
				else
					Copy[Text] = nil
					
					return Copy
				end
			end)
		end)
	}
	
	return {
		getUserIds = SignalsModule.createComputed(function(p2)
			-- upvalues: Signal1 (copy), Signal (copy)
			local SignalResult = Signal1(p2)
			local List = {}
			
			for _, value in Signal(p2) do
				if not SignalResult[value] then
					table.insert(List, value)
				end
			end
			return List
		end),
		dispose = function()
			-- upvalues: Tbl (copy)
			for _, value in Tbl do
				value()
			end
			table.clear(Tbl)
		end
	}
end