local reactModule = require(script:FindFirstAncestor("AccountUpgrade").Parent.React)
local mobileBirthdaySheetViewModule = require(script.Parent.MobileBirthdaySheetView)
local useMobileBirthdaySheetViewModelModule = require(script.Parent.useMobileBirthdaySheetViewModel)

local function OpenSheet(p1)
	-- upvalues: useMobileBirthdaySheetViewModelModule (ref), reactModule (ref), mobileBirthdaySheetViewModule (ref)
	return reactModule.createElement(mobileBirthdaySheetViewModule, useMobileBirthdaySheetViewModelModule(p1))
end

return function(p1)
	-- upvalues: reactModule (ref), OpenSheet (ref)
	return if p1.isOpen then reactModule.createElement(OpenSheet, p1) else nil
end