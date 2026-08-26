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
	local var1 = useScreenSize()
	local var2 = useNavigation()
	local param = var2.getParam(constantsModule.Navigation.ON_CLOSE)
	local param_1 = var2.getParam(constantsModule.Navigation.ON_DISMISS_REF)
	local var3 = var2.getParam(constantsModule.Navigation.GET_ROOT_ELEMENT_REF)()
	local var4 = if var3 then var3.AbsolutePosition else Vector2.new(0, 0)
	local var5 = useProfileActionsModule(enumsModule.ButtonSurface.ContextualMenu)
	local contextual = (useProfileJsonComponentModule(enumsModule.Components.Actions) or {}).contextual
	local var6, var7 = reactModule.useState(true)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var2 (ref), param (ref)
		var7(false)
		var2.pop()
		param()
	end, { var2, param })
	local var9 = if fFlagProfileFixMenuNavigation then useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function()
					-- upvalues: var8 (ref)
					var8()
				end)
			}
		},
		isFocusable = var6
	}) else nil
	reactModule.useEffect(function()
		-- upvalues: param_1 (ref), var8 (ref)
		if param_1 then
			param_1.current = var8
			
			return function()
				-- upvalues: param_1 (copy)
				param_1.current = nil
			end
		end
	end, { var8 })
	local var10 = reactModule.useMemo(function()
		-- upvalues: contextual (ref), var5 (ref), fFlagProfileContextualMenuDisableFix (copy), fFlagProfilePlatformAddTC (copy), var8 (ref)
		if not contextual then
			return {}
		end
		local t = {}
		
		for i, v in contextual do
			local var11 = var5[v]
			
			if var11 then
				table.insert(t, {
					text = var11.text,
					disabled = if fFlagProfileContextualMenuDisableFix then nil elseif fFlagProfilePlatformAddTC then var11.isDisabled else nil,
					isDisabled = if fFlagProfileContextualMenuDisableFix then var11.isDisabled else nil,
					onActivated = function()
						-- upvalues: var8 (copy), var11 (ref)
						var8()
						var11.onActivated()
					end
				})
			end
		end
		return t
	end, { contextual, var8, var5 })
	
	return if fFlagProfileFixMenuNavigation then reactModule.createElement(profileContextualMenuModule, {
		buttonProps = var10,
		screenSize = var1,
		onDismiss = var8,
		rootElementPosition = var4,
		rootElementRef = { current = var3 },
		isOpen = var6,
		menuRef = var9
	}) else reactModule.createElement(focusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p1)
					-- upvalues: var8 (ref)
					var8()
					p1:cancel()
				end)
			}
		}
	}, {
		reactModule.createElement(profileContextualMenuModule, {
			buttonProps = var10,
			screenSize = var1,
			onDismiss = var8,
			rootElementPosition = var4,
			rootElementRef = { current = var3 },
			isOpen = var6
		})
	})
end