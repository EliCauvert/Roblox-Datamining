local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DsaIllegalContentReportingModule = require(Parent.DsaIllegalContentReporting)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SharedFlagsModule = require(Parent.SharedFlags)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseLocalizedStringsModule = require(GenericAbuseReporting.LocalizationKeys.useLocalizedStrings)
local CommentTextFieldModule = require(GenericAbuseReporting.Common.CommentTextField)
local FrameModule = require(GenericAbuseReporting.Common.Frame)
local UIListLayoutModule = require(GenericAbuseReporting.Common.UIListLayout)
local ReasonDropdownModule = require(GenericAbuseReporting.Common.ReasonDropdown)
local MODALPOSITIONOFFSETModule = require(GenericAbuseReporting.Common.MODAL_POSITION_OFFSET)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local CloseButtonIcon = UIBloxModule.App.Dialog.Enum.CloseButtonIcon
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local ScrollView = FoundationModule.ScrollView
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local Text = FoundationModule.Text
local GenericReportLink = DsaIllegalContentReportingModule.GenericReportLink
local IsShowGenericIllegalContentReportingLink = DsaIllegalContentReportingModule.isShowGenericIllegalContentReportingLink()
local TakeItDownReportLink = DsaIllegalContentReportingModule.TakeItDownReportLink
local GetTakeItDownReportLinkVisibilityFunction = DsaIllegalContentReportingModule.getTakeItDownReportLinkVisibility
local UseAnalyticsDispatchModule = require(GenericAbuseReporting.Analytics.useAnalyticsDispatch)
local OnFormCommentUpdatedModule = require(GenericAbuseReporting.Analytics.Actions.OnFormCommentUpdated)
local OnFormReasonSelectedModule = require(GenericAbuseReporting.Analytics.Actions.OnFormReasonSelected)
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local FFlagAddAbuseReportOffsetForLandscape = SharedFlagsModule.FFlagAddAbuseReportOffsetForLandscape
local FFlagAddTakeItDownReportLinkToSurfaces = SharedFlagsModule.FFlagAddTakeItDownReportLinkToSurfaces

local function _(Vector): number
	-- upvalues: FFlagAddAbuseReportOffsetForLandscape (copy)
	return if FFlagAddAbuseReportOffsetForLandscape and Vector.Y < Vector.X then 180 else 100
end

local _ = function(p1, p2): number
	return if p2.Y < p1.Y then 16 else 1
end

