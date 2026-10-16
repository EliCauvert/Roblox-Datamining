local WhatsNew = script:FindFirstAncestor("WhatsNew")
local EnumsModule = require(WhatsNew.Enums)
local _ = require(WhatsNew.Types)
local Localization = require(WhatsNew.Parent.InExperienceLocales).Localization
local _ = require(script.Parent.ScopeActions)
local ValidateRegistryModule = require(script.Parent.validateRegistry)
local BuildTourTipsModule = require(script.Parent.buildTourTips)
local LocalizationService = game:GetService("LocalizationService")

local function collectScreenScopeIds(ScopeTours) --[[ Line: 26 ]]
	local List = {}
	
	for i, scopeTour in ScopeTours do
		if scopeTour.parentScopeId == nil then
			table.insert(List, i)
		end
	end
	table.sort(List)
	
	return List
end

local function _(p1, WhatsNew) --[[ Line: 37 | Named "getRegistryEntries" ]]
	-- upvalues: EnumsModule (copy)
	return if WhatsNew == EnumsModule.TourType.WhatsNew then p1.whatsNew else p1.onboarding
end

local function assertValidationPassed(p1, p2) --[[ Line: 44 ]]
	-- upvalues: ValidateRegistryModule (copy)
	local ValidateRegistryModuleResult = ValidateRegistryModule(p1, { scopeActions = if p2 then p2.scopeActions else nil })
	assert(#ValidateRegistryModuleResult.errors == 0, `loadWhatsNewRegistry validation failed: {table.concat(ValidateRegistryModuleResult.errors, "; ")}`)
end

local _ = function(p1, p2) --[[ Line: 51 | Named "localizeOptional" ]]
	return if p2 == nil or p2 == "" then p2 else p1:Format(p2)
end

local function localizeRegistry(UpdatesModule) --[[ Line: 58 ]]
	-- upvalues: Localization (copy), LocalizationService (copy)
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	local ScopeTours = {}
	
	for i, scopeTour in UpdatesModule.scopeTours do
		local Copy = table.clone(scopeTour)
		local OnboardingTitle = scopeTour.onboardingTitle
		Copy.onboardingTitle = if OnboardingTitle == nil or OnboardingTitle == "" then OnboardingTitle else NewLocalization:Format(OnboardingTitle)
		local OnboardingText = scopeTour.onboardingText
		Copy.onboardingText = if OnboardingText == nil or OnboardingText == "" then OnboardingText else NewLocalization:Format(OnboardingText)
		local UpdatesTitle = scopeTour.updatesTitle
		Copy.updatesTitle = if UpdatesTitle == nil or UpdatesTitle == "" then UpdatesTitle else NewLocalization:Format(UpdatesTitle)
		local UpdatesText = scopeTour.updatesText
		Copy.updatesText = if UpdatesText == nil or UpdatesText == "" then UpdatesText else NewLocalization:Format(UpdatesText)
		ScopeTours[i] = Copy
	end
	local function localizeEntries(Onboarding) --[[ Line: 71 ]]
		-- upvalues: NewLocalization (copy)
		local t = {}
		
		for i, value in Onboarding do
			local Copy = table.clone(value)
			Copy.title = NewLocalization:Format(value.title)
			Copy.text = NewLocalization:Format(value.text)
			t[i] = Copy
		end
		return t
	end
	
	return {
		constants = UpdatesModule.constants,
		scopeTours = ScopeTours,
		whatsNew = localizeEntries(UpdatesModule.whatsNew),
		onboarding = localizeEntries(UpdatesModule.onboarding)
	}
end

local function loadWhatsNewRegistry(p1, p2, p3) --[[ Line: 90 ]]
	-- upvalues: assertValidationPassed (copy), collectScreenScopeIds (copy), EnumsModule (copy), BuildTourTipsModule (copy)
	assertValidationPassed(p1, p3 or {})
	local t = {}
	
	for _, ScreenScopeId in collectScreenScopeIds(p1.scopeTours) do
		for _, TourType in EnumsModule.TourTypeList do
			local TourTipsModule = BuildTourTipsModule(p1, p2, ScreenScopeId, TourType, if TourType == EnumsModule.TourType.WhatsNew then p1.whatsNew else p1.onboarding, nil)
			t[`{ScreenScopeId}:{TourType}`] = {
				screenScopeId = ScreenScopeId,
				tourType = TourType,
				scopeTree = TourTipsModule.scope,
				globalTotalSteps = TourTipsModule.globalTotalSteps,
				truncated = TourTipsModule.truncated
			}
		end
	end
	return t
end

return {
	loadWhatsNewRegistry = loadWhatsNewRegistry,
	loadBundledRegistry = function(p4, p5) --[[ Line: 118 ]]
		-- upvalues: loadWhatsNewRegistry (copy), localizeRegistry (copy)
		return (loadWhatsNewRegistry(localizeRegistry((require(script.Parent.Updates))), p4, p5))
	end,
	makeRootTourKey = function(p4, p5): string --[[ Line: 22 ]]
		return `{p4}:{p5}`
	end
}