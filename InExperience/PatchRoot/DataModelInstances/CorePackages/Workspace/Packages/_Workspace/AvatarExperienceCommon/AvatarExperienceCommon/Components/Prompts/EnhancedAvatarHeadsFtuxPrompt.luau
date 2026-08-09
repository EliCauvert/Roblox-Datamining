local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useLocalization = require(parent.Localization).Hooks.useLocalization
local AXPartialPageModalModule = require(avatarExperienceCommon.Components.AXPartialPageModal.AXPartialPageModal)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local useFocusOnMountEffectModule = require(avatarExperienceCommon.Hooks.useFocusOnMountEffect)
local fFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss = require(parent.AvatarExperienceFlags).FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p0) --[[ line: 32 | named "EnhancedAvatarHeadsFtuxPrompt" ]]
	-- upvalues: useNavigation (ref), useLocalization (ref), reactModule (ref), fFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss (ref), reactFocusNavigationModule (ref), t (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusOnMountEffectModule (ref), view (ref), text (ref), AXPartialPageModalModule (ref), buttonVariant (ref), inputSize (ref)
	local var8 = useNavigation()
	local var9 = useLocalization({
		confirmButtonText = "Feature.Avatar.Action.GotIt",
		enhancedAvatarHeadsTitle = "Feature.Avatar.Title.EnhancedAvatarHeads",
		enhancedAvatarHeadsMessage = "Feature.Avatar.Message.EnhancedAvatarHeads"
	})
	local onConfirm = p0.onConfirm or (var8.state.params or {}).onConfirm
	local var11 = reactModule.useCallback(function() --[[ line: 43 ]]
		-- upvalues: var8 (ref)
		var8.goBack()
	end, { var8 })
	local var12 = reactModule.useCallback(function() --[[ line: 47 ]]
		-- upvalues: var11 (ref), onConfirm (ref)
		var11()
		
		if onConfirm then
			onConfirm()
		end
	end, { onConfirm, var11 })
	local var13, var14 = reactModule.useState(false)
	local var15 = if fFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss then reactModule.useRef(nil) else nil
	
	if fFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss then
		reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function() --[[ line: 62 ]]
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var12 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p1) --[[ line: 65 ]]
						-- upvalues: var12 (copy)
						p1.cancelled = true
						var12()
					end)
				}
			}
		end, { var12 }), reactFocusNavigationModule.useEventMap(t, var15))
	end
	reactModule.useEffect(function() --[[ line: 75 ]]
		-- upvalues: var14 (ref)
		var14(true)
	end, {})
	
	if fFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss then
		useFocusOnMountEffectModule(var15, 0.15)
	end
	local var16 = function() --[[ line: 86 ]]
		-- upvalues: reactModule (copy), view (copy), text (copy), var9 (ref)
		return {
			ViewFrame = reactModule.createElement(view, {
				tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
			}, {
				PromptBodyTitle = reactModule.createElement(text, {
					tag = "auto-xy padding-bottom-small padding-top-medium text-align-x-left text-heading-small text-wrap",
					LayoutOrder = 1,
					Text = var9.enhancedAvatarHeadsTitle
				}),
				PromptBodyText = reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left text-body-large text-wrap",
					LayoutOrder = 2,
					Text = var9.enhancedAvatarHeadsMessage
				})
			})
		}
	end
	
	return if fFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		SelectionGroup = true,
		Size = UDim2.fromScale(1, 1),
		ref = var15,
		SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
		SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
		SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop
	}, {
		Modal = reactModule.createElement(AXPartialPageModalModule, {
			visible = var13,
			onBackgroundPress = var12,
			buttonStackProps = {
				rowLayout = false,
				buttons = {
					{
						props = {
							onActivated = var12,
							text = var9.confirmButtonText,
							variant = buttonVariant.Emphasis,
							size = inputSize.Medium
						}
					}
				}
			}
		}, var16())
	}) else reactModule.createElement(AXPartialPageModalModule, {
		visible = var13,
		onBackgroundPress = var12,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = var12,
						text = var9.confirmButtonText,
						variant = buttonVariant.Emphasis,
						size = inputSize.Medium
					}
				}
			}
		}
	}, var16())
end