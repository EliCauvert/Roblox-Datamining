local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local PromiseModule = require(CorePackages.Packages.Promise)
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local RobuxUpsellFlow = IAPExperienceModule.PurchaseFlow.RobuxUpsellFlow
local RobuxUpsellFlowState = IAPExperienceModule.PurchaseFlow.RobuxUpsellFlowState
local U13ConfirmType = IAPExperienceModule.PurchaseFlow.U13ConfirmType
local PurchaseErrorType = IAPExperienceModule.PurchaseFlow.PurchaseErrorType
local VPCModalTypeModule = require(Modules.LuaApp.Components.BuyRobux.Enum.VPCModalType)
local TwoStepSpendFrictionRequestsModule = require(Modules.LuaApp.Http.Requests.TwoStepSpendFrictionRequests)
local ApiFetchIAPPurchaseWarningModule = require(Modules.LuaApp.Thunks.ApiFetchIAPPurchaseWarning)
local ApiPostAckPurchaseWarningModule = require(Modules.LuaApp.Thunks.ApiPostAckPurchaseWarning)
local TypeModule = require(Modules.LuaApp.Enum.Challenge.Type)
local ActionTypeModule = require(Modules.LuaApp.Enum.Challenge.TwoStepVerification.ActionType)
local NativePurchaseStatusModule = require(Modules.LuaApp.Enum.NativePurchaseStatus)
local GetFFlagFixBuyRobuxNotChargedMessageModule = require(Modules.LuaApp.Flags.GetFFlagFixBuyRobuxNotChargedMessage)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local RobuxUpsellCounterModule = require(script.Parent.Enum.RobuxUpsellCounter)
local PaymentPlatformModule = require(Modules.LuaApp.Enum.PaymentPlatform)
local GetPaymentPlatformModule = require(Modules.LuaApp.Util.getPaymentPlatform)
local CheckUserPurchaseSettingsFailureReason = IAPExperienceModule.Enums.CheckUserPurchaseSettingsFailureReason
local MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction = IAPExperienceModule.Utility.mapCheckUserPurchaseSettingsFailureReasonToViolationType
local GetFFlagLuaAppWaitBeforeTwoStepRenderDevModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppWaitBeforeTwoStepRenderDev)
local GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDevModule = require(Modules.LuaApp.Flags.GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDev)
local GetFFlagOpenVngTosForVngRobuxUpsellFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagOpenVngTosForVngRobuxUpsell
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
local PreparePaymentCheckFunction = IAPExperienceModule.PreparePaymentCheck
local GetEnableConsolePreparePaymentCheckFunction = IAPExperienceModule.GetEnableConsolePreparePaymentCheck
local UpsellSuggestionsAPIMaxPackages = require(CorePackages.Workspace.Packages.SharedFlags).UpsellSuggestionsAPIMaxPackages
local EconomicRestrictionsViolationType = IAPExperienceModule.Enums.EconomicRestrictionsViolationType

