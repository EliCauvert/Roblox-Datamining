local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local VPCApiProviderModule = require(ampUpsell.Common.VPCApiProvider)
local ampApiProviderModule = require(ampUpsell.Common.AmpApiProvider)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local vpcConfirmationScreenStrings = require(ampUpsell.Common.LocalizationStrings).vpcConfirmationScreenStrings
local vpcUpsellGatherEmailStrings = require(ampUpsell.Common.LocalizationStrings).vpcUpsellGatherEmailStrings
local VPCErrorScreenModule = require(script.Parent.VPCErrorScreen)
local VPCConfirmationScreenModule = require(script.Parent.VPCConfirmationScreen)
local VPCNewParentUpsellModule = require(script.Parent.VPCNewParentUpsell)
local isStringEmail = require(parent.AuthCommon).Utils.isStringEmail
local appScreensModule = require(ampUpsell.Common.AppScreens)
local getFStringPrivacyPolicyLinkModule = require(ampUpsell.Flags.GetFStringPrivacyPolicyLink)
local useNavigation = require(parent.Navigation).useNavigation
local enumsModule = require(ampUpsell.Common.Enums)
local actionTypeEnum = enumsModule.ActionTypeEnum
local VPCStepEnum = enumsModule.VPCStepEnum
local accessResponseEnum = enumsModule.AccessResponseEnum
local authAnalyticsModule = require(parent.AuthAnalytics)
local authMsgShown = authAnalyticsModule.Events.authMsgShown
local authButtonClick = authAnalyticsModule.Events.authButtonClick
local authFormInteraction = authAnalyticsModule.Events.authFormInteraction
local vpcEventConstants = require(ampUpsell.Common.EventConstants).vpcEventConstants
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local argCheckModule = require(parent.ArgCheck)
local appLinking = require(parent.RoactServiceTags).AppLinking
local getFFlagEnableExternalBrowserForVPCPrivacyPolicyModule = require(ampUpsell.Flags.GetFFlagEnableExternalBrowserForVPCPrivacyPolicy)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking

