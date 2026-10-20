local PerUserAppStorageModule = require(script:FindFirstAncestor("ExpChat").Utils.perUserAppStorage)

return {
	hasBeenDismissed = function(): boolean
		-- upvalues: PerUserAppStorageModule (copy)
		return PerUserAppStorageModule.getEntry("ExpChatDictationFtux").dismissed == true
	end,
	markDismissed = function()
		-- upvalues: PerUserAppStorageModule (copy)
		PerUserAppStorageModule.updateEntry("ExpChatDictationFtux", function(p1)
			if p1.dismissed == true then
				return nil
			else
				p1.dismissed = true
				
				return p1
			end
		end)
	end,
	hasBeenUsed = function(): boolean
		-- upvalues: PerUserAppStorageModule (copy)
		return PerUserAppStorageModule.getEntry("ExpChatDictationFtux").used == true
	end,
	markUsed = function()
		-- upvalues: PerUserAppStorageModule (copy)
		PerUserAppStorageModule.updateEntry("ExpChatDictationFtux", function(p1)
			if p1.used == true then
				return nil
			else
				p1.used = true
				
				return p1
			end
		end)
	end
}