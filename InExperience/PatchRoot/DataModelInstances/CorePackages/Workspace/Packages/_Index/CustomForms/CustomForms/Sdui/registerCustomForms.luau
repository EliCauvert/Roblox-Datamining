local CustomForms = script:FindFirstAncestor("CustomForms")
local Parent = CustomForms.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry
local GetSduiComponentRegistryFunction = SduiCoreSystemModule.getSduiComponentRegistry
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiApiStoreUpdateInputData = SharedFlagsModule.FFlagSduiCustomFormEnabled and (SharedFlagsModule.FFlagSduiUnwrapStructPropEnvelope and SharedFlagsModule.FFlagSduiApiStoreUpdateInputData)

local function registerCustomFormActions()
	-- upvalues: SduiActionType (copy), FFlagSduiApiStoreUpdateInputData (copy), CustomForms (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.SubmitCustomFormResponse] = if FFlagSduiApiStoreUpdateInputData then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: CustomForms (upval)
				return require(CustomForms.Sdui.SduiSubmitCustomFormResponseAction)
			end
		} else nil,
		[SduiActionType.RefreshCustomFormResults] = if FFlagSduiApiStoreUpdateInputData then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: CustomForms (upval)
				return require(CustomForms.Sdui.SduiRefreshCustomFormResultsAction)
			end
		} else nil
	})
end

local function registerCustomFormComponents()
	-- upvalues: SduiComponentType (copy), FFlagSduiApiStoreUpdateInputData (copy), CustomForms (copy), GetSduiComponentRegistryFunction (copy)
	GetSduiComponentRegistryFunction().registerComponentDefinitions({
		[SduiComponentType.CustomForm] = if FFlagSduiApiStoreUpdateInputData then {
			getLazyComponent = function()
				-- upvalues: CustomForms (upval)
				return require(CustomForms.Sdui.SduiCustomForm)
			end
		} else nil
	})
end

return {
	registerCustomForms = function()
		-- upvalues: registerCustomFormActions (copy), registerCustomFormComponents (copy)
		registerCustomFormActions()
		registerCustomFormComponents()
	end,
	registerCustomFormActions = registerCustomFormActions,
	registerCustomFormComponents = registerCustomFormComponents
}