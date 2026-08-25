local perUserAppStorageModule = require(script:FindFirstAncestor("ExpChat").Utils.perUserAppStorage)

return {
	hasBeenDismissed = function()
		-- upvalues: perUserAppStorageModule (ref)
		return perUserAppStorageModule.getEntry("ExpChatDictationFtux").dismissed == true
	end,
	markDismissed = function()
		-- upvalues: perUserAppStorageModule (ref)
		perUserAppStorageModule.updateEntry("ExpChatDictationFtux", function(p0)
			if p0.dismissed == true then
				return nil
			end
			p0.dismissed = true
			
			return p0
		end)
	end,
	hasBeenUsed = function()
		-- upvalues: perUserAppStorageModule (ref)
		return perUserAppStorageModule.getEntry("ExpChatDictationFtux").used == true
	end,
	markUsed = function()
		-- upvalues: perUserAppStorageModule (ref)
		perUserAppStorageModule.updateEntry("ExpChatDictationFtux", function(p1)
			if p1.used == true then
				return nil
			end
			p1.used = true
			
			return p1
		end)
	end
}