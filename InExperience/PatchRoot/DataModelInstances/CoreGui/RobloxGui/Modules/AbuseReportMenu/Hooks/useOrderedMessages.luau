local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local reactModule = require(corePackagesService.Packages.React)
local useExpChatMessagesReducerSlice = require(corePackagesService.Workspace.Packages.ExpChat).Hooks.useExpChatMessagesReducerSlice

return function() --[[ line: 9 ]]
	-- upvalues: useExpChatMessagesReducerSlice (ref), reactModule (ref), cryoModule (ref)
	local var3 = useExpChatMessagesReducerSlice()
	
	if var3 then
		local byMessageId = var3.byMessageId
		local windowMessagesInOrder = var3.windowMessagesInOrder
		
		return reactModule.useMemo(function() --[[ line: 19 ]]
			-- upvalues: cryoModule (copy), windowMessagesInOrder (ref), byMessageId (ref)
			return cryoModule.List.map(windowMessagesInOrder, function(p0) --[[ line: 20 ]]
				-- upvalues: byMessageId (copy)
				return byMessageId[p0]
			end)
		end, { byMessageId, windowMessagesInOrder })
	end
	return {}
end