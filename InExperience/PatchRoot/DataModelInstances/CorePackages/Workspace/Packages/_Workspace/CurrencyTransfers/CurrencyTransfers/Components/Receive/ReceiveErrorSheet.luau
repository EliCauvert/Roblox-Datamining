local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetTransferRequestByIdRequestModule = require(CurrencyTransfers.NetworkRequests.getTransferRequestByIdRequest)
local UseUserNameFromUserIdModule = require(CurrencyTransfers.Hooks.useUserNameFromUserId)
local TransferLocalizationKeysModule = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local TransferLocaleFormatModule = require(CurrencyTransfers.Localization.transferLocaleFormat)
local FoundationModule = require(Parent.Foundation)
local Sheet = FoundationModule.Sheet
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Enums = FoundationModule.Enums
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FailureReasonModule = require(CurrencyTransfers.Enums.FailureReason)
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)

local function _(TransferDisabledForUser, p1, p2) --[[ Line: 38 | Named "getErrorMessageAndButton" ]]
	-- upvalues: FailureReasonModule (copy), TransferLocaleFormatModule (copy)
	if not TransferDisabledForUser then
		return p1.GenericError, p1.TryAgain
	end
	local OK = p1.OK
	local AccountDisabled = nil
	
	if TransferDisabledForUser == FailureReasonModule.TransferDisabledForUser then
		AccountDisabled = p1.AccountDisabled
	elseif TransferDisabledForUser == FailureReasonModule.TransferExpired then
		AccountDisabled = TransferLocaleFormatModule.substituteUsername(p1.TransferExpired, (tostring(p2)))
	else
		AccountDisabled = p1.GenericError
		OK = p1.TryAgain
	end
	return AccountDisabled, OK
end

local GetFFlagCurrencyTransferFocusNavigationModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFocusNavigation)
local UseTransferSheetFocusModule = require(CurrencyTransfers.Hooks.useTransferSheetFocus)

return function(_) --[[ Line: 67 | Named "ReceiveErrorSheet" ]]
	-- upvalues: UseTransferStoreModule (copy), UseTokensFunction (copy), SignalsReactModule (copy), FailureReasonModule (copy), ReactModule (copy), GetTransferRequestByIdRequestModule (copy), UseUserNameFromUserIdModule (copy), UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), TransferLocaleFormatModule (copy), GetFFlagCurrencyTransferFocusNavigationModule (copy), UseTransferSheetFocusModule (copy), Sheet (copy), UseScaledValueFunction (copy), View (copy), Icon (copy), Enums (copy), Text (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getErrorTransferModel)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getSender)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getRobuxTransfer)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getTransferRequestId)
	local TriggerOnClose = UseTransferStoreModuleResult.triggerOnClose
	local FailureReason = if UseSignalStateResult then UseSignalStateResult.failureReason else nil
	local IsFailureReasonMatch = FailureReason == FailureReasonModule.TransferExpired
	ReactModule.useEffect(function() --[[ Line: 84 ]]
		-- upvalues: IsFailureReasonMatch (copy), UseSignalStateResult1 (copy), UseSignalStateResult2 (copy), UseSignalStateResult3 (copy), GetTransferRequestByIdRequestModule (upval), UseTransferStoreModuleResult (copy)
		if IsFailureReasonMatch and not UseSignalStateResult1 and (not UseSignalStateResult2 or not UseSignalStateResult2.sender) and UseSignalStateResult3 then
			GetTransferRequestByIdRequestModule({ transferRequestId = UseSignalStateResult3 }, nil, UseTransferStoreModuleResult.getNetworkImpl()):andThen(function(Result) --[[ Line: 94 ]]
				-- upvalues: UseTransferStoreModuleResult (upval)
				if Result and Result.transfer and Result.transfer.sender then
					UseTransferStoreModuleResult.setSender(Result.transfer.sender)
				end
			end):catch(function() --[[ Line: 99 ]] end)
			
			return
		end
	end, {
		IsFailureReasonMatch,
		UseSignalStateResult3,
		UseSignalStateResult1,
		UseSignalStateResult2
	})
	local UseSignalStateResult1_1 = UseSignalStateResult1 or (UseSignalStateResult2 and UseSignalStateResult2.sender or nil)
	local TargetId = if UseSignalStateResult1_1 then UseSignalStateResult1_1.targetId else nil
	local UseUserNameFromUserIdModuleResult = UseUserNameFromUserIdModule(if IsFailureReasonMatch and TargetId and TargetId ~= 0 then TargetId else nil)
	local TargetName = if UseSignalStateResult1_1 and (UseSignalStateResult1_1.targetName or UseSignalStateResult1_1.targetDisplayName) then UseSignalStateResult1_1.targetName or UseSignalStateResult1_1.targetDisplayName elseif IsFailureReasonMatch and UseUserNameFromUserIdModuleResult and UseUserNameFromUserIdModuleResult ~= "" then UseUserNameFromUserIdModuleResult else nil
	local UseLocalizationResult = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.ReceiveErrorSheet)
	local TryAgain = nil
	local GenericError = nil
	
	if FailureReason then
		local OK = UseLocalizationResult.OK
		local AccountDisabled = nil
		
		if FailureReason == FailureReasonModule.TransferDisabledForUser then
			AccountDisabled = UseLocalizationResult.AccountDisabled
		elseif FailureReason == FailureReasonModule.TransferExpired then
			AccountDisabled = TransferLocaleFormatModule.substituteUsername(UseLocalizationResult.TransferExpired, (tostring(TargetName)))
		else
			AccountDisabled = UseLocalizationResult.GenericError
			OK = UseLocalizationResult.TryAgain
		end
		GenericError = AccountDisabled
		TryAgain = OK
	else
		GenericError = UseLocalizationResult.GenericError
		TryAgain = UseLocalizationResult.TryAgain
	end
	local Ref = nil
	local Ref1 = nil
	
	if GetFFlagCurrencyTransferFocusNavigationModule() then
		Ref, Ref1 = UseTransferSheetFocusModule(TriggerOnClose)
	end
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		snapPoints = { UseScaledValueFunction(300), 0.5 },
		onClose = TriggerOnClose,
		ref = Ref
	}, {
		Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 1 }, {
			SheetContentContainer = ReactModule.createElement(View, {
				tag = "col gap-xlarge auto-y size-full-0 align-x-center align-y-center padding-top-xlarge"
			}, {
				ErrorIconContainer = ReactModule.createElement(View, {
					tag = "size-1200-1200 radius-circle align-x-center align-y-center bg-inverse-emphasis",
					LayoutOrder = 1
				}, {
					ErrorIcon = ReactModule.createElement(Icon, {
						tag = "content-inverse-emphasis",
						name = Enums.IconName.TriangleExclamation,
						size = UseTokensResult.Size.Size_1200
					})
				}),
				ErrorMessage = ReactModule.createElement(Text, {
					tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap",
					LayoutOrder = 2,
					Text = GenericError,
					Size = UDim2.new(1, 0, 0, 0)
				})
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 2 }, {
			ReactModule.createElement(View, {
				tag = "col auto-y align-y-center align-x-center size-full-0 gap-small"
			}, {
				ReactModule.createElement(View, { tag = "row auto-y size-full-0 gap-small" }, {
					ReactModule.createElement(Button, {
						ref = Ref1,
						text = TryAgain,
						onActivated = TriggerOnClose,
						variant = ButtonVariant.Emphasis,
						fillBehavior = FillBehavior.Fill
					})
				})
			})
		})
	})
end