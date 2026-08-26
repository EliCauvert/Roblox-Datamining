local whatsNew = script:FindFirstAncestor("WhatsNew")
local parent = whatsNew.Parent
local enumsModule = require(whatsNew.Enums)
local _ = require(whatsNew.Types)
local localization = require(parent.InExperienceLocales).Localization
local _ = require(script.Parent.ScopeActions)
local validateRegistryModule = require(script.Parent.validateRegistry)
local buildTourTipsModule = require(script.Parent.buildTourTips)
local localizationService = game:GetService("LocalizationService")

local function makeRootTourKey(p1, p2)
	return `{p1}:{p2}`
end

local function collectScreenScopeIds(p1)
	local t = {}
	
	for i, v in p1 do
		if v.parentScopeId == nil then
			table.insert(t, i)
		end
	end
	table.sort(t)
	
	return t
end

local function _(p2, p3)
	-- upvalues: enumsModule (ref)
	return if p3 == enumsModule.TourType.WhatsNew then p2.whatsNew else p2.onboarding
end

local function assertValidationPassed(p2, p3)
	-- upvalues: validateRegistryModule (ref)
	local var1 = validateRegistryModule(p2, { scopeActions = if p3 then p3.scopeActions else nil })
	assert(#var1.errors == 0, `loadWhatsNewRegistry validation failed: {table.concat(var1.errors, "; ")}`)
end

local _ = function(p2, p3)
	return if p3 == nil or p3 == "" then p3 else p2:Format(p3)
end

local function localizeRegistry(p2)
	-- upvalues: localization (ref), localizationService (ref)
	local var1 = localization.new(localizationService.RobloxLocaleId)
	local t = {}
	
	for i, v in p2.scopeTours do
		local cloned = table.clone(v)
		local onboardingTitle = v.onboardingTitle
		cloned.onboardingTitle = if onboardingTitle == nil or onboardingTitle == "" then onboardingTitle else var1:Format(onboardingTitle)
		onboardingTitle = v.onboardingText
		cloned.onboardingText = if onboardingTitle == nil or onboardingTitle == "" then onboardingTitle else var1:Format(onboardingTitle)
		onboardingTitle = v.updatesTitle
		cloned.updatesTitle = if onboardingTitle == nil or onboardingTitle == "" then onboardingTitle else var1:Format(onboardingTitle)
		onboardingTitle = v.updatesText
		cloned.updatesText = if onboardingTitle == nil or onboardingTitle == "" then onboardingTitle else var1:Format(onboardingTitle)
		t[i] = cloned
	end
	local function localizeEntries(p3)
		-- upvalues: var1 (ref)
		local t = {}
		
		for i, v in p3 do
			local cloned = table.clone(v)
			cloned.title = var1:Format(v.title)
			cloned.text = var1:Format(v.text)
			t[i] = cloned
		end
		return t
	end
	
	return {
		constants = p2.constants,
		scopeTours = t,
		whatsNew = localizeEntries(p2.whatsNew),
		onboarding = localizeEntries(p2.onboarding)
	}
end

local function loadWhatsNewRegistry(p3, p4, p5)
	-- upvalues: assertValidationPassed (ref), collectScreenScopeIds (ref), enumsModule (ref), buildTourTipsModule (ref)
	assertValidationPassed(p3, p5 or {})
	local t = {}
	
	for i, v in collectScreenScopeIds(p3.scopeTours) do
		for i_1, v_1 in enumsModule.TourTypeList do
			local var2 = buildTourTipsModule(p3, p4, v, v_1, if v_1 == enumsModule.TourType.WhatsNew then p3.whatsNew else p3.onboarding, nil)
			t[`{v}:{v_1}`] = {
				screenScopeId = v,
				tourType = v_1,
				scopeTree = var2.scope,
				globalTotalSteps = var2.globalTotalSteps,
				truncated = var2.truncated
			}
		end
	end
	return t
end

return {
	loadWhatsNewRegistry = loadWhatsNewRegistry,
	loadBundledRegistry = function(p6, p7)
		-- upvalues: loadWhatsNewRegistry (ref), localizeRegistry (ref)
		return loadWhatsNewRegistry(localizeRegistry(require(script.Parent.Updates)), p6, p7)
	end,
	makeRootTourKey = makeRootTourKey
}