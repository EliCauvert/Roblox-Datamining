return {
	new = function()
		local t = {}
		local v1 = nil
		local Tbl = {}
		
		return {
			busy = function(): boolean
				-- upvalues: t (copy), v1 (ref)
				return next(t) ~= nil or v1 ~= nil
			end,
			begin = function(Key, Owner, Origin, Tbl): boolean
				-- upvalues: t (copy)
				local Entry = t[Key]
				
				if Entry and (Entry.owner == Owner or Entry.kind ~= "pending" or not Owner:IsDescendantOf(Entry.owner)) then
					return Entry.owner == Owner
				else
					local Threshold = Tbl.threshold or 6
					assert(Threshold > 0 and Threshold < 1e999, "Facet gesture threshold must be finite and positive")
					t[Key] = {
						kind = "pending",
						owner = Owner,
						origin = Origin,
						options = table.clone(Tbl)
					}
					
					return true
				end
			end,
			move = function(p1, p2)
				-- upvalues: t (copy)
				local Entry = t[p1]
				
				if not Entry then
					return nil
				elseif Entry.kind ~= "pending" then
					return Entry.kind
				else
					local Vector = p2 - Entry.origin
					local Options = Entry.options
					
					if Vector.Magnitude < (Options.threshold or 6) then
						return "pending"
					else
						local IsNotY: boolean = if Options.axis == "X" then math.abs(Vector.Y) <= math.abs(Vector.X) and (Options.axis ~= "Y" or math.abs(Vector.Y) >= math.abs(Vector.X)) else Options.axis ~= "Y" or math.abs(Vector.Y) >= math.abs(Vector.X)
						Entry.kind = if Options.pickup == "immediate" and IsNotY then "drag" elseif Options.scroll then "scroll" else "pan"
						
						return Entry.kind
					end
				end
			end,
			claim = function(p1, Owner, Kind): boolean
				-- upvalues: t (copy)
				local Entry = t[p1]
				
				if not Entry or Entry.owner ~= Owner then
					return false
				elseif Entry.kind ~= "pending" then
					return Entry.kind == Kind
				elseif Kind == "drag" and Entry.options.pickup == nil then
					return false
				elseif Kind == "pan" or Kind == "scroll" then
					return false
				else
					Entry.kind = Kind
					
					return true
				end
			end,
			get = function(p1)
				-- upvalues: t (copy)
				local Entry = t[p1]
				
				return if Entry then {
					owner = Entry.owner,
					origin = Entry.origin,
					kind = Entry.kind
				} else nil
			end,
			finish = function(Key, Owner, p1)
				-- upvalues: t (copy)
				local Entry = t[Key]
				
				if Entry and Entry.owner == Owner then
					t[Key] = nil
					
					return if p1 then "cancelled" elseif Entry.kind == "pending" then "press" else Entry.kind
				else
					return nil
				end
			end,
			capture = function(p1, Callback)
				-- upvalues: v1 (ref), Tbl (copy)
				assert(v1 == nil, "Facet capture callbacks cannot start another capture")
				v1 = p1
				table.clear(Tbl)
				local Success, Result = pcall(function()
					-- upvalues: Callback (copy)
					Callback()
					
					return nil
				end)
				v1 = nil
				table.clear(Tbl)
				
				if not Success then
					error(Result, 0)
				end
			end,
			claimCamera = function(Key): boolean
				-- upvalues: v1 (ref), Tbl (copy)
				if v1 and not Tbl[Key] then
					Tbl[Key] = true
					
					return true
				else
					return false
				end
			end,
			cancelOwner = function(Owner)
				-- upvalues: t (copy)
				for i, value in t do
					if value.owner == Owner then
						t[i] = nil
					end
				end
			end
		}
	end
}