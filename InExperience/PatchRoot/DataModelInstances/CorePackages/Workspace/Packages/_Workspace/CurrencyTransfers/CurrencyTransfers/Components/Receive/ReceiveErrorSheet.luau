local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getTransferRequestByIdRequestModule = require(currencyTransfers.NetworkRequests.getTransferRequestByIdRequest)
local useUserNameFromUserIdModule = require(currencyTransfers.Hooks.useUserNameFromUserId)
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local transferLocaleFormatModule = require(currencyTransfers.Localization.transferLocaleFormat)
local foundationModule = require(parent.Foundation)
local sheet = foundationModule.Sheet
local view = foundationModule.View
local text = foundationModule.Text
local button = foundationModule.Button
local icon = foundationModule.Icon
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local enums = foundationModule.Enums
local useLocalization = require(parent.Localization).Hooks.useLocalization
local failureReasonModule = require(currencyTransfers.Enums.FailureReason)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)

local function _(p0, p1, p2) --[[ line: 38 | named "getErrorMessageAndButton" ]]
	-- upvalues: failureReasonModule (ref), transferLocaleFormatModule (ref)
	if not p0 then
		return p1.GenericError, p1.TryAgain
	end
	local accountDisabled
	local OK = p1.OK
	local _ = nil
	
	if p0 == failureReasonModule.TransferDisabledForUser then
		accountDisabled = p1.AccountDisabled
	elseif p0 == failureReasonModule.TransferExpired then
		accountDisabled = transferLocaleFormatModule.substituteUsername(p1.TransferExpired, tostring(p2))
	else
		accountDisabled = p1.GenericError
		OK = p1.TryAgain
	end
	return accountDisabled, OK
end

return function(_) --[[ line: 64 | named "ReceiveErrorSheet" ]]
	-- upvalues: useTransferStoreModule (ref), useTokens (ref), signalsReactModule (ref), failureReasonModule (ref), reactModule (ref), getTransferRequestByIdRequestModule (ref), useUserNameFromUserIdModule (ref), useLocalization (ref), transferLocalizationKeysModule (ref), transferLocaleFormatModule (ref), sheet (ref), useScaledValue (ref), view (ref), icon (ref), enums (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local genericError, tryAgain
	local var10 = useTransferStoreModule()
	local var11 = useTokens()
	local var12 = signalsReactModule.useSignalState(var10.getErrorTransferModel)
	local var13 = signalsReactModule.useSignalState(var10.getSender)
	local var14 = signalsReactModule.useSignalState(var10.getRobuxTransfer)
	local var15 = signalsReactModule.useSignalState(var10.getTransferRequestId)
	local triggerOnClose = var10.triggerOnClose
	local var16 = if var12 then var12.failureReason else nil
	local var17 = var16 == failureReasonModule.TransferExpired
	reactModule.useEffect(function() --[[ line: 81 ]]
		-- upvalues: var17 (ref), var13 (ref), var14 (ref), var15 (ref), getTransferRequestByIdRequestModule (copy), var10 (ref)
		if var17 and not var13 and (not var14 or not var14.sender) and var15 then
			getTransferRequestByIdRequestModule({ transferRequestId = var15 }, nil, var10.getNetworkImpl()):andThen(function(p3) --[[ line: 91 ]]
				-- upvalues: var10 (copy)
				if p3 and p3.transfer and p3.transfer.sender then
					var10.setSender(p3.transfer.sender)
				end
			end):catch(function() --[[ line: 96 ]] end)
			
			return
		end
	end, { var17, var15, var13, var14 })
	local var13_1 = var13 or (if var14 then var14.sender else nil)
	local var19 = if var13_1 then var13_1.targetId else nil
	local var20 = useUserNameFromUserIdModule(if var17 and var19 and var19 ~= 0 then var19 else nil)
	local var21 = if var13_1 and (var13_1.targetName or var13_1.targetDisplayName) then var13_1.targetName or var13_1.targetDisplayName elseif var17 and var20 and var20 ~= "" then var20 else nil
	local var22 = useLocalization(transferLocalizationKeysModule.Presets.ReceiveErrorSheet)
	
	if var16 then
		local accountDisabled
		local OK = var22.OK
		local _ = nil
		
		if var16 == failureReasonModule.TransferDisabledForUser then
			accountDisabled = var22.AccountDisabled
		elseif var16 == failureReasonModule.TransferExpired then
			accountDisabled = transferLocaleFormatModule.substituteUsername(var22.TransferExpired, tostring(var21))
		else
			accountDisabled = var22.GenericError
			OK = var22.TryAgain
		end
		genericError = accountDisabled
		tryAgain = OK
	else
		genericError = var22.GenericError
		tryAgain = var22.TryAgain
	end
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		snapPoints = { useScaledValue(300), 0.5 },
		onClose = triggerOnClose
	}, {
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 1 }, {
			SheetContentContainer = reactModule.createElement(view, {
				tag = "col gap-xlarge auto-y size-full-0 align-x-center align-y-center padding-top-xlarge"
			}, {
				ErrorIconContainer = reactModule.createElement(view, {
					tag = "size-1200-1200 radius-circle align-x-center align-y-center bg-inverse-emphasis",
					LayoutOrder = 1
				}, {
					ErrorIcon = reactModule.createElement(icon, {
						tag = "content-inverse-emphasis",
						name = enums.IconName.TriangleExclamation,
						size = var11.Size.Size_1200
					})
				}),
				ErrorMessage = reactModule.createElement(text, {
					tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap",
					LayoutOrder = 2,
					Text = genericError,
					Size = UDim2.new(1, 0, 0, 0)
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 2 }, {
			reactModule.createElement(view, {
				tag = "col auto-y align-y-center align-x-center size-full-0 gap-small"
			}, {
				reactModule.createElement(view, { tag = "row auto-y size-full-0 gap-small" }, {
					reactModule.createElement(button, {
						text = tryAgain,
						onActivated = triggerOnClose,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill
					})
				})
			})
		})
	})
end