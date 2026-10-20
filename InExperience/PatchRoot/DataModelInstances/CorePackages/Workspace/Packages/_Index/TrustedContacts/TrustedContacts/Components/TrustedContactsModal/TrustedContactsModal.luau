local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusOnMountFunction = FocusNavigationUtilsModule.useFocusOnMount
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local InputHandlersModule = require(Parent.InputHandlers)
local UseMostRecentOrDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useMostRecentOrDefaultFocusBehavior
local ResponsiveModule = require(Parent.Responsive)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local View = FoundationModule.View
local Sheet = FoundationModule.Sheet
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local SocialMetadataSectionModule = require(TrustedContacts.Components.SocialMetadataSection)
local TCMountMinLoadingTimeMs = game:DefineFastInt("TCMountMinLoadingTimeMs", 0)
local FFlagTCLearnMoreLinkModule = require(TrustedContacts.Flags.FFlagTCLearnMoreLink)
local FFlagTrustedContactsModalFixFocusNavigationModule = require(TrustedContacts.Flags.FFlagTrustedContactsModalFixFocusNavigation)
local FFlagTrustedContactsSheetFocusNavigationModule = require(TrustedContacts.Flags.FFlagTrustedContactsSheetFocusNavigation)
local _ = require(script.Parent.useModalButtonActions)
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: ResponsiveModule (copy), FFlagTrustedContactsModalFixFocusNavigationModule (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FFlagTrustedContactsSheetFocusNavigationModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), UseMostRecentOrDefaultFocusBehaviorFunction (copy), UseFocusOnMountFunction (copy), TCMountMinLoadingTimeMs (copy), Loading (copy), IconSize (copy), Sheet (copy), Text (copy), FFlagTCLearnMoreLinkModule (copy), View (copy), SocialMetadataSectionModule (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy), FocusRoot (copy)
	local IsVerticallyConstrained = p1.isVerticallyConstrained
	local UseOrientationResult = ResponsiveModule.useOrientation()
	local OnCloseModalFunction = p1.onCloseModal
	local UseMemoResult = if FFlagTrustedContactsModalFixFocusNavigationModule then ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCloseModalFunction (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: OnCloseModalFunction (upval)
					OnCloseModalFunction()
					p2:cancel()
				end)
			}
		}
	end, { OnCloseModalFunction }) else nil
	local FFlagTrustedContactsModalFixFocusNavigationModule1 = FFlagTrustedContactsSheetFocusNavigationModule and FFlagTrustedContactsModalFixFocusNavigationModule
	local v1 = nil
	local v2 = nil
	
	if FFlagTrustedContactsSheetFocusNavigationModule then
		v1, v30 = UseMostRecentOrDefaultFocusBehaviorFunction((UseFocusRootFunction({
			isAutoFocusRoot = true,
			shouldRestoreFocus = false,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = EventMap,
			eventHandlers = UseMemoResult,
			isFocusable = FFlagTrustedContactsModalFixFocusNavigationModule1
		})))
	end
	local UseFocusOnMountResult = if FFlagTrustedContactsModalFixFocusNavigationModule then UseFocusOnMountFunction(if FFlagTrustedContactsModalFixFocusNavigationModule1 then v1 else nil) else nil
	local IsUseOrientationResultMatch = UseOrientationResult == ResponsiveModule.DefaultKey
	local UseStateResult, UseStateResult2 = ReactModule.useState(IsUseOrientationResultMatch)
	local UseRefResult = ReactModule.useRef(os.clock())
	ReactModule.useEffect(function()
		-- upvalues: IsUseOrientationResultMatch (copy), UseRefResult (copy), TCMountMinLoadingTimeMs (upval), UseStateResult2 (copy)
		if not IsUseOrientationResultMatch then
			local Elapsed = os.clock() - UseRefResult.current
			local TCMountMinLoadingTimeMsRatio = TCMountMinLoadingTimeMs / 1000
			
			if Elapsed < TCMountMinLoadingTimeMsRatio then
				delay(TCMountMinLoadingTimeMsRatio - Elapsed, function()
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(false)
				end)
				
				return
			end
			UseStateResult2(false)
		end
	end, { IsUseOrientationResultMatch, UseStateResult2 })
	
	if UseStateResult then
		return ReactModule.createElement(Loading, {
			size = IconSize.Large,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	else
		local ModalButtonAction = p1.modalButtonActions and p1.modalButtonActions[1] or nil
		local ModalButtonAction1 = p1.modalButtonActions and p1.modalButtonActions[2] or nil
		local Element = ReactModule.createElement(Sheet.Root, {
			preferCenterSheet = true,
			onClose = p1.onCloseModal,
			ref = if FFlagTrustedContactsModalFixFocusNavigationModule1 then v2 else nil
		}, {
			Header = ReactModule.createElement(Sheet.Header, nil, {
				Title = ReactModule.createElement(Text, {
					tag = "auto-xy text-heading-small text-align-x-left content-default",
					Text = p1.headerText
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
				TextIntro = if FFlagTCLearnMoreLinkModule then ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "col gap-small size-full-0 auto-y"
				}, {
					Text = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-wrap text-align-x-left",
						Text = p1.descriptionText
					}),
					LearnMore = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-0 auto-xy text-wrap text-align-x-left",
						RichText = true,
						Text = `<u>{p1.learnMoreText}</u>`,
						onActivated = p1.onLearnMoreClick
					})
				}) else ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-wrap text-align-x-left",
					Text = p1.descriptionText
				}),
				Insights = ReactModule.createElement(SocialMetadataSectionModule, {
					layoutOrder = 2,
					userId = p1.userId,
					isVerticallyConstrained = IsVerticallyConstrained
				})
			}),
			Actions = if ModalButtonAction or ModalButtonAction1 then ReactModule.createElement(Sheet.Actions, nil, {
				First = ModalButtonAction and ReactModule.createElement(Button, {
					LayoutOrder = 1,
					text = ModalButtonAction.text or "",
					onActivated = ModalButtonAction.onActivated,
					icon = ModalButtonAction.icon,
					isLoading = ModalButtonAction.isLoading,
					variant = ButtonVariant.Emphasis,
					fillBehavior = FillBehavior.Fill,
					width = UDim.new(1, 0),
					ref = UseFocusOnMountResult,
					isDisabled = ModalButtonAction.isDisabled
				}) or nil,
				Second = ModalButtonAction1 and ReactModule.createElement(Button, {
					LayoutOrder = 2,
					text = ModalButtonAction1.text or "",
					onActivated = ModalButtonAction1.onActivated,
					icon = ModalButtonAction1.icon,
					isLoading = ModalButtonAction1.isLoading,
					variant = ButtonVariant.Standard,
					fillBehavior = FillBehavior.Fill,
					width = UDim.new(1, 0),
					isDisabled = ModalButtonAction1.isDisabled
				}) or nil
			}) else nil
		})
		
		return if FFlagTrustedContactsModalFixFocusNavigationModule1 then Element elseif FFlagTrustedContactsModalFixFocusNavigationModule then ReactModule.createElement(FocusRoot, {
			isAutoFocusRoot = true,
			isIsolated = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			eventHandlers = UseMemoResult
		}, { Modal = Element }) else Element
	end
end