local WhatsNew = script:FindFirstAncestor("WhatsNew")
local ConstantsModule = require(WhatsNew.Constants)
local _ = require(WhatsNew.Types)
local TourTipCtaAccessModule = require(WhatsNew.TourTipCtaAccess)
local DeriveResolvedFieldsModule = require(script.Parent.DeriveResolvedFields)

local function _(List, p1, p2)
	if List ~= nil then
		table.insert(List, `{p1}:{p2}`)
		
		return
	end
end

local _ = function(BuildContext, Deps, ScreenScopeId, TourType, Warnings)
	return {
		document = BuildContext,
		deps = Deps,
		screenScopeId = ScreenScopeId,
		tourType = TourType,
		warnings = Warnings,
		constants = BuildContext.constants,
		scopeTours = BuildContext.scopeTours
	}
end

local function filterEntriesInSubtree(List, BuildContext)
	-- upvalues: DeriveResolvedFieldsModule (copy)
	local List1 = {}
	
	for _, value in List do
		if DeriveResolvedFieldsModule.isEntryInScopeSubtree(value, BuildContext.screenScopeId, BuildContext.scopeTours) then
			table.insert(List1, value)
		end
	end
	return List1
end

local function groupEntriesByScopeId(List1)
	local t = {}
	
	for _, value in List1 do
		local List = t[value.scopeId]
		
		if List == nil then
			List = {}
			t[value.scopeId] = List
		end
		table.insert(List, value)
	end
	return t
end

local function collectRelevantScopeIds(ScreenScopeId, List, ScopeTours)
	local config = { [ScreenScopeId] = true }
	
	local function addAncestorChain(ParentScopeId)
		-- upvalues: config (copy), ScreenScopeId (copy), ScopeTours (copy)
		local ParentScopeId1 = ParentScopeId
		while ParentScopeId1 ~= nil and not config[ParentScopeId1] do
			config[ParentScopeId1] = true
			
			if ParentScopeId1 == ScreenScopeId then break end
			local ScopeTour = ScopeTours[ParentScopeId1]
			ParentScopeId1 = if ScopeTour then ScopeTour.parentScopeId else nil
		end
	end
	
	for i in List do
		addAncestorChain(i)
	end
	local List1 = {}
	
	for i1 in config do
		table.insert(List1, i1)
	end
	return List1
end

local function buildEmptyScopeTree(Ids, ScopeTours)
	local t = {}
	
	for _, id in Ids do
		local ScopeTour = ScopeTours[id]
		t[id] = {
			id = id,
			parentScopeId = if ScopeTour then ScopeTour.parentScopeId else nil,
			tourTips = {}
		}
	end
	return t
end

local _ = function(p1, p2): boolean
	if p1.globalRemaining < p2 then
		return false
	else
		p1.globalRemaining -= p2
		
		return true
	end
end

local _ = function(p1, List, p2)
	-- upvalues: ConstantsModule (copy)
	if p1.truncated then return end
	p1.truncated = true
	local TOURTIPSTRUNCATED = ConstantsModule.WarningCodes.TOUR_TIPS_TRUNCATED
	
	if List ~= nil then
		table.insert(List, `{TOURTIPSTRUNCATED}:{p2}`)
		
		return
	end
end

local function getScopePathFromScreen(ParentScopeId, ScreenScopeId, ScopeTours)
	local List = {}
	local ParentScopeId1 = ParentScopeId
	while ParentScopeId1 ~= nil do
		table.insert(List, 1, ParentScopeId1)
		
		if ParentScopeId1 == ScreenScopeId then break end
		local ScopeTour = ScopeTours[ParentScopeId1]
		ParentScopeId1 = if ScopeTour then ScopeTour.parentScopeId else nil
	end
	return List
end

local function entryToTourTip(NestedGatewayTip, AnchorId)
	-- upvalues: TourTipCtaAccessModule (copy)
	return {
		stepCount = 1,
		side = nil,
		align = nil,
		id = NestedGatewayTip.id,
		scopeId = NestedGatewayTip.scopeId,
		title = NestedGatewayTip.title,
		text = NestedGatewayTip.text,
		icon = NestedGatewayTip.icon,
		enabled = NestedGatewayTip.enabled,
		publishedTime = NestedGatewayTip.publishedTime,
		disableTime = NestedGatewayTip.disableTime,
		expired = NestedGatewayTip.expired,
		seen = NestedGatewayTip.seen,
		optOutCount = NestedGatewayTip.optOutCount,
		adopted = NestedGatewayTip.adopted,
		toShow = NestedGatewayTip.toShow,
		anchorId = AnchorId,
		cta = TourTipCtaAccessModule.none()
	}
