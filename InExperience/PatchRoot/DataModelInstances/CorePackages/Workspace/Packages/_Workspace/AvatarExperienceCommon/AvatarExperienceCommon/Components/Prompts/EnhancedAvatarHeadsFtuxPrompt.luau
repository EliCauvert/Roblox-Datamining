local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AXPartialPageModalModule = require(AvatarExperienceCommon.Components.AXPartialPageModal.AXPartialPageModal)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseFocusOnMountEffectModule = require(AvatarExperienceCommon.Hooks.useFocusOnMountEffect)
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1) --[[ Line: 29 | Named "EnhancedAvatarHeadsFtuxPrompt" ]]
	-- upvalues: UseNavigationFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), ReactFocusNavigationModule (copy), config (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusOnMountEffectModule (copy), View (copy), Text (copy), AXPartialPageModalModule (copy), ButtonVariant (copy), InputSize (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		confirmButtonText = "Feature.Avatar.Action.GotIt",
		enhancedAvatarHeadsTitle = "Feature.Avatar.Title.EnhancedAvatarHeads",
		enhancedAvatarHeadsMessage = "Feature.Avatar.Message.EnhancedAvatarHeads"
	})
	local Params = UseNavigationResult.state.params or {}
	local OnConfirm = p1.onConfirm or Params.onConfirm
	local UseResult = ReactModule.useCallback(function() --[[ Line: 40 ]]
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end, { UseNavigationResult })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 44 ]]
		-- upvalues: UseResult (copy), OnConfirm (copy)
		UseResult()
		
		if OnConfirm then
			OnConfirm()
		end
	end, { OnConfirm, UseResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function() --[[ Line: 55 ]]
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult1 (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2) --[[ Line: 58 ]]
					-- upvalues: UseResult1 (upval)
					p2.cancelled = true
					UseResult1()
				end)
			}
		}
	end, { UseResult1 }), (ReactFocusNavigationModule.useEventMap(config, UseRefResult)))
	ReactModule.useEffect(function() --[[ Line: 67 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	UseFocusOnMountEffectModule(UseRefResult, 0.15)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		SelectionGroup = true,
		Size = UDim2.fromScale(1, 1),
		ref = UseRefResult,
		SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
		SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
		SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop
	}, {
		Modal = ReactModule.createElement(AXPartialPageModalModule, {
			visible = UseStateResult,
			onBackgroundPress = UseResult1,
			buttonStackProps = {
				rowLayout = false,
				buttons = {
					{
						props = {
							onActivated = UseResult1,
							text = UseLocalizationResult.confirmButtonText,
							variant = ButtonVariant.Emphasis,
							size = InputSize.Medium
						}
					}
				}
			}
		}, {
			ViewFrame = ReactModule.createElement(View, {
				tag = "col align-x-left align-y-top size-full-0 auto-y padding-bottom-xxlarge"
			}, {
				PromptBodyTitle = ReactModule.createElement(Text, {
					tag = "auto-xy padding-bottom-small padding-top-medium text-heading-small text-wrap text-align-x-left",
					LayoutOrder = 1,
					Text = UseLocalizationResult.enhancedAvatarHeadsTitle
				}),
				PromptBodyText = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-large text-wrap text-align-x-left",
					LayoutOrder = 2,
					Text = UseLocalizationResult.enhancedAvatarHeadsMessage
				})
			})
		})
	})
end