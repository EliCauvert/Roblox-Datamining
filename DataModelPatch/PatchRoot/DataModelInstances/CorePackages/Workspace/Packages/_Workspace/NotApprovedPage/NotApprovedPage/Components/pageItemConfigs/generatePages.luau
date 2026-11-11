local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Constants = require(NotApprovedPage.Parent.NotApprovedPageShared).Constants
local CryoModule = require(NotApprovedPage.Parent.Cryo)
local INTERVENTIONTYPES = Constants.INTERVENTION_TYPES
local PUNISHMENTTYPETOINTERVENTIONMAP = Constants.PUNISHMENT_TYPE_TO_INTERVENTION_MAP
local _ = require(NotApprovedPage.Common.Types)
local PageItemConfigUtilsModule = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local EDUCATIONALPAGEPREFIXES = PageItemConfigUtilsModule.EDUCATIONAL_PAGE_PREFIXES
local STATICPAGENAMES = PageItemConfigUtilsModule.STATIC_PAGE_NAMES
local PolicyEducationContentRegistryModule = require(NotApprovedPage.Components.pageItemConfigs.policyEducationConfigs.policyEducationContentRegistry)
local CreatePolicyEducationConfigModule = require(NotApprovedPage.Components.pageItemConfigs.policyEducationConfigs.createPolicyEducationConfig)
local BadUtterancesConfigModule = require(NotApprovedPage.Components.pageItemConfigs.configs.BadUtterancesConfig)
local ChargebackStepsConfigModule = require(NotApprovedPage.Components.pageItemConfigs.configs.ChargebackStepsConfig)
local PreventionStepsConfigModule = require(NotApprovedPage.Components.pageItemConfigs.configs.PreventionStepsConfig)
local PunishmentDescriptionConfigModule = require(NotApprovedPage.Components.pageItemConfigs.configs.PunishmentDescriptionConfig)
local RecentActivityConfigModule = require(NotApprovedPage.Components.pageItemConfigs.configs.RecentActivityConfig)
local ReportMistakeConfigModule = require(NotApprovedPage.Components.pageItemConfigs.configs.ReportMistakeConfig)
local SecondChanceConclusionConfigModule = require(NotApprovedPage.Components.pageItemConfigs.secondChanceConfigs.SecondChanceConclusionConfig)
local SecondChanceIntroConfigModule = require(NotApprovedPage.Components.pageItemConfigs.secondChanceConfigs.SecondChanceIntroConfig)
local SimpleModeratorNoteConfigModule = require(NotApprovedPage.Components.pageItemConfigs.configs.SimpleModeratorNoteConfig)
local ViolationEvidenceConfigModule = require(NotApprovedPage.Components.pageItemConfigs.configs.ViolationEvidenceConfig)
local WhatHappenedConfigModule = require(NotApprovedPage.Components.pageItemConfigs.configs.WhatHappenedConfig)
local ContinueButtonCtaModule = require(NotApprovedPage.Components.cta.ContinueButtonCta)
local DeleteCtaModule = require(NotApprovedPage.Components.cta.DeleteCta)
local ProceedActionsCtaModule = require(NotApprovedPage.Components.cta.ProceedActionsCta)
local SecondChanceActionsCtaModule = require(NotApprovedPage.Components.cta.SecondChanceActionsCta)
local UnderstandRuleContinueCtaModule = require(NotApprovedPage.Components.cta.UnderstandRuleContinueCta)