end

local function buildNestedGatewayTip(ScopeTour, p1, NestedGatewayTip)
	-- upvalues: DeriveResolvedFieldsModule (copy), TourTipCtaAccessModule (copy)
	return {
		icon = nil,
		enabled = true,
		publishedTime = nil,
		disableTime = nil,
		expired = false,
		seen = nil,
		optOutCount = 0,
		adopted = false,
		toShow = true,
		side = nil,
		align = nil,
		id = `gateway:{ScopeTour.id}`,
		scopeId = ScopeTour.parentScopeId or ScopeTour.id,
		title = NestedGatewayTip.title,
		text = NestedGatewayTip.text,
		anchorId = ScopeTour.anchorId or "",
		stepCount = 1 + DeriveResolvedFieldsModule.countScopeSteps(p1),
		cta = TourTipCtaAccessModule.nested(ScopeTour.openActionKey or "", ScopeTour.closeActionKey or "", p1)
	}
end

local _ = function(p1, p2)
	-- upvalues: DeriveResolvedFieldsModule (copy)
	p1.tip.stepCount = 1 + DeriveResolvedFieldsModule.countScopeSteps(p2)
end

local function ensureNestedGateway(ParentScopeId, Key, p1, p2, p3, BuildContext): boolean
	-- upvalues: ConstantsModule (copy), DeriveResolvedFieldsModule (copy), buildNestedGatewayTip (copy)
	if p2[Key] ~= nil then
		return true
	end
	local ScopeTour = BuildContext.scopeTours[Key]
	
	if ScopeTour == nil then
		return false
	end
	local Flag = nil
	if p3.globalRemaining < 1 then
		Flag = false
	else
		p3.globalRemaining -= 1
		Flag = true
	end
	if Flag then
		local Labels = DeriveResolvedFieldsModule.getLabels(ScopeTour, BuildContext.tourType)
		
		if not DeriveResolvedFieldsModule.hasLabels(Labels) then
			local Warnings = BuildContext.warnings
			local GATEWAYCOPYFALLBACK = ConstantsModule.WarningCodes.GATEWAY_COPY_FALLBACK
			
			if Warnings ~= nil then
				table.insert(Warnings, `{GATEWAYCOPYFALLBACK}:{Key}`)
			end
		end
		local NestedGatewayTip = buildNestedGatewayTip(ScopeTour, p1[Key], Labels)
		table.insert(p1[ParentScopeId].tourTips, NestedGatewayTip)
		p2[Key] = { parentScopeId = ParentScopeId, tip = NestedGatewayTip }
		
		return true
	else
		local Warnings = BuildContext.warnings
		local ScreenScopeId = BuildContext.screenScopeId
		
		if not p3.truncated then
			p3.truncated = true
			local TOURTIPSTRUNCATED = ConstantsModule.WarningCodes.TOUR_TIPS_TRUNCATED
			
			if Warnings ~= nil then
				table.insert(Warnings, `{TOURTIPSTRUNCATED}:{ScreenScopeId}`)
			end
		end
		return false
	end
end

local _ = function(p1, p2, p3, p4, p5, BuildContext): boolean
	-- upvalues: ConstantsModule (copy), DeriveResolvedFieldsModule (copy)
	local Flag = nil
	if p5.globalRemaining < 1 then
		Flag = false
	else
		p5.globalRemaining -= 1
		Flag = true
	end
	if Flag then
		table.insert(p3[p1].tourTips, p2)
		local v1 = p4[p1]
		
		if v1 ~= nil then
			v1.tip.stepCount = 1 + DeriveResolvedFieldsModule.countScopeSteps(p3[p1])
		end
		return true
	else
		local Warnings = BuildContext.warnings
		local ScreenScopeId = BuildContext.screenScopeId
		
		if not p5.truncated then
			p5.truncated = true
			local TOURTIPSTRUNCATED = ConstantsModule.WarningCodes.TOUR_TIPS_TRUNCATED
			
			if Warnings ~= nil then
				table.insert(Warnings, `{TOURTIPSTRUNCATED}:{ScreenScopeId}`)
			end
		end
		return false
	end
