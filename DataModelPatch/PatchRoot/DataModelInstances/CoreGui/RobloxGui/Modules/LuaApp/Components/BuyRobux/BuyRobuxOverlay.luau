local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local PromiseModule = require(CorePackages.Packages.Promise)
local ApiFetchIAPPurchaseWarningModule = require(Modules.LuaApp.Thunks.ApiFetchIAPPurchaseWarning)
local ApiPostAckPurchaseWarningModule = require(Modules.LuaApp.Thunks.ApiPostAckPurchaseWarning)
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local BuyRobuxFlow = IAPExperienceModule.PurchaseFlow.BuyRobuxFlow
local BuyRobuxFlowState = IAPExperienceModule.PurchaseFlow.BuyRobuxFlowState
local U13ConfirmType = IAPExperienceModule.PurchaseFlow.U13ConfirmType
local PurchaseErrorType = IAPExperienceModule.PurchaseFlow.PurchaseErrorType
local CheckUserPurchaseSettingsFailureReason = IAPExperienceModule.Enums.CheckUserPurchaseSettingsFailureReason
local EconomicRestrictionsViolationType = IAPExperienceModule.Enums.EconomicRestrictionsViolationType
local MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction = IAPExperienceModule.Utility.mapCheckUserPurchaseSettingsFailureReasonToViolationType
local NativePurchaseStatusModule = require(Modules.LuaApp.Enum.NativePurchaseStatus)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local _ = require(script.Parent.RobuxPackage)
local GetFFlagFixBuyRobuxNotChargedMessageModule = require(Modules.LuaApp.Flags.GetFFlagFixBuyRobuxNotChargedMessage)
local BuyRobuxCounterModule = require(script.Parent.Enum.BuyRobuxCounter)
local VPCModalTypeModule = require(script.Parent.Enum.VPCModalType)
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
local IsTenFootInterface = game:GetService("GuiService"):IsTenFootInterface()
local PreparePaymentCheckFunction = IAPExperienceModule.PreparePaymentCheck
local GetEnableConsolePreparePaymentCheckFunction = IAPExperienceModule.GetEnableConsolePreparePaymentCheck

