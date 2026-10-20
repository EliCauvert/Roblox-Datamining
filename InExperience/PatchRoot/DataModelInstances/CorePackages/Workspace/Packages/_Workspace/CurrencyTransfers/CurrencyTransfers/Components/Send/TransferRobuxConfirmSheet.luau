local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SharedFlagsModule = require(Parent.SharedFlags)
local TransferLocalizationKeysModule = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Sheet = FoundationModule.Sheet
local Button = FoundationModule.Button
local View = FoundationModule.View
local Text = FoundationModule.Text
local FillBehavior = FoundationModule.Enums.FillBehavior
local Enums = FoundationModule.Enums
local IconVariant = FoundationModule.Enums.IconVariant
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TransferRobuxHeaderModule = require(CurrencyTransfers.Components.Generic.TransferRobuxHeader)
local TransferProfileThumbnailModule = require(CurrencyTransfers.Components.Generic.TransferProfileThumbnail)
local RobuxTextModule = require(CurrencyTransfers.Components.Generic.RobuxText)
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)
local SetTransferPromptStateModule = require(CurrencyTransfers.Actions.Send.setTransferPromptState)
local ProcessTransferModule = require(CurrencyTransfers.Actions.Send.processTransfer)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventNameModule = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local LogCurrencyTransferCounterModule = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local LogRobuxTransferFlowEventModule = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)
local GetFFlagCurrencyTransferFlowUIImprovementFixModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFlowUIImprovementFix)
local GetFIntCurrencyTransferDeveloperCommissionRateModule = require(CurrencyTransfers.Flags.GetFIntCurrencyTransferDeveloperCommissionRate)
local GetFIntCurrencyTransferPlatformFeeRateModule = require(CurrencyTransfers.Flags.GetFIntCurrencyTransferPlatformFeeRate)
local GetFFlagCurrencyTransferFocusNavigationModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFocusNavigation)
local UseTransferSheetFocusModule = require(CurrencyTransfers.Hooks.useTransferSheetFocus)

