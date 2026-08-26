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
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: useNavigation (ref), useLocalization (ref), reactModule (ref), reactFocusNavigationModule (ref), t (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusOnMountEffectModule (ref), view (ref), text (ref), AXPartialPageModalModule (ref), buttonVariant (ref), inputSize (ref)
	local var1 = useNavigation()
	local var2 = useLocalization({
		confirmButtonText = "Feature.Avatar.Action.GotIt",
		enhancedAvatarHeadsTitle = "Feature.Avatar.Title.EnhancedAvatarHeads",
		enhancedAvatarHeadsMessage = "Feature.Avatar.Message.EnhancedAvatarHeads"
	})
	local onConfirm = p1.onConfirm or (var1.state.params or {}).onConfirm
	local var3 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		var1.goBack()
	end, { var1 })
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), onConfirm (ref)
		var3()
		
		if onConfirm then
			onConfirm()
		end
	end, { onConfirm, var3 })
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useRef(nil)
	reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var4 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p2)
					-- upvalues: var4 (copy)
					p2.cancelled = true
					var4()
				end)
			}
		}
	end, { var4 }), reactFocusNavigationModule.useEventMap(t, var7))
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		var6(true)
	end, {})
	useFocusOnMountEffectModule(var7, 0.15)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		SelectionGroup = true,
		Size = UDim2.fromScale(1, 1),
		ref = var7,
		SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
		SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
		SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop
	}, {
		Modal = reactModule.createElement(AXPartialPageModalModule, {
			visible = var5,
			onBackgroundPress = var4,
			buttonStackProps = {
				rowLayout = false,
				buttons = {
					{
						props = {
							onActivated = var4,
							text = var2.confirmButtonText,
							variant = buttonVariant.Emphasis,
							size = inputSize.Medium
						}
					}
				}
			}
		}, {
			ViewFrame = reactModule.createElement(view, {
				tag = "col align-x-left align-y-top size-full-0 auto-y padding-bottom-xxlarge"
			}, {
				PromptBodyTitle = reactModule.createElement(text, {
					tag = "auto-xy padding-bottom-small padding-top-medium text-heading-small text-wrap text-align-x-left",
					LayoutOrder = 1,
					Text = var2.enhancedAvatarHeadsTitle
				}),
				PromptBodyText = reactModule.createElement(text, {
					tag = "auto-xy text-body-large text-wrap text-align-x-left",
					LayoutOrder = 2,
					Text = var2.enhancedAvatarHeadsMessage
				})
			})
		})
	})
end