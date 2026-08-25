local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local navigationModule = require(parent.Navigation)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local profileContextualMenuModule = require(script.Parent.ProfileContextualMenu)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useProfileActionsModule = require(profilePlatform.Hooks.useProfileActions)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useNavigation = navigationModule.useNavigation
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local constantsModule = require(profilePlatform.Common.Constants)
local enumsModule = require(profilePlatform.Common.Enums)
local fFlagProfilePlatformAddTC = require(parent.SharedFlags).FFlagProfilePlatformAddTC
local fFlagProfileContextualMenuDisableFix = require(parent.SharedFlags).FFlagProfileContextualMenuDisableFix
local fFlagProfileFixMenuNavigation = require(parent.SharedFlags).FFlagProfileFixMenuNavigation

return function(_)
	-- upvalues: useScreenSize (ref), useNavigation (ref), constantsModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useProfileActionsModule (ref), reactModule (ref), fFlagProfileFixMenuNavigation (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), fFlagProfileContextualMenuDisableFix (ref), fFlagProfilePlatformAddTC (ref), profileContextualMenuModule (ref), focusNavigableSurfaceWrapper (ref)
	local var10 = useScreenSize()
	local var11 = useNavigation()
	local param = var11.getParam(constantsModule.Navigation.ON_CLOSE)
	local param_1 = var11.getParam(constantsModule.Navigation.ON_DISMISS_REF)
	local var14 = var11.getParam(constantsModule.Navigation.GET_ROOT_ELEMENT_REF)()
	local var15 = if var14 then var14.AbsolutePosition else Vector2.new(0, 0)
	local var16 = useProfileActionsModule(enumsModule.ButtonSurface.ContextualMenu)
	local contextual = (useProfileJsonComponentModule(enumsModule.Components.Actions) or {}).contextual
	local var17, var18 = reactModule.useState(true)
	local var19 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var11 (ref), param (ref)
		var18(false)
		var11.pop()
		param()
	end, { var11, param })
	local var20 = if fFlagProfileFixMenuNavigation then useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function()
					-- upvalues: var19 (ref)
					var19()
				end)
			}
		},
		isFocusable = var17
	}) else nil
	reactModule.useEffect(function()
		-- upvalues: param_1 (ref), var19 (ref)
		if param_1 then
			param_1.current = var19
			
			return function()
				-- upvalues: param_1 (copy)
				param_1.current = nil
			end
		end
	end, { var19 })
	local var21 = reactModule.useMemo(function()
		-- upvalues: contextual (ref), var16 (ref), fFlagProfileContextualMenuDisableFix (copy), fFlagProfilePlatformAddTC (copy), var19 (ref)
		if not contextual then
			return {}
		end
		local t = {}
		
		for i, v in contextual do
			local var23 = var16[v]
			
			if var23 then
				table.insert(t, {
					text = var23.text,
					disabled = if fFlagProfileContextualMenuDisableFix then nil elseif fFlagProfilePlatformAddTC then var23.isDisabled else nil,
					isDisabled = if fFlagProfileContextualMenuDisableFix then var23.isDisabled else nil,
					onActivated = function()
						-- upvalues: var19 (copy), var23 (ref)
						var19()
						var23.onActivated()
					end
				})
			end
		end
		return t
	end, { contextual, var19, var16 })
	
	return if fFlagProfileFixMenuNavigation then reactModule.createElement(profileContextualMenuModule, {
		buttonProps = var21,
		screenSize = var10,
		onDismiss = var19,
		rootElementPosition = var15,
		rootElementRef = { current = var14 },
		isOpen = var17,
		menuRef = var20
	}) else reactModule.createElement(focusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p0)
					-- upvalues: var19 (ref)
					var19()
					p0:cancel()
				end)
			}
		}
	}, {
		reactModule.createElement(profileContextualMenuModule, {
			buttonProps = var21,
			screenSize = var10,
			onDismiss = var19,
			rootElementPosition = var15,
			rootElementRef = { current = var14 },
			isOpen = var17
		})
	})
end