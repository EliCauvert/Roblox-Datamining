local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local useLocalization = require(parent.Localization).Hooks.useLocalization
local appScreensModule = require(ampUpsell.Common.AppScreens)
local IDVWithQRCodeUpsellModule = require(script.Parent.IDVWithQRCodeUpsell)
local IDVApiProvider = require(parent.IdentityVerification).IDVApiProvider
local getFStringBiometricPrivacyPolicyLinkModule = require(ampUpsell.Flags.GetFStringBiometricPrivacyPolicyLink)
local getFIntIDVPollDelay = require(parent.IdentityVerification).GetFIntIDVPollDelay
local getFIntIDVMaxRetries = require(parent.IdentityVerification).GetFIntIDVMaxRetries
local useNavigation = require(parent.Navigation).useNavigation
local enumsModule = require(ampUpsell.Common.Enums)
local IDVStep = enumsModule.IDVStep
local IDVSessionStatusEnum = require(parent.IdentityVerification).Enums.IDVSessionStatusEnum
local actionStatusEnum = enumsModule.ActionStatusEnum
local IDVErrorScreenModule = require(script.Parent.IDVErrorScreen)
local localizationStringsModule = require(ampUpsell.Common.LocalizationStrings)
local idvErrorScreenStrings = localizationStringsModule.idvErrorScreenStrings
local idvWithQRCodeUpsellStrings = localizationStringsModule.idvWithQRCodeUpsellStrings
local IDVDirectLinkUpsellModule = require(script.Parent.IDVDirectLinkUpsell)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local useDeviceType = robloxAppHooksModule.useDeviceType
local useRoactService = robloxAppHooksModule.useRoactService
local appLinking = require(parent.RoactServiceTags).AppLinking
local deviceType = require(parent.RobloxAppEnums).DeviceType
local getFFlagEnableDirectLinkForTabletsModule = require(ampUpsell.Flags.GetFFlagEnableDirectLinkForTablets)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local getFFlagEnableRoactNetworkingForChallengeInteceptionModule = require(ampUpsell.Flags.GetFFlagEnableRoactNetworkingForChallengeInteception)
local getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule = require(ampUpsell.Flags.GetFFlagEnableNativePersonaInquiryForAmpIDVUpsell)
local getFFlagEnableAmpIDVUpsellAnalyticsModule = require(ampUpsell.Flags.GetFFlagEnableAmpIDVUpsellAnalytics)
local facialAgeEstimationServiceWrapperModule = require(script.Parent.Parent.FacialAgeEstimation.FacialAgeEstimationServiceWrapper)
local authAnalyticsModule = require(parent.AuthAnalytics)
local authMsgShown = authAnalyticsModule.Events.authMsgShown
local authModalShown = authAnalyticsModule.Events.authModalShown
local authFormInteraction = authAnalyticsModule.Events.authFormInteraction
local var1 = getFIntIDVPollDelay()
local var2 = getFIntIDVMaxRetries()

local function _(p1)
	-- upvalues: IDVSessionStatusEnum (ref)
	return if p1 ~= IDVSessionStatusEnum.Failure then if p1 ~= IDVSessionStatusEnum.RequiresManualReview then if p1 ~= IDVSessionStatusEnum.RequiresRetry then p1 == IDVSessionStatusEnum.Expired else true else true else true
end

local _ = function(p1, p2)
	-- upvalues: IDVSessionStatusEnum (ref)
	return if p1 == IDVSessionStatusEnum.Failure or p1 == IDVSessionStatusEnum.RequiresManualReview then p2.declined elseif p1 == IDVSessionStatusEnum.RequiresRetry then p2.retry elseif p1 == IDVSessionStatusEnum.Expired then p2.timeout else p2.retry
end