function ExtendResult.init(p1)
	-- upvalues: U13ConfirmType (copy), RetrievalStatusModule (copy), VPCModalTypeModule (copy), PurchaseErrorType (copy), BuyRobuxCounterModule (copy), GetEnableConsolePreparePaymentCheckFunction (copy), PreparePaymentCheckFunction (copy), PromiseModule (copy)
	p1.selectedRobuxPackage = nil
	p1.resetState = p1.props.resetState or {
		economicRestrictionError = nil,
		purchaseWarningType = U13ConfirmType.None,
		purchaseWarningFetchingStatus = RetrievalStatusModule.NotStarted,
		purchaseWarningPostStatus = RetrievalStatusModule.NotStarted,
		purchaseVPCErrorType = VPCModalTypeModule.toRawValue(VPCModalTypeModule.None),
		purchaseVPCErrorFetchingStatus = RetrievalStatusModule.NotStarted,
		purchasePreCheckStatus = RetrievalStatusModule.NotStarted,
		purchaseErrorType = PurchaseErrorType.FailedRobuxPurchase
	}
	p1.state = {
		purchaseWarningType = p1.resetState.purchaseWarningType,
		purchaseWarningFetchingStatus = p1.resetState.purchaseWarningFetchingStatus,
		purchaseWarningPostStatus = p1.resetState.purchaseWarningPostStatus,
		purchaseVPCErrorType = p1.resetState.purchaseVPCErrorType,
		purchaseVPCErrorFetchingStatus = p1.resetState.purchaseVPCErrorFetchingStatus,
		purchasePreCheckStatus = p1.resetState.purchasePreCheckStatus,
		purchaseErrorType = p1.resetState.purchaseErrorType,
		economicRestrictionError = p1.resetState.economicRestrictionError
	}
	
	function p1:failFlow(p2)
		-- upvalues: p1 (copy), BuyRobuxCounterModule (upval)
		if p2 == nil then
			p1.sendCounter(BuyRobuxCounterModule.PurchaseFailed)
			
			return
		else
			p1.sendCounter(p2)
		end
	end
	
	function p1.purchaseRobux(SelectedRobuxPackage)
		-- upvalues: p1 (copy), GetEnableConsolePreparePaymentCheckFunction (upval), PreparePaymentCheckFunction (upval), RetrievalStatusModule (upval), PromiseModule (upval)
		p1:setState(p1.resetState)
		p1.props.endPurchase()
		
		if GetEnableConsolePreparePaymentCheckFunction() and not PreparePaymentCheckFunction(SelectedRobuxPackage) then
			p1:setState({ purchasePreCheckStatus = RetrievalStatusModule.Failed }, nil)
			
			return
		else
			p1.selectedRobuxPackage = SelectedRobuxPackage
			p1:setState({
				purchaseVPCErrorFetchingStatus = RetrievalStatusModule.Fetching
			})
			p1:dispatchCheckUserPurchaseSettings():andThen(function(Result)
				-- upvalues: PromiseModule (upval), p1 (upval), RetrievalStatusModule (upval)
				if Result then
					p1:setState({
						purchaseVPCErrorFetchingStatus = RetrievalStatusModule.Done
					})
					p1:setState({
						purchaseWarningFetchingStatus = RetrievalStatusModule.Fetching
					})
					p1:dispatchFetchPurchaseWarning():andThen(function(Result)
						-- upvalues: p1 (upval), RetrievalStatusModule (upval)
						p1:setState({
							purchaseWarningFetchingStatus = RetrievalStatusModule.Done
						})
						
						if not Result then
							p1:promptRobuxPurchase()
						end
					end):catch(function()
						-- upvalues: p1 (upval), RetrievalStatusModule (upval)
						p1.failFlow({
							purchaseWarningFetchingStatus = RetrievalStatusModule.Failed
						}, nil)
					end)
					
					return
				else
					return PromiseModule.resolve()
				end
			end)
		end
	end
	
	function p1.acceptPurchaseWarning()
		-- upvalues: p1 (copy), RetrievalStatusModule (upval)
		p1:setState({ purchaseWarningPostStatus = RetrievalStatusModule.Done })
		p1:dispatchPostAckPurchaseWarning()
		p1:promptRobuxPurchase()
	end
	
	function p1.cancelPurchase()
		-- upvalues: p1 (copy), BuyRobuxCounterModule (upval)
		p1.sendCounter(BuyRobuxCounterModule.PurchaseCanceled)
		p1.endPurchase()
	end
	
	function p1.endPurchase()
		-- upvalues: p1 (copy)
		p1.selectedRobuxPackage = nil
		p1:setState(p1.resetState)
		p1.props.endPurchase()
	end
	
	function p1.sendAnalyticEvent(p2, p3)
		-- upvalues: p1 (copy)
		p1.props.sendAnalyticEvent(p1.props.eventPrefix .. "BuyRobux", p2, p3)
	end
	
	function p1.sendCounter(ConfirmParentalConsentWarningPaymentModal13To)
		-- upvalues: p1 (copy), BuyRobuxCounterModule (upval)
		p1.props.sendCounter(BuyRobuxCounterModule.toRawValue(ConfirmParentalConsentWarningPaymentModal13To))
	end
	
	function p1.getProductId(SelectedRobuxPackage)
		-- upvalues: p1 (copy)
		for _, robuxPackage in p1.props.robuxPackages do
			if SelectedRobuxPackage == robuxPackage.packageId then
				return robuxPackage.productId
			end
		end
		return nil
	end
end

function ExtendResult.dispatchFetchPurchaseWarning(p2)
	-- upvalues: ApiFetchIAPPurchaseWarningModule (copy), BuyRobuxCounterModule (copy), U13ConfirmType (copy), PromiseModule (copy)
	return p2.props.dispatchFetchIAPPurchaseWarning(p2.selectedRobuxPackage, p2.getProductId(p2.selectedRobuxPackage)):andThen(function(Result)
		-- upvalues: ApiFetchIAPPurchaseWarningModule (upval), p2 (copy), BuyRobuxCounterModule (upval), U13ConfirmType (upval), PromiseModule (upval)
		local Flag = true
		
		if Result == ApiFetchIAPPurchaseWarningModule.ResponseType.U13PaymentModal then
			p2.sendCounter(BuyRobuxCounterModule.ShowU13PaymentModal)
			p2:setState({ purchaseWarningType = U13ConfirmType.U13PaymentModal })
		elseif Result == ApiFetchIAPPurchaseWarningModule.ResponseType.U13MonthlyThreshold1Modal then
			p2.sendCounter(BuyRobuxCounterModule.ShowU13MonthlyThreshold1Modal)
			p2:setState({
				purchaseWarningType = U13ConfirmType.U13MonthlyThreshold1Modal
			})
		elseif Result == ApiFetchIAPPurchaseWarningModule.ResponseType.U13MonthlyThreshold2Modal then
			p2.sendCounter(BuyRobuxCounterModule.ShownU13MonthlyThreshold2Modal)
			p2:setState({
				purchaseWarningType = U13ConfirmType.U13MonthlyThreshold2Modal
			})
		elseif Result == ApiFetchIAPPurchaseWarningModule.ResponseType.ParentalConsentWarningPaymentModal13To17 then
			p2.sendCounter(BuyRobuxCounterModule.ShownParentalConsentWarningPaymentModal13To17)
			p2:setState({
				purchaseWarningType = U13ConfirmType.ParentalConsentWarningPaymentModal13To17
			})
		else
			Flag = false
		end
		return PromiseModule.resolve(Flag)
	end)
