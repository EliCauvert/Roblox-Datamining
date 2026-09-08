local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local fFlagAXFixPPEV2ConsoleSidebarNavModule = require(avatarExperienceProfilePictureEditor.Flags.FFlagAXFixPPEV2ConsoleSidebarNav)

return function(p1)
	-- upvalues: reactModule (ref), focusNavigableSurfaceWrapper (ref), fFlagAXFixPPEV2ConsoleSidebarNavModule (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref)
	return reactModule.createElement(focusNavigableSurfaceWrapper, {
		surfaceIdentifier = if fFlagAXFixPPEV2ConsoleSidebarNavModule then focusNavigableSurfaceIdentifierEnum.SubRouterView else focusNavigableSurfaceIdentifierEnum.PopUp,
		isIsolated = if fFlagAXFixPPEV2ConsoleSidebarNavModule then false else true,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p2)
					-- upvalues: p1 (ref)
					p1.onClose()
					p2:cancel()
				end)
			}
		}
	}, p1.children)
end