return function(p1)
	-- upvalues: IDVApiProvider (ref), useDeviceType (ref), useNavigation (ref), useLocalization (ref), idvErrorScreenStrings (ref), idvWithQRCodeUpsellStrings (ref), reactModule (ref), actionStatusEnum (ref), getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule (ref), facialAgeEstimationServiceWrapperModule (ref), getFFlagEnableDirectLinkForTabletsModule (ref), deviceType (ref), useRoactService (ref), appLinking (ref), roactNetworking (ref), appScreensModule (ref), getFStringBiometricPrivacyPolicyLinkModule (ref), IDVSessionStatusEnum (ref), IDVStep (ref), getFFlagEnableAmpIDVUpsellAnalyticsModule (ref), authModalShown (ref), authMsgShown (ref), var1 (ref), var2 (ref), promiseModule (ref), getFFlagEnableRoactNetworkingForChallengeInteceptionModule (ref), authFormInteraction (ref), IDVErrorScreenModule (ref), loading (ref), iconSize (ref), IDVDirectLinkUpsellModule (ref), IDVWithQRCodeUpsellModule (ref)
	local featureName = p1.featureName
	local onSuccess = p1.onSuccess
	local onFailure = p1.onFailure
	local onCancelled = p1.onCancelled
	local var3 = if p1.idvApiProvider then p1.idvApiProvider else IDVApiProvider
	local deviceType_1 = p1.deviceType or useDeviceType()
	local var4 = useNavigation()
	local var5 = useLocalization(idvErrorScreenStrings)
	local var6 = useLocalization(idvWithQRCodeUpsellStrings)
	local entryPointEventCtx = p1.entryPointEventCtx or ""
	local var7 = if p1.metadata then p1.metadata.sessionId else ""
	local var8, var9 = reactModule.useState(nil)
	local var10 = reactModule.useRef(true)
	local var11, var12 = reactModule.useState(actionStatusEnum.Unknown)
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState(var5.retry)
	local var17, var18 = reactModule.useState(0)
	local var19 = getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule() and facialAgeEstimationServiceWrapperModule.isAvailable()
	local var20 = if getFFlagEnableDirectLinkForTabletsModule() then true else deviceType_1 == deviceType.Phone
	local var21 = useRoactService(appLinking)
	local var22 = useRoactService(roactNetworking)
	local schedulePoll = p1.schedulePoll or function(p2, p3)
		spawn(function()
			-- upvalues: p3 (ref), p2 (ref)
			wait(p3)
			p2()
		end)
	end
	local openIdvLink = p1.openIdvLink or function(p2)
		-- upvalues: var21 (ref)
		var21:openURL(p2)
	end
	
	local var23 = function()
		-- upvalues: var4 (ref), appScreensModule (copy), getFStringBiometricPrivacyPolicyLinkModule (copy), var6 (ref)
		var4.navigate(appScreensModule.GenericWebPage, {
			detail = getFStringBiometricPrivacyPolicyLinkModule(),
			extraProps = {
				transitionAnimation = "SlideInFromBottom",
				title = var6.privacyPageHeader
			}
		})
	end
	
	local function updateChecklist(p2)
		-- upvalues: IDVSessionStatusEnum (copy), var18 (ref), IDVStep (copy)
		if p2 == IDVSessionStatusEnum.Stored then
			var18(IDVStep.UpdatedRobloxProfile)
			
			return
		elseif p2 == IDVSessionStatusEnum.Success then
			var18(IDVStep.Verified)
			
			return
		elseif p2 == IDVSessionStatusEnum.Submitted then
			var18(IDVStep.GotResults)
			
			return
		elseif p2 == IDVSessionStatusEnum.Started then
			var18(IDVStep.ConnectedMobile)
		end
	end
	
	local function _(p2)
		-- upvalues: getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), authModalShown (copy), entryPointEventCtx (ref)
		if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
			authModalShown(entryPointEventCtx, p2, "idvFailed")
		end
	end
	
	local function pollIDVStatus(p2, p3, p4)
		-- upvalues: var14 (ref), var16 (ref), var5 (ref), getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), authModalShown (copy), entryPointEventCtx (ref), var3 (ref), updateChecklist (ref), IDVSessionStatusEnum (copy), authMsgShown (copy), var12 (ref), actionStatusEnum (copy), schedulePoll (ref), var10 (ref), pollIDVStatus (ref), var1 (copy)
		if p3 == 0 then
			var14(true)
			var16(var5.timeout)
			
			if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
				authModalShown(entryPointEventCtx, p4, "idvFailed")
				
				return
			end
		else
			var3.getVerifiedStatus(p2):andThen(function(p5)
				-- upvalues: updateChecklist (copy), IDVSessionStatusEnum (copy), getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), authMsgShown (copy), entryPointEventCtx (copy), p4 (ref), var12 (copy), actionStatusEnum (copy), var14 (copy), var16 (copy), var5 (copy), authModalShown (copy), schedulePoll (copy), var10 (copy), pollIDVStatus (copy), p2 (ref), p3 (ref), var1 (copy)
				local isVerified = p5.isVerified
				local sessionStatus = p5.sessionStatus
				updateChecklist(sessionStatus)
				
				if isVerified and sessionStatus == IDVSessionStatusEnum.Stored then
					if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
						authMsgShown(entryPointEventCtx, p4, "idvSuccess")
					end
					var12(actionStatusEnum.Success)
					
					return
				else
					local var24 = if sessionStatus ~= IDVSessionStatusEnum.Failure then if sessionStatus ~= IDVSessionStatusEnum.RequiresManualReview then if sessionStatus ~= IDVSessionStatusEnum.RequiresRetry then sessionStatus == IDVSessionStatusEnum.Expired else true else true else true
					
					if var24 then
						var14(true)
						var12(actionStatusEnum.Failure)
						local var25 = var5
						var16(if sessionStatus == IDVSessionStatusEnum.Failure or sessionStatus == IDVSessionStatusEnum.RequiresManualReview then var25.declined elseif sessionStatus == IDVSessionStatusEnum.RequiresRetry then var25.retry elseif sessionStatus == IDVSessionStatusEnum.Expired then var25.timeout else var25.retry)
						var24 = p4
						
						if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
							authModalShown(entryPointEventCtx, var24, "idvFailed")
							
							return
						end
					else
						schedulePoll(function()
							-- upvalues: var10 (copy), pollIDVStatus (copy), p2 (copy), p3 (copy), p4 (copy)
							if var10.current then
								pollIDVStatus(p2, p3 - 1, p4)
							end
						end, var1)
					end
				end
			end):catch(function(_)
				-- upvalues: var14 (copy), var16 (copy), var5 (copy), p4 (ref), getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), authModalShown (copy), entryPointEventCtx (copy)
				var14(true)
				var16(var5.retry)
				
				if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
					authModalShown(entryPointEventCtx, p4, "idvFailed")
				end
			end)
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule (copy), facialAgeEstimationServiceWrapperModule (copy), getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), var7 (ref), authModalShown (copy), entryPointEventCtx (ref), pollIDVStatus (ref), var2 (copy), var20 (ref), var9 (ref), promiseModule (copy), getFFlagEnableRoactNetworkingForChallengeInteceptionModule (copy), var3 (ref), var22 (ref), authFormInteraction (copy), var12 (ref), actionStatusEnum (copy), var14 (ref), var16 (ref), var5 (ref)
		var10.current = true
		local var24 = getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule() and facialAgeEstimationServiceWrapperModule.isAvailable()
		local var25 = getFFlagEnableAmpIDVUpsellAnalyticsModule()
		local var26 = var7;
		(if getFFlagEnableRoactNetworkingForChallengeInteceptionModule() then var3.startVerificationWithWrappedNetworking(var22) else var3.startVerification()):andThen(function(p2)
			-- upvalues: var25 (ref), var26 (write), var7 (copy), var24 (ref), authModalShown (copy), entryPointEventCtx (copy), facialAgeEstimationServiceWrapperModule (copy), pollIDVStatus (copy), var2 (copy), var20 (copy), var9 (copy), promiseModule (copy)
			local sessionIdentifier = p2.sessionIdentifier
			
			if var25 then
				var26 = `{var7}_{sessionIdentifier}`
			end
			if var24 then
				if var25 then
					authModalShown(entryPointEventCtx, var26, "nativeIDV")
				end
				return facialAgeEstimationServiceWrapperModule.startFlow(sessionIdentifier, p2.sessionToken):andThen(function()
					-- upvalues: pollIDVStatus (copy), sessionIdentifier (ref), var2 (copy), var26 (copy)
					pollIDVStatus(sessionIdentifier, var2, var26)
				end)
			elseif var25 then
				authModalShown(entryPointEventCtx, var26, if var20 then "idvDirectLink" else "idvQRCode")
			end
			pollIDVStatus(sessionIdentifier, var2, var26)
			var9(p2.verificationLink)
			
			return promiseModule.resolve()
		end):catch(function(p2)
			-- upvalues: var24 (ref), var25 (ref), authFormInteraction (copy), entryPointEventCtx (copy), var26 (write), var12 (copy), actionStatusEnum (copy), var14 (copy), var16 (copy), var5 (copy), authModalShown (copy)
			if var24 and p2 and p2.resultType == Enum.FacialAgeEstimationResultType.Cancel then
				if var25 then
					authFormInteraction(entryPointEventCtx, var26, "idvCancelled")
				end
				var12(actionStatusEnum.Cancelled)
				
				return
			else
				var14(true)
				var16(var5.retry)
				
				if var25 then
					authModalShown(entryPointEventCtx, var26, "idvFailed")
				end
			end
		end)
		
		return function()
			-- upvalues: var10 (copy)
			var10.current = false
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), actionStatusEnum (copy), onSuccess (ref), onCancelled (ref)
		if var11 == actionStatusEnum.Success then
			onSuccess()
			
			return
		elseif var11 == actionStatusEnum.Cancelled then
			onCancelled()
		end
	end, { var11 })
	
	return if var13 then reactModule.createElement(IDVErrorScreenModule, {
		errorTitle = var5.title,
		errorDescription = var15,
		buttonText = var5.close,
		onClose = function()
			-- upvalues: onFailure (ref)
			onFailure()
		end
	}) elseif var19 and var11 == actionStatusEnum.Cancelled then nil elseif var19 and not var13 and (var11 == actionStatusEnum.Unknown or var11 == actionStatusEnum.Success) then reactModule.createElement(loading, {
		size = iconSize.Large,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}) elseif var20 then reactModule.createElement(IDVDirectLinkUpsellModule, {
		featureName = featureName,
		idvLink = var8,
		openIdvLink = openIdvLink,
		onClose = function()
			-- upvalues: getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), authFormInteraction (copy), entryPointEventCtx (ref), var7 (ref), var12 (ref), actionStatusEnum (copy)
			if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
				authFormInteraction(entryPointEventCtx, var7, "idvCancelled")
			end
			var12(actionStatusEnum.Cancelled)
		end,
		openPrivacyPolicyLink = var23,
		latestStepCompleted = var17
	}) else reactModule.createElement(IDVWithQRCodeUpsellModule, {
		qrCodeLink = var8,
		featureName = featureName,
		openPrivacyPolicyLink = var23,
		latestStepCompleted = var17,
		onClose = function()
			-- upvalues: getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), authFormInteraction (copy), entryPointEventCtx (ref), var7 (ref), var12 (ref), actionStatusEnum (copy)
			if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
				authFormInteraction(entryPointEventCtx, var7, "idvCancelled")
			end
			var12(actionStatusEnum.Cancelled)
		end
	})
end