return function(p1)
	-- upvalues: UseAnalyticsDispatchModule (copy), ReactFocusNavigationModule (copy), FocusNavigationUtilsModule (copy), UseTokensFunction (copy), ReactModule (copy), UseLayerCollectorFunction (copy), OnFormReasonSelectedModule (copy), OnFormCommentUpdatedModule (copy), UseLocalizationFunction (copy), UseLocalizedStringsModule (copy), CreateNextOrderFunction (copy), ReasonDropdownModule (copy), UIListLayoutModule (copy), View (copy), Text (copy), IsShowGenericIllegalContentReportingLink (copy), GenericReportLink (copy), FFlagAddTakeItDownReportLinkToSurfaces (copy), GetTakeItDownReportLinkVisibilityFunction (copy), TakeItDownReportLink (copy), PartialPageModal (copy), MODALPOSITIONOFFSETModule (copy), ButtonType (copy), CloseButtonIcon (copy), ScrollView (copy), FFlagAddAbuseReportOffsetForLandscape (copy), ScrollBarVisibility (copy), FrameModule (copy), StyledTextLabel (copy), CommentTextFieldModule (copy)
	local UseAnalyticsDispatchModuleResult = UseAnalyticsDispatchModule()
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseLastInputModeResult = FocusNavigationUtilsModule.useLastInputMode()
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState("")
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(Vector2.zero)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(Vector2.zero)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(0)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(0)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState(0)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseStateResult10, UseStateResult2_9 = ReactModule.useState(0)
	local UseStateResult11, UseStateResult2_10 = ReactModule.useState(96)
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	local AbsoluteSize = UseLayerCollectorResult.absoluteSize
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_10 (copy), UseStateResult5 (copy), UseStateResult9 (copy), UseStateResult8 (copy), UseStateResult7 (copy)
		UseStateResult2_10((math.max(96, UseStateResult5.Y - (UseStateResult9 - UseStateResult8) - UseStateResult7 - 20)))
	end, {
		UseStateResult5.Y,
		UseStateResult9,
		UseStateResult8,
		UseStateResult7
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseStateResult2_6 (copy), UseStateResult2_8 (copy)
		if UseRefResult1.current then
			UseStateResult2_6(UseRefResult1.current.AbsoluteSize.Y)
			UseStateResult2_8(UseRefResult1.current.AbsolutePosition.Y)
		end
	end, { UseRefResult1.current, AbsoluteSize })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2_5 (copy), UseStateResult2_4 (copy), UseStateResult2_7 (copy)
		if not UseRefResult.current then
			UseStateResult2_4(Vector2.zero)
			
			return
		end
		local ScrollingFrame = UseRefResult.current:FindFirstChildWhichIsA("ScrollingFrame")
		
		if ScrollingFrame then
			ScrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: UseStateResult2_5 (upval), ScrollingFrame (copy), UseStateResult2_4 (upval)
				UseStateResult2_5(ScrollingFrame.AbsoluteWindowSize)
				UseStateResult2_4(ScrollingFrame.AbsoluteCanvasSize)
			end)
			ScrollingFrame.Selectable = false
		end
		UseStateResult2_7(UseRefResult.current.AbsolutePosition.Y)
	end, { UseRefResult.current, AbsoluteSize })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), UseStateResult2_9 (copy)
		if UseRefResult2.current then
			UseStateResult2_9(UseRefResult2.current.AbsoluteContentSize.Y)
		end
	end, { UseRefResult2.current })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), p1 (copy), UseStateResult4 (copy), UseStateResult2 (copy)
		if UseStateResult1 ~= "" then
			p1.onSubmit(UseStateResult1, UseStateResult4)
			
			return
		end
		if p1.reportCategoryDefaultKey == nil then
			UseStateResult2(true)
			
			return
		else
			p1.onSubmit(p1.reportCategoryDefaultKey, UseStateResult4)
		end
	end, {
		p1.onSubmit,
		UseStateResult1,
		UseStateResult4,
		UseStateResult2
	})
	local UseResult1 = ReactModule.useCallback(function(Reason_selection)
		-- upvalues: UseStateResult2_1 (copy), UseAnalyticsDispatchModuleResult (copy), OnFormReasonSelectedModule (upval), UseLastInputModeResult (copy), UseRefResult1 (copy), UseFocusGuiObjectResult (copy)
		UseStateResult2_1(Reason_selection)
		UseAnalyticsDispatchModuleResult(OnFormReasonSelectedModule({ reason_selection = Reason_selection }))
		
		if UseLastInputModeResult == "Focus" and UseRefResult1.current then
			local SpawnButton = UseRefResult1.current:FindFirstChild("SpawnButton", true)
			
			if SpawnButton and SpawnButton:IsA("GuiObject") then
				UseFocusGuiObjectResult(SpawnButton)
			end
		end
	end, {
		UseAnalyticsDispatchModuleResult,
		UseFocusGuiObjectResult,
		UseLastInputModeResult
	})
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_3 (copy), UseAnalyticsDispatchModuleResult (copy), OnFormCommentUpdatedModule (upval)
		UseStateResult2_3(p2)
		UseAnalyticsDispatchModuleResult(OnFormCommentUpdatedModule({ comment_added = #p2 > 0 }))
	end, { UseAnalyticsDispatchModuleResult })
	local UseLocalizationResult = if p1.localizationKeys then UseLocalizationFunction(p1.localizationKeys) else UseLocalizedStringsModule()
	local UseLocalizationResult1 = UseLocalizationFunction({
		submitDialogReasonSubheading = "Feature.ReportAbuse.Label.WhatWasWrong",
		selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne",
		submitDialogCommentSubheading = "Feature.ReportAbuse.Label.TellUsWhatHappened",
		submitDialogTextBoxPlaceholder = "Feature.SettingsHub.Label.ReportComment",
		defaultKey = p1.reportCategories[1].localizationKey
	})
	local NextOrder = CreateNextOrderFunction()
	local Element = ReactModule.createElement(ReasonDropdownModule, {
		menuItemHeight = 48,
		options = p1.reportCategories,
		screenSize = AbsoluteSize,
		maxHeight = UseStateResult11,
		isDropdownError = UseStateResult,
		setDropdownError = UseStateResult2,
		onSelectedAbuseType = UseResult1,
		reportCategoryDefaultKey = p1.reportCategoryDefaultKey,
		setDescription = UseStateResult2_2,
		isDisabled = p1.isDisabled
	})
	local Frame = ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = NextOrder()
	}, {
		Layout = ReactModule.createElement(UIListLayoutModule, {
			Padding = UDim.new(0, 7),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		}),
		Padding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 15) }),
		TextFrame = ReactModule.createElement(View, {
			tag = "radius-medium stroke-standard stroke-system-neutral padding-left-small",
			Size = UDim2.new(1, 0, 0, 48)
		}, {
			Text = ReactModule.createElement(Text, {
				tag = "size-full content-muted",
				Text = UseLocalizationResult1.defaultKey,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), View (upval), IsShowGenericIllegalContentReportingLink (upval), GenericReportLink (upval)
		return function()
			-- upvalues: ReactModule (upval), View (upval), IsShowGenericIllegalContentReportingLink (upval), GenericReportLink (upval)
			return ReactModule.createElement(View, {
				tag = "size-full-0 auto-y col padding-x-xlarge padding-top-small"
			}, {
				GenericReportingLink = if IsShowGenericIllegalContentReportingLink then ReactModule.createElement(GenericReportLink, { layoutOrder = 2 }) else nil
			})
		end
	end, {})
	local UseMemoResult1 = if FFlagAddTakeItDownReportLinkToSurfaces then ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), View (upval), IsShowGenericIllegalContentReportingLink (upval), GenericReportLink (upval), GetTakeItDownReportLinkVisibilityFunction (upval), TakeItDownReportLink (upval)
		return function()
			-- upvalues: ReactModule (upval), View (upval), IsShowGenericIllegalContentReportingLink (upval), GenericReportLink (upval), GetTakeItDownReportLinkVisibilityFunction (upval), TakeItDownReportLink (upval)
			return ReactModule.createElement(View, {
				tag = "col gap-medium size-full-0 auto-y padding-x-xlarge padding-top-small"
			}, {
				GenericReportLink = if IsShowGenericIllegalContentReportingLink then ReactModule.createElement(GenericReportLink) else nil,
				TakeItDownReportLink = if GetTakeItDownReportLinkVisibilityFunction() then ReactModule.createElement(TakeItDownReportLink, { layoutOrder = 2 }) else nil
			})
		end
	end, {}) else nil
	local IsShowGenericIllegalContentReportingLink1 = FFlagAddTakeItDownReportLinkToSurfaces and (IsShowGenericIllegalContentReportingLink or GetTakeItDownReportLinkVisibilityFunction())
	
	return ReactModule.createElement(PartialPageModal, {
		screenSize = Vector2.new(AbsoluteSize.X * (p1.scaleDialog and p1.scaleDialog.X or 1), (AbsoluteSize.Y - UseLayerCollectorResult.insets.top) * (p1.scaleDialog and p1.scaleDialog.Y or 1)),
		position = UDim2.new(0.5, 0, 0, UseLayerCollectorResult.insets.top + MODALPOSITIONOFFSETModule),
		anchorPoint = Vector2.new(0.5, 0),
		title = UseLocalizationResult.formTitle,
		onCloseClicked = p1.onAbandon,
		buttonStackProps = {
			buttons = {
				{
					buttonType = ButtonType.PrimaryContextual,
					props = {
						onActivated = UseResult,
						text = UseLocalizationResult.formSubmit
					}
				}
			}
		},
		footerContent = (if FFlagAddTakeItDownReportLinkToSurfaces then p1.footerContent or IsShowGenericIllegalContentReportingLink1 and UseMemoResult1 else p1.footerContent or IsShowGenericIllegalContentReportingLink and UseMemoResult) or nil,
		closeButtonIcon = if p1.useBackButton then CloseButtonIcon.Back else nil
	}, {
		SubmitContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			SubmitReportFrame = ReactModule.createElement(ScrollView, {
				Size = UDim2.new(1, 0, 0, (math.min(AbsoluteSize.Y - UseLayerCollectorResult.insets.top - (if FFlagAddAbuseReportOffsetForLandscape and AbsoluteSize.Y < AbsoluteSize.X then 180 else 100) - (if p1.footerContent == nil and IsShowGenericIllegalContentReportingLink then 25 else 0), UseStateResult10 + 50 + 50))),
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromOffset(0, 0),
					scrollBarVisibility = ScrollBarVisibility.Always,
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				ref = UseRefResult
			}, {
				Layout = ReactModule.createElement(UIListLayoutModule, {
					Padding = UDim.new(0, 16),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Ref = UseRefResult2
				}),
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 16),
					PaddingBottom = UDim.new(0, 16),
					PaddingLeft = UDim.new(0, 1),
					PaddingRight = UDim.new(0, if UseStateResult6.Y < UseStateResult5.Y then 16 else 1)
				}),
				TopCustomComponent = p1.topCustomComponent,
				ReportReasonFrame = ReactModule.createElement(FrameModule, {
					ZIndex = 2,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = NextOrder()
				}, {
					Layout = ReactModule.createElement(UIListLayoutModule, {
						Padding = UDim.new(0, 14),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left
					}),
					ReportReasonSubheading = ReactModule.createElement(StyledTextLabel, {
						text = "1. " .. UseLocalizationResult1.submitDialogReasonSubheading,
						fontStyle = UseTokensResult.Typography.TitleLarge,
						colorStyle = UseTokensResult.Color.Content.Default,
						layoutOrder = NextOrder(),
						automaticSize = Enum.AutomaticSize.XY
					}),
					DropdownPosition = ReactModule.createElement(FrameModule, {
						ZIndex = 2,
						AutomaticSize = Enum.AutomaticSize.None,
						Size = UDim2.new(1, 0, 0, 48),
						LayoutOrder = NextOrder(),
						ref = UseRefResult1
					}, {
						ReportReasonPrompt = if p1.isReportCategoryReadonly then Frame else Element
					}),
					ReportReasonSubtext = if UseStateResult then ReactModule.createElement(StyledTextLabel, {
						text = UseLocalizationResult1.selectOnePrompt,
						fontStyle = UseTokensResult.Typography.BodySmall,
						colorStyle = UseTokensResult.Color.System.Alert,
						layoutOrder = NextOrder(),
						automaticSize = Enum.AutomaticSize.XY
					}) elseif UseStateResult3 == "" then nil else ReactModule.createElement(StyledTextLabel, {
						text = UseStateResult3,
						fontStyle = UseTokensResult.Typography.BodySmall,
						colorStyle = UseTokensResult.Color.Content.Default,
						layoutOrder = NextOrder(),
						automaticSize = Enum.AutomaticSize.XY
					}),
					Padding = if UseStateResult3 == "" and not UseStateResult then nil else ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 10) })
				}),
				ReportCommentFrame = ReactModule.createElement(FrameModule, {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = NextOrder()
				}, {
					Layout = ReactModule.createElement(UIListLayoutModule, {
						Padding = UDim.new(0, 14),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left
					}),
					Padding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 15) }),
					ReportCommentSubheading = ReactModule.createElement(StyledTextLabel, {
						text = "2. " .. UseLocalizationResult1.submitDialogCommentSubheading,
						fontStyle = UseTokensResult.Typography.TitleLarge,
						colorStyle = UseTokensResult.Color.Content.Default,
						layoutOrder = NextOrder(),
						automaticSize = Enum.AutomaticSize.XY
					}),
					CommentTextField = ReactModule.createElement(CommentTextFieldModule, {
						layoutOrder = NextOrder(),
						text = UseStateResult4,
						placeholderText = UseLocalizationResult1.submitDialogTextBoxPlaceholder,
						onUpdate = UseResult2
					})
				})
			})
		})
	})
end