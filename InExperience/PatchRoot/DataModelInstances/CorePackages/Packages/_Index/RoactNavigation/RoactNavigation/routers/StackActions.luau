local Parent = script.Parent.Parent
local Object = require(Parent.Parent.LuauPolyfill).Object
local NavigationSymbolModule = require(Parent.NavigationSymbol)
local POP = NavigationSymbolModule("POP")
local POPTOTOP = NavigationSymbolModule("POP_TO_TOP")
local PUSH = NavigationSymbolModule("PUSH")
local RESET = NavigationSymbolModule("RESET")
local REPLACE = NavigationSymbolModule("REPLACE")
local COMPLETETRANSITION = NavigationSymbolModule("COMPLETE_TRANSITION")
local StackActionsModule = {
	Pop = POP,
	PopToTop = POPTOTOP,
	Push = PUSH,
	Reset = RESET,
	Replace = REPLACE,
	CompleteTransition = COMPLETETRANSITION
}
setmetatable(StackActionsModule, {
	__index = function(_, p1) --[[ Line: 34 ]]
		error(("%q is not a valid member of StackActions"):format((tostring(p1))), 2)
	end
})

function StackActionsModule.pop(p1) --[[ Line: 40 ]]
	-- upvalues: POP (copy), Object (copy)
	local config = { type = POP }
	
	return if p1 then Object.assign(config, p1) else config
end

function StackActionsModule.popToTop(p1) --[[ Line: 46 ]]
	-- upvalues: POPTOTOP (copy), Object (copy)
	local config = { type = POPTOTOP }
	
	return if p1 then Object.assign(config, p1) else config
end

function StackActionsModule.push(p1) --[[ Line: 52 ]]
	-- upvalues: PUSH (copy), Object (copy)
	local config = { type = PUSH }
	
	return if p1 then Object.assign(config, p1) else config
end

function StackActionsModule.reset(p1) --[[ Line: 59 ]]
	-- upvalues: RESET (copy), Object (copy)
	local config = { type = RESET }
	
	return if p1 then Object.assign(config, p1) else config
end

function StackActionsModule.replace(p1) --[[ Line: 65 ]]
	-- upvalues: REPLACE (copy), Object (copy)
	local config = { preserveFocus = true, type = REPLACE }
	
	return if p1 then Object.assign(config, p1) else config
end

function StackActionsModule.completeTransition(p1) --[[ Line: 70 ]]
	-- upvalues: COMPLETETRANSITION (copy), Object (copy)
	local config = { preserveFocus = true, type = COMPLETETRANSITION }
	
	return if p1 then Object.assign(config, p1) else config
end

return StackActionsModule