local Parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.PromptStyle)
local GetSduiApiStoreFunction = require(Parent.SduiSharedUtilities).getSduiApiStore

return function(p1, Category) --[[ Line: 27 | Named "usePromptEntries" ]]
	-- upvalues: SignalsReactModule (copy), GetSduiApiStoreFunction (copy), ReactModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetSduiApiStoreFunction().getData(p1).data)
	
	return ReactModule.useMemo(function() --[[ Line: 30 ]]
		-- upvalues: UseSignalStateResult (copy), Category (copy)
		local List = {}
		
		if not UseSignalStateResult then
			return List
		end
		for _, value in UseSignalStateResult do
			local Category1 = value.category
			
			if Category == nil or Category1 == Category then
				table.insert(List, {
					identifier = value.identifier,
					robloxComponentType = value.robloxComponentType,
					title = value.title,
					promptStyle = Category1,
					config = value.config
				})
			end
		end
		return List
	end, { UseSignalStateResult, Category })
end