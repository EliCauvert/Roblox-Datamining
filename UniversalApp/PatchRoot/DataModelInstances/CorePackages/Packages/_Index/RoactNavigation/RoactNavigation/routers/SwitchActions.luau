local Object = require(script.Parent.Parent.Parent.LuauPolyfill).Object
local JUMPTO = require(script.Parent.Parent.NavigationSymbol)("JUMP_TO")
local SwitchActionsModule = { JumpTo = JUMPTO }
setmetatable(SwitchActionsModule, {
	__index = function(_, p1) --[[ Line: 16 ]]
		error(("%q is not a valid member of SwitchActions"):format((tostring(p1))), 2)
	end
})

function SwitchActionsModule.jumpTo(p1) --[[ Line: 22 ]]
	-- upvalues: JUMPTO (copy), Object (copy)
	local config = { preserveFocus = true, type = JUMPTO }
	
	return if p1 then Object.assign(config, p1) else config
end

return SwitchActionsModule