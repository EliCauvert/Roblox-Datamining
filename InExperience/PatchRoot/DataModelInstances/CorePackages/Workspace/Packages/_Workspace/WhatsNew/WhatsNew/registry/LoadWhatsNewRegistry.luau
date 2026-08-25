local whatsNew = script:FindFirstAncestor("WhatsNew")
local parent = whatsNew.Parent
local enumsModule = require(whatsNew.Enums)
local _ = require(whatsNew.Types)
local localization = require(parent.InExperienceLocales).Localization
local _ = require(script.Parent.ScopeActions)
local validateRegistryModule = require(script.Parent.validateRegistry)
local buildTourTipsModule = require(script.Parent.buildTourTips)
local localizationService = game:GetService("LocalizationService")

local function makeRootTourKey(p0, p1)
	return `{p0}:{p1}`
end

local function collectScreenScopeIds(p2)
	local t = {}
	
	for i, v in p2 do
		if v.parentScopeId == nil then
			table.insert(t, i)
		end
	end
	table.sort(t)
	
	return t
end

local function _(p3, p4)
	-- upvalues: enumsModule (ref)
	return if p4 == enumsModule.TourType.WhatsNew then p3.whatsNew else p3.onboarding
end

local function assertValidationPassed(p5, p6)
	-- upvalues: validateRegistryModule (ref)
	local var11 = validateRegistryModule(p5, { scopeActions = if p6 then p6.scopeActions else nil })
	assert(#var11.errors == 0, `loadWhatsNewRegistry validation failed: {table.concat(var11.errors, "; ")}`)
end

local _ = function(p7, p8)
	return if p8 == nil or p8 == "" then p8 else p7:Format(p8)
end

local function localizeRegistry(p9)
	-- upvalues: localization (ref), localizationService (ref)
	local var12 = localization.new(localizationService.RobloxLocaleId)
	local t = {}
	
	for i, v in p9.scopeTours do
		local cloned = table.clone(v)
		local onboardingTitle = v.onboardingTitle
		cloned.onboardingTitle = if onboardingTitle == nil or onboardingTitle == "" then onboardingTitle else var12:Format(onboardingTitle)
		onboardingTitle = v.onboardingText
		cloned.onboardingText = if onboardingTitle == nil or onboardingTitle == "" then onboardingTitle else var12:Format(onboardingTitle)
		onboardingTitle = v.updatesTitle
		cloned.updatesTitle = if onboardingTitle == nil or onboardingTitle == "" then onboardingTitle else var12:Format(onboardingTitle)
		onboardingTitle = v.updatesText
		cloned.updatesText = if onboardingTitle == nil or onboardingTitle == "" then onboardingTitle else var12:Format(onboardingTitle)
		t[i] = cloned
	end
	local function localizeEntries(p10)
		-- upvalues: var12 (ref)
		local t = {}
		
		for i, v in p10 do
			local cloned = table.clone(v)
			cloned.title = var12:Format(v.title)
			cloned.text = var12:Format(v.text)
			t[i] = cloned
		end
		return t
	end
	
	return {
		constants = p9.constants,
		scopeTours = t,
		whatsNew = localizeEntries(p9.whatsNew),
		onboarding = localizeEntries(p9.onboarding)
	}
end

local function loadWhatsNewRegistry(p11, p12, p13)
	-- upvalues: assertValidationPassed (ref), collectScreenScopeIds (ref), enumsModule (ref), buildTourTipsModule (ref)
	assertValidationPassed(p11, p13 or {})
	local t = {}
	
	for i, v in collectScreenScopeIds(p11.scopeTours) do
		for i_1, v_1 in enumsModule.TourTypeList do
			local var19 = buildTourTipsModule(p11, p12, v, v_1, if v_1 == enumsModule.TourType.WhatsNew then p11.whatsNew else p11.onboarding, nil)
			t[`{v}:{v_1}`] = {
				screenScopeId = v,
				tourType = v_1,
				scopeTree = var19.scope,
				globalTotalSteps = var19.globalTotalSteps,
				truncated = var19.truncated
			}
		end
	end
	return t
end

return {
	loadWhatsNewRegistry = loadWhatsNewRegistry,
	loadBundledRegistry = function(p14, p15)
		-- upvalues: loadWhatsNewRegistry (ref), localizeRegistry (ref)
		return loadWhatsNewRegistry(localizeRegistry(require(script.Parent.Updates)), p14, p15)
	end,
	makeRootTourKey = makeRootTourKey
}