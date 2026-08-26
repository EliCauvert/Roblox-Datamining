local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.PromptStyle)
local getSduiApiStore = require(parent.SduiSharedUtilities).getSduiApiStore

return function(p1, p2)
	-- upvalues: signalsReactModule (ref), getSduiApiStore (ref), reactModule (ref)
	local var1 = signalsReactModule.useSignalState(getSduiApiStore().getData(p1).data)
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), p2 (ref)
		local t = {}
		
		if not var1 then
			return t
		end
		for i, v in var1 do
			local category = v.category
			
			if p2 == nil or category == p2 then
				table.insert(t, {
					identifier = v.identifier,
					robloxComponentType = v.robloxComponentType,
					title = v.title,
					promptStyle = category,
					config = v.config
				})
			end
		end
		return t
	end, { var1, p2 })
end