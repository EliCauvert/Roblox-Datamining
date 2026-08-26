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
local var1 = dsaIllegalContentReportingModule.isShowGenericIllegalContentReportingLink()
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

local _ = function(p1, p2)
	return if p2.Y < p1.Y then 16 else 1
end

return function(p1)
	-- upvalues: useAnalyticsDispatchModule (ref), reactFocusNavigationModule (ref), focusNavigationUtilsModule (ref), useTokens (ref), reactModule (ref), useLayerCollector (ref), fFlagChatLineReportingFocusFixesEnabled (ref), onFormReasonSelectedModule (ref), onFormCommentUpdatedModule (ref), useLocalization (ref), useLocalizedStringsModule (ref), createNextOrder (ref), reasonDropdownModule (ref), UIListLayoutModule (ref), view (ref), text (ref), var1 (ref), genericReportLink (ref), fFlagAddTakeItDownReportLinkToSurfaces (ref), getTakeItDownReportLinkVisibility (ref), takeItDownReportLink (ref), partialPageModal (ref), MODAL_POSITION_OFFSETModule (ref), buttonType (ref), closeButtonIcon (ref), scrollView (ref), fFlagAddAbuseReportOffsetForLandscape (ref), scrollBarVisibility (ref), frameModule (ref), styledTextLabel (ref), commentTextFieldModule (ref)
	local var2 = useAnalyticsDispatchModule()
	local var3 = reactFocusNavigationModule.useFocusGuiObject()
	local var4 = focusNavigationUtilsModule.useLastInputMode()
	local var5 = useTokens()
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState("")
	local var10, var11 = reactModule.useState("")
	local var12, var13 = reactModule.useState("")
	local var14 = reactModule.useRef(nil)
	local var15, var16 = reactModule.useState(Vector2.zero)
	local var17, var18 = reactModule.useState(Vector2.zero)
	local var19, var20 = reactModule.useState(0)
	local var21, var22 = reactModule.useState(0)
	local var23 = reactModule.useRef(nil)
	local var24, var25 = reactModule.useState(0)
	local var26 = reactModule.useRef(nil)
	local var27, var28 = reactModule.useState(0)
	local var29, var30 = reactModule.useState(96)
	local var31 = useLayerCollector()
	local absoluteSize = var31.absoluteSize
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), var15 (ref), var24 (ref), var21 (ref), var19 (ref)
		var30(math.max(96, var15.Y - (var24 - var21) - var19 - 20))
	end, { var15.Y, var24, var21, var19 })
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), var20 (ref), var25 (ref)
		if var23.current then
			var20(var23.current.AbsoluteSize.Y)
			var25(var23.current.AbsolutePosition.Y)
		end
	end, { var23.current, absoluteSize })
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var18 (ref), var16 (ref), fFlagChatLineReportingFocusFixesEnabled (copy), var22 (ref)
		if not var14.current then
			var16(Vector2.zero)
			
			return
		end
		local scrollingFrame = var14.current:FindFirstChildWhichIsA("ScrollingFrame")
		
		if scrollingFrame then
			scrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: var18 (copy), scrollingFrame (ref), var16 (copy)
				var18(scrollingFrame.AbsoluteWindowSize)
				var16(scrollingFrame.AbsoluteCanvasSize)
			end)
			
			if fFlagChatLineReportingFocusFixesEnabled then
				scrollingFrame.Selectable = false
			end
		end
		var22(var14.current.AbsolutePosition.Y)
	end, { var14.current, absoluteSize })
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), var28 (ref)
		if var26.current then
			var28(var26.current.AbsoluteContentSize.Y)
		end
	end, { var26.current })
	local var32 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), p1 (ref), var12 (ref), var7 (ref)
		if var8 ~= "" then
			p1.onSubmit(var8, var12)
			
			return
		elseif p1.reportCategoryDefaultKey == nil then
			var7(true)
			
			return
		end
		p1.onSubmit(p1.reportCategoryDefaultKey, var12)
	end, { p1.onSubmit, var8, var12, var7 })
	local var33 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), var2 (ref), onFormReasonSelectedModule (copy), fFlagChatLineReportingFocusFixesEnabled (copy), var4 (ref), var23 (ref), var3 (ref)
		var9(p2)
		var2(onFormReasonSelectedModule({ reason_selection = p2 }))
		
		if fFlagChatLineReportingFocusFixesEnabled and var4 == "Focus" and var23.current then
			local spawnButton = var23.current:FindFirstChild("SpawnButton", true)
			
			if spawnButton and spawnButton:IsA("GuiObject") then
				var3(spawnButton)
			end
		end
	end, if fFlagChatLineReportingFocusFixesEnabled then { var2, var3, var4 } else { var2 })
	local var34 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref), var2 (ref), onFormCommentUpdatedModule (copy)
		var13(p2)
		var2(onFormCommentUpdatedModule({ comment_added = #p2 > 0 }))
	end, { var2 })
	local var35 = if p1.localizationKeys then useLocalization(p1.localizationKeys) else useLocalizedStringsModule()
	local var36 = useLocalization({
		submitDialogReasonSubheading = "Feature.ReportAbuse.Label.WhatWasWrong",
		selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne",
		submitDialogCommentSubheading = "Feature.ReportAbuse.Label.TellUsWhatHappened",
		submitDialogTextBoxPlaceholder = "Feature.SettingsHub.Label.ReportComment",
		defaultKey = p1.reportCategories[1].localizationKey
	})
	local var37 = createNextOrder()
	
	return reactModule.createElement(partialPageModal, {
		screenSize = Vector2.new(absoluteSize.X * (if p1.scaleDialog then p1.scaleDialog.X else 1), (absoluteSize.Y - var31.insets.top) * (if p1.scaleDialog then p1.scaleDialog.Y else 1)),
		position = UDim2.new(0.5, 0, 0, var31.insets.top + MODAL_POSITION_OFFSETModule),
		anchorPoint = Vector2.new(0.5, 0),
		title = var35.formTitle,
		onCloseClicked = p1.onAbandon,
		buttonStackProps = {
			buttons = {
				{
					buttonType = buttonType.PrimaryContextual,
					props = { onActivated = var32, text = var35.formSubmit }
				}
			}
		},
		footerContent = if fFlagAddTakeItDownReportLinkToSurfaces then p1.footerContent or (if fFlagAddTakeItDownReportLinkToSurfaces and (var1 or getTakeItDownReportLinkVisibility()) then if fFlagAddTakeItDownReportLinkToSurfaces then reactModule.useMemo(function()
			-- upvalues: reactModule (copy), view (copy), var1 (copy), genericReportLink (copy), getTakeItDownReportLinkVisibility (copy), takeItDownReportLink (copy)
			return function()
				-- upvalues: reactModule (copy), view (copy), var1 (copy), genericReportLink (copy), getTakeItDownReportLinkVisibility (copy), takeItDownReportLink (copy)
				return reactModule.createElement(view, {
					tag = "col gap-medium size-full-0 auto-y padding-x-xlarge padding-top-small"
				}, {
					GenericReportLink = if var1 then reactModule.createElement(genericReportLink) else nil,
					TakeItDownReportLink = if getTakeItDownReportLinkVisibility() then reactModule.createElement(takeItDownReportLink, { layoutOrder = 2 }) else nil
				})
			end
		end, {}) else nil else nil) else p1.footerContent or (if var1 then reactModule.useMemo(function()
			-- upvalues: reactModule (copy), view (copy), var1 (copy), genericReportLink (copy)
			return function()
				-- upvalues: reactModule (copy), view (copy), var1 (copy), genericReportLink (copy)
				return reactModule.createElement(view, {
					tag = "size-full-0 auto-y col padding-x-xlarge padding-top-small"
				}, {
					GenericReportingLink = if var1 then reactModule.createElement(genericReportLink, { layoutOrder = 2 }) else nil
				})
			end
		end, {}) else nil),
		closeButtonIcon = if p1.useBackButton then closeButtonIcon.Back else nil
	}, {
		SubmitContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			SubmitReportFrame = reactModule.createElement(scrollView, {
				Size = UDim2.new(1, 0, 0, math.min(absoluteSize.Y - var31.insets.top - (if fFlagAddAbuseReportOffsetForLandscape then if absoluteSize.Y < absoluteSize.X then 180 else 100 else 100) - (if p1.footerContent == nil and var1 then 25 else 0), var27 + 50 + 50)),
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromOffset(0, 0),
					scrollBarVisibility = scrollBarVisibility.Always,
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				ref = var14
			}, {
				Layout = reactModule.createElement(UIListLayoutModule, {
					Padding = UDim.new(0, 16),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Ref = var26
				}),
				Padding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 16),
					PaddingBottom = UDim.new(0, 16),
					PaddingLeft = UDim.new(0, 1),
					PaddingRight = UDim.new(0, if var17.Y < var15.Y then 16 else 1)
				}),
				TopCustomComponent = p1.topCustomComponent,
				ReportReasonFrame = reactModule.createElement(frameModule, {
					ZIndex = 2,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = var37()
				}, {
					Layout = reactModule.createElement(UIListLayoutModule, {
						Padding = UDim.new(0, 14),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left
					}),
					ReportReasonSubheading = reactModule.createElement(styledTextLabel, {
						text = "1. " .. var52.submitDialogReasonSubheading,
						fontStyle = var5.Typography.TitleLarge,
						colorStyle = var5.Color.Content.Default,
						layoutOrder = var37(),
						automaticSize = Enum.AutomaticSize.XY
					}),
					DropdownPosition = reactModule.createElement(frameModule, {
						ZIndex = 2,
						AutomaticSize = Enum.AutomaticSize.None,
						Size = UDim2.new(1, 0, 0, 48),
						LayoutOrder = var37(),
						ref = var23
					}, {
						ReportReasonPrompt = if p1.isReportCategoryReadonly then reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							LayoutOrder = var37()
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
									Text = var36.defaultKey,
									TextXAlignment = Enum.TextXAlignment.Left
								})
							})
						}) else reactModule.createElement(reasonDropdownModule, {
							menuItemHeight = 48,
							options = p1.reportCategories,
							screenSize = absoluteSize,
							maxHeight = var29,
							isDropdownError = var6,
							setDropdownError = var7,
							onSelectedAbuseType = var33,
							reportCategoryDefaultKey = p1.reportCategoryDefaultKey,
							setDescription = var11,
							isDisabled = p1.isDisabled
						})
					}),
					ReportReasonSubtext = if var6 then reactModule.createElement(styledTextLabel, {
						text = var36.selectOnePrompt,
						fontStyle = var5.Typography.BodySmall,
						colorStyle = var5.Color.System.Alert,
						layoutOrder = var37(),
						automaticSize = Enum.AutomaticSize.XY
					}) elseif var10 ~= "" then nil else reactModule.createElement(styledTextLabel, {
						text = var10,
						fontStyle = var5.Typography.BodySmall,
						colorStyle = var5.Color.Content.Default,
						layoutOrder = var37(),
						automaticSize = Enum.AutomaticSize.XY
					}),
					Padding = if var10 == "" and not var6 then nil else reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 10) })
				}),
				ReportCommentFrame = reactModule.createElement(frameModule, {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = var37()
				}, {
					Layout = reactModule.createElement(UIListLayoutModule, {
						Padding = UDim.new(0, 14),
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left
					}),
					Padding = reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 15) }),
					ReportCommentSubheading = reactModule.createElement(styledTextLabel, {
						text = "2. " .. var52.submitDialogCommentSubheading,
						fontStyle = var5.Typography.TitleLarge,
						colorStyle = var5.Color.Content.Default,
						layoutOrder = var37(),
						automaticSize = Enum.AutomaticSize.XY
					}),
					CommentTextField = reactModule.createElement(commentTextFieldModule, {
						layoutOrder = var37(),
						text = var12,
						placeholderText = var36.submitDialogTextBoxPlaceholder,
						onUpdate = var34
					})
				})
			})
		})
	})
end