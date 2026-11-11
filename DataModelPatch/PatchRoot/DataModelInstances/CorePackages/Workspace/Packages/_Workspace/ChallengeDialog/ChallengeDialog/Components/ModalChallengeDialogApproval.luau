local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local Parent = ChallengeDialog.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local HttpRequestModule = require(Parent.HttpRequest)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FullPageModalWrapperModule = require(ChallengeDialog.Common.FullPageModalWrapper)
local LockModule = require(ChallengeDialog.Common.Lock)
local ModalTextComponentModule = require(ChallengeDialog.Common.ModalTextComponent)
local ModalErrorTextModule = require(ChallengeDialog.Common.ModalErrorText)
local ModalButtonConfigModule = require(ChallengeDialog.Common.ModalButtonConfig)
local ModalFooterModule = require(ChallengeDialog.Common.ModalFooter)
local FinishDialogModule = require(ChallengeDialog.Thunks.FinishDialog)
local ModalStateModule = require(ChallengeDialog.Enum.ModalState)
local ChallengeDialogActionModule = require(ChallengeDialog.Enum.ChallengeDialogAction)
local ChallengeDialogErrorModule = require(ChallengeDialog.Enum.ChallengeDialogError)
local ChallengeDialogTypeModule = require(ChallengeDialog.Enum.ChallengeDialogType)
local ChallengeDialogStateModule = require(ChallengeDialog.Enum.ChallengeDialogState)
local GetFormattedDeviceTypeFunction = require(ChallengeDialog.Common.Utils).getFormattedDeviceType
local GetFormattedRegionalLocationFunction = require(ChallengeDialog.Common.Utils).getFormattedRegionalLocation
local GetFormattedIPAddressFunction = require(ChallengeDialog.Common.Utils).getFormattedIPAddress
local GetFormattedDateTimeFunction = require(ChallengeDialog.Common.Utils).getFormattedDateTime
local EventServiceModule = require(ChallengeDialog.Analytics.EventService)
local MetricsServiceModule = require(ChallengeDialog.Analytics.MetricsService)
local ModalTextSizesModule = require(ChallengeDialog.Common.ModalTextSizes)
local DEFAULTPADDING = require(ChallengeDialog.Common.Constants).DEFAULT_PADDING
local XBUTTONSIZE = require(ChallengeDialog.Common.Constants).X_BUTTON_SIZE
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle

local function v26(City, Subdivision, Country, Type, ChallengeActionTypeTranslationKey)
	-- upvalues: ChallengeDialogTypeModule (copy)
	return {
		approve = "Authentication.TwoStepVerification.Action.Approve",
		deny = "Authentication.TwoStepVerification.Action.Deny",
		deviceTypeLabel = "Authentication.TwoStepVerification.Label.DeviceTypeLabel",
		locationLabel = "Authentication.TwoStepVerification.Label.LocationLabel",
		ipAddressLabel = "Authentication.TwoStepVerification.Label.IPAddressLabel",
		dateTimeLabel = "Authentication.TwoStepVerification.Label.DateTimeLabel",
		unknownDeviceType = "Authentication.TwoStepVerification.Label.UnknownDevice",
		unknownLocation = "Authentication.TwoStepVerification.Label.UnknownLocation",
		unknownIPAddress = "Authentication.TwoStepVerification.Label.UnknownIPAddress",
		errorMessage = "Authentication.TwoStepVerification.Response.DefaultError",
		helpMessage = "Authentication.TwoStepVerification.Label.NeedHelpMessage",
		description = if Type == ChallengeDialogTypeModule.toRawValue(ChallengeDialogTypeModule.DIALOG_TYPE_APPROVAL_2SV_GENERIC) then if ChallengeActionTypeTranslationKey == nil or ChallengeActionTypeTranslationKey == "" then "Authentication.TwoStepVerification.Description.PostLoginActionConfirmation" else ChallengeActionTypeTranslationKey else "Authentication.TwoStepVerification.Description.LoginToNewDevice",
		location = {
			"Authentication.TwoStepVerification.Label.Location",
			city = City,
			subdivision = Subdivision,
			country = Country
		},
		locationWithoutCity = {
			"Authentication.TwoStepVerification.Label.LocationWithoutCity",
			subdivision = Subdivision,
			country = Country
		},
		locationWithoutSubdivision = {
			"Authentication.TwoStepVerification.Label.LocationWithoutSubdivision",
			city = City,
			country = Country
		},
		locationWithoutCountry = {
			"Authentication.TwoStepVerification.Label.LocationWithoutCountry",
			city = City,
			subdivision = Subdivision
		}
	}
