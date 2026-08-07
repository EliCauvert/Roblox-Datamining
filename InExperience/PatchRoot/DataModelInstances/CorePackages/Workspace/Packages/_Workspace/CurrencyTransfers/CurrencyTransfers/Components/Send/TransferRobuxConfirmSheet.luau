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
local getFFlagCurrencyTransferFixBalanceReRenderModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFixBalanceReRender)
local getFFlagCurrencyTransferFlowUIImprovementFixModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFlowUIImprovementFix)
local getFIntCurrencyTransferDeveloperCommissionRateModule = require(currencyTransfers.Flags.GetFIntCurrencyTransferDeveloperCommissionRate)
local getFIntCurrencyTransferPlatformFeeRateModule = require(currencyTransfers.Flags.GetFIntCurrencyTransferPlatformFeeRate)

return function(_) --[[ line: 61 | named "TransferRobuxConfirmSheet" ]]
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), useTransferStoreModule (ref), reactModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), getFFlagCurrencyTransferFixBalanceReRenderModule (ref), signalsReactModule (ref), transferOriginationModule (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (ref), getFIntCurrencyTransferDeveloperCommissionRateModule (ref), getFIntCurrencyTransferPlatformFeeRateModule (ref), sheet (ref), transferRobuxHeaderModule (ref), view (ref), transferProfileThumbnailModule (ref), text (ref), getIconRichText (ref), enums (ref), iconVariant (ref), robuxTextModule (ref), button (ref), setTransferPromptStateModule (ref), promptStateModule (ref), processTransferModule (ref), buttonVariant (ref), fillBehavior (ref), foundationModule (ref)
	local var22 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxConfirmSheet)
	local var23 = useTransferStoreModule()
	reactModule.useEffect(function() --[[ line: 66 ]]
		-- upvalues: logCurrencyTransferCounterModule (copy), var23 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var23, currencyTransferTelemetryModule.CurrencyTransferConfirmSheetShownCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var23, robuxTransferFlowEventNameModule.confirm_shown)
		end
		return nil
	end, { var23 })
	local var24 = if getFFlagCurrencyTransferFixBalanceReRenderModule() then signalsReactModule.useSignalState(var23.getRobuxBalanceAmount) or 0 else var23.getRobuxBalanceAmount(false)
	local var25 = if getFFlagCurrencyTransferFixBalanceReRenderModule() then signalsReactModule.useSignalState(var23.getSelectedAmount) or 0 else var23.getSelectedAmount(false) or 0
	local userRelationshipDetail = var23.getUserRelationshipDetail(false)
	local recipient = var23.getRecipient(false)
	local var28 = var23.getTransferOrigination(false) == transferOriginationModule.InExperience
	local triggerOnClose = var23.triggerOnClose
	local year = os.date("*t").year
	local var29, var30 = reactModule.useState(userRelationshipDetail)
	local var31, var32 = reactModule.useState(recipient)
	reactModule.useEffect(function() --[[ line: 90 ]]
		-- upvalues: userRelationshipDetail (ref), var30 (ref)
		if userRelationshipDetail then
			var30(userRelationshipDetail)
		end
	end, { userRelationshipDetail })
	reactModule.useEffect(function() --[[ line: 96 ]]
		-- upvalues: recipient (ref), var32 (ref)
		if recipient then
			var32(recipient)
		end
	end, { recipient })
	local var33 = reactModule.useMemo(function() --[[ line: 103 ]]
		-- upvalues: getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), var29 (ref), var22 (ref), year (ref)
		if getFFlagCurrencyTransferFlowUIImprovementFixModule() then
			if not var29 or not var29.friendSinceDate then
				return var22.NewConnection
			end
			local friendSinceDate = var29.friendSinceDate
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
				return var22.NewConnection
			end
			local dateString = os.date("*t", timestamp)
			local var41 = (dateString.year - friendSinceDate.year) * 12 + (dateString.month - friendSinceDate.month)
			
			if dateString.day < friendSinceDate.day then
				var41 -= 1
			end
			return if var41 >= 12 then string.gsub(var22.ConnectedYear, "{year}", tostring(math.floor(var41 / 12))) elseif var41 >= 1 then if var41 <= 1 then string.gsub(var22.ConnectedMonthsSingular, "{amount}", tostring(var41)) else string.gsub(var22.ConnectedMonths, "{amount}", tostring(var41)) elseif floored <= 1 then string.gsub(var22.ConnectedDaysSingular, "{amount}", tostring(floored)) else string.gsub(var22.ConnectedDays, "{amount}", tostring(floored))
		elseif not var29 or not var29.friendSinceYear then
			return var22.NewConnection
		end
		local var42 = year - var29.friendSinceYear
		
		return if var42 == 0 then var22.NewConnection else string.gsub(var22.ConnectedYear, "{year}", tostring(var42))
	end, {
		year, var29, var22.ConnectedYear, var22.ConnectedMonths,
		var22.ConnectedMonthsSingular, var22.ConnectedDays,
		var22.ConnectedDaysSingular, var22.NewConnection
	})
	local var34 = reactModule.useMemo(function() --[[ line: 166 ]]
		-- upvalues: var29 (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), var22 (ref)
		local mutualFriendsCount = var29.mutualFriendsCount
		
		return if getFFlagCurrencyTransferFlowUIImprovementFixModule() and var29.areFriends and mutualFriendsCount <= 1 then string.gsub(var22.MutualConnectionSingular, "{amount}", tostring(mutualFriendsCount)) else string.gsub(var22.MutualConnection, "{amount}", tostring(mutualFriendsCount))
	end, {
		var29.mutualFriendsCount,
		var29.areFriends,
		var22.MutualConnection,
		var22.MutualConnectionSingular
	})
	local var35 = reactModule.useMemo(function() --[[ line: 185 ]]
		-- upvalues: var22 (ref), var29 (ref)
		return string.gsub(var22.JoinedInYear, "{year}", tostring(var29.userAccountSinceYear))
	end, { var29.userAccountSinceYear })
	local var36 = reactModule.useMemo(function() --[[ line: 190 ]]
		-- upvalues: getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), var28 (ref), var25 (ref), getFIntCurrencyTransferDeveloperCommissionRateModule (copy), getFIntCurrencyTransferPlatformFeeRateModule (copy), var22 (ref)
		return if getFFlagCurrencyTransferFlowUIImprovementFixModule() then if var28 and var25 then string.gsub(string.gsub(var22.RecipientWillGetInGame, "{amount}", tostring(math.ceil(var25 * (1 - (getFIntCurrencyTransferDeveloperCommissionRateModule() + getFIntCurrencyTransferPlatformFeeRateModule()) / 100)))), "{commissionPercentage}", tostring(getFIntCurrencyTransferDeveloperCommissionRateModule())) elseif var25 then string.gsub(var22.RecipientWillGetInApp, "{amount}", tostring(var25)) else nil elseif var28 and var25 then string.gsub(var22.RecipientWillGet, "{amount}", tostring(math.ceil(var25 * (1 - (getFIntCurrencyTransferDeveloperCommissionRateModule() + getFIntCurrencyTransferPlatformFeeRateModule()) / 100)))) else nil
	end, {
		var28, var25, var22.RecipientWillGet, var22.RecipientWillGetInGame,
		var22.RecipientWillGetInApp,
		getFFlagCurrencyTransferFlowUIImprovementFixModule()
	})
	local var37 = getFFlagCurrencyTransferFlowUIImprovementFixModule() and not var29.areFriends
	
	return reactModule.createElement(sheet.Root, { preferCenterSheet = true, onClose = triggerOnClose }, {
		Header = reactModule.createElement(sheet.Header, {}, {
			TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, { titleText = var22.SendRobux, robuxBalanceAmount = var24 })
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, { tag = "col gap-large auto-y size-full-0 align-x-center" }, {
				ProfileCard = reactModule.createElement(view, {
					LayoutOrder = 1,
					Size = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then nil else UDim2.new(1, 0, 0, 250),
					tag = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then "col gap-xlarge align-x-center bg-shift-100 size-full-0 auto-y radius-medium padding-large" else "col gap-xlarge align-x-center bg-shift-100 align-y-center radius-medium padding-large"
				}, {
					RecipientProfile = if var31 and var31.targetId then reactModule.createElement(transferProfileThumbnailModule, {
						showUsername = true,
						layoutOrder = 1,
						userId = tostring(var31.targetId),
						username = var31.targetName,
						displayName = var31.targetDisplayName,
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
							ConnectedDetail = if var29 and var29.areFriends then reactModule.createElement(text, {
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 1,
								Text = `{getIconRichText(enums.IconName.Calendar, iconVariant.Filled)} {var33}`
							}) else nil,
							Spacer = if var29 and var29.areFriends then reactModule.createElement(view, {
								tag = "auto-xy",
								LayoutOrder = 2,
								Size = UDim2.new(0, 8, 0, 0)
							}) else nil,
							MutualDetail = reactModule.createElement(text, {
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 3,
								Text = `{getIconRichText(enums.IconName.TwoPeople, iconVariant.Filled)} {var34}`
							}),
							Spacer2 = if var37 then reactModule.createElement(view, {
								tag = "auto-xy",
								LayoutOrder = 4,
								Size = UDim2.new(0, 8, 0, 0)
							}) else nil,
							InlineJoinedDetail = if var37 then reactModule.createElement(text, {
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 5,
								Text = `{getIconRichText(enums.IconName.CircleI, iconVariant.Filled)} {var35}`
							}) else nil
						}),
						JoinedDetail = if var37 then nil else reactModule.createElement(text, {
							tag = "auto-xy text-body-medium content-default text-no-wrap padding-y-xsmall",
							RichText = true,
							LayoutOrder = 2,
							Text = `{getIconRichText(enums.IconName.CircleI, iconVariant.Filled)} {var35}`
						})
					})
				}),
				AmountDisplay = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then "col align-x-center align-y-center size-full-0 auto-y radius-medium bg-shift-100 padding-large" else "col align-x-center align-y-center size-full-2000 radius-medium bg-shift-100"
				}, {
					Amount = reactModule.createElement(robuxTextModule, { layoutOrder = 1, amount = var25 or 0 }),
					RecipientText = if var36 then reactModule.createElement(text, {
						LayoutOrder = 2,
						Text = var36,
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
						text = var22.Send,
						onActivated = function() --[[ line: 369 ]]
							-- upvalues: var25 (ref), var24 (ref), setTransferPromptStateModule (copy), var23 (ref), promptStateModule (copy), processTransferModule (copy)
							if var25 and var24 < var25 then
								setTransferPromptStateModule(var23, promptStateModule.TransferInsufficientBalance)
								
								return
							end
							processTransferModule(var23, var25 or 0)
						end,
						inputDelay = if var28 then 2.5 else nil,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill
					}),
					EditButton = if not var28 then reactModule.createElement(button, {
						LayoutOrder = 2,
						text = var22.Edit,
						onActivated = function() --[[ line: 384 ]]
							-- upvalues: setTransferPromptStateModule (copy), var23 (ref), promptStateModule (copy)
							setTransferPromptStateModule(var23, promptStateModule.TransferInput)
						end,
						variant = buttonVariant.Standard,
						fillBehavior = fillBehavior.Fill
					}) else nil
				}),
				Disclaimer = reactModule.createElement(foundationModule.Text, {
					tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
					LayoutOrder = 2,
					Text = var22.AgeEstimationDisclaimer
				})
			})
		})
	})
end