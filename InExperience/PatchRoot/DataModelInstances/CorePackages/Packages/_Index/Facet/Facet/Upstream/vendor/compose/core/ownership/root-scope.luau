local ActiveModule = require("./active")
local DiagnosticsModule = require("../diagnostics")
local OwnerModule = require("./owner")
local _ = require("../reactive/reactor")
local _ = require("../types")
local _ = require("../reactive/types")

local function requireBody(Callback, p1)
	-- upvalues: DiagnosticsModule (copy)
	if type(Callback) == "function" then return end
	return DiagnosticsModule.raise("owner/root-body-not-a-function", ("%s expects a function to run in the root scope"):format(p1), {
		expected = "a function taking the root owner",
		contract = "a root scope exists to give one body an owner; there is nothing else to run",
		actual = DiagnosticsModule.describe(Callback)
	})
end

local function _(p1, p2)
	-- upvalues: OwnerModule (copy)
	local Success, Result = pcall(OwnerModule.dispose, p1)
	
	if Success then
		error(p2, 0)
	end
	error(("%s\nCompose: the root scope also raised while unwinding it:\n%s"):format(tostring(p2), (tostring(Result))), 0)
end

local function settle(Owner, Success, ...)
	-- upvalues: OwnerModule (copy)
	if not Success then
		local Selected = select(1, ...)
		local Success1, Result = pcall(OwnerModule.dispose, Owner)
		
		if Success1 then
			error(Selected, 0)
		end
		error(("%s\nCompose: the root scope also raised while unwinding it:\n%s"):format(tostring(Selected), (tostring(Result))), 0)
	end
	OwnerModule.dispose(Owner)
	
	return ...
end

return {
	withRootOwner = function(Callback, p1)
		-- upvalues: requireBody (copy), OwnerModule (copy), settle (copy), ActiveModule (copy)
		requireBody(Callback, "withRootOwner")
		local Owner = OwnerModule.createOwner(p1)
		
		return settle(Owner, pcall(ActiveModule.withOwner, Owner, function()
			-- upvalues: Callback (copy), Owner (copy)
			return Callback(Owner)
		end))
	end,
	createRootOwner = function(p1, p2)
		-- upvalues: requireBody (copy), OwnerModule (copy), ActiveModule (copy)
		requireBody(p1, "createRootOwner")
		local Owner = OwnerModule.createOwner(p2)
		local Success, Result = pcall(ActiveModule.runWith, Owner, p1, Owner)
		
		if not Success then
			local Success1, Result1 = pcall(OwnerModule.dispose, Owner)
			
			if Success1 then
				error(Result, 0)
			end
			error(("%s\nCompose: the root scope also raised while unwinding it:\n%s"):format(tostring(Result), (tostring(Result1))), 0)
		end
		return { owner = Owner, dispose = OwnerModule.disposer(Owner) }
	end
}