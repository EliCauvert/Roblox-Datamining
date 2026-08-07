local expChatShared = script:FindFirstAncestor("ExpChatShared")
local promiseModule = require(expChatShared.Parent.Promise)
local contextModule = require(expChatShared.context)
local _ = require(script:FindFirstAncestor("Commands").types)

local function matchesAlias(p0, p1) --[[ line: 10 ]]
	for i, v in pairs(p0) do
		if string.find(p1, "^" .. v .. " ") then
			return true
		end
	end
	return false
end

return function(p2, p3, p4) --[[ line: 20 ]]
	-- upvalues: promiseModule (ref), contextModule (ref), matchesAlias (ref)
	return promiseModule.try(function() --[[ line: 21 ]]
		-- upvalues: contextModule (copy), p2 (ref), matchesAlias (copy), p4 (ref), p3 (ref), promiseModule (copy)
		assert(contextModule.store, "Store should exist")
		
		if matchesAlias(contextModule.store:getState().AutoCastCommands[p2.name], p4) then
			local var4 = p2.clientRun(contextModule.store, p3, p4)
			
			return if var4 and string.find(var4.metadata, "Success") then promiseModule.resolve(var4) else promiseModule.reject()
		end
	end)
end