return function(p0) --[[ line: 49 | named "VPCUpsellContainer" ]]
	-- upvalues: VPCApiProviderModule (ref), ampApiProviderModule (ref), useRoactService (ref), roactNetworking (ref), getFFlagEnableExternalBrowserForVPCPrivacyPolicyModule (ref), useAppPolicy (ref), appLinking (ref), reactModule (ref), actionTypeEnum (ref), VPCStepEnum (ref), useLocalization (ref), vpcUpsellGatherEmailStrings (ref), useNavigation (ref), argCheckModule (ref), getFStringPrivacyPolicyLinkModule (ref), appScreensModule (ref), isStringEmail (ref), accessResponseEnum (ref), authMsgShown (ref), vpcEventConstants (ref), VPCConfirmationScreenModule (ref), vpcConfirmationScreenStrings (ref), authButtonClick (ref), VPCNewParentUpsellModule (ref), authFormInteraction (ref), VPCErrorScreenModule (ref)
	local onCancel = p0.onCancel
	local onSuccess = p0.onSuccess
	local var13 = if p0.vpcApiProvider then p0.vpcApiProvider else VPCApiProviderModule
	local var14 = if p0.ampApiProvider then p0.ampApiProvider else ampApiProviderModule
	local recourseAction = p0.recourseAction
	local recourseData = p0.recourseData
	local var15 = if p0.entryPointEventCtx then p0.entryPointEventCtx else ""
	local parentConsentTypes = p0.parentConsentTypes
	local var16 = if p0.disablePortal then p0.disablePortal else false
	local var17 = if p0.isInExperienceEntry then p0.isInExperienceEntry else false
	local var18 = useRoactService(roactNetworking)
	local var19 = false
	local var20 = nil
	
	if getFFlagEnableExternalBrowserForVPCPrivacyPolicyModule() then
		var19 = useAppPolicy(function(p1) --[[ line: 66 ]]
			return p1.shouldUseExternalBrowserForDisclaimerLinks()
		end)
		var20 = useRoactService(appLinking)
	end
	local var21, var22 = reactModule.useState(if recourseAction == actionTypeEnum.ParentLink then VPCStepEnum.NewParentLoading else VPCStepEnum.AlreadyLinkedSendRequest)
	local unknown, unknown_1 = reactModule.useState("Unknown")
	local var25, var26 = reactModule.useState({})
	local var27, var28 = reactModule.useState(true)
	local var29 = useLocalization(vpcUpsellGatherEmailStrings)
	local var30, var31 = reactModule.useState(false)
	local var32, var33 = reactModule.useState("")
	local var34, var35 = reactModule.useState("")
	local var36 = useNavigation()
	
	local function _(p2, p3) --[[ line: 88 | named "openExternalBrowser" ]]
		-- upvalues: argCheckModule (copy)
		argCheckModule.isNotNil(p2, "linking")
		argCheckModule.isType(p3, "string", "url")
		p2:openURL(p3)
	end
	
	local var37 = function() --[[ line: 95 ]]
		-- upvalues: getFFlagEnableExternalBrowserForVPCPrivacyPolicyModule (copy), var19 (write), var20 (write), getFStringPrivacyPolicyLinkModule (copy), argCheckModule (copy), var36 (ref), appScreensModule (copy), var29 (ref)
		if getFFlagEnableExternalBrowserForVPCPrivacyPolicyModule() and var19 then
			local var45 = var20
			local var46 = getFStringPrivacyPolicyLinkModule()
			argCheckModule.isNotNil(var45, "linking")
			argCheckModule.isType(var46, "string", "url")
			var45:openURL(var46)
			
			return
		end
		var36.navigate(appScreensModule.GenericWebPage, {
			detail = getFStringPrivacyPolicyLinkModule(),
			extraProps = {
				transitionAnimation = "SlideInFromBottom",
				title = var29.privacyLinkText
			}
		})
	end
	
	local function handleEmailInput(p4) --[[ line: 109 ]]
		-- upvalues: var33 (ref), isStringEmail (copy), var31 (ref), var35 (ref), var29 (ref)
		var33(p4)
		
		if isStringEmail(p4) then
			var31(true)
			var35("")
			
			return
		end
		var31(false)
		
		if p4 == "" then
			var35("")
			
			return
		end
		var35(var29.errorText)
	end
	
	local var39, var40 = reactModule.useState(0)
	local onRetryAmp = p0.onRetryAmp
	
	local function onRetryVPC() --[[ line: 127 ]]
		-- upvalues: var40 (ref), var39 (ref), var26 (ref), unknown_1 (ref), var33 (ref), isStringEmail (copy), var31 (ref), var35 (ref), var22 (ref), recourseAction (ref), actionTypeEnum (copy), VPCStepEnum (copy)
		var40(var39 + 1)
		var26({})
		unknown_1("Unknown")
		var33("")
		
		if isStringEmail("") then
			var31(true)
			var35("")
		else
			var31(false)
			var35("")
		end
		var22(if recourseAction == actionTypeEnum.ParentLink then VPCStepEnum.NewParentCollectEmail else VPCStepEnum.AlreadyLinkedSendRequest)
	end
	
	local function getLinkedParentEmailsAndSendRequestToAllParents() --[[ line: 139 ]]
		-- upvalues: var13 (ref), var18 (ref), var26 (ref), parentConsentTypes (ref), recourseData (ref), var22 (ref), VPCStepEnum (copy), unknown_1 (ref)
		var13.getLinkedParentEmails(var18):andThen(function(p5) --[[ line: 142 ]]
			-- upvalues: var26 (copy)
			var26(p5.parentEmails)
		end):catch(function(_) --[[ line: 145 ]] end)
		var13.sendRequestToAllParents(var18, parentConsentTypes, recourseData):andThen(function(_) --[[ line: 149 ]]
			-- upvalues: var22 (copy), VPCStepEnum (copy)
			var22(VPCStepEnum.RequestSent)
		end):catch(function(p6) --[[ line: 152 ]]
			-- upvalues: unknown_1 (copy), var22 (copy), VPCStepEnum (copy)
			unknown_1(p6.code)
			var22(VPCStepEnum.Error)
		end)
	end
	
	local function sendRequestToNewParent(p7) --[[ line: 158 ]]
		-- upvalues: var13 (ref), var18 (ref), parentConsentTypes (ref), recourseData (ref), var22 (ref), VPCStepEnum (copy), unknown_1 (ref)
		var13.sendRequestToNewParent(var18, p7, parentConsentTypes, recourseData):andThen(function(_) --[[ line: 161 ]]
			-- upvalues: var22 (copy), VPCStepEnum (copy)
			var22(VPCStepEnum.RequestSent)
		end):catch(function(p8) --[[ line: 164 ]]
			-- upvalues: unknown_1 (copy), var22 (copy), VPCStepEnum (copy)
			unknown_1(p8.code)
			var22(VPCStepEnum.Error)
		end)
	end
	
	local function getIsChildSubjectToParentalControls() --[[ line: 170 ]]
		-- upvalues: var14 (ref), accessResponseEnum (copy), var28 (ref), var22 (ref), VPCStepEnum (copy)
		local featureAccess = var14.getFeatureAccess({ "IsChildSubjectToParentalControls" })
		var28(if featureAccess.featureAccessList and featureAccess.featureAccessList[1] then featureAccess.featureAccessList[1].access ~= accessResponseEnum.Denied else true)
		var22(VPCStepEnum.NewParentCollectEmail)
	end
	
	reactModule.useEffect(function() --[[ line: 180 ]]
		-- upvalues: recourseAction (ref), actionTypeEnum (copy), getLinkedParentEmailsAndSendRequestToAllParents (ref), getIsChildSubjectToParentalControls (ref)
		if recourseAction == actionTypeEnum.ParentConsent then
			getLinkedParentEmailsAndSendRequestToAllParents()
			
			return
		elseif recourseAction == actionTypeEnum.ParentLink then
			getIsChildSubjectToParentalControls()
		end
	end, { var39 })
	
	if var21 == VPCStepEnum.RequestSent then
		authMsgShown(var15, "", vpcEventConstants.confirmationPageLoadField, "")
		
		return reactModule.createElement(VPCConfirmationScreenModule, {
			messageStrings = vpcConfirmationScreenStrings,
			parentEmails = var25,
			onAck = function() --[[ line: 193 ]]
				-- upvalues: authButtonClick (copy), var15 (ref), vpcEventConstants (copy), onSuccess (ref)
				authButtonClick(var15, vpcEventConstants.confirmationPageButton)
				onSuccess()
			end,
			disablePortal = var16,
			isInExperienceEntry = var17
		})
	elseif var21 == VPCStepEnum.NewParentCollectEmail then
		authMsgShown(var15, "", vpcEventConstants.collectEmailPageLoadField, "")
		
		return reactModule.createElement(VPCNewParentUpsellModule, {
			onCancel = onCancel,
			onCollectEmailAndSendRequest = function(p9) --[[ line: 204 ]]
				-- upvalues: authButtonClick (copy), var15 (ref), vpcEventConstants (copy), var26 (ref), var22 (ref), VPCStepEnum (copy), sendRequestToNewParent (ref)
				authButtonClick(var15, vpcEventConstants.collectEmailPageSubmitButton)
				var26({ p9 })
				var22(VPCStepEnum.NewParentSendRequest)
				sendRequestToNewParent(p9)
			end,
			onTextChange = function(p10) --[[ line: 210 ]]
				-- upvalues: authFormInteraction (copy), var15 (ref), vpcEventConstants (copy), handleEmailInput (ref)
				authFormInteraction(var15, vpcEventConstants.collectEmailPageInteractFormField)
				handleEmailInput(p10)
			end,
			canSendRequest = var30,
			textInput = var32,
			openPrivacyPolicyLink = var37,
			errorText = var34,
			messageStrings = vpcUpsellGatherEmailStrings,
			isChildSubjectToParentalControls = var27,
			disablePortal = var16,
			isInExperienceEntry = var17
		})
	elseif var21 == VPCStepEnum.AlreadyLinkedSendRequest then
		return nil
	elseif var21 == VPCStepEnum.NewParentSendRequest then
		return nil
	elseif var21 == VPCStepEnum.NewParentLoading then
		return nil
	end
	authMsgShown(var15, "", vpcEventConstants.errorPageLoadField, unknown)
	
	return reactModule.createElement(VPCErrorScreenModule, {
		errorCode = unknown,
		onRetryAmp = function() --[[ line: 233 ]]
			-- upvalues: authButtonClick (copy), var15 (ref), vpcEventConstants (copy), onRetryAmp (ref)
			authButtonClick(var15, vpcEventConstants.errorPageRetryButton)
			onRetryAmp()
		end,
		onRetryVPC = function() --[[ line: 237 ]]
			-- upvalues: authButtonClick (copy), var15 (ref), vpcEventConstants (copy), onRetryVPC (ref)
			authButtonClick(var15, vpcEventConstants.errorPageRetryButton)
			onRetryVPC()
		end,
		onCancel = function() --[[ line: 241 ]]
			-- upvalues: authButtonClick (copy), var15 (ref), vpcEventConstants (copy), onCancel (ref)
			authButtonClick(var15, vpcEventConstants.errorPageCancelButton)
			onCancel()
		end,
		onSuccess = function() --[[ line: 245 ]]
			-- upvalues: authButtonClick (copy), var15 (ref), vpcEventConstants (copy), onSuccess (ref)
			authButtonClick(var15, vpcEventConstants.confirmationPageButton)
			onSuccess()
		end,
		retryNum = var39,
		disablePortal = var16,
		isInExperienceEntry = var17
	})
end