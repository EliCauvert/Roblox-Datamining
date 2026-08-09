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
local facialAgeEstimationServiceWrapperModule = require(script.Parent.Parent.FacialAgeEstimation.FacialAgeEstimationServiceWrapper)
local var16 = getFIntIDVPollDelay()
local var17 = getFIntIDVMaxRetries()

local function _(p0) --[[ line: 54 | named "isFailure" ]]
	-- upvalues: IDVSessionStatusEnum (ref)
	return if p0 ~= IDVSessionStatusEnum.Failure then if p0 ~= IDVSessionStatusEnum.RequiresManualReview then if p0 ~= IDVSessionStatusEnum.RequiresRetry then p0 == IDVSessionStatusEnum.Expired else true else true else true
end

local _ = function(p1, p2) --[[ line: 61 | named "getErrorDescription" ]]
	-- upvalues: IDVSessionStatusEnum (ref)
	return if p1 == IDVSessionStatusEnum.Failure or p1 == IDVSessionStatusEnum.RequiresManualReview then p2.declined elseif p1 == IDVSessionStatusEnum.RequiresRetry then p2.retry elseif p1 == IDVSessionStatusEnum.Expired then p2.timeout else p2.retry
end

return function(p3) --[[ line: 73 | named "IDVUpsellContainer" ]]
	-- upvalues: IDVApiProvider (ref), useDeviceType (ref), useNavigation (ref), useLocalization (ref), idvErrorScreenStrings (ref), idvWithQRCodeUpsellStrings (ref), reactModule (ref), actionStatusEnum (ref), getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule (ref), facialAgeEstimationServiceWrapperModule (ref), getFFlagEnableDirectLinkForTabletsModule (ref), deviceType (ref), useRoactService (ref), appLinking (ref), roactNetworking (ref), appScreensModule (ref), getFStringBiometricPrivacyPolicyLinkModule (ref), IDVSessionStatusEnum (ref), IDVStep (ref), var16 (ref), var17 (ref), promiseModule (ref), getFFlagEnableRoactNetworkingForChallengeInteceptionModule (ref), IDVErrorScreenModule (ref), loading (ref), iconSize (ref), IDVDirectLinkUpsellModule (ref), IDVWithQRCodeUpsellModule (ref)
	local featureName = p3.featureName
	local onSuccess = p3.onSuccess
	local onFailure = p3.onFailure
	local onCancelled = p3.onCancelled
	local var18 = if p3.idvApiProvider then p3.idvApiProvider else IDVApiProvider
	local deviceType_1 = p3.deviceType or useDeviceType()
	local var20 = useNavigation()
	local var21 = useLocalization(idvErrorScreenStrings)
	local var22 = useLocalization(idvWithQRCodeUpsellStrings)
	local var23, var24 = reactModule.useState(nil)
	local var25, var26 = reactModule.useState(true)
	local var27, var28 = reactModule.useState(actionStatusEnum.Unknown)
	local var29, var30 = reactModule.useState(false)
	local var31, var32 = reactModule.useState(var21.retry)
	local var33, var34 = reactModule.useState(0)
	local var35 = getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule() and facialAgeEstimationServiceWrapperModule.isAvailable()
	local var36 = if getFFlagEnableDirectLinkForTabletsModule() then true else deviceType_1 == deviceType.Phone
	local var37 = useRoactService(appLinking)
	local var38 = useRoactService(roactNetworking)
	local openIdvLink = p3.openIdvLink or function(p4) --[[ line: 97 ]]
		-- upvalues: var37 (ref)
		var37:openURL(p4)
	end
	
	local var40 = function() --[[ line: 101 ]]
		-- upvalues: var20 (ref), appScreensModule (copy), getFStringBiometricPrivacyPolicyLinkModule (copy), var22 (ref)
		var20.navigate(appScreensModule.GenericWebPage, {
			detail = getFStringBiometricPrivacyPolicyLinkModule(),
			extraProps = {
				transitionAnimation = "SlideInFromBottom",
				title = var22.privacyPageHeader
			}
		})
	end
	
	local function updateChecklist(p5) --[[ line: 111 ]]
		-- upvalues: IDVSessionStatusEnum (copy), var34 (ref), IDVStep (copy)
		if p5 == IDVSessionStatusEnum.Stored then
			var34(IDVStep.UpdatedRobloxProfile)
			
			return
		elseif p5 == IDVSessionStatusEnum.Success then
			var34(IDVStep.Verified)
			
			return
		elseif p5 == IDVSessionStatusEnum.Submitted then
			var34(IDVStep.GotResults)
			
			return
		elseif p5 == IDVSessionStatusEnum.Started then
			var34(IDVStep.ConnectedMobile)
		end
	end
	
	local function pollIDVStatus(p6, p7) --[[ line: 125 ]]
		-- upvalues: var30 (ref), var32 (ref), var21 (ref), var18 (ref), updateChecklist (ref), IDVSessionStatusEnum (copy), var28 (ref), actionStatusEnum (copy), var16 (copy), var25 (ref), pollIDVStatus (ref)
		if p7 == 0 then
			var30(true)
			var32(var21.timeout)
			
			return
		end
		var18.getVerifiedStatus(p6):andThen(function(p8) --[[ line: 132 ]]
			-- upvalues: updateChecklist (copy), IDVSessionStatusEnum (copy), var28 (copy), actionStatusEnum (copy), var30 (copy), var32 (copy), var21 (copy), var16 (copy), var25 (copy), pollIDVStatus (copy), p6 (ref), p7 (ref)
			local isVerified = p8.isVerified
			local sessionStatus = p8.sessionStatus
			updateChecklist(sessionStatus)
			
			if isVerified and sessionStatus == IDVSessionStatusEnum.Stored then
				var28(actionStatusEnum.Success)
				
				return
			elseif not (if sessionStatus ~= IDVSessionStatusEnum.Failure then if sessionStatus ~= IDVSessionStatusEnum.RequiresManualReview then if sessionStatus ~= IDVSessionStatusEnum.RequiresRetry then sessionStatus == IDVSessionStatusEnum.Expired else true else true else true) then
				spawn(function() --[[ line: 144 ]]
					-- upvalues: var16 (copy), var25 (copy), pollIDVStatus (copy), p6 (copy), p7 (copy)
					wait(var16)
					
					if var25 then
						pollIDVStatus(p6, p7 - 1)
					end
				end)
				
				return
			end
			var30(true)
			var28(actionStatusEnum.Failure)
			local var43 = var21
			var32(if sessionStatus == IDVSessionStatusEnum.Failure or sessionStatus == IDVSessionStatusEnum.RequiresManualReview then var43.declined elseif sessionStatus == IDVSessionStatusEnum.RequiresRetry then var43.retry elseif sessionStatus == IDVSessionStatusEnum.Expired then var43.timeout else var43.retry)
		end):catch(function(_) --[[ line: 152 ]]
			-- upvalues: var30 (copy), var32 (copy), var21 (copy)
			var30(true)
			var32(var21.retry)
		end)
	end
	
	reactModule.useEffect(function() --[[ line: 159 ]]
		-- upvalues: var26 (ref), getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule (copy), facialAgeEstimationServiceWrapperModule (copy), pollIDVStatus (ref), var17 (copy), var24 (ref), promiseModule (copy), getFFlagEnableRoactNetworkingForChallengeInteceptionModule (copy), var18 (ref), var38 (ref), var28 (ref), actionStatusEnum (copy), var30 (ref), var32 (ref), var21 (ref)
		var26(true)
		local var44 = getFFlagEnableNativePersonaInquiryForAmpIDVUpsellModule() and facialAgeEstimationServiceWrapperModule.isAvailable();
		(if getFFlagEnableRoactNetworkingForChallengeInteceptionModule() then var18.startVerificationWithWrappedNetworking(var38) else var18.startVerification()):andThen(function(p10) --[[ line: 164 | named "afterStartVerification" ]]
			-- upvalues: var44 (ref), facialAgeEstimationServiceWrapperModule (copy), pollIDVStatus (copy), var17 (copy), var24 (copy), promiseModule (copy)
			local sessionIdentifier = p10.sessionIdentifier
			
			if var44 then
				return facialAgeEstimationServiceWrapperModule.startFlow(sessionIdentifier, p10.sessionToken):andThen(function() --[[ line: 168 ]]
					-- upvalues: pollIDVStatus (copy), sessionIdentifier (ref), var17 (copy)
					pollIDVStatus(sessionIdentifier, var17)
				end)
			end
			pollIDVStatus(sessionIdentifier, var17)
			var24(p10.verificationLink)
			
			return promiseModule.resolve()
		end):catch(function(p9) --[[ line: 182 ]]
			-- upvalues: var44 (ref), var28 (copy), actionStatusEnum (copy), var30 (copy), var32 (copy), var21 (copy)
			if var44 and p9 and p9.resultType == Enum.FacialAgeEstimationResultType.Cancel then
				var28(actionStatusEnum.Cancelled)
				
				return
			end
			var30(true)
			var32(var21.retry)
		end)
		
		return function() --[[ line: 191 ]]
			-- upvalues: var26 (copy)
			var26(false)
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 197 ]]
		-- upvalues: var27 (ref), actionStatusEnum (copy), onSuccess (ref), onCancelled (ref)
		if var27 == actionStatusEnum.Success then
			onSuccess()
			
			return
		elseif var27 == actionStatusEnum.Cancelled then
			onCancelled()
		end
	end, { var27 })
	
	return if var29 then reactModule.createElement(IDVErrorScreenModule, {
		errorTitle = var21.title,
		errorDescription = var31,
		buttonText = var21.close,
		onClose = function() --[[ line: 210 ]]
			-- upvalues: onFailure (ref)
			onFailure()
		end
	}) elseif var35 and var27 == actionStatusEnum.Cancelled then nil elseif var35 and not var29 and (var27 == actionStatusEnum.Unknown or var27 == actionStatusEnum.Success) then reactModule.createElement(loading, {
		size = iconSize.Large,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}) elseif var36 then reactModule.createElement(IDVDirectLinkUpsellModule, {
		featureName = featureName,
		idvLink = var23,
		openIdvLink = openIdvLink,
		onClose = function() --[[ line: 232 ]]
			-- upvalues: var28 (ref), actionStatusEnum (copy)
			var28(actionStatusEnum.Cancelled)
		end,
		openPrivacyPolicyLink = var40,
		latestStepCompleted = var33
	}) else reactModule.createElement(IDVWithQRCodeUpsellModule, {
		qrCodeLink = var23,
		featureName = featureName,
		openPrivacyPolicyLink = var40,
		latestStepCompleted = var33,
		onClose = function() --[[ line: 244 ]]
			-- upvalues: var28 (ref), actionStatusEnum (copy)
			var28(actionStatusEnum.Cancelled)
		end
	})
end