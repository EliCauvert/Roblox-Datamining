local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.PromptStyle)
local getSduiApiStore = require(parent.SduiSharedUtilities).getSduiApiStore

return function(p0, p1)
	-- upvalues: signalsReactModule (ref), getSduiApiStore (ref), reactModule (ref)
	local var2 = signalsReactModule.useSignalState(getSduiApiStore().getData(p0).data)
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), p1 (ref)
		local t = {}
		
		if not var2 then
			return t
		end
		for i, v in var2 do
			local category = v.category
			
			if p1 == nil or category == p1 then
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
	end, { var2, p1 })
end