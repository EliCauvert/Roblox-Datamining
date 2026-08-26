local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)

return function(p1, p2)
	-- upvalues: reactModule (ref), getSduiApiStoreModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p3)
		-- upvalues: getSduiApiStoreModule (copy), p1 (ref), p2 (ref)
		local var1 = getSduiApiStoreModule()
		var1.getData(p1).status(p3)
		local getInputData = var1.getInputData
		
		if not getInputData then
			return nil
		elseif p2 then
			local var2 = getInputData(p1, p2, p3)
			
			return if var2 == nil then getInputData(p1, nil, p3) else var2
		end
	end, { p1, p2 }))
end