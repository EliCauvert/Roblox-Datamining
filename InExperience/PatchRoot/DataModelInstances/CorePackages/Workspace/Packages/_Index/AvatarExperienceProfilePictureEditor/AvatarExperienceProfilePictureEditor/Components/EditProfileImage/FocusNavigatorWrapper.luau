local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FFlagAXFixPPEV2ConsoleSidebarNavModule = require(AvatarExperienceProfilePictureEditor.Flags.FFlagAXFixPPEV2ConsoleSidebarNav)

return function(p1) --[[ Line: 18 | Named "FocusNavigatorWrapper" ]]
	-- upvalues: ReactModule (copy), FocusNavigableSurfaceWrapper (copy), FFlagAXFixPPEV2ConsoleSidebarNavModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactModule.createElement(FocusNavigableSurfaceWrapper, {
		surfaceIdentifier = if FFlagAXFixPPEV2ConsoleSidebarNavModule then FocusNavigableSurfaceIdentifierEnum.SubRouterView else FocusNavigableSurfaceIdentifierEnum.PopUp,
		isIsolated = not FFlagAXFixPPEV2ConsoleSidebarNavModule,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2) --[[ Line: 26 ]]
					-- upvalues: p1 (copy)
					p1.onClose()
					p2:cancel()
				end)
			}
		}
	}, p1.children)
end