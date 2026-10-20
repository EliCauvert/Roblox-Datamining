local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local LoggerModule = require(Foundation.Utility.Logger)
local InteractableModule = require(Foundation.Components.Interactable)
local FlagsModule = require(Foundation.Utility.Flags)
local GuiObjectChildrenModule = require(Foundation.Utility.GuiObjectChildren)
local _ = require(Foundation.Components.Types)
local UseDefaultTagsModule = require(Foundation.Utility.useDefaultTags)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local WithGuiObjectPropsModule = require(Foundation.Utility.withGuiObjectProps)
local UseStyleTagsModule = require(Foundation.Providers.Style.useStyleTags)
local _ = require(Foundation.Enums.ControlState)
local config = {
	AutoLocalize = false,
	BorderSizePixel = 0,
	isDisabled = false,
	layout = { SortOrder = Enum.SortOrder.LayoutOrder }
}
local Flag = false

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseDefaultTagsModule (copy), UseStyleTagsModule (copy), FlagsModule (copy), ReactModule (copy), Flag (ref), LoggerModule (copy), WithGuiObjectPropsModule (copy), InteractableModule (copy), GuiObjectChildrenModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStyleTagsModuleResult = UseStyleTagsModule((UseDefaultTagsModule(WithDefaultsModuleResult.tag, if WithDefaultsModuleResult.backgroundStyle == nil then "gui-object-defaults" else "gui-object-defaults x-default-transparency")))
	local HasOnStateChanged: boolean = WithDefaultsModuleResult.onStateChanged ~= nil or WithDefaultsModuleResult.onActivated ~= nil or WithDefaultsModuleResult.onSecondaryActivated ~= nil
	local IsTable = nil
	IsTable = if FlagsModule.FoundationViewMemoizationChanges then WithDefaultsModuleResult.GroupTransparency ~= nil and (type(WithDefaultsModuleResult.GroupTransparency) == "table" or WithDefaultsModuleResult.GroupTransparency > 0) else ReactModule.useMemo(function(): boolean
		-- upvalues: WithDefaultsModuleResult (copy)
		return WithDefaultsModuleResult.GroupTransparency ~= nil and (type(WithDefaultsModuleResult.GroupTransparency) == "table" or WithDefaultsModuleResult.GroupTransparency > 0)
	end, { WithDefaultsModuleResult.GroupTransparency })
	local CanvasGroup = nil
	
	if FlagsModule.FoundationViewMemoizationChanges then
		CanvasGroup = if IsTable then "CanvasGroup" elseif HasOnStateChanged then "ImageButton" else "Frame"
		
		if IsTable and HasOnStateChanged and not WithDefaultsModuleResult.isDisabled and not Flag then
			Flag = true
			LoggerModule:warning("Some state changes are not supported with GroupTransparency")
		end
	else
		CanvasGroup = ReactModule.useMemo(function(): string
			-- upvalues: IsTable (ref), HasOnStateChanged (copy), WithDefaultsModuleResult (copy), LoggerModule (upval)
			if not IsTable then
				return if HasOnStateChanged then "ImageButton" else "Frame"
			end
			if HasOnStateChanged and not WithDefaultsModuleResult.isDisabled then
				LoggerModule:warning("Some state changes are not supported with GroupTransparency")
			end
			return "CanvasGroup"
		end, { IsTable, HasOnStateChanged })
	end
	local WithGuiObjectPropsModuleResult = WithGuiObjectPropsModule(WithDefaultsModuleResult, {
		AutoButtonColor = CanvasGroup ~= "ImageButton" and nil,
		GroupTransparency = if IsTable then WithDefaultsModuleResult.GroupTransparency else nil,
		ref = Ref,
		[ReactModule.Tag] = UseStyleTagsModuleResult
	})
	local CanvasGroup1: string = CanvasGroup
	
	if HasOnStateChanged then
		CanvasGroup1 = InteractableModule
		WithGuiObjectPropsModuleResult.component = CanvasGroup
		WithGuiObjectPropsModuleResult.onActivated = WithDefaultsModuleResult.onActivated
		WithGuiObjectPropsModuleResult.onSecondaryActivated = WithDefaultsModuleResult.onSecondaryActivated
		WithGuiObjectPropsModuleResult.onStateChanged = WithDefaultsModuleResult.onStateChanged
		WithGuiObjectPropsModuleResult.stateLayer = WithDefaultsModuleResult.stateLayer
		WithGuiObjectPropsModuleResult.isDisabled = WithDefaultsModuleResult.isDisabled
		WithGuiObjectPropsModuleResult.cursor = WithDefaultsModuleResult.cursor
	end
	return ReactModule.createElement(CanvasGroup1, WithGuiObjectPropsModuleResult, GuiObjectChildrenModule(WithDefaultsModuleResult))
end))