local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local sheet = foundationModule.Sheet
local button = foundationModule.Button
local view = foundationModule.View
local text = foundationModule.Text
local fillBehavior = foundationModule.Enums.FillBehavior
local enums = foundationModule.Enums
local iconVariant = foundationModule.Enums.IconVariant
local getIconRichText = foundationModule.Utility.getIconRichText
local useLocalization = require(parent.Localization).Hooks.useLocalization
local transferRobuxHeaderModule = require(currencyTransfers.Components.Generic.TransferRobuxHeader)
local transferProfileThumbnailModule = require(currencyTransfers.Components.Generic.TransferProfileThumbnail)
local robuxTextModule = require(currencyTransfers.Components.Generic.RobuxText)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local setTransferPromptStateModule = require(currencyTransfers.Actions.Send.setTransferPromptState)
local processTransferModule = require(currencyTransfers.Actions.Send.processTransfer)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)
local getFFlagCurrencyTransferFlowUIImprovementFixModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFlowUIImprovementFix)
local getFIntCurrencyTransferDeveloperCommissionRateModule = require(currencyTransfers.Flags.GetFIntCurrencyTransferDeveloperCommissionRate)
local getFIntCurrencyTransferPlatformFeeRateModule = require(currencyTransfers.Flags.GetFIntCurrencyTransferPlatformFeeRate)

