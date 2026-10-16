local ReactModule = require(script:FindFirstAncestor("AccountUpgrade").Parent.React)
local BirthdaySheetViewModule = require(script.Parent.BirthdaySheetView)
local UseBirthdaySheetViewModelModule = require(script.Parent.useBirthdaySheetViewModel)

local function OpenSheet(p1) --[[ Line: 18 ]]
	-- upvalues: UseBirthdaySheetViewModelModule (copy), ReactModule (copy), BirthdaySheetViewModule (copy)
	return ReactModule.createElement(BirthdaySheetViewModule, (UseBirthdaySheetViewModelModule(p1)))
end

return function(p1) --[[ Line: 25 | Named "BirthdaySheet" ]]
	-- upvalues: ReactModule (copy), OpenSheet (copy)
	return if p1.isOpen then ReactModule.createElement(OpenSheet, p1) else nil
end