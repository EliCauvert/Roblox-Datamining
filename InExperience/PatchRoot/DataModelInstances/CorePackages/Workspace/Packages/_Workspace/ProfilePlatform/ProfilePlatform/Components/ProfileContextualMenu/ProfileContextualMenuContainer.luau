local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ProfileContextualMenuModule = require(script.Parent.ProfileContextualMenu)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseProfileActionsModule = require(ProfilePlatform.Hooks.useProfileActions)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local FFlagProfilePlatformAddTC = require(Parent.SharedFlags).FFlagProfilePlatformAddTC
local FFlagProfileContextualMenuDisableFix = require(Parent.SharedFlags).FFlagProfileContextualMenuDisableFix
local FFlagProfileFixMenuNavigation = require(Parent.SharedFlags).FFlagProfileFixMenuNavigation

return function(_) --[[ Line: 24 | Named "ProfileContextualMenuContainer" ]]
	-- upvalues: UseScreenSizeFunction (copy), UseNavigationFunction (copy), ConstantsModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), UseProfileActionsModule (copy), ReactModule (copy), FFlagProfileFixMenuNavigation (copy), UseAppFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FFlagProfileContextualMenuDisableFix (copy), FFlagProfilePlatformAddTC (copy), ProfileContextualMenuModule (copy), FocusNavigableSurfaceWrapper (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseNavigationResult = UseNavigationFunction()
	local Param = UseNavigationResult.getParam(ConstantsModule.Navigation.ON_CLOSE)
	local Param1 = UseNavigationResult.getParam(ConstantsModule.Navigation.ON_DISMISS_REF)
	local Current = UseNavigationResult.getParam(ConstantsModule.Navigation.GET_ROOT_ELEMENT_REF)()
	local AbsolutePosition = if Current then Current.AbsolutePosition else Vector2.new(0, 0)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.Actions) or {}
	local UseProfileActionsModuleResult = UseProfileActionsModule(EnumsModule.ButtonSurface.ContextualMenu)
	local Contextual = UseProfileJsonComponentModuleResult.contextual
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 42 ]]
		-- upvalues: UseStateResult2 (copy), UseNavigationResult (copy), Param (copy)
		UseStateResult2(false)
		UseNavigationResult.pop()
		Param()
	end, { UseNavigationResult, Param })
	local UseAppFocusRootResult = if FFlagProfileFixMenuNavigation then UseAppFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function() --[[ Line: 54 ]]
					-- upvalues: UseResult (copy)
					UseResult()
				end)
			}
		},
		isFocusable = UseStateResult
	}) else nil
	ReactModule.useEffect(function() --[[ Line: 64 ]]
		-- upvalues: Param1 (copy), UseResult (copy)
		if not Param1 then return end
		Param1.current = UseResult
		
		return function() --[[ Line: 69 ]]
			-- upvalues: Param1 (upval)
			Param1.current = nil
		end
	end, { UseResult })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 74 ]]
		-- upvalues: Contextual (copy), UseProfileActionsModuleResult (copy), FFlagProfileContextualMenuDisableFix (upval), FFlagProfilePlatformAddTC (upval), UseResult (copy)
		if not Contextual then
			return {}
		end
		local List = {}
		
		for _, value in Contextual do
			local UseProfileActionsModuleResultEntry = UseProfileActionsModuleResult[value]
			
			if UseProfileActionsModuleResultEntry then
				table.insert(List, {
					text = UseProfileActionsModuleResultEntry.text,
					disabled = if FFlagProfileContextualMenuDisableFix then nil elseif FFlagProfilePlatformAddTC then UseProfileActionsModuleResultEntry.isDisabled else nil,
					isDisabled = if FFlagProfileContextualMenuDisableFix then UseProfileActionsModuleResultEntry.isDisabled else nil,
					onActivated = function() --[[ Line: 90 ]]
						-- upvalues: UseResult (upval), UseProfileActionsModuleResultEntry (copy)
						UseResult()
						UseProfileActionsModuleResultEntry.onActivated()
					end
				})
			end
		end
		return List
	end, { Contextual, UseResult, UseProfileActionsModuleResult })
	
	return if FFlagProfileFixMenuNavigation then ReactModule.createElement(ProfileContextualMenuModule, {
		buttonProps = UseMemoResult,
		screenSize = UseScreenSizeResult,
		onDismiss = UseResult,
		rootElementPosition = AbsolutePosition,
		rootElementRef = { current = Current },
		isOpen = UseStateResult,
		menuRef = UseAppFocusRootResult
	}) else ReactModule.createElement(FocusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p1) --[[ Line: 116 ]]
					-- upvalues: UseResult (copy)
					UseResult()
					p1:cancel()
				end)
			}
		}
	}, {
		ReactModule.createElement(ProfileContextualMenuModule, {
			buttonProps = UseMemoResult,
			screenSize = UseScreenSizeResult,
			onDismiss = UseResult,
			rootElementPosition = AbsolutePosition,
			rootElementRef = { current = Current },
			isOpen = UseStateResult
		})
	})
end