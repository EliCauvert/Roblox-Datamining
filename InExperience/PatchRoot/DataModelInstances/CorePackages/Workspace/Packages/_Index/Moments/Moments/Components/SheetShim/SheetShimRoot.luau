local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local _ = require(script.Parent.SheetShimTypes)
local getSheetStructureModule = require(script.Parent.getSheetStructure)
local useHiddenBackdropModule = require(script.Parent.useHiddenBackdrop)
local useSheetContentInsetsModule = require(script.Parent.useSheetContentInsets)
local useComposedRef = reactUtilsModule.useComposedRef

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), getSheetStructureModule (ref), useSheetContentInsetsModule (ref), useHiddenBackdropModule (ref), useComposedRef (ref), foundationModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), getSheetStructureModule (copy)
		return if var1 == nil then nil else getSheetStructureModule(var1)
	end, { var1 })
	local var4 = useSheetContentInsetsModule(var3, p1.onContentInsetChanged)
	useHiddenBackdropModule(var3, p1.hideBackdrop == true)
	local onClose = p1.onClose
	local var5 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), onClose (ref)
		var4()
		onClose()
	end, { var4, onClose })
	local var6 = useComposedRef(var2, p2)
	local cloned = table.clone(p1)
	cloned.onContentInsetChanged = nil
	cloned.hideBackdrop = nil
	cloned.onClose = var5
	cloned.ref = var6
	
	return reactModule.createElement(foundationModule.Sheet.Root, cloned)
end)