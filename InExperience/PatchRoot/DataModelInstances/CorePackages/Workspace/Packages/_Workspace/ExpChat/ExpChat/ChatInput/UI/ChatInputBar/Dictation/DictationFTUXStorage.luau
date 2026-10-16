local PerUserAppStorageModule = require(script:FindFirstAncestor("ExpChat").Utils.perUserAppStorage)

return {
	hasBeenDismissed = function(): boolean --[[ Line: 16 ]]
		-- upvalues: PerUserAppStorageModule (copy)
		return PerUserAppStorageModule.getEntry("ExpChatDictationFtux").dismissed == true
	end,
	markDismissed = function() --[[ Line: 21 ]]
		-- upvalues: PerUserAppStorageModule (copy)
		PerUserAppStorageModule.updateEntry("ExpChatDictationFtux", function(p1) --[[ Line: 22 ]]
			if p1.dismissed == true then
				return nil
			else
				p1.dismissed = true
				
				return p1
			end
		end)
	end,
	hasBeenUsed = function(): boolean --[[ Line: 31 ]]
		-- upvalues: PerUserAppStorageModule (copy)
		return PerUserAppStorageModule.getEntry("ExpChatDictationFtux").used == true
	end,
	markUsed = function() --[[ Line: 36 ]]
		-- upvalues: PerUserAppStorageModule (copy)
		PerUserAppStorageModule.updateEntry("ExpChatDictationFtux", function(p1) --[[ Line: 37 ]]
			if p1.used == true then
				return nil
			else
				p1.used = true
				
				return p1
			end
		end)
	end
}