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
local var18 = getFIntIDVPollDelay()
local var19 = getFIntIDVMaxRetries()

local function _(p0) --[[ line: 65 | named "isFailure" ]]
	-- upvalues: IDVSessionStatusEnum (ref)
	return if p0 ~= IDVSessionStatusEnum.Failure then if p0 ~= IDVSessionStatusEnum.RequiresManualReview then if p0 ~= IDVSessionStatusEnum.RequiresRetry then p0 == IDVSessionStatusEnum.Expired else true else true else true
end

local _ = function(p1, p2) --[[ line: 72 | named "getErrorDescription" ]]
	-- upvalues: IDVSessionStatusEnum (ref)
	return if p1 == IDVSessionStatusEnum.Failure or p1 == IDVSessionStatusEnum.RequiresManualReview then p2.declined elseif p1 == IDVSessionStatusEnum.RequiresRetry then p2.retry elseif p1 == IDVSessionStatusEnum.Expired then p2.timeout else p2.retry
end

return function(p3) --[[ line: 84 | named "IDVUpsellContainer" ]]
	-- upvalues: IDVApiProvider (ref), useDeviceType (ref), useNavigation (ref), useLocalization (ref), idvErrorScreenStrings (ref), idvWithQRCodeUpsellStrings (ref), reactModule (ref), actionStatusEnum (ref), getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule (ref), facialAgeEstimationServiceWrapperModule (ref), getFFlagEnableDirectLinkForTabletsModule (ref), deviceType (ref), useRoactService (ref), appLinking (ref), roactNetworking (ref), appScreensModule (ref), getFStringBiometricPrivacyPolicyLinkModule (ref), IDVSessionStatusEnum (ref), IDVStep (ref), getFFlagEnableAmpIDVUpsellAnalyticsModule (ref), authModalShown (ref), authMsgShown (ref), var18 (ref), var19 (ref), promiseModule (ref), getFFlagEnableRoactNetworkingForChallengeInteceptionModule (ref), authFormInteraction (ref), IDVErrorScreenModule (ref), loading (ref), iconSize (ref), IDVDirectLinkUpsellModule (ref), IDVWithQRCodeUpsellModule (ref)
	local featureName = p3.featureName
	local onSuccess = p3.onSuccess
	local onFailure = p3.onFailure
	local onCancelled = p3.onCancelled
	local var20 = if p3.idvApiProvider then p3.idvApiProvider else IDVApiProvider
	local deviceType_1 = p3.deviceType or useDeviceType()
	local var22 = useNavigation()
	local var23 = useLocalization(idvErrorScreenStrings)
	local var24 = useLocalization(idvWithQRCodeUpsellStrings)
	local entryPointEventCtx = p3.entryPointEventCtx or ""
	local var26 = if p3.metadata then p3.metadata.sessionId else ""
	local var27, var28 = reactModule.useState(nil)
	local var29 = reactModule.useRef(true)
	local var30, var31 = reactModule.useState(actionStatusEnum.Unknown)
	local var32, var33 = reactModule.useState(false)
	local var34, var35 = reactModule.useState(var23.retry)
	local var36, var37 = reactModule.useState(0)
	local var38 = getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule() and facialAgeEstimationServiceWrapperModule.isAvailable()
	local var39 = if getFFlagEnableDirectLinkForTabletsModule() then true else deviceType_1 == deviceType.Phone
	local var40 = useRoactService(appLinking)
	local var41 = useRoactService(roactNetworking)
	local schedulePoll = p3.schedulePoll or function(p4, p5) --[[ line: 111 ]]
		spawn(function() --[[ line: 112 ]]
			-- upvalues: p5 (ref), p4 (ref)
			wait(p5)
			p4()
		end)
	end
	local openIdvLink = p3.openIdvLink or function(p6) --[[ line: 118 ]]
		-- upvalues: var40 (ref)
		var40:openURL(p6)
	end
	
	local var44 = function() --[[ line: 122 ]]
		-- upvalues: var22 (ref), appScreensModule (copy), getFStringBiometricPrivacyPolicyLinkModule (copy), var24 (ref)
		var22.navigate(appScreensModule.GenericWebPage, {
			detail = getFStringBiometricPrivacyPolicyLinkModule(),
			extraProps = {
				transitionAnimation = "SlideInFromBottom",
				title = var24.privacyPageHeader
			}
		})
	end
	
	local function updateChecklist(p7) --[[ line: 132 ]]
		-- upvalues: IDVSessionStatusEnum (copy), var37 (ref), IDVStep (copy)
		if p7 == IDVSessionStatusEnum.Stored then
			var37(IDVStep.UpdatedRobloxProfile)
			
			return
		elseif p7 == IDVSessionStatusEnum.Success then
			var37(IDVStep.Verified)
			
			return
		elseif p7 == IDVSessionStatusEnum.Submitted then
			var37(IDVStep.GotResults)
			
			return
		elseif p7 == IDVSessionStatusEnum.Started then
			var37(IDVStep.ConnectedMobile)
		end
	end
	
	local function _(p8) --[[ line: 146 | named "reportErrorShown" ]]
		-- upvalues: getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), authModalShown (copy), entryPointEventCtx (ref)
		if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
			authModalShown(entryPointEventCtx, p8, "idvFailed")
		end
	end
	
	local function pollIDVStatus(p9, p10, p11) --[[ line: 152 ]]
		-- upvalues: var33 (ref), var35 (ref), var23 (ref), getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), authModalShown (copy), entryPointEventCtx (ref), var20 (ref), updateChecklist (ref), IDVSessionStatusEnum (copy), authMsgShown (copy), var31 (ref), actionStatusEnum (copy), schedulePoll (ref), var29 (ref), pollIDVStatus (ref), var18 (copy)
		if p10 == 0 then
			var33(true)
			var35(var23.timeout)
			
			if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
				authModalShown(entryPointEventCtx, p11, "idvFailed")
				
				return
			end
		else
			var20.getVerifiedStatus(p9):andThen(function(p12) --[[ line: 160 ]]
				-- upvalues: updateChecklist (copy), IDVSessionStatusEnum (copy), getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), authMsgShown (copy), entryPointEventCtx (copy), p11 (ref), var31 (copy), actionStatusEnum (copy), var33 (copy), var35 (copy), var23 (copy), authModalShown (copy), schedulePoll (copy), var29 (copy), pollIDVStatus (copy), p9 (ref), p10 (ref), var18 (copy)
				local isVerified = p12.isVerified
				local sessionStatus = p12.sessionStatus
				updateChecklist(sessionStatus)
				
				if isVerified and sessionStatus == IDVSessionStatusEnum.Stored then
					if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
						authMsgShown(entryPointEventCtx, p11, "idvSuccess")
					end
					var31(actionStatusEnum.Success)
					
					return
				else
					local var47 = if sessionStatus ~= IDVSessionStatusEnum.Failure then if sessionStatus ~= IDVSessionStatusEnum.RequiresManualReview then if sessionStatus ~= IDVSessionStatusEnum.RequiresRetry then sessionStatus == IDVSessionStatusEnum.Expired else true else true else true
					
					if var47 then
						var33(true)
						var31(actionStatusEnum.Failure)
						local var48 = var23
						var35(if sessionStatus == IDVSessionStatusEnum.Failure or sessionStatus == IDVSessionStatusEnum.RequiresManualReview then var48.declined elseif sessionStatus == IDVSessionStatusEnum.RequiresRetry then var48.retry elseif sessionStatus == IDVSessionStatusEnum.Expired then var48.timeout else var48.retry)
						var47 = p11
						
						if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
							authModalShown(entryPointEventCtx, var47, "idvFailed")
							
							return
						end
					else
						schedulePoll(function() --[[ line: 176 ]]
							-- upvalues: var29 (copy), pollIDVStatus (copy), p9 (copy), p10 (copy), p11 (copy)
							if var29.current then
								pollIDVStatus(p9, p10 - 1, p11)
							end
						end, var18)
					end
				end
			end):catch(function(_) --[[ line: 183 ]]
				-- upvalues: var33 (copy), var35 (copy), var23 (copy), p11 (ref), getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), authModalShown (copy), entryPointEventCtx (copy)
				var33(true)
				var35(var23.retry)
				
				if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
					authModalShown(entryPointEventCtx, p11, "idvFailed")
				end
			end)
		end
	end
	
	reactModule.useEffect(function() --[[ line: 191 ]]
		-- upvalues: var29 (ref), getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule (copy), facialAgeEstimationServiceWrapperModule (copy), getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), var26 (ref), authModalShown (copy), entryPointEventCtx (ref), pollIDVStatus (ref), var19 (copy), var39 (ref), var28 (ref), promiseModule (copy), getFFlagEnableRoactNetworkingForChallengeInteceptionModule (copy), var20 (ref), var41 (ref), authFormInteraction (copy), var31 (ref), actionStatusEnum (copy), var33 (ref), var35 (ref), var23 (ref)
		var29.current = true
		local var49 = getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule() and facialAgeEstimationServiceWrapperModule.isAvailable()
		local var50 = getFFlagEnableAmpIDVUpsellAnalyticsModule()
		local var51 = var26;
		(if getFFlagEnableRoactNetworkingForChallengeInteceptionModule() then var20.startVerificationWithWrappedNetworking(var41) else var20.startVerification()):andThen(function(p14) --[[ line: 198 | named "afterStartVerification" ]]
			-- upvalues: var50 (ref), var51 (write), var26 (copy), var49 (ref), authModalShown (copy), entryPointEventCtx (copy), facialAgeEstimationServiceWrapperModule (copy), pollIDVStatus (copy), var19 (copy), var39 (copy), var28 (copy), promiseModule (copy)
			local sessionIdentifier = p14.sessionIdentifier
			
			if var50 then
				var51 = `{var26}_{sessionIdentifier}`
			end
			if var49 then
				if var50 then
					authModalShown(entryPointEventCtx, var51, "nativeIDV")
				end
				return facialAgeEstimationServiceWrapperModule.startFlow(sessionIdentifier, p14.sessionToken):andThen(function() --[[ line: 209 ]]
					-- upvalues: pollIDVStatus (copy), sessionIdentifier (ref), var19 (copy), var51 (copy)
					pollIDVStatus(sessionIdentifier, var19, var51)
				end)
			elseif var50 then
				authModalShown(entryPointEventCtx, var51, if var39 then "idvDirectLink" else "idvQRCode")
			end
			pollIDVStatus(sessionIdentifier, var19, var51)
			var28(p14.verificationLink)
			
			return promiseModule.resolve()
		end):catch(function(p13) --[[ line: 227 ]]
			-- upvalues: var49 (ref), var50 (ref), authFormInteraction (copy), entryPointEventCtx (copy), var51 (write), var31 (copy), actionStatusEnum (copy), var33 (copy), var35 (copy), var23 (copy), authModalShown (copy)
			if var49 and p13 and p13.resultType == Enum.FacialAgeEstimationResultType.Cancel then
				if var50 then
					authFormInteraction(entryPointEventCtx, var51, "idvCancelled")
				end
				var31(actionStatusEnum.Cancelled)
				
				return
			else
				var33(true)
				var35(var23.retry)
				
				if var50 then
					authModalShown(entryPointEventCtx, var51, "idvFailed")
				end
			end
		end)
		
		return function() --[[ line: 242 ]]
			-- upvalues: var29 (copy)
			var29.current = false
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 248 ]]
		-- upvalues: var30 (ref), actionStatusEnum (copy), onSuccess (ref), onCancelled (ref)
		if var30 == actionStatusEnum.Success then
			onSuccess()
			
			return
		elseif var30 == actionStatusEnum.Cancelled then
			onCancelled()
		end
	end, { var30 })
	
	return if var32 then reactModule.createElement(IDVErrorScreenModule, {
		errorTitle = var23.title,
		errorDescription = var34,
		buttonText = var23.close,
		onClose = function() --[[ line: 261 ]]
			-- upvalues: onFailure (ref)
			onFailure()
		end
	}) elseif var38 and var30 == actionStatusEnum.Cancelled then nil elseif var38 and not var32 and (var30 == actionStatusEnum.Unknown or var30 == actionStatusEnum.Success) then reactModule.createElement(loading, {
		size = iconSize.Large,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}) elseif var39 then reactModule.createElement(IDVDirectLinkUpsellModule, {
		featureName = featureName,
		idvLink = var27,
		openIdvLink = openIdvLink,
		onClose = function() --[[ line: 283 ]]
			-- upvalues: getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), authFormInteraction (copy), entryPointEventCtx (ref), var26 (ref), var31 (ref), actionStatusEnum (copy)
			if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
				authFormInteraction(entryPointEventCtx, var26, "idvCancelled")
			end
			var31(actionStatusEnum.Cancelled)
		end,
		openPrivacyPolicyLink = var44,
		latestStepCompleted = var36
	}) else reactModule.createElement(IDVWithQRCodeUpsellModule, {
		qrCodeLink = var27,
		featureName = featureName,
		openPrivacyPolicyLink = var44,
		latestStepCompleted = var36,
		onClose = function() --[[ line: 298 ]]
			-- upvalues: getFFlagEnableAmpIDVUpsellAnalyticsModule (copy), authFormInteraction (copy), entryPointEventCtx (ref), var26 (ref), var31 (ref), actionStatusEnum (copy)
			if getFFlagEnableAmpIDVUpsellAnalyticsModule() then
				authFormInteraction(entryPointEventCtx, var26, "idvCancelled")
			end
			var31(actionStatusEnum.Cancelled)
		end
	})
end