end

function ExtendResult.dispatchCheckUserPurchaseSettings(p2)
	-- upvalues: MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction (copy), EconomicRestrictionsViolationType (copy), PromiseModule (copy), CheckUserPurchaseSettingsFailureReason (copy), BuyRobuxCounterModule (copy), VPCModalTypeModule (copy), PurchaseErrorType (copy), RetrievalStatusModule (copy)
	return p2.props.dispatchCheckUserPurchaseSettings():andThen(function(Result)
		-- upvalues: MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction (upval), EconomicRestrictionsViolationType (upval), PromiseModule (upval), CheckUserPurchaseSettingsFailureReason (upval), p2 (copy), BuyRobuxCounterModule (upval), VPCModalTypeModule (upval), PurchaseErrorType (upval)
		if Result == nil then
			error("Result from check-user-purchase-settings is nil")
		end
		local MapCheckUserPurchaseSettingsFailureReasonToViolationTypeResult = MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction(Result.failureReason)
		local HasExpirationTimeInMinutes: boolean = MapCheckUserPurchaseSettingsFailureReasonToViolationTypeResult ~= EconomicRestrictionsViolationType.None and Result.expirationTimeInMinutes ~= nil
		
		if (Result.isEligible == nil or Result.failureReason == nil) and not HasExpirationTimeInMinutes then
			error("Invalid response from check-user-purchase-settings")
		end
		if Result.isEligible then
			return PromiseModule.resolve(true)
		elseif Result.failureReason == CheckUserPurchaseSettingsFailureReason.PurchaseNotEnabled then
			p2.sendCounter(BuyRobuxCounterModule.ShowPurchaseNotEnabledModal)
			p2:setState({
				purchaseVPCErrorType = VPCModalTypeModule.toRawValue(VPCModalTypeModule.EnablePurchase)
			})
			
			return PromiseModule.resolve(false)
		elseif not HasExpirationTimeInMinutes then
			error("User is not eligible for purchases with unknown failure reason")
			
			return
		else
			p2.sendCounter(BuyRobuxCounterModule.ShowEconomicRestrictionModal)
			p2:setState({
				purchaseErrorType = PurchaseErrorType.EconomicRestriction,
				economicRestrictionError = {
					timeoutMinutes = Result.expirationTimeInMinutes,
					violationType = MapCheckUserPurchaseSettingsFailureReasonToViolationTypeResult
				}
			})
			
			return PromiseModule.resolve(false)
		end
	end):catch(function(_)
		-- upvalues: p2 (copy), RetrievalStatusModule (upval), PromiseModule (upval)
		p2:setState({
			purchaseVPCErrorFetchingStatus = RetrievalStatusModule.Failed
		})
		
		return PromiseModule.resolve(false)
	end)
end

function ExtendResult.dispatchPostAckPurchaseWarning(None)
	-- upvalues: ApiPostAckPurchaseWarningModule (copy), U13ConfirmType (copy), BuyRobuxCounterModule (copy)
	local Props = None.props
	local State = None.state
	local None1 = ApiPostAckPurchaseWarningModule.UserActionType.None
	
	if State.purchaseWarningType == U13ConfirmType.U13PaymentModal then
		None.sendCounter(BuyRobuxCounterModule.ConfirmU13PaymentModal)
		None1 = ApiPostAckPurchaseWarningModule.UserActionType.ConfirmedU13PaymentModal
	elseif State.purchaseWarningType == U13ConfirmType.U13MonthlyThreshold1Modal then
		None.sendCounter(BuyRobuxCounterModule.ConfirmU13MonthlyThreshold1Modal)
		None1 = ApiPostAckPurchaseWarningModule.UserActionType.ConfirmedU13MonthlyThreshold1Modal
	elseif State.purchaseWarningType == U13ConfirmType.U13MonthlyThreshold2Modal then
		None.sendCounter(BuyRobuxCounterModule.ConfirmU13MonthlyThreshold2Modal)
		None1 = ApiPostAckPurchaseWarningModule.UserActionType.ConfirmedU13MonthlyThreshold2Modal
	elseif State.purchaseWarningType == U13ConfirmType.ParentalConsentWarningPaymentModal13To17 then
		None.sendCounter(BuyRobuxCounterModule.ConfirmParentalConsentWarningPaymentModal13To17)
		None1 = ApiPostAckPurchaseWarningModule.UserActionType.ConfirmedParentalConsentWarningPaymentModal13To17
	end
	return Props.dispatchPostAckPurchaseWarning(None1)
