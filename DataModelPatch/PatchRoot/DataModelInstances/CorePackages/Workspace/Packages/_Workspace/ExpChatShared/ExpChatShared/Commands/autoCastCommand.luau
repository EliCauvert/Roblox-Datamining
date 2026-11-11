local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local PromiseModule = require(ExpChatShared.Parent.Promise)
local ContextModule = require(ExpChatShared.context)
local _ = require(script:FindFirstAncestor("Commands").types)

local function matchesAlias(AutoCastCommand, Text: string): boolean
	for _, value in pairs(AutoCastCommand) do
		if string.find(Text, "^" .. value .. " ") then
			return true
		end
	end
	return false
end

return function(p1, p2, p3)
	-- upvalues: PromiseModule (copy), ContextModule (copy), matchesAlias (copy)
	return PromiseModule.try(function()
		-- upvalues: ContextModule (upval), p1 (copy), matchesAlias (upval), p3 (copy), p2 (copy), PromiseModule (upval)
		assert(ContextModule.store, "Store should exist")
		
		if matchesAlias(ContextModule.store:getState().AutoCastCommands[p1.name], p3) then
			local ClientRunResult = p1.clientRun(ContextModule.store, p2, p3)
			
			if ClientRunResult and string.find(ClientRunResult.metadata, "Success") then
				return PromiseModule.resolve(ClientRunResult)
			end
		end
		return PromiseModule.reject()
	end)
end