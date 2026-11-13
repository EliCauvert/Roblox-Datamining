local ActiveModule = require("../ownership/active")
local DiagnosticsModule = require("../diagnostics")
local OwnerModule = require("../ownership/owner")
local _ = require("../types")

local function _(State)
	-- upvalues: OwnerModule (copy)
	State.references -= 1
	
	if State.references > 0 then return end
	local Lifetime = State.lifetime
	State.lifetime = nil
	State.value = nil
	
	if Lifetime ~= nil then
		OwnerModule.dispose(Lifetime)
	end
end

local function take(State)
	-- upvalues: OwnerModule (copy), ActiveModule (copy)
	if State.lifetime == nil then
		local Owner = OwnerModule.createOwner()
		local Success, Result, Result3 = pcall(ActiveModule.withOwner, Owner, State.factory)
		
		if not Success then
			OwnerModule.dispose(Owner)
			error(Result, 0)
		end
		if Result3 ~= nil then
			OwnerModule.own(Owner, Result3)
		end
		State.value = { value = Result }
		State.lifetime = Owner
	end
	State.references += 1
	
	return assert(State.value).value
end

local function acquireOwned(State, ReleaseHeld)
	-- upvalues: ActiveModule (copy), DiagnosticsModule (copy), take (copy), OwnerModule (copy)
	local CurrentResult = ActiveModule.current()
	
	if CurrentResult == nil then
		return DiagnosticsModule.raise("async/shared-no-owner", "a shared resource was acquired with no owner to release it", {
			contract = "a reference is released when the owner that took it is disposed",
			fix = "acquire it inside a component, inside Compose.withOwner(owner, ...), or use its `detached` form and release it yourself"
		})
	else
		local TakeResult = take(State)
		OwnerModule.holdSubject(CurrentResult, ReleaseHeld, State)
		
		return TakeResult
	end
end

return function(Callback)
	-- upvalues: DiagnosticsModule (copy), OwnerModule (copy), take (copy), acquireOwned (copy)
	if type(Callback) == "function" then
		local State = {
			references = 0,
			value = nil,
			lifetime = nil,
			factory = Callback
		}
		
		local function releaseHeld(_)
			-- upvalues: State (copy), OwnerModule (upval)
			State.references -= 1
			
			if State.references > 0 then return end
			local Lifetime = State.lifetime
			State.lifetime = nil
			State.value = nil
			
			if Lifetime ~= nil then
				OwnerModule.dispose(Lifetime)
			end
		end
		
		return (setmetatable({
			state = State,
			detached = function()
				-- upvalues: take (upval), State (copy), OwnerModule (upval)
				local TakeResult = take(State)
				local Flag = false
				
				return TakeResult, function()
					-- upvalues: Flag (ref), State (upval), OwnerModule (upval)
					if Flag then return end
					Flag = true
					State.references -= 1
					
					if State.references > 0 then return end
					local Lifetime = State.lifetime
					State.lifetime = nil
					State.value = nil
					
					if Lifetime ~= nil then
						OwnerModule.dispose(Lifetime)
					end
				end
			end
		}, {
			__call = function(_)
				-- upvalues: acquireOwned (upval), State (copy), releaseHeld (copy)
				return acquireOwned(State, releaseHeld)
			end
		}))
	else
		return DiagnosticsModule.raise("async/shared-needs-a-factory", "createSharedResource expects a factory function", {
			expected = "function() return value, teardown end",
			actual = DiagnosticsModule.describe(Callback)
		})
	end
end