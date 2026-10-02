local parent = script.Parent.Parent
local parent_1 = parent.Parent
local fFlagPlayerListReskinModule = require(parent.Flags.FFlagPlayerListReskin)
local fFlagEnableMobilePlayerListOnConsoleModule = require(parent.Flags.FFlagEnableMobilePlayerListOnConsole)
local fFlagEnableMobilePlayerListOnGamepadModule = require(parent.Flags.FFlagEnableMobilePlayerListOnGamepad)
local fFlagLuaSupportMicroGamepadPreferredInput = require(parent_1.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput

local function _(p1, p2)
	return if p1 ~= Enum.PreferredInput.Gamepad then p2 and p1 == Enum.PreferredInput.MicroGamepad else true
end

return function(p1, p2)
	-- upvalues: fFlagPlayerListReskinModule (ref), fFlagEnableMobilePlayerListOnConsoleModule (ref), fFlagEnableMobilePlayerListOnGamepadModule (ref), fFlagLuaSupportMicroGamepadPreferredInput (ref)
	local var1 = if p2 ~= nil then fFlagPlayerListReskinModule else p2.isReskinEnabled
	local var2 = if p2 ~= nil then fFlagEnableMobilePlayerListOnConsoleModule else p2.isConsoleMobileEnabled
	local var3 = if p2 ~= nil then fFlagEnableMobilePlayerListOnGamepadModule else p2.isGamepadMobileEnabled
	local var4 = if p2 ~= nil then fFlagLuaSupportMicroGamepadPreferredInput else p2.isMicroGamepadEnabled
	
	if not var1 then
		return false
	end
	local preferredInput = p1.preferredInput
	local var5 = if preferredInput ~= Enum.PreferredInput.Gamepad then var4 and preferredInput == Enum.PreferredInput.MicroGamepad else true
	
	return if var2 and (if p1.preferredInput ~= Enum.PreferredInput.Touch then var5 else true) and p1.displaySize == Enum.DisplaySize.Large then true else var3 and var5
end