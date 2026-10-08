local reactModule = require(script:FindFirstAncestor("AccountUpgrade").Parent.React)
local birthdaySheetViewModule = require(script.Parent.BirthdaySheetView)
local useBirthdaySheetViewModelModule = require(script.Parent.useBirthdaySheetViewModel)

local function OpenSheet(p1)
	-- upvalues: useBirthdaySheetViewModelModule (ref), reactModule (ref), birthdaySheetViewModule (ref)
	return reactModule.createElement(birthdaySheetViewModule, useBirthdaySheetViewModelModule(p1))
end

return function(p1)
	-- upvalues: reactModule (ref), OpenSheet (ref)
	return if p1.isOpen then reactModule.createElement(OpenSheet, p1) else nil
end