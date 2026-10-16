local Parent = script.Parent.Parent
local FFlagPlayerListReskinModule = require(Parent.Flags.FFlagPlayerListReskin)
local FFlagEnableMobilePlayerListOnConsoleModule = require(Parent.Flags.FFlagEnableMobilePlayerListOnConsole)
local FFlagEnableMobilePlayerListOnGamepadModule = require(Parent.Flags.FFlagEnableMobilePlayerListOnGamepad)
local FFlagLuaSupportMicroGamepadPreferredInput = require(Parent.Parent.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput

local function _(PreferredInput, p1): boolean --[[ Line: 25 | Named "isGamepadPreferredInput" ]]
	return PreferredInput == Enum.PreferredInput.Gamepad or p1 and PreferredInput == Enum.PreferredInput.MicroGamepad
end

return function(p1, p2): boolean --[[ Line: 34 | Named "isReskinConsoleMobileRoute" ]]
	-- upvalues: FFlagPlayerListReskinModule (copy), FFlagEnableMobilePlayerListOnConsoleModule (copy), FFlagEnableMobilePlayerListOnGamepadModule (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy)
	local FFlagEnableMobilePlayerListOnConsoleModule1 = if p2 == nil then FFlagEnableMobilePlayerListOnConsoleModule else p2.isConsoleMobileEnabled
	local FFlagEnableMobilePlayerListOnGamepadModule1 = if p2 == nil then FFlagEnableMobilePlayerListOnGamepadModule else p2.isGamepadMobileEnabled
	local FFlagLuaSupportMicroGamepadPreferredInput1 = if p2 == nil then FFlagLuaSupportMicroGamepadPreferredInput else p2.isMicroGamepadEnabled
	
	if if p2 == nil then FFlagPlayerListReskinModule else p2.isReskinEnabled then
		local PreferredInput = p1.preferredInput
		local IsPreferredInputMatch: boolean = PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput1 and PreferredInput == Enum.PreferredInput.MicroGamepad
		local IsPreferredInputMatch1: boolean = p1.preferredInput == Enum.PreferredInput.Touch or IsPreferredInputMatch
		
		return FFlagEnableMobilePlayerListOnConsoleModule1 and IsPreferredInputMatch1 and p1.displaySize == Enum.DisplaySize.Large or FFlagEnableMobilePlayerListOnGamepadModule1 and IsPreferredInputMatch
	else
		return false
	end
end