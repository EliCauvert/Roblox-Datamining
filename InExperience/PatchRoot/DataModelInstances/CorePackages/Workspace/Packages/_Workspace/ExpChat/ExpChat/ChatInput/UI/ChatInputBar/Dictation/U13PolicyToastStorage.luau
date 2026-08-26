local perUserAppStorageModule = require(script:FindFirstAncestor("ExpChat").Utils.perUserAppStorage)

return {
	hasBeenShown = function()
		-- upvalues: perUserAppStorageModule (ref)
		return perUserAppStorageModule.getEntry("ExpChatDictationU13PolicyToast").shown == true
	end,
	markShown = function()
		-- upvalues: perUserAppStorageModule (ref)
		perUserAppStorageModule.updateEntry("ExpChatDictationU13PolicyToast", function(p1)
			if p1.shown == true then
				return nil
			end
			p1.shown = true
			
			return p1
		end)
	end
}