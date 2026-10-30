local function _(p1: number): number?
	if p1 == nil then
		return 256
	elseif p1 == 1e999 then
		return nil
	else
		assert(type(p1) == "number" and (p1 >= 0 and p1 < 1e999) and p1 % 1 == 0, "Layout.measured: detachedMeasurementCapacity must be zero, a positive integer, or math.huge")
		
		return p1
	end
end

return {
	new = function(p1: number)
		local v1 = nil
		if p1 == nil then
			v1 = 256
		elseif p1 == 1e999 then
			v1 = nil
		else
			assert(type(p1) == "number" and (p1 >= 0 and p1 < 1e999) and p1 % 1 == 0, "Layout.measured: detachedMeasurementCapacity must be zero, a positive integer, or math.huge")
			v1 = p1
		end
		local t = {}
		local Next = nil
		local Previous = nil
		local Count = 0
		
		local function _(p2)
			-- upvalues: Next (ref), Previous (ref)
			if p2.previous == nil then
				Next = p2.next
			else
				p2.previous.next = p2.next
			end
			if p2.next == nil then
				Previous = p2.previous
			else
				p2.next.previous = p2.previous
			end
			p2.previous = nil
			p2.next = nil
		end
		
		local _ = function(p2)
			-- upvalues: Previous (ref), Next (ref)
			p2.previous = Previous
			
			if Previous == nil then
				Next = p2
			else
				Previous.next = p2
			end
			Previous = p2
		end
		
		return {
			put = function(Key, Value)
				-- upvalues: v1 (copy), t (copy), Next (ref), Previous (ref), Count (ref)
				if v1 == 0 then return end
				local Entry = t[Key]
				
				if Entry == nil then
					local config = { previous = nil, next = nil, key = Key, value = Value }
					t[Key] = config
					config.previous = Previous
					
					if Previous == nil then
						Next = config
					else
						Previous.next = config
					end
					Previous = config
					Count += 1
					
					if v1 ~= nil and v1 < Count then
						local Next1 = Next
						
						if Next1.previous == nil then
							Next = Next1.next
						else
							Next1.previous.next = Next1.next
						end
						if Next1.next == nil then
							Previous = Next1.previous
						else
							Next1.next.previous = Next1.previous
						end
						Next1.previous = nil
						Next1.next = nil
						t[Next1.key] = nil
						Count -= 1
					end
					return
				else
					Entry.value = Value
					
					if Entry.previous == nil then
						Next = Entry.next
					else
						Entry.previous.next = Entry.next
					end
					if Entry.next == nil then
						Previous = Entry.previous
					else
						Entry.next.previous = Entry.previous
					end
					Entry.previous = nil
					Entry.next = nil
					Entry.previous = Previous
					
					if Previous == nil then
						Next = Entry
					else
						Previous.next = Entry
					end
					Previous = Entry
				end
			end,
			take = function(Key)
				-- upvalues: t (copy), Next (ref), Previous (ref), Count (ref)
				local Entry = t[Key]
				
				if Entry == nil then
					return nil
				end
				if Entry.previous == nil then
					Next = Entry.next
				else
					Entry.previous.next = Entry.next
				end
				if Entry.next == nil then
					Previous = Entry.previous
				else
					Entry.next.previous = Entry.previous
				end
				Entry.previous = nil
				Entry.next = nil
				t[Key] = nil
				Count -= 1
				
				return Entry.value
			end
		}
	end
}