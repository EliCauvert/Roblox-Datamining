local Parent = script:FindFirstAncestor("Moments").Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local _ = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local Image = BuilderIconsModule.Icon.Image
local FrameVideoCamera = BuilderIconsModule.Icon.FrameVideoCamera
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseToggleStateFunction = require(Parent.MomentsCommon).Hooks.useToggleState
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusOnMountFunction = FocusNavigationUtilsModule.useFocusOnMount
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}
local config = {
	gallery = "Feature.Captures.Title.Gallery",
	myAvatars = "Feature.Avatar.Label.Title.MyAvatars"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseToggleStateFunction (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), ReactFocusNavigationModule (copy), UseFocusOnMountFunction (copy), Image (copy), FrameVideoCamera (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseToggleStateResult = UseToggleStateFunction()
	local DisableFunction = UseToggleStateResult.disable
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useDefaultFocusBehavior((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		isFocusable = UseToggleStateResult.enabled,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), DisableFunction (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: DisableFunction (upval)
						DisableFunction()
						p2:cancel()
					end)
				}
			}
		end, { DisableFunction })
	})))
	local UseFocusOnMountResult = UseFocusOnMountFunction(UseDefaultFocusBehaviorResult)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseToggleStateResult (copy), p1 (copy)
		UseToggleStateResult.disable()
		p1.onCreateFromCaptures()
	end, { UseToggleStateResult.disable, p1.onCreateFromCaptures })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseToggleStateResult (copy), p1 (copy)
		UseToggleStateResult.disable()
		p1.onCreateFromAvatar()
	end, { UseToggleStateResult.disable, p1.onCreateFromAvatar })
	
	return {
		isOpen = UseToggleStateResult.enabled,
		items = ReactModule.useMemo(function()
			-- upvalues: Image (upval), UseFocusOnMountResult (copy), UseLocalizationResult (copy), UseResult (copy), FrameVideoCamera (upval), UseResult1 (copy)
			return {
				{
					id = "gallery",
					icon = Image,
					ref = UseFocusOnMountResult,
					text = UseLocalizationResult.gallery,
					onActivated = UseResult
				},
				{
					id = "myAvatars",
					icon = FrameVideoCamera,
					text = UseLocalizationResult.myAvatars,
					onActivated = UseResult1
				}
			}
		end, {
			UseLocalizationResult,
			UseResult,
			UseResult1,
			UseFocusOnMountResult
		}),
		menuRef = UseDefaultFocusBehaviorResult2,
		onToggle = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), UseToggleStateResult (copy)
			if p1.onTriggerActivated ~= nil then
				p1.onTriggerActivated()
			end
			if UseToggleStateResult.enabled then
				UseToggleStateResult.disable()
				
				return
			else
				UseToggleStateResult.enable()
			end
		end, {
			p1.onTriggerActivated,
			UseToggleStateResult.enabled,
			UseToggleStateResult.enable,
			UseToggleStateResult.disable
		}),
		onPressedOutside = DisableFunction
	}
end