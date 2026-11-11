local function _(Tbl, Key, p1)
	local Copy = table.clone(Tbl)
	Copy[Key] = p1
	
	return Copy
end

local _ = function(List, p1)
	local t = {}
	
	for i, value in pairs(List) do
		if i ~= p1 then
			t[i] = value
		end
	end
	return t
end

return function()
	local Tbl = {}
	
	return {
		subscribe = function(_, Callback)
			-- upvalues: Tbl (ref)
			assert(typeof(Callback) == "function", "Can only subscribe to signals with a function.")
			local config = { disconnected = false, callback = Callback }
			local Copy = table.clone(Tbl)
			Copy[Callback] = config
			Tbl = Copy
			
			return function()
				-- upvalues: config (copy), Tbl (upval), Callback (copy)
				assert(not config.disconnected, "Listeners can only be disconnected once.")
				config.disconnected = true
				local t = {}
				
				for i, value in pairs(Tbl) do
					if i ~= Callback then
						t[i] = value
					end
				end
				Tbl = t
			end
		end,
		fire = function(_, ...)
			-- upvalues: Tbl (ref)
			for i, value in pairs(Tbl) do
				if not value.disconnected then
					i(...)
				end
			end
		end
	}
end