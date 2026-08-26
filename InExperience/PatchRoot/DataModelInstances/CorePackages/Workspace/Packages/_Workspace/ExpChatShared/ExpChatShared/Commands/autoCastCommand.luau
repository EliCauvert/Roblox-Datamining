local expChatShared = script:FindFirstAncestor("ExpChatShared")
local promiseModule = require(expChatShared.Parent.Promise)
local contextModule = require(expChatShared.context)
local _ = require(script:FindFirstAncestor("Commands").types)

local function matchesAlias(p1, p2)
	for i, v in pairs(p1) do
		if string.find(p2, "^" .. v .. " ") then
			return true
		end
	end
	return false
end

return function(p3, p4, p5)
	-- upvalues: promiseModule (ref), contextModule (ref), matchesAlias (ref)
	return promiseModule.try(function()
		-- upvalues: contextModule (copy), p3 (ref), matchesAlias (copy), p5 (ref), p4 (ref), promiseModule (copy)
		assert(contextModule.store, "Store should exist")
		
		if matchesAlias(contextModule.store:getState().AutoCastCommands[p3.name], p5) then
			local var1 = p3.clientRun(contextModule.store, p4, p5)
			
			return if var1 and string.find(var1.metadata, "Success") then promiseModule.resolve(var1) else promiseModule.reject()
		end
	end)
end