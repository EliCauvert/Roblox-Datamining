local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dsaIllegalContentReportingModule = require(parent.DsaIllegalContentReporting)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useLocalizedStringsModule = require(genericAbuseReporting.LocalizationKeys.useLocalizedStrings)
local commentTextFieldModule = require(genericAbuseReporting.Common.CommentTextField)
local frameModule = require(genericAbuseReporting.Common.Frame)
local UIListLayoutModule = require(genericAbuseReporting.Common.UIListLayout)
local reasonDropdownModule = require(genericAbuseReporting.Common.ReasonDropdown)
local MODAL_POSITION_OFFSETModule = require(genericAbuseReporting.Common.MODAL_POSITION_OFFSET)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local closeButtonIcon = UIBloxModule.App.Dialog.Enum.CloseButtonIcon
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local text = foundationModule.Text
local genericReportLink = dsaIllegalContentReportingModule.GenericReportLink
local var14 = dsaIllegalContentReportingModule.isShowGenericIllegalContentReportingLink()
local takeItDownReportLink = dsaIllegalContentReportingModule.TakeItDownReportLink
local getTakeItDownReportLinkVisibility = dsaIllegalContentReportingModule.getTakeItDownReportLinkVisibility
local useAnalyticsDispatchModule = require(genericAbuseReporting.Analytics.useAnalyticsDispatch)
local onFormCommentUpdatedModule = require(genericAbuseReporting.Analytics.Actions.OnFormCommentUpdated)
local onFormReasonSelectedModule = require(genericAbuseReporting.Analytics.Actions.OnFormReasonSelected)
local createNextOrder = require(parent.ReactUtils).createNextOrder
local fFlagChatLineReportingFocusFixesEnabled = sharedFlagsModule.FFlagChatLineReportingFocusFixesEnabled
local fFlagAddAbuseReportOffsetForLandscape = sharedFlagsModule.FFlagAddAbuseReportOffsetForLandscape
local fFlagAddTakeItDownReportLinkToSurfaces = sharedFlagsModule.FFlagAddTakeItDownReportLinkToSurfaces

local function _(value)
	-- upvalues: fFlagAddAbuseReportOffsetForLandscape (ref)
	return if fFlagAddAbuseReportOffsetForLandscape then if value.Y < value.X then 180 else 100 else 100
end

local _ = function(p0, p1)
	return if p1.Y < p0.Y then 16 else 1
end

