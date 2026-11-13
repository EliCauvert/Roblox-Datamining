local _ = require("../vendor/compose/core")
local _ = require("./collection_types")

return function(p1, p2, p3, Callback)
	if p3 then
		local v1 = assert(p1.currentOwner())
		local t = {}
		local Keys = {}
		local t1 = {}
		local t2 = {}
		local v2 = nil
		local v3 = false
		local Flag = false
		
		local function _(p4): string
			-- upvalues: t2 (ref), v3 (ref)
			return if t2[p4] then if v3 then "selected" else "only" else "none"
		end
		
		local function paint(Key, p4)
			-- upvalues: t1 (copy), Callback (copy)
			local Entry = t1[Key]
			
			if Entry ~= p4 then
				t1[Key] = p4
				Callback(Key, p4, Entry)
			end
		end
		
		local function notify(p4, p5, p6)
			-- upvalues: t (copy), paint (copy)
			local Entry = t[p4]
			
			if Entry then
				for i in Entry do
					local Success, Result = pcall(paint, i, p5)
					
					if not Success then
						local List = p6 or {}
						table.insert(List, (tostring(Result)))
						p6 = List
					end
				end
			end
			return p6
		end
		
		local _ = function(Key)
			-- upvalues: Keys (copy), t (copy)
			local Key1 = Keys[Key]
			
			if Key1 == nil then return end
			local Entry = t[Key1]
			
			if Entry then
				Entry[Key] = nil
				
				if next(Entry) == nil then
					t[Key1] = nil
				end
			end
		end
		
		local _ = function()
			-- upvalues: Flag (ref), p1 (copy), v1 (copy), p2 (copy), v2 (ref), v3 (ref), t2 (ref), t (copy), notify (copy)
			Flag = true
			p1.owner.watchStatic(v1, p2, function(List1)
				-- upvalues: v2 (upval), v3 (upval), t2 (upval), t (upval), notify (upval)
				local v4 = nil
				local Flag = false
				
				for i, value in List1 do
					if value then
						if v4 == nil then
							v4 = i
						else
							Flag = true
							break
						end
					end
				end
				local v5 = v2
				local v6: boolean = v3
				t2 = List1
				v2 = v4
				v3 = Flag
				local List = nil
				
				if v6 or Flag then
					for i1 in t do
						List = notify(i1, if t2[i1] then if v3 then "selected" else "only" else "none", List)
					end
				else
					if v5 ~= nil then
						List = notify(v5, if t2[v5] then if v3 then "selected" else "only" else "none", List)
					end
					if v4 ~= nil and not rawequal(v4, v5) then
						List = notify(v4, if t2[v4] then if v3 then "selected" else "only" else "none", List)
					end
				end
				if List then
					error(table.concat(List, "\n"), 0)
				end
			end)
		end
		
		local function move(Key, Key1)
			-- upvalues: Keys (copy), t (copy), t2 (ref), v3 (ref), t1 (copy), Callback (copy)
			local Key2 = Keys[Key]
			
			if Key2 ~= nil then
				local Entry = t[Key2]
				
				if Entry then
					Entry[Key] = nil
					
					if next(Entry) == nil then
						t[Key2] = nil
					end
				end
			end
			Keys[Key] = Key1
			local Entry1 = t[Key1]
			
			if Entry1 == nil then
				Entry1 = {}
				t[Key1] = Entry1
			end
			Entry1[Key] = true
			local Selected: string = if t2[Key1] then if v3 then "selected" else "only" else "none"
			local Entry = t1[Key]
			
			if Entry ~= Selected then
				t1[Key] = Selected
				Callback(Key, Selected, Entry)
			end
		end
		
		return {
			track = function(Key, p7)
				-- upvalues: Flag (ref), p1 (copy), v1 (copy), p2 (copy), v2 (ref), v3 (ref), t2 (ref), t (copy), notify (copy), move (copy)
				if not Flag then
					Flag = true
					p1.owner.watchStatic(v1, p2, function(List1)
						-- upvalues: v2 (upval), v3 (upval), t2 (upval), t (upval), notify (upval)
						local v7 = nil
						local Flag = false
						
						for i, value in List1 do
							if value then
								if v7 == nil then
									v7 = i
								else
									Flag = true
									break
								end
							end
						end
						local v8 = v2
						local v9: boolean = v3
						t2 = List1
						v2 = v7
						v3 = Flag
						local List = nil
						
						if v9 or Flag then
							for i1 in t do
								List = notify(i1, if t2[i1] then if v3 then "selected" else "only" else "none", List)
							end
						else
							if v8 ~= nil then
								List = notify(v8, if t2[v8] then if v3 then "selected" else "only" else "none", List)
							end
							if v7 ~= nil and not rawequal(v7, v8) then
								List = notify(v7, if t2[v7] then if v3 then "selected" else "only" else "none", List)
							end
						end
						if List then
							error(table.concat(List, "\n"), 0)
						end
					end)
				end
				move(Key, p7)
			end,
			move = function(Key, p8)
				-- upvalues: Keys (copy), move (copy)
				if Keys[Key] ~= nil then
					move(Key, p8)
				end
			end,
			forget = function(Key)
				-- upvalues: Keys (copy), t (copy), t1 (copy)
				local Key1 = Keys[Key]
				
				if Key1 ~= nil then
					local Entry = t[Key1]
					
					if Entry then
						Entry[Key] = nil
						
						if next(Entry) == nil then
							t[Key1] = nil
						end
					end
				end
				Keys[Key] = nil
				t1[Key] = nil
			end,
			bind = function(p8, Key)
				-- upvalues: Flag (ref), p1 (copy), v1 (copy), p2 (copy), v2 (ref), v3 (ref), t2 (ref), t (copy), notify (copy), move (copy), Keys (copy), t1 (copy)
				if not Flag then
					Flag = true
					p1.owner.watchStatic(v1, p2, function(List1)
						-- upvalues: v2 (upval), v3 (upval), t2 (upval), t (upval), notify (upval)
						local v7 = nil
						local Flag = false
						
						for i, value in List1 do
							if value then
								if v7 == nil then
									v7 = i
								else
									Flag = true
									break
								end
							end
						end
						local v8 = v2
						local v9: boolean = v3
						t2 = List1
						v2 = v7
						v3 = Flag
						local List = nil
						
						if v9 or Flag then
							for i1 in t do
								List = notify(i1, if t2[i1] then if v3 then "selected" else "only" else "none", List)
							end
						else
							if v8 ~= nil then
								List = notify(v8, if t2[v8] then if v3 then "selected" else "only" else "none", List)
							end
							if v7 ~= nil and not rawequal(v7, v8) then
								List = notify(v7, if t2[v7] then if v3 then "selected" else "only" else "none", List)
							end
						end
						if List then
							error(table.concat(List, "\n"), 0)
						end
					end)
				end
				p1.owner.watchStatic(assert(p1.currentOwner()), p8, function(p9)
					-- upvalues: move (upval), Key (copy)
					move(Key, p9)
				end)
				p1.cleanup(function()
					-- upvalues: Key (copy), Keys (upval), t (upval), t1 (upval)
					local Key1 = Keys[Key]
					
					if Key1 ~= nil then
						local Entry = t[Key1]
						
						if Entry then
							Entry[Key] = nil
							
							if next(Entry) == nil then
								t[Key1] = nil
							end
						end
					end
					Keys[Key] = nil
					t1[Key] = nil
				end)
			end
		}
	else
		local function ignore() end
		
		return {
			track = function(p9, _)
				-- upvalues: Callback (copy)
				Callback(p9, "none", nil)
			end,
			move = ignore,
			forget = ignore,
			bind = function(p9, p10)
				-- upvalues: Callback (copy)
				local _ = p9:peek()
				Callback(p10, "none", nil)
			end
		}
	end
end