local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getSduiApiStoreModule = require(sduiSharedUtilities.getSduiApiStore)

return function(p0, p1) --[[ line: 9 | named "useInputData" ]]
	-- upvalues: reactModule (ref), getSduiApiStoreModule (ref), signalsReactModule (ref)
	return signalsReactModule.useSignalState(reactModule.useCallback(function(p2) --[[ line: 10 ]]
		-- upvalues: getSduiApiStoreModule (copy), p0 (ref), p1 (ref)
		local var4 = getSduiApiStoreModule()
		var4.getData(p0).status(p2)
		local getInputData = var4.getInputData
		
		if not getInputData then
			return nil
		elseif p1 then
			local var5 = getInputData(p0, p1, p2)
			
			return if var5 == nil then getInputData(p0, nil, p2) else var5
		end
	end, { p0, p1 }))
end