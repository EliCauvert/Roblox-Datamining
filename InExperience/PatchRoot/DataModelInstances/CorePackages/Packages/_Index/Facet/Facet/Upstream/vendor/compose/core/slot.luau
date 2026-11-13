local _ = require("./types")
local ActiveModule = require("./ownership/active")
local DiagnosticsModule = require("./diagnostics")
local OwnerModule = require("./ownership/owner")

return function(p1)
	-- upvalues: OwnerModule (copy), DiagnosticsModule (copy), ActiveModule (copy)
	if p1 ~= nil and not OwnerModule.isOwner(p1) then
		return DiagnosticsModule.raise("slot/invalid-owner", "a slot can only be bound to an owner", {
			expected = "an owner from Compose.createOwner or Compose.owner.createChild",
			actual = DiagnosticsModule.describe(p1)
		})
	end
	local P0 = p1 or ActiveModule.current()
	
	if P0 == nil then
		return DiagnosticsModule.raise("slot/no-active-owner", "createSlot ran outside an owner", {
			contract = "a slot cannot outlive the owner responsible for what it holds",
			fix = "create it inside a component, Compose.withOwner(owner, ...), or pass an owner"
		})
	else
		local Child = OwnerModule.createChild(P0)
		local v1 = nil
		local v2 = nil
		OwnerModule.own(Child, function()
			-- upvalues: v1 (ref), v2 (ref)
			v1 = nil
			v2 = nil
		end)
		
		return {
			bind = function(p2, Callback)
				-- upvalues: DiagnosticsModule (upval), OwnerModule (upval), Child (copy), v1 (ref), ActiveModule (upval), v2 (ref)
				if p2 == nil or p2 ~= p2 then
					return DiagnosticsModule.raise("slot/invalid-key", "a slot key must be a value other than nil or NaN", {
						expected = "the value the slot holds the attachment for",
						actual = DiagnosticsModule.describe(p2)
					})
				end
				if type(Callback) ~= "function" then
					return DiagnosticsModule.raise("slot/invalid-attach", "a slot needs a function that attaches the new value", {
						expected = "a function receiving the owner for the attachment and a release callback",
						actual = DiagnosticsModule.describe(Callback)
					})
				end
				if OwnerModule.isDisposed(Child) or v1 == p2 then
					return false
				end
				local Child1 = OwnerModule.createChild(Child)
				local Success, Result = pcall(function()
					-- upvalues: ActiveModule (upval), Child1 (copy), Callback (copy), p2 (copy), v1 (upval), v2 (upval), OwnerModule (upval)
					ActiveModule.withOwner(Child1, function()
						-- upvalues: Callback (upval), Child1 (upval), p2 (upval), v1 (upval), v2 (upval), OwnerModule (upval)
						Callback(Child1, function()
							-- upvalues: p2 (upval), v1 (upval), v2 (upval), OwnerModule (upval)
							if p2 ~= nil then
								if v1 ~= p2 then return end
								v1 = nil
								local v3 = v2
								v2 = nil
								
								if v3 ~= nil then
									OwnerModule.dispose(v3)
								end
							end
						end)
					end)
					
					return nil
				end)
				
				if not Success then
					pcall(OwnerModule.dispose, Child1)
					error(Result, 0)
				end
				if OwnerModule.isDisposed(Child) then
					return false
				end
				local v3 = v2
				v1 = p2
				v2 = Child1
				
				if v3 ~= nil then
					OwnerModule.dispose(v3)
				end
				return true
			end,
			release = function(p2): boolean
				-- upvalues: v1 (ref), v2 (ref), OwnerModule (upval)
				if p2 == nil or v1 ~= p2 then
					return false
				end
				v1 = nil
				local v3 = v2
				v2 = nil
				
				if v3 ~= nil then
					OwnerModule.dispose(v3)
				end
				return true
			end,
			current = function()
				-- upvalues: v1 (ref)
				return v1
			end,
			dispose = OwnerModule.disposer(Child)
		}
	end
end