return function(_)
	-- upvalues: UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), UseTransferStoreModule (copy), ReactModule (copy), LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), SharedFlagsModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy), SignalsReactModule (copy), TransferOriginationModule (copy), GetFFlagCurrencyTransferFocusNavigationModule (copy), UseTransferSheetFocusModule (copy), GetFFlagCurrencyTransferFlowUIImprovementFixModule (copy), GetFIntCurrencyTransferDeveloperCommissionRateModule (copy), GetFIntCurrencyTransferPlatformFeeRateModule (copy), Sheet (copy), TransferRobuxHeaderModule (copy), View (copy), TransferProfileThumbnailModule (copy), Text (copy), GetIconRichTextFunction (copy), Enums (copy), IconVariant (copy), RobuxTextModule (copy), Button (copy), SetTransferPromptStateModule (copy), PromptStateModule (copy), ProcessTransferModule (copy), ButtonVariant (copy), FillBehavior (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.TransferRobuxConfirmSheet)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	ReactModule.useEffect(function()
		-- upvalues: LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval)
		LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferConfirmSheetShownCounter)
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.confirm_shown)
		end
		return nil
	end, { UseTransferStoreModuleResult })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getRobuxBalanceAmount) or 0
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getSelectedAmount) or 0
	local UserRelationshipDetail = UseTransferStoreModuleResult.getUserRelationshipDetail(false)
	local Recipient = UseTransferStoreModuleResult.getRecipient(false)
	local IsTransferOriginationMatch = UseTransferStoreModuleResult.getTransferOrigination(false) == TransferOriginationModule.InExperience
	local TriggerOnClose = UseTransferStoreModuleResult.triggerOnClose
	local Ref = nil
	local Ref1 = nil
	
	if GetFFlagCurrencyTransferFocusNavigationModule() then
		Ref, Ref1 = UseTransferSheetFocusModule(TriggerOnClose)
	end
	local Year = os.date("*t").year
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserRelationshipDetail)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Recipient)
	ReactModule.useEffect(function()
		-- upvalues: UserRelationshipDetail (copy), UseStateResult2 (copy)
		if UserRelationshipDetail then
			UseStateResult2(UserRelationshipDetail)
		end
	end, { UserRelationshipDetail })
	ReactModule.useEffect(function()
		-- upvalues: Recipient (copy), UseStateResult2_1 (copy)
		if Recipient then
			UseStateResult2_1(Recipient)
		end
	end, { Recipient })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetFFlagCurrencyTransferFlowUIImprovementFixModule (upval), UseStateResult (copy), UseLocalizationResult (copy), Year (copy)
		if GetFFlagCurrencyTransferFlowUIImprovementFixModule() then
			if not UseStateResult or not UseStateResult.friendSinceDate then
				return UseLocalizationResult.NewConnection
			end
			local FriendSinceDate = UseStateResult.friendSinceDate
			local Timestamp = os.time()
			local Floored = math.floor((Timestamp - os.time({
				hour = 0,
				min = 0,
				sec = 0,
				year = FriendSinceDate.year,
				month = FriendSinceDate.month,
				day = FriendSinceDate.day
			})) / 86400)
			
			if Floored < 1 then
				return UseLocalizationResult.NewConnection
			end
			local DateInfo = os.date("*t", Timestamp)
			local NewYear = (DateInfo.year - FriendSinceDate.year) * 12 + (DateInfo.month - FriendSinceDate.month)
			
			if DateInfo.day < FriendSinceDate.day then
				NewYear -= 1
			end
			return if NewYear >= 12 then string.gsub(UseLocalizationResult.ConnectedYear, "{year}", (tostring((math.floor(NewYear / 12))))) elseif NewYear >= 1 then if NewYear <= 1 then string.gsub(UseLocalizationResult.ConnectedMonthsSingular, "{amount}", (tostring(NewYear))) else string.gsub(UseLocalizationResult.ConnectedMonths, "{amount}", (tostring(NewYear))) elseif Floored <= 1 then string.gsub(UseLocalizationResult.ConnectedDaysSingular, "{amount}", (tostring(Floored))) else string.gsub(UseLocalizationResult.ConnectedDays, "{amount}", (tostring(Floored)))
		elseif UseStateResult and UseStateResult.friendSinceYear then
			local YearDelta = Year - UseStateResult.friendSinceYear
			
			return if YearDelta == 0 then UseLocalizationResult.NewConnection else string.gsub(UseLocalizationResult.ConnectedYear, "{year}", (tostring(YearDelta)))
		else
			return UseLocalizationResult.NewConnection
		end
	end, {
		Year, UseStateResult, UseLocalizationResult.ConnectedYear,
		UseLocalizationResult.ConnectedMonths,
		UseLocalizationResult.ConnectedMonthsSingular,
		UseLocalizationResult.ConnectedDays,
		UseLocalizationResult.ConnectedDaysSingular,
		UseLocalizationResult.NewConnection
	})
	local UseMemoResult1 = ReactModule.useMemo(function(): string
		-- upvalues: UseStateResult (copy), GetFFlagCurrencyTransferFlowUIImprovementFixModule (upval), UseLocalizationResult (copy)
		local MutualFriendsCount: number = UseStateResult.mutualFriendsCount
		
		return if GetFFlagCurrencyTransferFlowUIImprovementFixModule() and UseStateResult.areFriends and MutualFriendsCount <= 1 then string.gsub(UseLocalizationResult.MutualConnectionSingular, "{amount}", (tostring(MutualFriendsCount))) else string.gsub(UseLocalizationResult.MutualConnection, "{amount}", (tostring(MutualFriendsCount)))
	end, {
		UseStateResult.mutualFriendsCount,
		UseStateResult.areFriends,
		UseLocalizationResult.MutualConnection,
		UseLocalizationResult.MutualConnectionSingular
	})
	local UseMemoResult2 = ReactModule.useMemo(function(): string
		-- upvalues: UseLocalizationResult (copy), UseStateResult (copy)
		return string.gsub(UseLocalizationResult.JoinedInYear, "{year}", (tostring(UseStateResult.userAccountSinceYear)))
	end, { UseStateResult.userAccountSinceYear })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: GetFFlagCurrencyTransferFlowUIImprovementFixModule (upval), IsTransferOriginationMatch (copy), UseSignalStateResult1 (copy), GetFIntCurrencyTransferDeveloperCommissionRateModule (upval), GetFIntCurrencyTransferPlatformFeeRateModule (upval), UseLocalizationResult (copy)
		return if GetFFlagCurrencyTransferFlowUIImprovementFixModule() then if IsTransferOriginationMatch and UseSignalStateResult1 then string.gsub(string.gsub(UseLocalizationResult.RecipientWillGetInGame, "{amount}", (tostring((math.ceil(UseSignalStateResult1 * (1 - (GetFIntCurrencyTransferDeveloperCommissionRateModule() + GetFIntCurrencyTransferPlatformFeeRateModule()) / 100)))))), "{commissionPercentage}", (tostring((GetFIntCurrencyTransferDeveloperCommissionRateModule())))) elseif UseSignalStateResult1 then string.gsub(UseLocalizationResult.RecipientWillGetInApp, "{amount}", (tostring(UseSignalStateResult1))) else nil elseif IsTransferOriginationMatch and UseSignalStateResult1 then string.gsub(UseLocalizationResult.RecipientWillGet, "{amount}", (tostring((math.ceil(UseSignalStateResult1 * (1 - (GetFIntCurrencyTransferDeveloperCommissionRateModule() + GetFIntCurrencyTransferPlatformFeeRateModule()) / 100)))))) else nil
	end, {
		IsTransferOriginationMatch, UseSignalStateResult1,
		UseLocalizationResult.RecipientWillGet,
		UseLocalizationResult.RecipientWillGetInGame,
		UseLocalizationResult.RecipientWillGetInApp,
		GetFFlagCurrencyTransferFlowUIImprovementFixModule()
	})
	local SizeFull0AutoYTextBodySmallTextWrapTextAlignXCenterContentDefault: string = if GetFFlagCurrencyTransferFlowUIImprovementFixModule() then "size-full-0 auto-y text-body-small text-wrap text-align-x-center content-default" else "auto-xy text-caption-small text-align-x-center content-muted"
	local NoAreFriends: boolean = GetFFlagCurrencyTransferFlowUIImprovementFixModule() and not UseStateResult.areFriends
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		onClose = TriggerOnClose,
		ref = Ref
	}, {
		Header = ReactModule.createElement(Sheet.Header, {}, {
			TransferRobuxHeader = ReactModule.createElement(TransferRobuxHeaderModule, {
				titleText = UseLocalizationResult.SendRobux,
				robuxBalanceAmount = UseSignalStateResult
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = ReactModule.createElement(View, { tag = "col gap-large auto-y size-full-0 align-x-center" }, {
				ProfileCard = ReactModule.createElement(View, {
					LayoutOrder = 1,
					Size = if GetFFlagCurrencyTransferFlowUIImprovementFixModule() then nil else UDim2.new(1, 0, 0, 250),
					tag = if GetFFlagCurrencyTransferFlowUIImprovementFixModule() then "col gap-xlarge align-x-center bg-shift-100 size-full-0 auto-y radius-medium padding-large" else "col gap-xlarge align-x-center bg-shift-100 align-y-center radius-medium padding-large"
				}, {
					RecipientProfile = if UseStateResult1 and UseStateResult1.targetId then ReactModule.createElement(TransferProfileThumbnailModule, {
						showUsername = true,
						layoutOrder = 1,
						userId = tostring(UseStateResult1.targetId),
						username = UseStateResult1.targetName,
						displayName = UseStateResult1.targetDisplayName,
						size = UDim2.fromOffset(60, 60),
						thumbnailSize = Enum.ThumbnailSize.Size48x48
					}) else nil,
					InfoRow = ReactModule.createElement(View, {
						tag = "col gap-medium align-x-center align-y-start auto-y size-full-0",
						LayoutOrder = 2
					}, {
						FirstRow = ReactModule.createElement(View, {
							tag = "row align-x-center align-y-center auto-xy",
							LayoutOrder = 1
						}, {
							ConnectedDetail = if UseStateResult and UseStateResult.areFriends then ReactModule.createElement(Text, {
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 1,
								Text = `{GetIconRichTextFunction(Enums.IconName.Calendar, IconVariant.Filled)} {UseMemoResult}`
							}) else nil,
							Spacer = if UseStateResult and UseStateResult.areFriends then ReactModule.createElement(View, {
								tag = "auto-xy",
								LayoutOrder = 2,
								Size = UDim2.new(0, 8, 0, 0)
							}) else nil,
							MutualDetail = ReactModule.createElement(Text, {
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 3,
								Text = `{GetIconRichTextFunction(Enums.IconName.TwoPeople, IconVariant.Filled)} {UseMemoResult1}`
							}),
							Spacer2 = if NoAreFriends then ReactModule.createElement(View, {
								tag = "auto-xy",
								LayoutOrder = 4,
								Size = UDim2.new(0, 8, 0, 0)
							}) else nil,
							InlineJoinedDetail = if NoAreFriends then ReactModule.createElement(Text, {
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 5,
								Text = `{GetIconRichTextFunction(Enums.IconName.CircleI, IconVariant.Filled)} {UseMemoResult2}`
							}) else nil
						}),
						JoinedDetail = if NoAreFriends then nil else ReactModule.createElement(Text, {
							tag = "auto-xy text-body-medium content-default text-no-wrap padding-y-xsmall",
							RichText = true,
							LayoutOrder = 2,
							Text = `{GetIconRichTextFunction(Enums.IconName.CircleI, IconVariant.Filled)} {UseMemoResult2}`
						})
					})
				}),
				AmountDisplay = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = if GetFFlagCurrencyTransferFlowUIImprovementFixModule() then "col align-x-center align-y-center size-full-0 auto-y radius-medium bg-shift-100 padding-large" else "col align-x-center align-y-center size-full-2000 radius-medium bg-shift-100"
				}, {
					Amount = ReactModule.createElement(RobuxTextModule, { layoutOrder = 1, amount = UseSignalStateResult1 or 0 }),
					RecipientText = if UseMemoResult3 then ReactModule.createElement(Text, {
						LayoutOrder = 2,
						Text = UseMemoResult3,
						tag = SizeFull0AutoYTextBodySmallTextWrapTextAlignXCenterContentDefault
					}) else nil
				})
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 3 }, {
			ReactModule.createElement(View, {
				tag = "col align-x-center align-y-center gap-medium size-full-1000"
			}, {
				ReactModule.createElement(View, {
					tag = "row gap-small size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					SendButton = ReactModule.createElement(Button, {
						LayoutOrder = 1,
						ref = Ref1,
						text = UseLocalizationResult.Send,
						onActivated = function()
							-- upvalues: UseSignalStateResult1 (copy), UseSignalStateResult (copy), SetTransferPromptStateModule (upval), UseTransferStoreModuleResult (copy), PromptStateModule (upval), ProcessTransferModule (upval)
							if UseSignalStateResult1 and UseSignalStateResult < UseSignalStateResult1 then
								SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferInsufficientBalance)
								
								return
							else
								ProcessTransferModule(UseTransferStoreModuleResult, UseSignalStateResult1 or 0)
							end
						end,
						inputDelay = if IsTransferOriginationMatch then 2.5 else nil,
						variant = ButtonVariant.Emphasis,
						fillBehavior = FillBehavior.Fill
					}),
					EditButton = if IsTransferOriginationMatch then nil else ReactModule.createElement(Button, {
						LayoutOrder = 2,
						text = UseLocalizationResult.Edit,
						onActivated = function()
							-- upvalues: SetTransferPromptStateModule (upval), UseTransferStoreModuleResult (copy), PromptStateModule (upval)
							SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferInput)
						end,
						variant = ButtonVariant.Standard,
						fillBehavior = FillBehavior.Fill
					})
				}),
				Disclaimer = ReactModule.createElement(FoundationModule.Text, {
					tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
					LayoutOrder = 2,
					Text = UseLocalizationResult.AgeEstimationDisclaimer
				})
			})
		})
	})
end