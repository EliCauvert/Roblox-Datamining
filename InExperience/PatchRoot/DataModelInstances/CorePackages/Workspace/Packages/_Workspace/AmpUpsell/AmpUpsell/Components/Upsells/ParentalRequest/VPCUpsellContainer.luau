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

return function(p1)
	-- upvalues: VPCApiProviderModule (ref), ampApiProviderModule (ref), useRoactService (ref), roactNetworking (ref), getFFlagEnableExternalBrowserForVPCPrivacyPolicyModule (ref), useAppPolicy (ref), appLinking (ref), reactModule (ref), actionTypeEnum (ref), VPCStepEnum (ref), useLocalization (ref), vpcUpsellGatherEmailStrings (ref), useNavigation (ref), argCheckModule (ref), getFStringPrivacyPolicyLinkModule (ref), appScreensModule (ref), isStringEmail (ref), accessResponseEnum (ref), authMsgShown (ref), vpcEventConstants (ref), VPCConfirmationScreenModule (ref), vpcConfirmationScreenStrings (ref), authButtonClick (ref), VPCNewParentUpsellModule (ref), authFormInteraction (ref), VPCErrorScreenModule (ref)
	local onCancel = p1.onCancel
	local onSuccess = p1.onSuccess
	local var1 = if p1.vpcApiProvider then p1.vpcApiProvider else VPCApiProviderModule
	local var2 = if p1.ampApiProvider then p1.ampApiProvider else ampApiProviderModule
	local recourseAction = p1.recourseAction
	local recourseData = p1.recourseData
	local var3 = if p1.entryPointEventCtx then p1.entryPointEventCtx else ""
	local parentConsentTypes = p1.parentConsentTypes
	local var4 = if p1.disablePortal then p1.disablePortal else false
	local var5 = if p1.isInExperienceEntry then p1.isInExperienceEntry else false
	local var6 = useRoactService(roactNetworking)
	local var7 = false
	local var8 = nil
	
	if getFFlagEnableExternalBrowserForVPCPrivacyPolicyModule() then
		var7 = useAppPolicy(function(p2)
			return p2.shouldUseExternalBrowserForDisclaimerLinks()
		end)
		var8 = useRoactService(appLinking)
	end
	local var9, var10 = reactModule.useState(if recourseAction == actionTypeEnum.ParentLink then VPCStepEnum.NewParentLoading else VPCStepEnum.AlreadyLinkedSendRequest)
	local unknown, unknown_1 = reactModule.useState("Unknown")
	local var11, var12 = reactModule.useState({})
	local var13, var14 = reactModule.useState(true)
	local var15 = useLocalization(vpcUpsellGatherEmailStrings)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState("")
	local var20, var21 = reactModule.useState("")
	local var22 = useNavigation()
	
	local function _(p2, p3)
		-- upvalues: argCheckModule (copy)
		argCheckModule.isNotNil(p2, "linking")
		argCheckModule.isType(p3, "string", "url")
		p2:openURL(p3)
	end
	
	local var23 = function()
		-- upvalues: getFFlagEnableExternalBrowserForVPCPrivacyPolicyModule (copy), var7 (write), var8 (write), getFStringPrivacyPolicyLinkModule (copy), argCheckModule (copy), var22 (ref), appScreensModule (copy), var15 (ref)
		if getFFlagEnableExternalBrowserForVPCPrivacyPolicyModule() and var7 then
			local var24 = var8
			local var25 = getFStringPrivacyPolicyLinkModule()
			argCheckModule.isNotNil(var24, "linking")
			argCheckModule.isType(var25, "string", "url")
			var24:openURL(var25)
			
			return
		end
		var22.navigate(appScreensModule.GenericWebPage, {
			detail = getFStringPrivacyPolicyLinkModule(),
			extraProps = {
				transitionAnimation = "SlideInFromBottom",
				title = var15.privacyLinkText
			}
		})
	end
	
	local function handleEmailInput(p2)
		-- upvalues: var19 (ref), isStringEmail (copy), var17 (ref), var21 (ref), var15 (ref)
		var19(p2)
		
		if isStringEmail(p2) then
			var17(true)
			var21("")
			
			return
		end
		var17(false)
		
		if p2 == "" then
			var21("")
			
			return
		end
		var21(var15.errorText)
	end
	
	local var24, var25 = reactModule.useState(0)
	local onRetryAmp = p1.onRetryAmp
	
	local function onRetryVPC()
		-- upvalues: var25 (ref), var24 (ref), var12 (ref), unknown_1 (ref), var19 (ref), isStringEmail (copy), var17 (ref), var21 (ref), var10 (ref), recourseAction (ref), actionTypeEnum (copy), VPCStepEnum (copy)
		var25(var24 + 1)
		var12({})
		unknown_1("Unknown")
		var19("")
		
		if isStringEmail("") then
			var17(true)
			var21("")
		else
			var17(false)
			var21("")
		end
		var10(if recourseAction == actionTypeEnum.ParentLink then VPCStepEnum.NewParentCollectEmail else VPCStepEnum.AlreadyLinkedSendRequest)
	end
	
	local function getLinkedParentEmailsAndSendRequestToAllParents()
		-- upvalues: var1 (ref), var6 (ref), var12 (ref), parentConsentTypes (ref), recourseData (ref), var10 (ref), VPCStepEnum (copy), unknown_1 (ref)
		var1.getLinkedParentEmails(var6):andThen(function(p2)
			-- upvalues: var12 (copy)
			var12(p2.parentEmails)
		end):catch(function(_) end)
		var1.sendRequestToAllParents(var6, parentConsentTypes, recourseData):andThen(function(_)
			-- upvalues: var10 (copy), VPCStepEnum (copy)
			var10(VPCStepEnum.RequestSent)
		end):catch(function(p2)
			-- upvalues: unknown_1 (copy), var10 (copy), VPCStepEnum (copy)
			unknown_1(p2.code)
			var10(VPCStepEnum.Error)
		end)
	end
	
	local function sendRequestToNewParent(p2)
		-- upvalues: var1 (ref), var6 (ref), parentConsentTypes (ref), recourseData (ref), var10 (ref), VPCStepEnum (copy), unknown_1 (ref)
		var1.sendRequestToNewParent(var6, p2, parentConsentTypes, recourseData):andThen(function(_)
			-- upvalues: var10 (copy), VPCStepEnum (copy)
			var10(VPCStepEnum.RequestSent)
		end):catch(function(p3)
			-- upvalues: unknown_1 (copy), var10 (copy), VPCStepEnum (copy)
			unknown_1(p3.code)
			var10(VPCStepEnum.Error)
		end)
	end
	
	local function getIsChildSubjectToParentalControls()
		-- upvalues: var2 (ref), accessResponseEnum (copy), var14 (ref), var10 (ref), VPCStepEnum (copy)
		local featureAccess = var2.getFeatureAccess({ "IsChildSubjectToParentalControls" })
		var14(if featureAccess.featureAccessList and featureAccess.featureAccessList[1] then featureAccess.featureAccessList[1].access ~= accessResponseEnum.Denied else true)
		var10(VPCStepEnum.NewParentCollectEmail)
	end
	
	reactModule.useEffect(function()
		-- upvalues: recourseAction (ref), actionTypeEnum (copy), getLinkedParentEmailsAndSendRequestToAllParents (ref), getIsChildSubjectToParentalControls (ref)
		if recourseAction == actionTypeEnum.ParentConsent then
			getLinkedParentEmailsAndSendRequestToAllParents()
			
			return
		elseif recourseAction == actionTypeEnum.ParentLink then
			getIsChildSubjectToParentalControls()
		end
	end, { var24 })
	
	if var9 == VPCStepEnum.RequestSent then
		authMsgShown(var3, "", vpcEventConstants.confirmationPageLoadField, "")
		
		return reactModule.createElement(VPCConfirmationScreenModule, {
			messageStrings = vpcConfirmationScreenStrings,
			parentEmails = var11,
			onAck = function()
				-- upvalues: authButtonClick (copy), var3 (ref), vpcEventConstants (copy), onSuccess (ref)
				authButtonClick(var3, vpcEventConstants.confirmationPageButton)
				onSuccess()
			end,
			disablePortal = var4,
			isInExperienceEntry = var5
		})
	elseif var9 == VPCStepEnum.NewParentCollectEmail then
		authMsgShown(var3, "", vpcEventConstants.collectEmailPageLoadField, "")
		
		return reactModule.createElement(VPCNewParentUpsellModule, {
			onCancel = onCancel,
			onCollectEmailAndSendRequest = function(p2)
				-- upvalues: authButtonClick (copy), var3 (ref), vpcEventConstants (copy), var12 (ref), var10 (ref), VPCStepEnum (copy), sendRequestToNewParent (ref)
				authButtonClick(var3, vpcEventConstants.collectEmailPageSubmitButton)
				var12({ p2 })
				var10(VPCStepEnum.NewParentSendRequest)
				sendRequestToNewParent(p2)
			end,
			onTextChange = function(p2)
				-- upvalues: authFormInteraction (copy), var3 (ref), vpcEventConstants (copy), handleEmailInput (ref)
				authFormInteraction(var3, vpcEventConstants.collectEmailPageInteractFormField)
				handleEmailInput(p2)
			end,
			canSendRequest = var16,
			textInput = var18,
			openPrivacyPolicyLink = var23,
			errorText = var20,
			messageStrings = vpcUpsellGatherEmailStrings,
			isChildSubjectToParentalControls = var13,
			disablePortal = var4,
			isInExperienceEntry = var5
		})
	elseif var9 == VPCStepEnum.AlreadyLinkedSendRequest then
		return nil
	elseif var9 == VPCStepEnum.NewParentSendRequest then
		return nil
	elseif var9 == VPCStepEnum.NewParentLoading then
		return nil
	end
	authMsgShown(var3, "", vpcEventConstants.errorPageLoadField, unknown)
	
	return reactModule.createElement(VPCErrorScreenModule, {
		errorCode = unknown,
		onRetryAmp = function()
			-- upvalues: authButtonClick (copy), var3 (ref), vpcEventConstants (copy), onRetryAmp (ref)
			authButtonClick(var3, vpcEventConstants.errorPageRetryButton)
			onRetryAmp()
		end,
		onRetryVPC = function()
			-- upvalues: authButtonClick (copy), var3 (ref), vpcEventConstants (copy), onRetryVPC (ref)
			authButtonClick(var3, vpcEventConstants.errorPageRetryButton)
			onRetryVPC()
		end,
		onCancel = function()
			-- upvalues: authButtonClick (copy), var3 (ref), vpcEventConstants (copy), onCancel (ref)
			authButtonClick(var3, vpcEventConstants.errorPageCancelButton)
			onCancel()
		end,
		onSuccess = function()
			-- upvalues: authButtonClick (copy), var3 (ref), vpcEventConstants (copy), onSuccess (ref)
			authButtonClick(var3, vpcEventConstants.confirmationPageButton)
			onSuccess()
		end,
		retryNum = var24,
		disablePortal = var4,
		isInExperienceEntry = var5
	})
end