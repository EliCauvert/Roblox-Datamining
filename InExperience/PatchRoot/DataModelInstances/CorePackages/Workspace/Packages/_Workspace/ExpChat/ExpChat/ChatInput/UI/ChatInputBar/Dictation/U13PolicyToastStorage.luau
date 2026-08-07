local perUserAppStorageModule = require(script:FindFirstAncestor("ExpChat").Utils.perUserAppStorage)

return {
	hasBeenShown = function() --[[ line: 11 ]]
		-- upvalues: perUserAppStorageModule (ref)
		return perUserAppStorageModule.getEntry("ExpChatDictationU13PolicyToast").shown == true
	end,
	markShown = function() --[[ line: 16 ]]
		-- upvalues: perUserAppStorageModule (ref)
		perUserAppStorageModule.updateEntry("ExpChatDictationU13PolicyToast", function(p0) --[[ line: 17 ]]
			if p0.shown == true then
				return nil
			end
			p0.shown = true
			
			return p0
		end)
	end
}