return function(_)
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), useTransferStoreModule (ref), reactModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), signalsReactModule (ref), transferOriginationModule (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (ref), getFIntCurrencyTransferDeveloperCommissionRateModule (ref), getFIntCurrencyTransferPlatformFeeRateModule (ref), sheet (ref), transferRobuxHeaderModule (ref), view (ref), transferProfileThumbnailModule (ref), text (ref), getIconRichText (ref), enums (ref), iconVariant (ref), robuxTextModule (ref), button (ref), setTransferPromptStateModule (ref), promptStateModule (ref), processTransferModule (ref), buttonVariant (ref), fillBehavior (ref), foundationModule (ref)
	local var21 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxConfirmSheet)
	local var22 = useTransferStoreModule()
	reactModule.useEffect(function()
		-- upvalues: logCurrencyTransferCounterModule (copy), var22 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var22, currencyTransferTelemetryModule.CurrencyTransferConfirmSheetShownCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var22, robuxTransferFlowEventNameModule.confirm_shown)
		end
		return nil
	end, { var22 })
	local getRobuxBalanceAmount = signalsReactModule.useSignalState(var22.getRobuxBalanceAmount) or 0
	local getSelectedAmount = signalsReactModule.useSignalState(var22.getSelectedAmount) or 0
	local userRelationshipDetail = var22.getUserRelationshipDetail(false)
	local recipient = var22.getRecipient(false)
	local var27 = var22.getTransferOrigination(false) == transferOriginationModule.InExperience
	local triggerOnClose = var22.triggerOnClose
	local year = os.date("*t").year
	local var28, var29 = reactModule.useState(userRelationshipDetail)
	local var30, var31 = reactModule.useState(recipient)
	reactModule.useEffect(function()
		-- upvalues: userRelationshipDetail (ref), var29 (ref)
		if userRelationshipDetail then
			var29(userRelationshipDetail)
		end
	end, { userRelationshipDetail })
	reactModule.useEffect(function()
		-- upvalues: recipient (ref), var31 (ref)
		if recipient then
			var31(recipient)
		end
	end, { recipient })
	local var32 = reactModule.useMemo(function()
		-- upvalues: getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), var28 (ref), var21 (ref), year (ref)
		if getFFlagCurrencyTransferFlowUIImprovementFixModule() then
			if not var28 or not var28.friendSinceDate then
				return var21.NewConnection
			end
			local friendSinceDate = var28.friendSinceDate
			local timestamp = os.time()
			local floored = math.floor((timestamp - os.time({
				hour = 0,
				min = 0,
				sec = 0,
				year = friendSinceDate.year,
				month = friendSinceDate.month,
				day = friendSinceDate.day
			})) / 86400)
			
			if floored < 1 then
				return var21.NewConnection
			end
			local dateString = os.date("*t", timestamp)
			local var40 = (dateString.year - friendSinceDate.year) * 12 + (dateString.month - friendSinceDate.month)
			
			if dateString.day < friendSinceDate.day then
				var40 -= 1
			end
			return if var40 >= 12 then string.gsub(var21.ConnectedYear, "{year}", tostring(math.floor(var40 / 12))) elseif var40 >= 1 then if var40 <= 1 then string.gsub(var21.ConnectedMonthsSingular, "{amount}", tostring(var40)) else string.gsub(var21.ConnectedMonths, "{amount}", tostring(var40)) elseif floored <= 1 then string.gsub(var21.ConnectedDaysSingular, "{amount}", tostring(floored)) else string.gsub(var21.ConnectedDays, "{amount}", tostring(floored))
		elseif not var28 or not var28.friendSinceYear then
			return var21.NewConnection
		end
		local var41 = year - var28.friendSinceYear
		
		return if var41 == 0 then var21.NewConnection else string.gsub(var21.ConnectedYear, "{year}", tostring(var41))
	end, {
		year, var28, var21.ConnectedYear, var21.ConnectedMonths,
		var21.ConnectedMonthsSingular, var21.ConnectedDays,
		var21.ConnectedDaysSingular, var21.NewConnection
	})
	local var33 = reactModule.useMemo(function()
		-- upvalues: var28 (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), var21 (ref)
		local mutualFriendsCount = var28.mutualFriendsCount
		
		return if getFFlagCurrencyTransferFlowUIImprovementFixModule() and var28.areFriends and mutualFriendsCount <= 1 then string.gsub(var21.MutualConnectionSingular, "{amount}", tostring(mutualFriendsCount)) else string.gsub(var21.MutualConnection, "{amount}", tostring(mutualFriendsCount))
	end, {
		var28.mutualFriendsCount,
		var28.areFriends,
		var21.MutualConnection,
		var21.MutualConnectionSingular
	})
	local var34 = reactModule.useMemo(function()
		-- upvalues: var21 (ref), var28 (ref)
		return string.gsub(var21.JoinedInYear, "{year}", tostring(var28.userAccountSinceYear))
	end, { var28.userAccountSinceYear })
	local var35 = reactModule.useMemo(function()
		-- upvalues: getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), var27 (ref), getSelectedAmount (ref), getFIntCurrencyTransferDeveloperCommissionRateModule (copy), getFIntCurrencyTransferPlatformFeeRateModule (copy), var21 (ref)
		return if getFFlagCurrencyTransferFlowUIImprovementFixModule() then if var27 and getSelectedAmount then string.gsub(string.gsub(var21.RecipientWillGetInGame, "{amount}", tostring(math.ceil(getSelectedAmount * (1 - (getFIntCurrencyTransferDeveloperCommissionRateModule() + getFIntCurrencyTransferPlatformFeeRateModule()) / 100)))), "{commissionPercentage}", tostring(getFIntCurrencyTransferDeveloperCommissionRateModule())) elseif getSelectedAmount then string.gsub(var21.RecipientWillGetInApp, "{amount}", tostring(getSelectedAmount)) else nil elseif var27 and getSelectedAmount then string.gsub(var21.RecipientWillGet, "{amount}", tostring(math.ceil(getSelectedAmount * (1 - (getFIntCurrencyTransferDeveloperCommissionRateModule() + getFIntCurrencyTransferPlatformFeeRateModule()) / 100)))) else nil
	end, {
		var27, getSelectedAmount, var21.RecipientWillGet, var21.RecipientWillGetInGame,
		var21.RecipientWillGetInApp,
		getFFlagCurrencyTransferFlowUIImprovementFixModule()
	})
	local var36 = getFFlagCurrencyTransferFlowUIImprovementFixModule() and not var28.areFriends
	
	return reactModule.createElement(sheet.Root, { preferCenterSheet = true, onClose = triggerOnClose }, {
		Header = reactModule.createElement(sheet.Header, {}, {
			TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, {
				titleText = var21.SendRobux,
				robuxBalanceAmount = getRobuxBalanceAmount
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, { tag = "col gap-large auto-y size-full-0 align-x-center" }, {
				ProfileCard = reactModule.createElement(view, {
					LayoutOrder = 1,
					Size = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then nil else UDim2.new(1, 0, 0, 250),
					tag = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then "col gap-xlarge align-x-center bg-shift-100 size-full-0 auto-y radius-medium padding-large" else "col gap-xlarge align-x-center bg-shift-100 align-y-center radius-medium padding-large"
				}, {
					RecipientProfile = if var30 and var30.targetId then reactModule.createElement(transferProfileThumbnailModule, {
						showUsername = true,
						layoutOrder = 1,
						userId = tostring(var30.targetId),
						username = var30.targetName,
						displayName = var30.targetDisplayName,
						size = UDim2.fromOffset(60, 60),
						thumbnailSize = Enum.ThumbnailSize.Size48x48
					}) else nil,
					InfoRow = reactModule.createElement(view, {
						tag = "col gap-medium align-x-center align-y-start auto-y size-full-0",
						LayoutOrder = 2
					}, {
						FirstRow = reactModule.createElement(view, {
							tag = "row align-x-center align-y-center auto-xy",
							LayoutOrder = 1
						}, {
							ConnectedDetail = if var28 and var28.areFriends then reactModule.createElement(text, {
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 1,
								Text = `{getIconRichText(enums.IconName.Calendar, iconVariant.Filled)} {var32}`
							}) else nil,
							Spacer = if var28 and var28.areFriends then reactModule.createElement(view, {
								tag = "auto-xy",
								LayoutOrder = 2,
								Size = UDim2.new(0, 8, 0, 0)
							}) else nil,
							MutualDetail = reactModule.createElement(text, {
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 3,
								Text = `{getIconRichText(enums.IconName.TwoPeople, iconVariant.Filled)} {var33}`
							}),
							Spacer2 = if var36 then reactModule.createElement(view, {
								tag = "auto-xy",
								LayoutOrder = 4,
								Size = UDim2.new(0, 8, 0, 0)
							}) else nil,
							InlineJoinedDetail = if var36 then reactModule.createElement(text, {
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 5,
								Text = `{getIconRichText(enums.IconName.CircleI, iconVariant.Filled)} {var34}`
							}) else nil
						}),
						JoinedDetail = if var36 then nil else reactModule.createElement(text, {
							tag = "auto-xy text-body-medium content-default text-no-wrap padding-y-xsmall",
							RichText = true,
							LayoutOrder = 2,
							Text = `{getIconRichText(enums.IconName.CircleI, iconVariant.Filled)} {var34}`
						})
					})
				}),
				AmountDisplay = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then "col align-x-center align-y-center size-full-0 auto-y radius-medium bg-shift-100 padding-large" else "col align-x-center align-y-center size-full-2000 radius-medium bg-shift-100"
				}, {
					Amount = reactModule.createElement(robuxTextModule, { layoutOrder = 1, amount = getSelectedAmount or 0 }),
					RecipientText = if var35 then reactModule.createElement(text, {
						LayoutOrder = 2,
						Text = var35,
						tag = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then "size-full-0 auto-y text-body-small text-wrap text-align-x-center content-default" else "auto-xy text-caption-small text-align-x-center content-muted"
					}) else nil
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(view, {
				tag = "col align-x-center align-y-center gap-medium size-full-1000"
			}, {
				reactModule.createElement(view, {
					tag = "row gap-small size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					SendButton = reactModule.createElement(button, {
						LayoutOrder = 1,
						text = var21.Send,
						onActivated = function()
							-- upvalues: getSelectedAmount (ref), getRobuxBalanceAmount (ref), setTransferPromptStateModule (copy), var22 (ref), promptStateModule (copy), processTransferModule (copy)
							if getSelectedAmount and getRobuxBalanceAmount < getSelectedAmount then
								setTransferPromptStateModule(var22, promptStateModule.TransferInsufficientBalance)
								
								return
							end
							processTransferModule(var22, getSelectedAmount or 0)
						end,
						inputDelay = if var27 then 2.5 else nil,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill
					}),
					EditButton = if not var27 then reactModule.createElement(button, {
						LayoutOrder = 2,
						text = var21.Edit,
						onActivated = function()
							-- upvalues: setTransferPromptStateModule (copy), var22 (ref), promptStateModule (copy)
							setTransferPromptStateModule(var22, promptStateModule.TransferInput)
						end,
						variant = buttonVariant.Standard,
						fillBehavior = fillBehavior.Fill
					}) else nil
				}),
				Disclaimer = reactModule.createElement(foundationModule.Text, {
					tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
					LayoutOrder = 2,
					Text = var21.AgeEstimationDisclaimer
				})
			})
		})
	})
end