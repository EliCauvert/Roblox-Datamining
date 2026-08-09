local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local loggerModule = require(foundation.Utility.Logger)
local interactableModule = require(foundation.Components.Interactable)
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 42 | named "View" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useDefaultTagsModule (ref), useStyleTagsModule (ref), reactModule (ref), loggerModule (ref), withGuiObjectPropsModule (ref), interactableModule (ref), guiObjectChildrenModule (ref)
	local var10 = withDefaultsModule(p0, t)
	local var11 = useStyleTagsModule(useDefaultTagsModule(var10.tag, if var10.backgroundStyle ~= nil then "gui-object-defaults" else "gui-object-defaults x-default-transparency"))
	local var12 = if var10.onStateChanged == nil then if var10.onActivated == nil then var10.onSecondaryActivated ~= nil else true else true
	local var13 = reactModule.useMemo(function() --[[ line: 52 ]]
		-- upvalues: var10 (ref)
		return if var10.GroupTransparency == nil then false else type(var10.GroupTransparency) == "table" or var10.GroupTransparency > 0
	end, { var10.GroupTransparency })
	local var14 = reactModule.useMemo(function() --[[ line: 63 ]]
		-- upvalues: var13 (ref), var12 (ref), var10 (ref), loggerModule (copy)
		if var13 then
			if var12 and not var10.isDisabled then
				loggerModule:warning("Some state changes are not supported with GroupTransparency")
			end
			return "CanvasGroup"
		else
			return if var12 then "ImageButton" else "Frame"
		end
	end, { var13, var12 })
	local var15 = withGuiObjectPropsModule(var10, {
		AutoButtonColor = if var14 == "ImageButton" then false else nil,
		GroupTransparency = if var13 then var10.GroupTransparency else nil,
		ref = p1,
		[reactModule.Tag] = var11
	})
	local var16 = var14
	
	if var12 then
		var16 = interactableModule
		var15.component = var14
		var15.onActivated = var10.onActivated
		var15.onSecondaryActivated = var10.onSecondaryActivated
		var15.onStateChanged = var10.onStateChanged
		var15.stateLayer = var10.stateLayer
		var15.isDisabled = var10.isDisabled
		var15.cursor = var10.cursor
	end
	return reactModule.createElement(var16, var15, guiObjectChildrenModule(var10))
end))