end

function ExtendResult.promptRobuxPurchase(p2)
	p2.props.promptRobux(p2.props.networking, p2.selectedRobuxPackage, p2.getProductId(p2.selectedRobuxPackage))
end

function ExtendResult.getFlowState(p2)
	-- upvalues: VPCModalTypeModule (copy), BuyRobuxFlowState (copy), RetrievalStatusModule (copy), PurchaseErrorType (copy), U13ConfirmType (copy), NativePurchaseStatusModule (copy), GetFFlagFixBuyRobuxNotChargedMessageModule (copy)
	local State = p2.state
	local Props = p2.props
	
	return if State.purchaseVPCErrorType == nil or State.purchaseVPCErrorType == VPCModalTypeModule.toRawValue(VPCModalTypeModule.None) then if State.purchaseVPCErrorFetchingStatus == RetrievalStatusModule.Failed then BuyRobuxFlowState.Error elseif State.purchaseErrorType == PurchaseErrorType.EconomicRestriction then BuyRobuxFlowState.Error elseif State.purchasePreCheckStatus == RetrievalStatusModule.Failed then BuyRobuxFlowState.Error elseif Props.iapProductsFetchingStatus == RetrievalStatusModule.Done and Props.nativeProductsFetchingStatus == RetrievalStatusModule.Done then if State.purchaseWarningFetchingStatus == RetrievalStatusModule.NotStarted or State.purchaseVPCErrorFetchingStatus == RetrievalStatusModule.NotStarted then BuyRobuxFlowState.BuyRobux elseif State.purchaseWarningFetchingStatus == RetrievalStatusModule.Done or State.purchaseVPCErrorFetchingStatus == RetrievalStatusModule.Done then if State.purchaseWarningType == U13ConfirmType.None or State.purchaseWarningPostStatus ~= RetrievalStatusModule.NotStarted then if Props.iapPurchase.nativeProductId == nil or Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.Pending then BuyRobuxFlowState.RobuxPurchasePending elseif Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.Polling then BuyRobuxFlowState.RobuxGrantPending elseif Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.Failed or GetFFlagFixBuyRobuxNotChargedMessageModule() and Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.RobuxPollingFailedAfterNativePurchase then BuyRobuxFlowState.Error elseif Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.Success then BuyRobuxFlowState.Succeed else BuyRobuxFlowState.BuyRobux else BuyRobuxFlowState.PurchaseWarning else BuyRobuxFlowState.Loading else BuyRobuxFlowState.Loading else BuyRobuxFlowState.PurchaseVPC
end

function ExtendResult.getErrorType(p2)
	-- upvalues: NativePurchaseStatusModule (copy), PurchaseErrorType (copy)
	local Props = p2.props
	local State = p2.state
	
	return if Props.iapPurchase and Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.RobuxPollingFailedAfterNativePurchase then PurchaseErrorType.FailedGrant else State.purchaseErrorType
end

function ExtendResult.render(p2)
	-- upvalues: RoactModule (copy), BuyRobuxFlow (copy), IsTenFootInterface (copy), GetFFlagFixBuyRobuxNotChargedMessageModule (copy)
	local Props = p2.props
	local State = p2.state
	
	return RoactModule.createElement(BuyRobuxFlow, {
		shouldAnimate = true,
		screenSize = Props.screenSize,
		isConsoleSize = IsTenFootInterface,
		showBackground = not IsTenFootInterface,
		showCloseButton = not IsTenFootInterface,
		analyticId = Props.analyticId,
		robuxBalance = Props.robuxBalance,
		robuxPackages = Props.robuxPackages,
		purchaseState = p2:getFlowState(),
		purchaseVPCType = State.purchaseVPCErrorType,
		errorType = if GetFFlagFixBuyRobuxNotChargedMessageModule() then p2:getErrorType() else State.purchaseErrorType,
		economicRestrictionError = State.economicRestrictionError,
		u13ConfirmType = p2.state.purchaseWarningType,
		purchaseRobux = p2.purchaseRobux,
		acceptPurchaseWarning = p2.acceptPurchaseWarning,
		cancelPurchase = p2.cancelPurchase,
		flowComplete = p2.endPurchase,
		onAnalyticEvent = p2.sendAnalyticEvent,
		eventPrefix = Props.eventPrefix,
		onPageClose = Props.onPageClose,
		dispatchCentralOverlay = Props.dispatchCentralOverlay
	})
end

return ExtendResult