local PerUserAppStorageModule = require(script:FindFirstAncestor("ExpChat").Utils.perUserAppStorage)

return {
	hasBeenShown = function(): boolean
		-- upvalues: PerUserAppStorageModule (copy)
		return PerUserAppStorageModule.getEntry("ExpChatDictationU13PolicyToast").shown == true
	end,
	markShown = function()
		-- upvalues: PerUserAppStorageModule (copy)
		PerUserAppStorageModule.updateEntry("ExpChatDictationU13PolicyToast", function(p1)
			if p1.shown == true then
				return nil
			else
				p1.shown = true
				
				return p1
			end
		end)
	end
}