function ExtendResult.init(p1)
	-- upvalues: PurchaseErrorType (copy), RetrievalStatusModule (copy), U13ConfirmType (copy), VPCModalTypeModule (copy), RobuxUpsellCounterModule (copy), GetEnableConsolePreparePaymentCheckFunction (copy), PreparePaymentCheckFunction (copy), PromiseModule (copy), GetPaymentPlatformModule (copy), PaymentPlatformModule (copy)
	p1.state = {
		robuxSuggestions = nil,
		robuxPackageSelection = nil,
		virtualItemBadgeType = nil,
		robuxProduct = nil,
		twoStepRequired = false,
		errorType = PurchaseErrorType.None,
		robuxProductFetchingStatus = RetrievalStatusModule.NotStarted,
		purchaseWarningType = U13ConfirmType.None,
		purchaseWarningFetchingStatus = RetrievalStatusModule.NotStarted,
		purchaseWarningPostStatus = RetrievalStatusModule.NotStarted,
		purchaseVPCErrorType = VPCModalTypeModule.toRawValue(VPCModalTypeModule.None),
		purchaseVPCErrorFetchingStatus = RetrievalStatusModule.NotStarted,
		itemPurchaseFetchingStatus = RetrievalStatusModule.NotStarted
	}
	
	function p1.getSelectedRobuxProduct()
		-- upvalues: p1 (copy)
		return if p1.state.robuxSuggestions == nil or p1.state.robuxPackageSelection == nil then nil else p1.state.robuxSuggestions[p1.state.robuxPackageSelection]
	end
	
	function p1.failFlow(ErrorType, p2, UpsellFailedTwoStep)
		-- upvalues: p1 (copy), RobuxUpsellCounterModule (upval), PurchaseErrorType (upval)
		if UpsellFailedTwoStep == nil then
			p1.sendCounter(RobuxUpsellCounterModule.UpsellFailed)
		else
			p1.sendCounter(UpsellFailedTwoStep)
		end
		local T = if p2 ~= nil then p2 else {}
		
		if ErrorType == nil then
			T.errorType = PurchaseErrorType.Unknown
		else
			T.errorType = ErrorType
		end
		p1:setState(T)
	end
	
	function p1.getRobuxUpsellProduct()
		-- upvalues: p1 (copy), RetrievalStatusModule (upval)
		task.spawn(function()
			-- upvalues: p1 (upval), RetrievalStatusModule (upval)
			p1:setState({
				robuxProductFetchingStatus = RetrievalStatusModule.Fetching
			})
			p1:dispatchFetchRobuxProduct():andThen(function()
				-- upvalues: p1 (upval), RetrievalStatusModule (upval)
				p1:setState({ robuxProductFetchingStatus = RetrievalStatusModule.Done })
			end, function()
				-- upvalues: p1 (upval), RetrievalStatusModule (upval)
				p1:setState({ robuxProductFetchingStatus = RetrievalStatusModule.Done })
			end)
		end)
	end
	
	function p1.attemptRobuxUpsell()
		-- upvalues: GetEnableConsolePreparePaymentCheckFunction (upval), p1 (copy), PreparePaymentCheckFunction (upval), RetrievalStatusModule (upval), PromiseModule (upval)
		if GetEnableConsolePreparePaymentCheckFunction() and not PreparePaymentCheckFunction(p1.getSelectedRobuxProduct().providerId) then
			p1.failFlow()
			
			return
		else
			p1:setState({
				purchaseVPCErrorFetchingStatus = RetrievalStatusModule.Fetching
			})
			p1:dispatchCheckUserPurchaseSettings():andThen(function(Result)
				-- upvalues: p1 (upval), RetrievalStatusModule (upval), PromiseModule (upval)
				p1:setState({
					purchaseVPCErrorFetchingStatus = RetrievalStatusModule.Done
				})
				
				if Result then
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
						p1.failFlow(nil, {
							purchaseWarningFetchingStatus = RetrievalStatusModule.Failed
						})
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
	
	function p1.attemptPurchaseItem()
		-- upvalues: p1 (copy), RetrievalStatusModule (upval), RobuxUpsellCounterModule (upval)
		p1:setState({
			itemPurchaseFetchingStatus = RetrievalStatusModule.Fetching
		})
		p1:purchaseItem():andThen(function(Result)
			-- upvalues: p1 (upval), RetrievalStatusModule (upval)
			if Result then
				p1:setState({ itemPurchaseFetchingStatus = RetrievalStatusModule.Done })
			end
		end, function()
			-- upvalues: p1 (upval), RetrievalStatusModule (upval), RobuxUpsellCounterModule (upval)
			p1.failFlow(nil, {
				itemPurchaseFetchingStatus = RetrievalStatusModule.Failed
			}, RobuxUpsellCounterModule.UpsellFailedTwoStep)
		end)
	end
	
	function p1.showTwoStepRequiredPrompt()
		-- upvalues: p1 (copy)
		p1:setState({ twoStepRequired = true })
	end
	
	function p1.openSecuritySettings()
		-- upvalues: p1 (copy)
		p1.props.openSecuritySettings()
	end
	
	function p1.openBuyRobux()
		-- upvalues: p1 (copy)
		p1.props.openBuyRobux()
	end
	
	function p1.cancelPurchase()
		-- upvalues: p1 (copy), RobuxUpsellCounterModule (upval)
		p1.sendCounter(RobuxUpsellCounterModule.UpsellCancelled)
		p1.props.endPurchase()
	end
	
	function p1.sendErrorEvent(p2)
		-- upvalues: p1 (copy)
		p1.props.sendAnalyticEvent(p1.props.eventPrefix .. "RobuxUpsell", "RobuxUpsellError", p2)
	end
	
	function p1.sendAnalyticEvent(p2, p3)
		-- upvalues: p1 (copy)
		p1.props.sendAnalyticEvent(p1.props.eventPrefix .. "RobuxUpsell", p2, p3)
	end
	
	function p1.sendCounter(AbandonedTwoStepAuth)
		-- upvalues: RobuxUpsellCounterModule (upval), p1 (copy)
		local RawValue = RobuxUpsellCounterModule.toRawValue(AbandonedTwoStepAuth)
		p1.props.sendCounter(RawValue)
		local SelectedRobuxProduct = p1.getSelectedRobuxProduct()
		
		if SelectedRobuxProduct ~= nil and SelectedRobuxProduct.robuxAmount ~= nil then
			p1.props.sendCounter(RawValue .. tostring(SelectedRobuxProduct.robuxAmount))
		end
	end
	
	function p1.isSettingsSupportedForPlatform(): boolean
		-- upvalues: GetPaymentPlatformModule (upval), PaymentPlatformModule (upval)
		local PaymentPlatformModule1 = GetPaymentPlatformModule()
		
		return PaymentPlatformModule1 == PaymentPlatformModule.Google or (PaymentPlatformModule1 == PaymentPlatformModule.Apple or (PaymentPlatformModule1 == PaymentPlatformModule.UWP or PaymentPlatformModule1 == PaymentPlatformModule.Amazon))
	end
end

function ExtendResult.dispatchFetchRobuxProduct(p1)
	-- upvalues: PromiseModule (copy)
	local UpsellSuggestions, UpsellSuggestions2 = p1.props.fetchUpsellSuggestions()
	
	if UpsellSuggestions and UpsellSuggestions2 ~= nil then
		p1:setState({
			robuxPackageSelection = 1,
			robuxSuggestions = UpsellSuggestions2.products,
			virtualItemBadgeType = UpsellSuggestions2.virtualItemBadgeType
		})
		
		return PromiseModule.resolve()
	else
		return PromiseModule.reject()
	end
end

function ExtendResult.dispatchFetchPurchaseWarning(p1)
	-- upvalues: ApiFetchIAPPurchaseWarningModule (copy), RobuxUpsellCounterModule (copy), U13ConfirmType (copy), PromiseModule (copy)
	local Props = p1.props
	local SelectedRobuxProduct = p1.getSelectedRobuxProduct()
	
	if SelectedRobuxProduct == nil then return end
	return Props.dispatchFetchIAPPurchaseWarning(SelectedRobuxProduct.providerId, SelectedRobuxProduct.productId):andThen(function(Result)
		-- upvalues: ApiFetchIAPPurchaseWarningModule (upval), p1 (copy), RobuxUpsellCounterModule (upval), U13ConfirmType (upval), PromiseModule (upval)
		local Flag = true
		
		if Result == ApiFetchIAPPurchaseWarningModule.ResponseType.U13PaymentModal then
			p1.sendCounter(RobuxUpsellCounterModule.ShowU13PaymentModal)
			p1:setState({ purchaseWarningType = U13ConfirmType.U13PaymentModal })
		elseif Result == ApiFetchIAPPurchaseWarningModule.ResponseType.U13MonthlyThreshold1Modal then
			p1.sendCounter(RobuxUpsellCounterModule.ShowU13MonthlyThreshold1Modal)
			p1:setState({
				purchaseWarningType = U13ConfirmType.U13MonthlyThreshold1Modal
			})
		elseif Result == ApiFetchIAPPurchaseWarningModule.ResponseType.U13MonthlyThreshold2Modal then
			p1.sendCounter(RobuxUpsellCounterModule.ShownU13MonthlyThreshold2Modal)
			p1:setState({
				purchaseWarningType = U13ConfirmType.U13MonthlyThreshold2Modal
			})
		elseif Result == ApiFetchIAPPurchaseWarningModule.ResponseType.ParentalConsentWarningPaymentModal13To17 then
			p1.sendCounter(RobuxUpsellCounterModule.ShownParentalConsentWarningPaymentModal13To17)
			p1:setState({
				purchaseWarningType = U13ConfirmType.ParentalConsentWarningPaymentModal13To17
			})
		else
			Flag = false
		end
		return PromiseModule.resolve(Flag)
	end)
end

function ExtendResult.dispatchPostAckPurchaseWarning(None)
	-- upvalues: ApiPostAckPurchaseWarningModule (copy), U13ConfirmType (copy), RobuxUpsellCounterModule (copy)
	local Props = None.props
	local State = None.state
	local None1 = ApiPostAckPurchaseWarningModule.UserActionType.None
	
	if State.purchaseWarningType == U13ConfirmType.U13PaymentModal then
		None.sendCounter(RobuxUpsellCounterModule.ConfirmU13PaymentModal)
		None1 = ApiPostAckPurchaseWarningModule.UserActionType.ConfirmedU13PaymentModal
	elseif State.purchaseWarningType == U13ConfirmType.U13MonthlyThreshold1Modal then
		None.sendCounter(RobuxUpsellCounterModule.ConfirmU13MonthlyThreshold1Modal)
		None1 = ApiPostAckPurchaseWarningModule.UserActionType.ConfirmedU13MonthlyThreshold1Modal
	elseif State.purchaseWarningType == U13ConfirmType.U13MonthlyThreshold2Modal then
		None.sendCounter(RobuxUpsellCounterModule.ConfirmU13MonthlyThreshold2Modal)
		None1 = ApiPostAckPurchaseWarningModule.UserActionType.ConfirmedU13MonthlyThreshold2Modal
	elseif State.purchaseWarningType == U13ConfirmType.ParentalConsentWarningPaymentModal13To17 then
		None.sendCounter(RobuxUpsellCounterModule.ConfirmParentalConsentWarningPaymentModal13To17)
		None1 = ApiPostAckPurchaseWarningModule.UserActionType.ConfirmedParentalConsentWarningPaymentModal13To17
	end
	return Props.dispatchPostAckPurchaseWarning(None1)
end

function ExtendResult.dispatchCheckUserPurchaseSettings(p1)
	-- upvalues: GetPaymentPlatformModule (copy), PaymentPlatformModule (copy), PromiseModule (copy), MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction (copy), EconomicRestrictionsViolationType (copy), CheckUserPurchaseSettingsFailureReason (copy), RobuxUpsellCounterModule (copy), VPCModalTypeModule (copy), PurchaseErrorType (copy), RetrievalStatusModule (copy)
	local Props = p1.props
	
	return if GetPaymentPlatformModule() == PaymentPlatformModule.Web then PromiseModule.resolve(true) else Props.dispatchCheckUserPurchaseSettings():andThen(function(Result)
		-- upvalues: MapCheckUserPurchaseSettingsFailureReasonToViolationTypeFunction (upval), EconomicRestrictionsViolationType (upval), PromiseModule (upval), CheckUserPurchaseSettingsFailureReason (upval), p1 (copy), RobuxUpsellCounterModule (upval), VPCModalTypeModule (upval), PurchaseErrorType (upval)
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
			p1.sendCounter(RobuxUpsellCounterModule.ShowPurchaseNotEnabledModal)
			p1:setState({
				purchaseVPCErrorType = VPCModalTypeModule.toRawValue(VPCModalTypeModule.EnablePurchase)
			})
			
			return PromiseModule.resolve(false)
		elseif not HasExpirationTimeInMinutes then
			error("User is not eligible for purchases with unknown failure reason")
			
			return
		else
			p1.sendCounter(RobuxUpsellCounterModule.ShowEconomicRestrictionModal)
			p1:setState({
				errorType = PurchaseErrorType.EconomicRestriction,
				economicRestrictionError = {
					timeoutMinutes = Result.expirationTimeInMinutes,
					violationType = MapCheckUserPurchaseSettingsFailureReasonToViolationTypeResult
				}
			})
			
			return PromiseModule.resolve(false)
		end
	end):catch(function(_)
		-- upvalues: p1 (copy), RetrievalStatusModule (upval), PromiseModule (upval)
		p1.failFlow(nil, {
			purchaseWarningFetchingStatus = RetrievalStatusModule.Failed
		})
		
		return PromiseModule.resolve(false)
	end)
end

function ExtendResult.promptRobuxPurchase(p1)
	local Props = p1.props
	local SelectedRobuxProduct = p1.getSelectedRobuxProduct()
	
	if SelectedRobuxProduct ~= nil then
		if Props.analyticId then
			Props.promptRobux(p1.props.networking, SelectedRobuxProduct.providerId, SelectedRobuxProduct.productId, Props.analyticId)
			
			return
		end
		Props.promptRobux(p1.props.networking, SelectedRobuxProduct.providerId, SelectedRobuxProduct.productId)
	end
end

function ExtendResult.purchaseItem(p1)
	-- upvalues: RobuxUpsellCounterModule (copy), PromiseModule (copy)
	return p1.props.purchaseItem():andThen(function(Result)
		-- upvalues: p1 (copy), RobuxUpsellCounterModule (upval), PromiseModule (upval)
		local Is2SVEnabled = Result.is2SVEnabled
		local ChallengeToken = Result.challengeToken
		
		if Result.purchased then
			p1.sendCounter(RobuxUpsellCounterModule.UpsellSuccess)
			
			return PromiseModule.resolve(true)
		elseif Is2SVEnabled == false then
			p1.sendCounter(RobuxUpsellCounterModule.ShownEnableTwoStepAuth)
			p1.showTwoStepRequiredPrompt()
			
			return PromiseModule.resolve(true)
		elseif ChallengeToken then
			p1.sendCounter(RobuxUpsellCounterModule.ShownTwoStepAuth)
			p1:renderTwoStepChallenge(ChallengeToken)
			
			return PromiseModule.resolve(false)
		else
			p1.sendCounter(RobuxUpsellCounterModule.FailedShowTwoStepAuth)
			
			return PromiseModule.reject()
		end
	end, function()
		-- upvalues: p1 (copy), RobuxUpsellCounterModule (upval), PromiseModule (upval)
		p1.sendCounter(RobuxUpsellCounterModule.FailedShowTwoStepAuthUnknown)
		
		return PromiseModule.reject()
	end)
end

function ExtendResult.renderTwoStepChallenge(p1, ChallengeId)
	-- upvalues: GetFFlagLuaAppWaitBeforeTwoStepRenderDevModule (copy), GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDevModule (copy), TypeModule (copy), ActionTypeModule (copy), RobuxUpsellCounterModule (copy), TwoStepSpendFrictionRequestsModule (copy)
	local Props = p1.props
	local Networking = Props.networking
	local UserId = Props.userId
	
	if GetFFlagLuaAppWaitBeforeTwoStepRenderDevModule() then
		wait(GetFIntLuaAppWaitBeforeTwoStepRenderTimeSecondsDevModule())
	end
	Props.renderChallenge({
		forceWebViewVisible = true,
		challengeType = TypeModule.TwoStepVerification,
		challengeParameters = {
			actionType = ActionTypeModule.RobuxSpend,
			challengeId = ChallengeId,
			userId = UserId,
			onChallengeCompleted = function(p2)
				-- upvalues: p1 (copy), RobuxUpsellCounterModule (upval), TwoStepSpendFrictionRequestsModule (upval), Networking (copy), ChallengeId (copy)
				p1.sendCounter(RobuxUpsellCounterModule.CompletedTwoStepAuth)
				
				return TwoStepSpendFrictionRequestsModule.redeem(Networking, tostring(ChallengeId), p2.verificationToken):andThen(function(_)
					-- upvalues: p1 (upval)
					p1.attemptPurchaseItem()
				end, function(_)
					-- upvalues: p1 (upval)
					p1.failFlow()
				end)
			end,
			onChallengeInvalidated = function(_)
				-- upvalues: p1 (copy), RobuxUpsellCounterModule (upval)
				p1.sendCounter(RobuxUpsellCounterModule.InvalidatedTwoStepAuth)
				p1.failFlow()
			end
		},
		onChallengeAbandoned = function()
			-- upvalues: p1 (copy), RobuxUpsellCounterModule (upval)
			p1.sendCounter(RobuxUpsellCounterModule.AbandonedTwoStepAuth)
			p1.failFlow()
		end,
		onChallengeLoadFailed = function()
			-- upvalues: p1 (copy), RobuxUpsellCounterModule (upval)
			p1.sendCounter(RobuxUpsellCounterModule.LoadFailedTwoStepAuth)
			p1.failFlow()
		end
	}, false)
end

function ExtendResult.didMount(p1)
	-- upvalues: RetrievalStatusModule (copy), RobuxUpsellCounterModule (copy)
	if p1.state.robuxProductFetchingStatus == RetrievalStatusModule.NotStarted then
		p1.sendCounter(RobuxUpsellCounterModule.UpsellShown)
		p1.getRobuxUpsellProduct()
	end
end

function ExtendResult.didUpdate(p1, p2, p3)
	-- upvalues: RetrievalStatusModule (copy), RobuxUpsellCounterModule (copy), NativePurchaseStatusModule (copy), GetFFlagFixBuyRobuxNotChargedMessageModule (copy)
	local State = p1.state
	local Props = p1.props
	
	if p3.robuxProductFetchingStatus ~= State.robuxProductFetchingStatus and State.robuxProductFetchingStatus == RetrievalStatusModule.Done then
		if p1.getSelectedRobuxProduct() == nil then
			p1.sendCounter(RobuxUpsellCounterModule.UpsellGenericModalShown)
		else
			p1.sendCounter(RobuxUpsellCounterModule.UpsellModalShown)
		end
	end
	if Props.iapPurchase ~= p2.iapPurchase then
		if Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.Success and State.itemPurchaseFetchingStatus == RetrievalStatusModule.NotStarted then
			p1.attemptPurchaseItem()
		end
		if p2.iapPurchase.purchaseStatus ~= Props.iapPurchase.purchaseStatus and (Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.Failed or GetFFlagFixBuyRobuxNotChargedMessageModule() and Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.RobuxPollingFailedAfterNativePurchase) then
			p1.sendCounter(RobuxUpsellCounterModule.UpsellFailedNativePurchase)
		end
	end
end

function ExtendResult.getFlowState(p1)
	-- upvalues: VPCModalTypeModule (copy), RobuxUpsellFlowState (copy), PurchaseErrorType (copy), RetrievalStatusModule (copy), U13ConfirmType (copy), NativePurchaseStatusModule (copy), GetFFlagFixBuyRobuxNotChargedMessageModule (copy)
	local State = p1.state
	local Props = p1.props
	
	return if State.purchaseVPCErrorType == nil or State.purchaseVPCErrorType == VPCModalTypeModule.toRawValue(VPCModalTypeModule.None) then if State.errorType == PurchaseErrorType.None then if State.robuxProductFetchingStatus == RetrievalStatusModule.Done then if State.purchaseWarningFetchingStatus == RetrievalStatusModule.NotStarted and State.purchaseVPCErrorFetchingStatus == RetrievalStatusModule.NotStarted then if p1.getSelectedRobuxProduct() == nil then RobuxUpsellFlowState.GenericPurchaseModal else RobuxUpsellFlowState.PurchaseModal elseif State.purchaseWarningFetchingStatus == RetrievalStatusModule.Done or State.purchaseVPCErrorFetchingStatus == RetrievalStatusModule.Done then if State.purchaseWarningType == U13ConfirmType.None or State.purchaseWarningPostStatus ~= RetrievalStatusModule.NotStarted then if Props.iapPurchase.nativeProductId == nil or Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.Pending then RobuxUpsellFlowState.RobuxPurchasePending elseif Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.Polling then RobuxUpsellFlowState.RobuxGrantPending elseif Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.Failed or GetFFlagFixBuyRobuxNotChargedMessageModule() and Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.RobuxPollingFailedAfterNativePurchase then RobuxUpsellFlowState.Error elseif State.itemPurchaseFetchingStatus == RetrievalStatusModule.NotStarted or State.itemPurchaseFetchingStatus == RetrievalStatusModule.Fetching then RobuxUpsellFlowState.ItemPurchasePending elseif State.twoStepRequired then RobuxUpsellFlowState.TwoStepRequired elseif State.itemPurchaseFetchingStatus == RetrievalStatusModule.Done then RobuxUpsellFlowState.Success else RobuxUpsellFlowState.Error else RobuxUpsellFlowState.PurchaseWarning else RobuxUpsellFlowState.Loading else RobuxUpsellFlowState.Loading else RobuxUpsellFlowState.Error else RobuxUpsellFlowState.PurchaseVPCModal
end

function ExtendResult.getErrorType(p1)
	-- upvalues: NativePurchaseStatusModule (copy), GetFFlagFixBuyRobuxNotChargedMessageModule (copy), PurchaseErrorType (copy)
	local State = p1.state
	local Props = p1.props
	
	return if Props.iapPurchase and (Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.Failed or GetFFlagFixBuyRobuxNotChargedMessageModule() and Props.iapPurchase.purchaseStatus == NativePurchaseStatusModule.RobuxPollingFailedAfterNativePurchase) then PurchaseErrorType.FailedGrantUnknown else State.errorType
end

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), RobuxUpsellFlow (copy), UpsellSuggestionsAPIMaxPackages (copy), GetFFlagOpenVngTosForVngRobuxUpsellFunction (copy), GetAppFeaturePoliciesFunction (copy)
	local Props = p1.props
	local State = p1.state
	local SelectedRobuxProduct = p1.getSelectedRobuxProduct()
	
	return RoactModule.createElement(RobuxUpsellFlow, {
		screenSize = Props.screenSize,
		itemProductId = Props.itemProductId,
		itemIcon = Props.itemIcon,
		itemName = Props.itemName,
		itemRobuxCost = Props.priceInRobux,
		iapRobuxAmount = SelectedRobuxProduct and SelectedRobuxProduct.robuxAmount or nil,
		iapRobuxAmountBeforeBonus = if SelectedRobuxProduct then SelectedRobuxProduct.robuxAmountBeforeBonus else nil,
		iapCostStr = if SelectedRobuxProduct then SelectedRobuxProduct.price else nil,
		beforeRobuxBalance = Props.beforeRobuxBalance,
		useUpsellSuggestions = UpsellSuggestionsAPIMaxPackages > 1,
		upsellSuggestions = State.robuxSuggestions,
		selectedUpsellIndex = State.robuxPackageSelection,
		virtualItemBadgeType = State.virtualItemBadgeType,
		onUpsellSuggestionsSelected = function(RobuxPackageSelection)
			-- upvalues: p1 (copy)
			p1:setState({ robuxPackageSelection = RobuxPackageSelection })
		end,
		purchaseState = p1:getFlowState(),
		errorType = p1:getErrorType(),
		economicRestrictionError = State.economicRestrictionError,
		u13ConfirmType = State.purchaseWarningType,
		purchaseVPCType = State.purchaseVPCErrorType,
		acceptControllerIcon = nil,
		cancelControllerIcon = nil,
		purchaseRobux = p1.attemptRobuxUpsell,
		acceptPurchaseWarning = p1.acceptPurchaseWarning,
		cancelPurchase = p1.cancelPurchase,
		openSecuritySettings = p1.openSecuritySettings,
		openBuyRobux = p1.openBuyRobux,
		showTermsOfUse = p1.props.openTermsOfUse,
		equipItem = Props.equipItem,
		flowComplete = Props.endPurchase,
		openSettingsPage = if p1.isSettingsSupportedForPlatform() then Props.openSettingsPage else nil,
		onAnalyticEvent = p1.sendAnalyticEvent,
		eventPrefix = Props.eventPrefix,
		analyticId = Props.analyticId,
		dispatchCentralOverlay = Props.dispatchCentralOverlay,
		isVng = GetFFlagOpenVngTosForVngRobuxUpsellFunction() and GetAppFeaturePoliciesFunction().getShowVNGTosForRobuxUpsell()
	})
end

return ExtendResult