local function getEducationalPages(_, List, EducationalPassEligible)
	-- upvalues: PolicyEducationContentRegistryModule (copy), EDUCATIONALPAGEPREFIXES (copy), CreatePolicyEducationConfigModule (copy), UnderstandRuleContinueCtaModule (copy), ContinueButtonCtaModule (copy), CryoModule (copy)
	local List1 = {}
	local t = {}
	local t1 = {}
	
	for _, value in ipairs(List) do
		local PolicyEducationContentRegistryModuleEntry = PolicyEducationContentRegistryModule[value]
		
		if not PolicyEducationContentRegistryModuleEntry then
			t1[value] = true
		elseif not t[PolicyEducationContentRegistryModuleEntry.policyKey] then
			t[PolicyEducationContentRegistryModuleEntry.policyKey] = true
			table.insert(List1, {
				pageName = `{EDUCATIONALPAGEPREFIXES.Rule}{PolicyEducationContentRegistryModuleEntry.policyKey}`,
				pageItems = {
					CreatePolicyEducationConfigModule({
						title = PolicyEducationContentRegistryModuleEntry.ruleTitle,
						subtitle = PolicyEducationContentRegistryModuleEntry.ruleSubtitle,
						description = PolicyEducationContentRegistryModuleEntry.ruleDescription,
						descriptionBullets = PolicyEducationContentRegistryModuleEntry.ruleDescriptionBullets,
						policyKey = PolicyEducationContentRegistryModuleEntry.policyKey
					})
				},
				CtaComponent = if EducationalPassEligible then UnderstandRuleContinueCtaModule else ContinueButtonCtaModule
			})
			table.insert(List1, {
				pageName = `{EDUCATIONALPAGEPREFIXES.Importance}{PolicyEducationContentRegistryModuleEntry.policyKey}`,
				pageItems = {
					CreatePolicyEducationConfigModule({
						title = PolicyEducationContentRegistryModuleEntry.importanceTitle,
						description = PolicyEducationContentRegistryModuleEntry.importanceDescription,
						policyKey = PolicyEducationContentRegistryModuleEntry.policyKey
					})
				},
				CtaComponent = if EducationalPassEligible then UnderstandRuleContinueCtaModule else ContinueButtonCtaModule
			})
		end
	end
	return {
		educationalPages = List1,
		unmappedViolationKeys = CryoModule.Dictionary.keys(t1)
	}
end

return {
	generatePages = function(p1, p2, p3)
		-- upvalues: PUNISHMENTTYPETOINTERVENTIONMAP (copy), INTERVENTIONTYPES (copy), STATICPAGENAMES (copy), PunishmentDescriptionConfigModule (copy), WhatHappenedConfigModule (copy), RecentActivityConfigModule (copy), DeleteCtaModule (copy), ContinueButtonCtaModule (copy), SecondChanceIntroConfigModule (copy), ReportMistakeConfigModule (copy), getEducationalPages (copy), PreventionStepsConfigModule (copy), ChargebackStepsConfigModule (copy), UnderstandRuleContinueCtaModule (copy), ProceedActionsCtaModule (copy), SecondChanceConclusionConfigModule (copy), SecondChanceActionsCtaModule (copy)
		local List = {}
		local IsPUNISHMENTTYPETOINTERVENTIONMatch = PUNISHMENTTYPETOINTERVENTIONMAP[p1.punishmentTypeDescription] == INTERVENTIONTYPES.Deleted
		local EducationalPassEligible = if p3 then p3.educational_pass_eligible else false
		table.insert(List, {
			pageName = STATICPAGENAMES.Intro,
			pageItems = {
				PunishmentDescriptionConfigModule,
				WhatHappenedConfigModule,
				RecentActivityConfigModule
			},
			CtaComponent = if IsPUNISHMENTTYPETOINTERVENTIONMatch then DeleteCtaModule else ContinueButtonCtaModule
		})
		
		if IsPUNISHMENTTYPETOINTERVENTIONMatch then
			return { pages = List, unmappedViolationKeys = {} }
		end
		if EducationalPassEligible then
			table.insert(List, {
				pageName = STATICPAGENAMES.SecondChanceIntro,
				pageItems = { SecondChanceIntroConfigModule, ReportMistakeConfigModule },
				CtaComponent = ContinueButtonCtaModule
			})
		end
		local EducationalPages = getEducationalPages(p1, p2, EducationalPassEligible)
		
		for _, educationalPage in EducationalPages.educationalPages do
			table.insert(List, educationalPage)
		end
		table.insert(List, {
			pageName = STATICPAGENAMES.Resolution,
			pageItems = {
				PreventionStepsConfigModule,
				ChargebackStepsConfigModule,
				ReportMistakeConfigModule
			},
			CtaComponent = if EducationalPassEligible then UnderstandRuleContinueCtaModule else ProceedActionsCtaModule
		})
		
		if EducationalPassEligible then
			table.insert(List, {
				pageName = STATICPAGENAMES.SecondChanceConclusion,
				pageItems = { SecondChanceConclusionConfigModule },
				CtaComponent = SecondChanceActionsCtaModule
			})
		end
		return {
			pages = List,
			unmappedViolationKeys = EducationalPages.unmappedViolationKeys
		}
	end,
	getReviewedEvidencePageItemConfigs = function()
		-- upvalues: ViolationEvidenceConfigModule (copy), BadUtterancesConfigModule (copy), SimpleModeratorNoteConfigModule (copy)
		return {
			ViolationEvidenceConfigModule,
			BadUtterancesConfigModule,
			SimpleModeratorNoteConfigModule
		}
	end
}