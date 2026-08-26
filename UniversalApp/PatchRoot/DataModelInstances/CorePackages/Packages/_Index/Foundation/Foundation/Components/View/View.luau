local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local loggerModule = require(foundation.Utility.Logger)
local interactableModule = require(foundation.Components.Interactable)
local flagsModule = require(foundation.Utility.Flags)
local guiObjectChildrenModule = require(foundation.Utility.GuiObjectChildren)
local _ = require(foundation.Components.Types)
local useDefaultTagsModule = require(foundation.Utility.useDefaultTags)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local withGuiObjectPropsModule = require(foundation.Utility.withGuiObjectProps)
local useStyleTagsModule = require(foundation.Providers.Style.useStyleTags)
local _ = require(foundation.Enums.ControlState)
local t = {
	AutoLocalize = false,
	BorderSizePixel = 0,
	isDisabled = false,
	layout = { SortOrder = Enum.SortOrder.LayoutOrder }
}
local var1 = false

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useDefaultTagsModule (ref), useStyleTagsModule (ref), flagsModule (ref), reactModule (ref), var1 (write), loggerModule (ref), withGuiObjectPropsModule (ref), interactableModule (ref), guiObjectChildrenModule (ref)
	local var2
	local var3 = withDefaultsModule(p1, t)
	local var4 = useStyleTagsModule(useDefaultTagsModule(var3.tag, if var3.backgroundStyle ~= nil then "gui-object-defaults" else "gui-object-defaults x-default-transparency"))
	local var5 = if var3.onStateChanged == nil then if var3.onActivated == nil then var3.onSecondaryActivated ~= nil else true else true
	local _ = nil
	local var6 = if flagsModule.FoundationViewMemoizationChanges then var3.GroupTransparency ~= nil and (if type(var3.GroupTransparency) ~= "table" then var3.GroupTransparency > 0 else true) else reactModule.useMemo(function()
		-- upvalues: var3 (ref)
		return if var3.GroupTransparency == nil then false else type(var3.GroupTransparency) == "table" or var3.GroupTransparency > 0
	end, { var3.GroupTransparency })
	local _ = nil
	
	if flagsModule.FoundationViewMemoizationChanges then
		var2 = if var6 then "CanvasGroup" elseif var5 then "ImageButton" else "Frame"
		
		if var6 and var5 and (not var3.isDisabled and not var1) then
			var1 = true
			loggerModule:warning("Some state changes are not supported with GroupTransparency")
		end
	else
		var2 = reactModule.useMemo(function()
			-- upvalues: var6 (write), var5 (ref), var3 (ref), loggerModule (copy)
			if var6 then
				if var5 and not var3.isDisabled then
					loggerModule:warning("Some state changes are not supported with GroupTransparency")
				end
				return "CanvasGroup"
			else
				return if var5 then "ImageButton" else "Frame"
			end
		end, { var6, var5 })
	end
	local var7 = withGuiObjectPropsModule(var3, {
		AutoButtonColor = if var2 == "ImageButton" then false else nil,
		GroupTransparency = if var6 then var3.GroupTransparency else nil,
		ref = p2,
		[reactModule.Tag] = var4
	})
	local var8 = var2
	
	if var5 then
		var8 = interactableModule
		var7.component = var2
		var7.onActivated = var3.onActivated
		var7.onSecondaryActivated = var3.onSecondaryActivated
		var7.onStateChanged = var3.onStateChanged
		var7.stateLayer = var3.stateLayer
		var7.isDisabled = var3.isDisabled
		var7.cursor = var3.cursor
	end
	return reactModule.createElement(var8, var7, guiObjectChildrenModule(var3))
end))