end

local function ensureScopeChainForEntry(ScopeId, p1, p2, p3, BuildContext): boolean
	-- upvalues: getScopePathFromScreen (copy), ensureNestedGateway (copy)
	local ScopePathFromScreen = getScopePathFromScreen(ScopeId, BuildContext.screenScopeId, BuildContext.scopeTours)
	
	for i = 1, #ScopePathFromScreen - 1 do
		if not ensureNestedGateway(ScopePathFromScreen[i], ScopePathFromScreen[i + 1], p1, p2, p3, BuildContext) then
			return false
		end
	end
	return true
end

local function buildScopeTourForScreen(BuildContext, p4)
	-- upvalues: filterEntriesInSubtree (copy), groupEntriesByScopeId (copy), collectRelevantScopeIds (copy), buildEmptyScopeTree (copy), DeriveResolvedFieldsModule (copy), ensureScopeChainForEntry (copy), entryToTourTip (copy), ConstantsModule (copy)
	local ScopeTour = BuildContext.scopeTours[BuildContext.screenScopeId]
	local ParentScopeId = if ScopeTour then ScopeTour.parentScopeId else nil
	local MaxTourTips = BuildContext.constants.maxTourTips
	local FilterEntriesInSubtreeResult = filterEntriesInSubtree(p4, BuildContext)
	local EmptyScopeTree = buildEmptyScopeTree(collectRelevantScopeIds(BuildContext.screenScopeId, groupEntriesByScopeId(FilterEntriesInSubtreeResult), BuildContext.scopeTours), BuildContext.scopeTours)
	local config = { truncated = false, globalRemaining = MaxTourTips }
	local t = {}
	
	for _, NestedGatewayTip in FilterEntriesInSubtreeResult do
		local DeriveEntryDisplayResult = DeriveResolvedFieldsModule.deriveEntryDisplay(NestedGatewayTip, BuildContext.tourType, BuildContext.deps, BuildContext.constants)
		
		if DeriveEntryDisplayResult.toShow and ensureScopeChainForEntry(NestedGatewayTip.scopeId, EmptyScopeTree, t, config, BuildContext) then
			local EntryToTourTipResult = entryToTourTip(DeriveEntryDisplayResult, NestedGatewayTip.anchorId)
			local ScopeId = NestedGatewayTip.scopeId
			local Flag = nil
			
			if config.globalRemaining < 1 then
				Flag = false
			else
				config.globalRemaining -= 1
				Flag = true
			end
			if Flag then
				table.insert(EmptyScopeTree[ScopeId].tourTips, EntryToTourTipResult)
				local Entry = t[ScopeId]
				
				if Entry ~= nil then
					Entry.tip.stepCount = 1 + DeriveResolvedFieldsModule.countScopeSteps(EmptyScopeTree[ScopeId])
				end
			else
				local Warnings = BuildContext.warnings
				local ScreenScopeId = BuildContext.screenScopeId
				local Truncated = config.truncated
				local TOURTIPSTRUNCATED = nil
				
				if not Truncated then
					config.truncated = true
					TOURTIPSTRUNCATED = ConstantsModule.WarningCodes.TOUR_TIPS_TRUNCATED
					Truncated = Warnings == nil
				end
				if not Truncated then
					table.insert(Warnings, `{TOURTIPSTRUNCATED}:{ScreenScopeId}`)
				end
			end
		end
	end
	local EmptyScopeTreeEntry = EmptyScopeTree[BuildContext.screenScopeId]
	
	return if EmptyScopeTreeEntry == nil then {
		truncated = false,
		globalTotalSteps = 0,
		scope = {
			id = BuildContext.screenScopeId,
			parentScopeId = ParentScopeId,
			tourTips = {}
		}
	} else {
		scope = EmptyScopeTreeEntry,
		truncated = config.truncated,
		globalTotalSteps = DeriveResolvedFieldsModule.countScopeSteps(EmptyScopeTreeEntry)
	}
end

return function(BuildContext, Deps, ScreenScopeId, TourType, p5, Warnings)
	-- upvalues: buildScopeTourForScreen (copy)
	return (buildScopeTourForScreen({
		document = BuildContext,
		deps = Deps,
		screenScopeId = ScreenScopeId,
		tourType = TourType,
		warnings = Warnings,
		constants = BuildContext.constants,
		scopeTours = BuildContext.scopeTours
	}, p5))
end