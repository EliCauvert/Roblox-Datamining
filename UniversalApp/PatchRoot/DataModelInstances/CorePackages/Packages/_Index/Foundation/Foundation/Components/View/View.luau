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
local var11 = false

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 45 | named "View" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useDefaultTagsModule (ref), useStyleTagsModule (ref), flagsModule (ref), reactModule (ref), var11 (write), loggerModule (ref), withGuiObjectPropsModule (ref), interactableModule (ref), guiObjectChildrenModule (ref)
	local var16
	local var12 = withDefaultsModule(p0, t)
	local var13 = useStyleTagsModule(useDefaultTagsModule(var12.tag, if var12.backgroundStyle ~= nil then "gui-object-defaults" else "gui-object-defaults x-default-transparency"))
	local var14 = if var12.onStateChanged == nil then if var12.onActivated == nil then var12.onSecondaryActivated ~= nil else true else true
	local _ = nil
	local var15 = if flagsModule.FoundationViewMemoizationChanges then var12.GroupTransparency ~= nil and (if type(var12.GroupTransparency) ~= "table" then var12.GroupTransparency > 0 else true) else reactModule.useMemo(function() --[[ line: 64 ]]
		-- upvalues: var12 (ref)
		return if var12.GroupTransparency == nil then false else type(var12.GroupTransparency) == "table" or var12.GroupTransparency > 0
	end, { var12.GroupTransparency })
	local _ = nil
	
	if flagsModule.FoundationViewMemoizationChanges then
		var16 = if var15 then "CanvasGroup" elseif var14 then "ImageButton" else "Frame"
		
		if var15 and var14 and (not var12.isDisabled and not var11) then
			var11 = true
			loggerModule:warning("Some state changes are not supported with GroupTransparency")
		end
	else
		var16 = reactModule.useMemo(function() --[[ line: 91 ]]
			-- upvalues: var15 (write), var14 (ref), var12 (ref), loggerModule (copy)
			if var15 then
				if var14 and not var12.isDisabled then
					loggerModule:warning("Some state changes are not supported with GroupTransparency")
				end
				return "CanvasGroup"
			else
				return if var14 then "ImageButton" else "Frame"
			end
		end, { var15, var14 })
	end
	local var17 = withGuiObjectPropsModule(var12, {
		AutoButtonColor = if var16 == "ImageButton" then false else nil,
		GroupTransparency = if var15 then var12.GroupTransparency else nil,
		ref = p1,
		[reactModule.Tag] = var13
	})
	local var18 = var16
	
	if var14 then
		var18 = interactableModule
		var17.component = var16
		var17.onActivated = var12.onActivated
		var17.onSecondaryActivated = var12.onSecondaryActivated
		var17.onStateChanged = var12.onStateChanged
		var17.stateLayer = var12.stateLayer
		var17.isDisabled = var12.isDisabled
		var17.cursor = var12.cursor
	end
	return reactModule.createElement(var18, var17, guiObjectChildrenModule(var12))
end))