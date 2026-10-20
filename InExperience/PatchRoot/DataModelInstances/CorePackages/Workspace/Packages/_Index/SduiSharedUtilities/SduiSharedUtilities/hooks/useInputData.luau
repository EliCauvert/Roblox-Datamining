local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetSduiApiStoreModule = require(SduiSharedUtilities.getSduiApiStore)

return function(p1, p2)
	-- upvalues: ReactModule (copy), GetSduiApiStoreModule (copy), SignalsReactModule (copy)
	return SignalsReactModule.useSignalState((ReactModule.useCallback(function(p3)
		-- upvalues: GetSduiApiStoreModule (upval), p1 (copy), p2 (copy)
		local SduiApiStoreModule = GetSduiApiStoreModule()
		SduiApiStoreModule.getData(p1).status(p3)
		local GetInputDataFunction = SduiApiStoreModule.getInputData
		
		if not GetInputDataFunction then
			return nil
		end
		if p2 then
			local InputData = GetInputDataFunction(p1, p2, p3)
			
			if InputData ~= nil then
				return InputData
			end
		end
		return GetInputDataFunction(p1, nil, p3)
	end, { p1, p2 })))
end