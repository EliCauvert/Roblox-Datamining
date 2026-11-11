local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local LoggerModule = require(Foundation.Utility.Logger)
local InteractableModule = require(Foundation.Components.Interactable)
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

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseDefaultTagsModule (copy), UseStyleTagsModule (copy), ReactModule (copy), LoggerModule (copy), WithGuiObjectPropsModule (copy), InteractableModule (copy), GuiObjectChildrenModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local HasOnStateChanged: boolean = WithDefaultsModuleResult.onStateChanged ~= nil or WithDefaultsModuleResult.onActivated ~= nil or WithDefaultsModuleResult.onSecondaryActivated ~= nil
	local UseMemoResult = ReactModule.useMemo(function(): boolean
		-- upvalues: WithDefaultsModuleResult (copy)
		return WithDefaultsModuleResult.GroupTransparency ~= nil and (type(WithDefaultsModuleResult.GroupTransparency) == "table" or WithDefaultsModuleResult.GroupTransparency > 0)
	end, { WithDefaultsModuleResult.GroupTransparency })
	local UseMemoResult1 = ReactModule.useMemo(function(): string
		-- upvalues: UseMemoResult (copy), HasOnStateChanged (copy), WithDefaultsModuleResult (copy), LoggerModule (upval)
		if not UseMemoResult then
			return if HasOnStateChanged then "ImageButton" else "Frame"
		end
		if HasOnStateChanged and not WithDefaultsModuleResult.isDisabled then
			LoggerModule:warning("Some state changes are not supported with GroupTransparency")
		end
		return "CanvasGroup"
	end, { UseMemoResult, HasOnStateChanged })
	local WithGuiObjectPropsModuleResult = WithGuiObjectPropsModule(WithDefaultsModuleResult, {
		AutoButtonColor = UseMemoResult1 ~= "ImageButton" and nil,
		GroupTransparency = if UseMemoResult then WithDefaultsModuleResult.GroupTransparency else nil,
		ref = Ref,
		[ReactModule.Tag] = UseStyleTagsModule((UseDefaultTagsModule(WithDefaultsModuleResult.tag, if WithDefaultsModuleResult.backgroundStyle == nil then "gui-object-defaults" else "gui-object-defaults x-default-transparency")))
	})
	local UseMemoResult2 = UseMemoResult1
	
	if HasOnStateChanged then
		UseMemoResult2 = InteractableModule
		WithGuiObjectPropsModuleResult.component = UseMemoResult1
		WithGuiObjectPropsModuleResult.onActivated = WithDefaultsModuleResult.onActivated
		WithGuiObjectPropsModuleResult.onSecondaryActivated = WithDefaultsModuleResult.onSecondaryActivated
		WithGuiObjectPropsModuleResult.onStateChanged = WithDefaultsModuleResult.onStateChanged
		WithGuiObjectPropsModuleResult.stateLayer = WithDefaultsModuleResult.stateLayer
		WithGuiObjectPropsModuleResult.isDisabled = WithDefaultsModuleResult.isDisabled
		WithGuiObjectPropsModuleResult.cursor = WithDefaultsModuleResult.cursor
	end
	return ReactModule.createElement(UseMemoResult2, WithGuiObjectPropsModuleResult, GuiObjectChildrenModule(WithDefaultsModuleResult))
end))