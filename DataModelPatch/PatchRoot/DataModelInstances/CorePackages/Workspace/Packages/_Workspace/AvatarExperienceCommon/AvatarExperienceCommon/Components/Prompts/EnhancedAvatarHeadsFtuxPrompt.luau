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
local FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss = require(Parent.AvatarExperienceFlags).FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss (copy), ReactFocusNavigationModule (copy), config (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusOnMountEffectModule (copy), View (copy), Text (copy), AXPartialPageModalModule (copy), ButtonVariant (copy), InputSize (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		confirmButtonText = "Feature.Avatar.Action.GotIt",
		enhancedAvatarHeadsTitle = "Feature.Avatar.Title.EnhancedAvatarHeads",
		enhancedAvatarHeadsMessage = "Feature.Avatar.Message.EnhancedAvatarHeads"
	})
	local Params = UseNavigationResult.state.params or {}
	local OnConfirm = p1.onConfirm or Params.onConfirm
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end, { UseNavigationResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), OnConfirm (copy)
		UseResult()
		
		if OnConfirm then
			OnConfirm()
		end
	end, { OnConfirm, UseResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = if FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss then ReactModule.useRef(nil) else nil
	
	if FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss then
		ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult1 (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: UseResult1 (upval)
						p2.cancelled = true
						UseResult1()
					end)
				}
			}
		end, { UseResult1 }), (ReactFocusNavigationModule.useEventMap(config, UseRefResult)))
	end
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	
	if FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss then
		UseFocusOnMountEffectModule(UseRefResult, 0.15)
	end
	local function v24()
		-- upvalues: ReactModule (upval), View (upval), Text (upval), UseLocalizationResult (copy)
		return {
			ViewFrame = ReactModule.createElement(View, {
				tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
			}, {
				PromptBodyTitle = ReactModule.createElement(Text, {
					tag = "auto-xy padding-bottom-small padding-top-medium text-align-x-left text-heading-small text-wrap",
					LayoutOrder = 1,
					Text = UseLocalizationResult.enhancedAvatarHeadsTitle
				}),
				PromptBodyText = ReactModule.createElement(Text, {
					tag = "auto-xy text-align-x-left text-body-large text-wrap",
					LayoutOrder = 2,
					Text = UseLocalizationResult.enhancedAvatarHeadsMessage
				})
			})
		}
	end
	
	return if FFlagAXEnhancedAvatarHeadsFtuxConsoleDismiss then ReactModule.createElement("Frame", {
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
		}, (v24()))
	}) else ReactModule.createElement(AXPartialPageModalModule, {
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
	}, (v24()))
end