end

local ConfigResult = HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("ModalChallengeDialogApprovalHttpRetryCount", 4) else nil
})

return require(Parent.RoactRodux).connect(function(_, _)
	return {}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FinishDialogModule (copy)
	return {
		navigateToPage = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownFunction(p1))
		end,
		finishDialog = function(ConfigResult, p1, p2)
			-- upvalues: Callback (copy), FinishDialogModule (upval)
			return Callback(FinishDialogModule(ConfigResult, p1, p2))
		end
	}
end)(function(p1)
	-- upvalues: ReactModule (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), v26 (copy), MetricsServiceModule (copy), ConfigResult (copy), ChallengeDialogErrorModule (copy), ModalStateModule (copy), EventServiceModule (copy), ChallengeDialogStateModule (copy), ChallengeDialogActionModule (copy), DEFAULTPADDING (copy), ModalTextComponentModule (copy), ModalTextSizesModule (copy), FullPageModalWrapperModule (copy), XBUTTONSIZE (copy), LockModule (copy), GetFormattedDeviceTypeFunction (copy), GetFormattedRegionalLocationFunction (copy), GetFormattedIPAddressFunction (copy), GetFormattedDateTimeFunction (copy), ModalButtonConfigModule (copy), ButtonType (copy), ModalFooterModule (copy), ModalErrorTextModule (copy), AppPage (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(nil)
	local Theme = UseStyleFunction().Theme
	local UseLocalizationResult = UseLocalizationFunction((v26(p1.dialogItem.origin.city, p1.dialogItem.origin.subdivision, p1.dialogItem.origin.country, p1.dialogItem.type, p1.dialogItem.challengeActionTypeTranslationKey)))
	
	local function v40(Frame: Frame)
		-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy)
		if UseStateResult3 ~= Frame.AbsoluteSize then
			UseStateResult2_2(Frame.AbsoluteSize)
		end
	end
	
	local function v41(Frame: Frame)
		-- upvalues: UseStateResult4 (copy), UseStateResult2_3 (copy)
		if UseStateResult4 ~= Frame.AbsoluteSize then
			UseStateResult2_3(Frame.AbsoluteSize)
		end
	end
	
	local function v42(Frame)
		-- upvalues: MetricsServiceModule (upval)
		if Frame.AbsoluteSize.Y < Frame.CanvasSize.Y.Offset then
			MetricsServiceModule.loginInfoOverflowed()
		end
	end
	
	local function v43(p2, Deny, Callback, Callback1)
		-- upvalues: p1 (copy), ConfigResult (upval), ChallengeDialogErrorModule (upval), ModalStateModule (upval)
		p1.finishDialog(ConfigResult, p2, Deny):andThen(function(_)
			-- upvalues: Callback (copy)
			Callback()
		end):catch(function(Err)
			-- upvalues: ChallengeDialogErrorModule (upval), p1 (upval), ModalStateModule (upval), Callback1 (copy)
			if Err == ChallengeDialogErrorModule.InconsistentStateTransition then
				p1.navigateToModalState({
					modalState = ModalStateModule.ChallengeDialogAlreadyCompleted
				})
				
				return
			else
				Callback1(Err)
			end
		end):await()
	end
	
	local function v44(Text, Text1, ContentWidth, LayoutOrder)
		-- upvalues: ReactModule (upval), DEFAULTPADDING (upval), ModalTextComponentModule (upval), ModalTextSizesModule (upval)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			LayoutOrder = LayoutOrder
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, DEFAULTPADDING / 4),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Label = ReactModule.createElement(ModalTextComponentModule, {
				layoutOrder = 1,
				contentWidth = ContentWidth,
				size = ModalTextSizesModule.Footer,
				text = Text
			}),
			Info = ReactModule.createElement(ModalTextComponentModule, {
				layoutOrder = 2,
				useEmphasis = true,
				contentWidth = ContentWidth,
				text = Text1
			})
		})
	end
	
	return ReactModule.createElement(FullPageModalWrapperModule, {
		title = "",
		closeModal = function()
			-- upvalues: EventServiceModule (upval), p1 (copy), v43 (copy), ChallengeDialogActionModule (upval)
			v43({
				type = p1.dialogItem.type,
				typeInternalId = p1.dialogItem.typeInternalId
			}, ChallengeDialogActionModule.Deny, function()
				-- upvalues: EventServiceModule (upval), p1 (upval)
				EventServiceModule.sendDialogAbandonedEvent(p1.dialogItem.type, p1.dialogItem.typeInternalId)
				p1.closeModal()
			end, function(_)
				-- upvalues: p1 (upval)
				p1.closeModal()
			end)
		end,
		makeBodyFragment = function(ContentWidth)
			-- upvalues: ReactModule (upval), v40 (copy), DEFAULTPADDING (upval), ModalTextComponentModule (upval), XBUTTONSIZE (upval), ModalTextSizesModule (upval), UseLocalizationResult (copy), LockModule (upval), UseStateResult3 (copy), UseStateResult4 (copy), Theme (copy), v42 (copy), v41 (copy), v44 (copy), GetFormattedDeviceTypeFunction (upval), p1 (copy), GetFormattedRegionalLocationFunction (upval), GetFormattedIPAddressFunction (upval), GetFormattedDateTimeFunction (upval)
			return ReactModule.createElement(ReactModule.Fragment, nil, {
				Description = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0),
					LayoutOrder = 1,
					[ReactModule.Change.AbsoluteSize] = v40
				}, {
					ListLayout = ReactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, DEFAULTPADDING),
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					ModalBodyText = ReactModule.createElement(ModalTextComponentModule, {
						layoutOrder = 1,
						useBold = true,
						useEmphasis = true,
						contentWidth = ContentWidth - 2 * XBUTTONSIZE,
						size = ModalTextSizesModule.Header1,
						text = UseLocalizationResult.description
					}),
					Lock = ReactModule.createElement(LockModule, { layoutOrder = 2 })
				}),
				LoginAttemptInfoScrollable = ReactModule.createElement("ScrollingFrame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, -UseStateResult3.Y - DEFAULTPADDING),
					CanvasSize = UDim2.new(1, 0, 0, UseStateResult4.Y),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					ScrollBarImageColor3 = Theme.UIEmphasis.Color,
					LayoutOrder = 2,
					[ReactModule.Change.CanvasSize] = v42
				}, {
					LoginAttemptInfoCanvas = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.fromScale(1, 0),
						[ReactModule.Change.AbsoluteSize] = v41
					}, {
						ListLayout = ReactModule.createElement("UIListLayout", {
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, DEFAULTPADDING / 2),
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						ContentPadding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, DEFAULTPADDING / 2) }),
						DeviceType = v44(UseLocalizationResult.deviceTypeLabel, GetFormattedDeviceTypeFunction(p1.dialogItem.origin.deviceType, p1.dialogItem.origin.deviceOs, UseLocalizationResult), ContentWidth, 1),
						RegionalLocation = v44(UseLocalizationResult.locationLabel, GetFormattedRegionalLocationFunction(p1.dialogItem.origin.city, p1.dialogItem.origin.subdivision, p1.dialogItem.origin.country, UseLocalizationResult), ContentWidth, 2),
						IPAddress = v44(UseLocalizationResult.ipAddressLabel, GetFormattedIPAddressFunction(p1.dialogItem.origin.ipAddress, UseLocalizationResult), ContentWidth, 3),
						DateTimeInfo = v44(UseLocalizationResult.dateTimeLabel, GetFormattedDateTimeFunction(p1.dialogItem.origin.timestamp, UseLocalizationResult), ContentWidth, 4)
					})
				})
			})
		end,
		buttonConfig = ModalButtonConfigModule({
			{
				isDisabled = UseStateResult or UseStateResult1,
				isLoading = UseStateResult,
				onActivated = function()
					-- upvalues: UseStateResult2_4 (copy), UseStateResult2 (copy), EventServiceModule (upval), p1 (copy), ChallengeDialogStateModule (upval), v43 (copy), ChallengeDialogActionModule (upval)
					UseStateResult2_4(nil)
					UseStateResult2(true)
					v43({
						type = p1.dialogItem.type,
						typeInternalId = p1.dialogItem.typeInternalId
					}, ChallengeDialogActionModule.Approve, function()
						-- upvalues: EventServiceModule (upval), p1 (upval), ChallengeDialogStateModule (upval), UseStateResult2 (upval)
						EventServiceModule.sendDialogActionSelectedEvent(p1.dialogItem.type, p1.dialogItem.typeInternalId, ChallengeDialogStateModule.toRawValue(ChallengeDialogStateModule.DIALOG_STATE_APPROVED))
						UseStateResult2(false)
						p1.closeModal()
					end, function(p2)
						-- upvalues: UseStateResult2 (upval), UseStateResult2_4 (upval)
						UseStateResult2(false)
						UseStateResult2_4(p2)
					end)
				end,
				text = UseLocalizationResult.approve,
				type = ButtonType.Secondary
			},
			{
				isDisabled = UseStateResult1 or UseStateResult,
				isLoading = UseStateResult1,
				onActivated = function()
					-- upvalues: UseStateResult2_4 (copy), UseStateResult2_1 (copy), EventServiceModule (upval), p1 (copy), ChallengeDialogStateModule (upval), ModalStateModule (upval), v43 (copy), ChallengeDialogActionModule (upval)
					UseStateResult2_4(nil)
					UseStateResult2_1(true)
					v43({
						type = p1.dialogItem.type,
						typeInternalId = p1.dialogItem.typeInternalId
					}, ChallengeDialogActionModule.Deny, function()
						-- upvalues: EventServiceModule (upval), p1 (upval), ChallengeDialogStateModule (upval), UseStateResult2_1 (upval), ModalStateModule (upval)
						EventServiceModule.sendDialogActionSelectedEvent(p1.dialogItem.type, p1.dialogItem.typeInternalId, ChallengeDialogStateModule.toRawValue(ChallengeDialogStateModule.DIALOG_STATE_DENIED))
						UseStateResult2_1(false)
						p1.navigateToModalState({ modalState = ModalStateModule.ChallengeDialogDenied })
					end, function(p2)
						-- upvalues: UseStateResult2_1 (upval), UseStateResult2_4 (upval)
						UseStateResult2_1(false)
						UseStateResult2_4(p2)
					end)
				end,
				text = UseLocalizationResult.deny,
				type = ButtonType.Secondary
			}
		}),
		footerContent = ModalFooterModule(function(ContentWidth)
			-- upvalues: ReactModule (upval), UseStateResult5 (copy), ModalErrorTextModule (upval), UseLocalizationResult (copy), ModalTextComponentModule (upval), ModalTextSizesModule (upval), p1 (copy), AppPage (upval)
			return ReactModule.createElement(ReactModule.Fragment, nil, {
				ErrorMessage = UseStateResult5 and ReactModule.createElement(ModalErrorTextModule, {
					layoutOrder = 1,
					errorText = UseLocalizationResult.errorMessage,
					contentWidth = ContentWidth
				}),
				SupportLink = ReactModule.createElement(ModalTextComponentModule, {
					BackgroundTransparency = 0,
					layoutOrder = 2,
					text = UseLocalizationResult.helpMessage,
					contentWidth = ContentWidth,
					size = ModalTextSizesModule.Footer,
					onActivated = function()
						-- upvalues: p1 (upval), AppPage (upval)
						p1.navigateToPage({
							detail = "https://en.help.roblox.com/hc/en-us/articles/212459863-Add-2-Step-Verification-to-Your-Account",
							name = AppPage.GenericWebPage,
							extraProps = { title = "" }
						})
					end
				})
			})
		end)
	})
end)