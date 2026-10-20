local WhatsNew = script:FindFirstAncestor("WhatsNew")
local EnumsModule = require(WhatsNew.Enums)
local _ = require(WhatsNew.Types)
local _ = require(script.Parent.ScopeActions)
local ValidateRegistryModule = require(script.Parent.validateRegistry)
local BuildTourTipsModule = require(script.Parent.buildTourTips)

local function collectScreenScopeIds(ScopeTours)
	local List = {}
	
	for i, scopeTour in ScopeTours do
		if scopeTour.parentScopeId == nil then
			table.insert(List, i)
		end
	end
	table.sort(List)
	
	return List
end

local function _(p1, WhatsNew)
	-- upvalues: EnumsModule (copy)
	return if WhatsNew == EnumsModule.TourType.WhatsNew then p1.whatsNew else p1.onboarding
end

local function assertValidationPassed(p1, p2)
	-- upvalues: ValidateRegistryModule (copy)
	local ValidateRegistryModuleResult = ValidateRegistryModule(p1, { scopeActions = if p2 then p2.scopeActions else nil })
	assert(#ValidateRegistryModuleResult.errors == 0, `loadWhatsNewRegistry validation failed: {table.concat(ValidateRegistryModuleResult.errors, "; ")}`)
end

local function loadWhatsNewRegistry(UpdatesModule, p1, p2)
	-- upvalues: assertValidationPassed (copy), collectScreenScopeIds (copy), EnumsModule (copy), BuildTourTipsModule (copy)
	assertValidationPassed(UpdatesModule, p2 or {})
	local t = {}
	
	for _, ScreenScopeId in collectScreenScopeIds(UpdatesModule.scopeTours) do
		for _, TourType in EnumsModule.TourTypeList do
			local TourTipsModule = BuildTourTipsModule(UpdatesModule, p1, ScreenScopeId, TourType, if TourType == EnumsModule.TourType.WhatsNew then UpdatesModule.whatsNew else UpdatesModule.onboarding, nil)
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
	loadBundledRegistry = function(p3, p4)
		-- upvalues: loadWhatsNewRegistry (copy)
		return (loadWhatsNewRegistry(require(script.Parent.Updates), p3, p4))
	end,
	makeRootTourKey = function(p3, p4): string
		return `{p3}:{p4}`
	end
}