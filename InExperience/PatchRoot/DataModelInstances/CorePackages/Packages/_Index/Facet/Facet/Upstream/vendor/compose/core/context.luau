local ActiveModule = require("./ownership/active")
local OwnerModule = require("./ownership/owner")

return function(p1)
	-- upvalues: ActiveModule (copy), OwnerModule (copy)
	local t = {}
	setmetatable(t, { __mode = "ks" })
	
	local function finish(Owner, Success, ...)
		-- upvalues: OwnerModule (upval)
		if not Success then
			pcall(OwnerModule.dispose, Owner)
			error(select(1, ...), 0)
		end
		return ...
	end
	
	return {
		provide = function(Value, p2)
			-- upvalues: ActiveModule (upval), OwnerModule (upval), t (copy), finish (copy)
			local CurrentResult = ActiveModule.current()
			local Owner = if CurrentResult == nil then OwnerModule.createOwner() else OwnerModule.createChild(CurrentResult)
			
			if not OwnerModule.isDisposed(Owner) then
				t[Owner] = { value = Value }
				OwnerModule.own(Owner, function()
					-- upvalues: t (upval), Owner (copy)
					t[Owner] = nil
				end)
			end
			return finish(Owner, pcall(ActiveModule.withOwner, Owner, p2))
		end,
		read = function()
			-- upvalues: ActiveModule (upval), OwnerModule (upval), p1 (copy), t (copy)
			local NearestResult = ActiveModule.nearest()
			local Entry = nil
			while NearestResult ~= nil do
				if OwnerModule.isDisposed(NearestResult) then
					return p1
				end
				Entry = t[NearestResult]
				
				if Entry ~= nil then
					return Entry.value
				end
				NearestResult = NearestResult.parent
			end
			return p1
		end
	}
end