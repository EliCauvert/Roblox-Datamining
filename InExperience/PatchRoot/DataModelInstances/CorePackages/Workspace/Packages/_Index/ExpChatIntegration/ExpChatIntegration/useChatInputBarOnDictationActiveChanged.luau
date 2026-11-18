local ReactModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.React)
local UseChatPlatformModule = require(script.Parent.useChatPlatform)

return function()
	-- upvalues: UseChatPlatformModule (copy), ReactModule (copy)
	local GetTransparencyStoreFunction = UseChatPlatformModule().getTransparencyStore
	
	return ReactModule.useCallback(function(p1)
		-- upvalues: GetTransparencyStoreFunction (copy)
		local TransparencyStore = GetTransparencyStoreFunction(false)
		
		if p1 then
			TransparencyStore.setDictationActive()
			
			return
		else
			TransparencyStore.clearDictationActive()
		end
	end, { GetTransparencyStoreFunction })
end