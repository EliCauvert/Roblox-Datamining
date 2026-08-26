local appShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local parent = appShortcutBar.Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigationUtils)
local var1 = require(appShortcutBar.Stores.GetButtonHoldStore)(false)
local t = {
	ButtonHoldStarted = "ButtonHoldStarted",
	ButtonHoldEnded = "ButtonHoldEnded"
}
local t_1 = {
	[t.ButtonHoldStarted] = function(p1, p2)
		local cloned = table.clone(p1)
		cloned.heldProgress[p2.eventName] = p2.progress
		
		return cloned
	end,
	[t.ButtonHoldEnded] = function(p1, p2)
		local cloned = table.clone(p1)
		cloned.heldProgress[p2.eventName] = nil
		
		return cloned
	end
}

local function registryReducer(p1, p2)
	-- upvalues: t_1 (ref)
	local type = t_1[p2.type]
	
	if type then
		return type(p1, p2.payload)
	end
	error("Unknown action: " .. p5.type)
end

local var2 = reactModule.createContext(nil)

return {
	Context = var2,
	Provider = function(p1)
		-- upvalues: reactModule (ref), registryReducer (ref), var2 (ref)
		local var3, var4 = reactModule.useReducer(registryReducer, { heldProgress = {} })
		
		return reactModule.createElement(var2.Provider, { value = { state = var3, dispatch = var4 } }, p1.children)
	end,
	useDispatchButtonHoldStarted = var1.useDispatchButtonHoldStarted,
	useDispatchButtonHoldEnded = var1.useDispatchButtonHoldEnded,
	useHeldProgressByEvent = var1.useHeldProgressByEvent,
	AppShortcutBarStateActionEnum = t
}