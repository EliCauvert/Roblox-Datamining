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

local function _(p1, p2, p3)
	-- upvalues: failureReasonModule (ref), transferLocaleFormatModule (ref)
	if not p1 then
		return p2.GenericError, p2.TryAgain
	end
	local accountDisabled
	local OK = p2.OK
	local _ = nil
	
	if p1 == failureReasonModule.TransferDisabledForUser then
		accountDisabled = p2.AccountDisabled
	elseif p1 == failureReasonModule.TransferExpired then
		accountDisabled = transferLocaleFormatModule.substituteUsername(p2.TransferExpired, tostring(p3))
	else
		accountDisabled = p2.GenericError
		OK = p2.TryAgain
	end
	return accountDisabled, OK
end

return function(_)
	-- upvalues: useTransferStoreModule (ref), useTokens (ref), signalsReactModule (ref), failureReasonModule (ref), reactModule (ref), getTransferRequestByIdRequestModule (ref), useUserNameFromUserIdModule (ref), useLocalization (ref), transferLocalizationKeysModule (ref), transferLocaleFormatModule (ref), sheet (ref), useScaledValue (ref), view (ref), icon (ref), enums (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local genericError, tryAgain
	local var1 = useTransferStoreModule()
	local var2 = useTokens()
	local var3 = signalsReactModule.useSignalState(var1.getErrorTransferModel)
	local var4 = signalsReactModule.useSignalState(var1.getSender)
	local var5 = signalsReactModule.useSignalState(var1.getRobuxTransfer)
	local var6 = signalsReactModule.useSignalState(var1.getTransferRequestId)
	local triggerOnClose = var1.triggerOnClose
	local var7 = if var3 then var3.failureReason else nil
	local var8 = var7 == failureReasonModule.TransferExpired
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var4 (ref), var5 (ref), var6 (ref), getTransferRequestByIdRequestModule (copy), var1 (ref)
		if var8 and not var4 and (not var5 or not var5.sender) and var6 then
			getTransferRequestByIdRequestModule({ transferRequestId = var6 }, nil, var1.getNetworkImpl()):andThen(function(p1)
				-- upvalues: var1 (copy)
				if p1 and p1.transfer and p1.transfer.sender then
					var1.setSender(p1.transfer.sender)
				end
			end):catch(function() end)
			
			return
		end
	end, { var8, var6, var4, var5 })
	local var9 = var4 or (if var5 then var5.sender else nil)
	local var10 = if var9 then var9.targetId else nil
	local var11 = useUserNameFromUserIdModule(if var8 and var10 and var10 ~= 0 then var10 else nil)
	local var12 = if var9 and (var9.targetName or var9.targetDisplayName) then var9.targetName or var9.targetDisplayName elseif var8 and var11 and var11 ~= "" then var11 else nil
	local var13 = useLocalization(transferLocalizationKeysModule.Presets.ReceiveErrorSheet)
	
	if var7 then
		local accountDisabled
		local OK = var13.OK
		local _ = nil
		
		if var7 == failureReasonModule.TransferDisabledForUser then
			accountDisabled = var13.AccountDisabled
		elseif var7 == failureReasonModule.TransferExpired then
			accountDisabled = transferLocaleFormatModule.substituteUsername(var13.TransferExpired, tostring(var12))
		else
			accountDisabled = var13.GenericError
			OK = var13.TryAgain
		end
		genericError = accountDisabled
		tryAgain = OK
	else
		genericError = var13.GenericError
		tryAgain = var13.TryAgain
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
						size = var2.Size.Size_1200
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