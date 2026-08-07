local perUserAppStorageModule = require(script:FindFirstAncestor("ExpChat").Utils.perUserAppStorage)

return {
	hasBeenDismissed = function() --[[ line: 16 ]]
		-- upvalues: perUserAppStorageModule (ref)
		return perUserAppStorageModule.getEntry("ExpChatDictationFtux").dismissed == true
	end,
	markDismissed = function() --[[ line: 21 ]]
		-- upvalues: perUserAppStorageModule (ref)
		perUserAppStorageModule.updateEntry("ExpChatDictationFtux", function(p0) --[[ line: 22 ]]
			if p0.dismissed == true then
				return nil
			end
			p0.dismissed = true
			
			return p0
		end)
	end,
	hasBeenUsed = function() --[[ line: 31 ]]
		-- upvalues: perUserAppStorageModule (ref)
		return perUserAppStorageModule.getEntry("ExpChatDictationFtux").used == true
	end,
	markUsed = function() --[[ line: 36 ]]
		-- upvalues: perUserAppStorageModule (ref)
		perUserAppStorageModule.updateEntry("ExpChatDictationFtux", function(p1) --[[ line: 37 ]]
			if p1.used == true then
				return nil
			end
			p1.used = true
			
			return p1
		end)
	end
}