return function(p2)
	-- upvalues: useAnalyticsDispatchModule (ref), reactFocusNavigationModule (ref), focusNavigationUtilsModule (ref), useTokens (ref), reactModule (ref), useLayerCollector (ref), fFlagChatLineReportingFocusFixesEnabled (ref), onFormReasonSelectedModule (ref), onFormCommentUpdatedModule (ref), useLocalization (ref), useLocalizedStringsModule (ref), createNextOrder (ref), reasonDropdownModule (ref), UIListLayoutModule (ref), view (ref), text (ref), var14 (ref), genericReportLink (ref), fFlagAddTakeItDownReportLinkToSurfaces (ref), getTakeItDownReportLinkVisibility (ref), takeItDownReportLink (ref), partialPageModal (ref), MODAL_POSITION_OFFSETModule (ref), buttonType (ref), closeButtonIcon (ref), scrollView (ref), fFlagAddAbuseReportOffsetForLandscape (ref), scrollBarVisibility (ref), frameModule (ref), styledTextLabel (ref), commentTextFieldModule (ref)
	local var18 = useAnalyticsDispatchModule()
	local var19 = reactFocusNavigationModule.useFocusGuiObject()
	local var20 = focusNavigationUtilsModule.useLastInputMode()
	local var21 = useTokens()
	local var22, var23 = reactModule.useState(false)
	local var24, var25 = reactModule.useState("")
	local var26, var27 = reactModule.useState("")
	local var28, var29 = reactModule.useState("")
	local var30 = reactModule.useRef(nil)
	local var31, var32 = reactModule.useState(Vector2.zero)
	local var33, var34 = reactModule.useState(Vector2.zero)
	local var35, var36 = reactModule.useState(0)
	local var37, var38 = reactModule.useState(0)
	local var39 = reactModule.useRef(nil)
	local var40, var41 = reactModule.useState(0)
	local var42 = reactModule.useRef(nil)
	local var43, var44 = reactModule.useState(0)
	local var45, var46 = reactModule.useState(96)
	local var47 = useLayerCollector()
	local absoluteSize = var47.absoluteSize
	reactModule.useEffect(function()
		-- upvalues: var46 (ref), var31 (ref), var40 (ref), var37 (ref), var35 (ref)
		var46(math.max(96, var31.Y - (var40 - var37) - var35 - 20))
	end, { var31.Y, var40, var37, var35 })
	reactModule.useEffect(function()
		-- upvalues: var39 (ref), var36 (ref), var41 (ref)
		if var39.current then
			var36(var39.current.AbsoluteSize.Y)
			var41(var39.current.AbsolutePosition.Y)
		end
	end, { var39.current, absoluteSize })
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), var34 (ref), var32 (ref), fFlagChatLineReportingFocusFixesEnabled (copy), var38 (ref)
		if not var30.current then
			var32(Vector2.zero)
			
			return
		end
		local scrollingFrame = var30.current:FindFirstChildWhichIsA("ScrollingFrame")
		
		if scrollingFrame then
			scrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: var34 (copy), scrollingFrame (ref), var32 (copy)
				var34(scrollingFrame.AbsoluteWindowSize)
				var32(scrollingFrame.AbsoluteCanvasSize)
			end)
			
			if fFlagChatLineReportingFocusFixesEnabled then
				scrollingFrame.Selectable = false
			end
		end
		var38(var30.current.AbsolutePosition.Y)
	end, { var30.current, absoluteSize })
	reactModule.useEffect(function()
		-- upvalues: var42 (ref), var44 (ref)
		if var42.current then
			var44(var42.current.AbsoluteContentSize.Y)
		end
	end, { var42.current })
	local var48 = reactModule.useCallback(function()
		-- upvalues: var24 (ref), p2 (ref), var28 (ref), var23 (ref)
		if var24 ~= "" then
			p2.onSubmit(var24, var28)
			
			return
		elseif p2.reportCategoryDefaultKey == nil then
			var23(true)
			
			return
		end
		p2.onSubmit(p2.reportCategoryDefaultKey, var28)
	end, { p2.onSubmit, var24, var28, var23 })
	local var49 = reactModule.useCallback(function(p3)
		-- upvalues: var25 (ref), var18 (ref), onFormReasonSelectedModule (copy), fFlagChatLineReportingFocusFixesEnabled (copy), var20 (ref), var39 (ref), var19 (ref)
		var25(p3)
		var18(onFormReasonSelectedModule({ reason_selection = p3 }))
		
		if fFlagChatLineReportingFocusFixesEnabled and var20 == "Focus" and var39.current then
			local spawnButton = var39.current:FindFirstChild("SpawnButton", true)
			
			if spawnButton and spawnButton:IsA("GuiObject") then
				var19(spawnButton)
			end
		end
	end, if fFlagChatLineReportingFocusFixesEnabled then { var18, var19, var20 } else { var18 })
	local var50 = reactModule.useCallback(function(p4)
		-- upvalues: var29 (ref), var18 (ref), onFormCommentUpdatedModule (copy)
		var29(p4)
		var18(onFormCommentUpdatedModule({ comment_added = #p4 > 0 }))
	end, { var18 })
	local var51 = if p2.localizationKeys then useLocalization(p2.localizationKeys) else useLocalizedStringsModule()
	local var52 = useLocalization({
		submitDialogReasonSubheading = "Feature.ReportAbuse.Label.WhatWasWrong",
		selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne",
		submitDialogCommentSubheading = "Feature.ReportAbuse.Label.TellUsWhatHappened",
		submitDialogTextBoxPlaceholder = "Feature.SettingsHub.Label.ReportComment",
		defaultKey = p2.reportCategories[1].localizationKey
	})
	local var53 = createNextOrder()
	
	return reactModule.createElement(partialPageModal, {
		screenSize = Vector2.new(absoluteSize.X * (if p2.scaleDialog then p2.scaleDialog.X else 1), (absoluteSize.Y - var47.insets.top) * (if p2.scaleDialog then p2.scaleDialog.Y else 1)),
		position = UDim2.new(0.5, 0, 0, var47.insets.top + MODAL_POSITION_OFFSETModule),
		anchorPoint = Vector2.new(0.5, 0),
		title = var51.formTitle,
		onCloseClicked = p2.onAbandon,
		buttonStackProps = {
			buttons = {
				{
					buttonType = buttonType.PrimaryContextual,
					props = { onActivated = var48, text = var51.formSubmit }
				}
			}
		},
		footerContent = if fFlagAddTakeItDownReportLinkToSurfaces then p2.footerContent or (if fFlagAddTakeItDownReportLinkToSurfaces and (var14 or getTakeItDownReportLinkVisibility()) then if fFlagAddTakeItDownReportLinkToSurfaces then reactModule.useMemo(function()
			-- upvalues: reactModule (copy), view (copy), var14 (copy), genericReportLink (copy), getTakeItDownReportLinkVisibility (copy), takeItDownReportLink (copy)
			return function()
				-- upvalues: reactModule (copy), view (copy), var14 (copy), genericReportLink (copy), getTakeItDownReportLinkVisibility (copy), takeItDownReportLink (copy)
				return reactModule.createElement(view, {
					tag = "col gap-medium size-full-0 auto-y padding-x-xlarge padding-top-small"
				}, {
					GenericReportLink = if var14 then reactModule.createElement(genericReportLink) else nil,
					TakeItDownReportLink = if getTakeItDownReportLinkVisibility() then reactModule.createElement(takeItDownReportLink, { layoutOrder = 2 }) else nil
				})
			end
		end, {}) else nil else nil) else p2.footerContent or (if var14 then reactModule.useMemo(function()
			-- upvalues: reactModule (copy), view (copy), var14 (copy), genericReportLink (copy)
			return function()
				-- upvalues: reactModule (copy), view (copy), var14 (copy), genericReportLink (copy)
				return reactModule.createElement(view, {
					tag = "size-full-0 auto-y col padding-x-xlarge padding-top-small"
				}, {
					GenericReportingLink = if var14 then reactModule.createElement(genericReportLink, { layoutOrder = 2 }) else nil
				})
			end
		end, {}) else nil),
		closeButtonIcon = if p2.useBackButton then closeButtonIcon.Back else nil
	}, {
		SubmitContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			SubmitReportFrame = reactModule.createElement(scrollView, {
				Size = UDim2.new(1, 0, 0, math.min(absoluteSize.Y - var47.insets.top - (if fFlagAddAbuseReportOffsetForLandscape then if absoluteSize.Y < absoluteSize.X then 180 else 100 else 100) - (if p2.footerContent == nil and var14 then 25 else 0), var43 + 50 + 50)),
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromOffset(0, 0),
					scrollBarVisibility = scrollBarVisibility.Always,
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				ref = var30
			}, {
				Layout = reactModule.createElement(UIListLayoutModule, {
					Padding = UDim.new(0, 16),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Ref = var42
				}),
				Padding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 16),
					PaddingBottom = UDim.new(0, 16),
					PaddingLeft = UDim.new(0, 1),
					PaddingRight = UDim.new(0, if var33.Y < var31.Y then 16 else 1)
				}),
				TopCustomComponent = p2.topCustomComponent,
				ReportReasonFrame = reactModule.createElement(frameModule, {
					ZIndex = 2,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = var53()
				}, {
					Layout = reactModule.createElement(UIListLayoutModule, {
						Padding = UDim.new(0, 14),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left
					}),
					ReportReasonSubheading = reactModule.createElement(styledTextLabel, {
						text = "1. " .. var52.submitDialogReasonSubheading,
						fontStyle = var21.Typography.TitleLarge,
						colorStyle = var21.Color.Content.Default,
						layoutOrder = var53(),
						automaticSize = Enum.AutomaticSize.XY
					}),
					DropdownPosition = reactModule.createElement(frameModule, {
						ZIndex = 2,
						AutomaticSize = Enum.AutomaticSize.None,
						Size = UDim2.new(1, 0, 0, 48),
						LayoutOrder = var53(),
						ref = var39
					}, {
						ReportReasonPrompt = if p2.isReportCategoryReadonly then reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							LayoutOrder = var53()
						}, {
							Layout = reactModule.createElement(UIListLayoutModule, {
								Padding = UDim.new(0, 7),
								FillDirection = Enum.FillDirection.Vertical,
								HorizontalAlignment = Enum.HorizontalAlignment.Left
							}),
							Padding = reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 15) }),
							TextFrame = reactModule.createElement(view, {
								tag = "radius-medium stroke-standard stroke-system-neutral padding-left-small",
								Size = UDim2.new(1, 0, 0, 48)
							}, {
								Text = reactModule.createElement(text, {
									tag = "size-full content-muted",
									Text = var52.defaultKey,
									TextXAlignment = Enum.TextXAlignment.Left
								})
							})
						}) else reactModule.createElement(reasonDropdownModule, {
							menuItemHeight = 48,
							options = p2.reportCategories,
							screenSize = absoluteSize,
							maxHeight = var45,
							isDropdownError = var22,
							setDropdownError = var23,
							onSelectedAbuseType = var49,
							reportCategoryDefaultKey = p2.reportCategoryDefaultKey,
							setDescription = var27,
							isDisabled = p2.isDisabled
						})
					}),
					ReportReasonSubtext = if var22 then reactModule.createElement(styledTextLabel, {
						text = var52.selectOnePrompt,
						fontStyle = var21.Typography.BodySmall,
						colorStyle = var21.Color.System.Alert,
						layoutOrder = var53(),
						automaticSize = Enum.AutomaticSize.XY
					}) elseif var26 ~= "" then nil else reactModule.createElement(styledTextLabel, {
						text = var26,
						fontStyle = var21.Typography.BodySmall,
						colorStyle = var21.Color.Content.Default,
						layoutOrder = var53(),
						automaticSize = Enum.AutomaticSize.XY
					}),
					Padding = if var26 == "" and not var22 then nil else reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 10) })
				}),
				ReportCommentFrame = reactModule.createElement(frameModule, {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = var53()
				}, {
					Layout = reactModule.createElement(UIListLayoutModule, {
						Padding = UDim.new(0, 14),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left
					}),
					Padding = reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 15) }),
					ReportCommentSubheading = reactModule.createElement(styledTextLabel, {
						text = "2. " .. var52.submitDialogCommentSubheading,
						fontStyle = var21.Typography.TitleLarge,
						colorStyle = var21.Color.Content.Default,
						layoutOrder = var53(),
						automaticSize = Enum.AutomaticSize.XY
					}),
					CommentTextField = reactModule.createElement(commentTextFieldModule, {
						layoutOrder = var53(),
						text = var28,
						placeholderText = var52.submitDialogTextBoxPlaceholder,
						onUpdate = var50
					})
				})
			})
		})
	})
end