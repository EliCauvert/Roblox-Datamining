local appShortcutBar = script:FindFirstAncestor("AppShortcutBar")
local parent = appShortcutBar.Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigationUtils)
local var2 = require(appShortcutBar.Stores.GetButtonHoldStore)(false)
local t = {
	ButtonHoldStarted = "ButtonHoldStarted",
	ButtonHoldEnded = "ButtonHoldEnded"
}
local t_1 = {
	[t.ButtonHoldStarted] = function(p0, p1) --[[ line: 38 ]]
		local cloned = table.clone(p0)
		cloned.heldProgress[p1.eventName] = p1.progress
		
		return cloned
	end,
	[t.ButtonHoldEnded] = function(p2, p3) --[[ line: 43 ]]
		local cloned = table.clone(p2)
		cloned.heldProgress[p3.eventName] = nil
		
		return cloned
	end
}

local function registryReducer(p4, p5) --[[ line: 50 ]]
	-- upvalues: t_1 (ref)
	local type = t_1[p5.type]
	
	if type then
		return type(p4, p5.payload)
	end
	error("Unknown action: " .. p5.type)
end

local var6 = reactModule.createContext(nil)

return {
	Context = var6,
	Provider = function(p6) --[[ line: 60 ]]
		-- upvalues: reactModule (ref), registryReducer (ref), var6 (ref)
		local var9, var10 = reactModule.useReducer(registryReducer, { heldProgress = {} })
		
		return reactModule.createElement(var6.Provider, { value = { state = var9, dispatch = var10 } }, p6.children)
	end,
	useDispatchButtonHoldStarted = var2.useDispatchButtonHoldStarted,
	useDispatchButtonHoldEnded = var2.useDispatchButtonHoldEnded,
	useHeldProgressByEvent = var2.useHeldProgressByEvent,
	AppShortcutBarStateActionEnum = t
}