local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.SheetShimTypes)
local GetSheetStructureModule = require(script.Parent.getSheetStructure)
local UseHiddenBackdropModule = require(script.Parent.useHiddenBackdrop)
local UseSheetContentInsetsModule = require(script.Parent.useSheetContentInsets)
local UseComposedRefFunction = require(Parent.ReactUtils).useComposedRef

return ReactModule.forwardRef(function(Tbl, p1)
	-- upvalues: ReactModule (copy), GetSheetStructureModule (copy), UseSheetContentInsetsModule (copy), UseHiddenBackdropModule (copy), UseComposedRefFunction (copy), FoundationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), GetSheetStructureModule (upval)
		return if UseStateResult == nil then nil else GetSheetStructureModule(UseStateResult)
	end, { UseStateResult })
	local UseSheetContentInsetsModuleResult = UseSheetContentInsetsModule(UseMemoResult, Tbl.onContentInsetChanged)
	UseHiddenBackdropModule(UseMemoResult, Tbl.hideBackdrop == true)
	local OnCloseFunction = Tbl.onClose
	local Copy = table.clone(Tbl)
	Copy.onContentInsetChanged = nil
	Copy.hideBackdrop = nil
	Copy.onClose = ReactModule.useCallback(function()
		-- upvalues: UseSheetContentInsetsModuleResult (copy), OnCloseFunction (copy)
		UseSheetContentInsetsModuleResult()
		OnCloseFunction()
	end, { UseSheetContentInsetsModuleResult, OnCloseFunction })
	Copy.ref = UseComposedRefFunction(UseStateResult2, p1)
	
	return ReactModule.createElement(FoundationModule.Sheet.Root, Copy)
end)