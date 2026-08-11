local whatsNew = script:FindFirstAncestor("WhatsNew")
local constantsModule = require(whatsNew.Constants)
local _ = require(whatsNew.Types)
local deriveResolvedFieldsModule = require(script.Parent.DeriveResolvedFields)

local function _(p0, p1, p2) --[[ line: 33 | named "appendWarning" ]]
	if p0 == nil then
		return
	end
	table.insert(p0, `{p1}:{p2}`)
end

local _ = function(p3, p4, p5, p6, p7) --[[ line: 40 | named "createBuildContext" ]]
	return {
		document = p3,
		deps = p4,
		screenScopeId = p5,
		tourType = p6,
		warnings = p7,
		constants = p3.constants,
		scopeTours = p3.scopeTours
	}
end

local function filterEntriesInSubtree(p8, p9) --[[ line: 59 ]]
	-- upvalues: deriveResolvedFieldsModule (ref)
	local t = {}
	
	for i, v in p8 do
		if deriveResolvedFieldsModule.isEntryInScopeSubtree(v, p9.screenScopeId, p9.scopeTours) then
			table.insert(t, v)
		end
	end
	return t
end

local function groupEntriesByScopeId(p10) --[[ line: 69 ]]
	local t = {}
	
	for i, v in p10 do
		local scopeId = t[v.scopeId]
		
		if scopeId == nil then
			scopeId = {}
			t[v.scopeId] = scopeId
		end
		table.insert(scopeId, v)
	end
	return t
end

local function collectRelevantScopeIds(p11, p12, p13) --[[ line: 82 ]]
	local t = { [p11] = true }
	
	local function addAncestorChain(p14) --[[ line: 91 ]]
		-- upvalues: t (ref), p11 (ref), p13 (ref)
		local var18 = p14
		while var18 ~= nil and not t[var18] do
			t[var18] = true
			
			if var18 == p11 then break end
			local var19 = p13[var18]
			var18 = if var19 then var19.parentScopeId else nil
		end
	end
	
	for i in p12 do
		addAncestorChain(i)
	end
	local t_1 = {}
	
	for i_1 in t do
		table.insert(t_1, i_1)
	end
	return t_1
end

local function buildEmptyScopeTree(p15, p16) --[[ line: 118 ]]
	local t = {}
	
	for i, v in p15 do
		local var21 = p16[v]
		t[v] = {
			id = v,
			parentScopeId = if var21 then var21.parentScopeId else nil,
			tourTips = {}
		}
	end
	return t
end

local _ = function(p17, p18) --[[ line: 134 | named "tryConsumeSteps" ]]
	if p17.globalRemaining < p18 then
		return false
	end
	p17.globalRemaining -= p18
	
	return true
end

local _ = function(p19, p20, p21) --[[ line: 142 | named "markTruncated" ]]
	-- upvalues: constantsModule (ref)
	if p19.truncated then return end
	p19.truncated = true
	local TOUR_TIPS_TRUNCATED = constantsModule.WarningCodes.TOUR_TIPS_TRUNCATED
	
	if p20 == nil then
		return
	end
	table.insert(p20, `{TOUR_TIPS_TRUNCATED}:{p21}`)
end

local function getScopePathFromScreen(p22, p23, p24) --[[ line: 150 ]]
	local t = {}
	local var23 = p22
	while var23 ~= nil do
		table.insert(t, 1, var23)
		
		if var23 == p23 then break end
		local var24 = p24[var23]
		var23 = if var24 then var24.parentScopeId else nil
	end
	return t
end

local function entryToTourTip(p25, p26) --[[ line: 169 ]]
	return {
		stepCount = 1,
		id = p25.id,
		scopeId = p25.scopeId,
		title = p25.title,
		text = p25.text,
		icon = p25.icon,
		enabled = p25.enabled,
		publishedTime = p25.publishedTime,
		disabledTime = p25.disabledTime,
		expired = p25.expired,
		seen = p25.seen,
		optOutCount = p25.optOutCount,
		adopted = p25.adopted,
		toShow = p25.toShow,
		anchorId = p26.anchorId,
		side = p26.side,
		align = p26.align
	}
end

local function buildNestedGatewayTip(p27, p28, p29) --[[ line: 191 ]]
	return {
		icon = nil,
		enabled = true,
		publishedTime = nil,
		disabledTime = nil,
		expired = false,
		seen = nil,
		optOutCount = 0,
		adopted = false,
		toShow = true,
		stepCount = 1,
		id = `gateway:{p27.id}`,
		scopeId = p27.parentScopeId or p27.id,
		title = p29.title,
		text = p29.text,
		anchorId = p27.anchorId or "",
		side = p27.side,
		align = p27.align,
		gateway = {
			openActionKey = p27.openActionKey or "",
			closeActionKey = p27.closeActionKey or "",
			scope = p28
		}
	}
end

local _ = function(p30, p31, p32, _, p33, p34) --[[ line: 226 | named "addPlainTipToScope" ]]
	-- upvalues: constantsModule (ref)
	local var25
	if p33.globalRemaining < 1 then
		var25 = false
	else
		p33.globalRemaining -= 1
		var25 = true
	end
	if var25 then
		table.insert(p32[p30].tourTips, p31)
		
		return true
	end
	local warnings = p34.warnings
	local screenScopeId = p34.screenScopeId
	
	if not p33.truncated then
		p33.truncated = true
		local TOUR_TIPS_TRUNCATED = constantsModule.WarningCodes.TOUR_TIPS_TRUNCATED
		
		if warnings ~= nil then
			table.insert(warnings, `{TOUR_TIPS_TRUNCATED}:{screenScopeId}`)
		end
	end
	return false
end

local function ensureNestedGateway(p35, p36, p37, p38, p39, p40) --[[ line: 243 ]]
	-- upvalues: constantsModule (ref), deriveResolvedFieldsModule (ref), buildNestedGatewayTip (ref)
	if p38[p36] ~= nil then
		return true
	end
	local var27
	local var26 = p40.scopeTours[p36]
	
	if var26 == nil then
		return false
	elseif p39.globalRemaining < 1 then
		var27 = false
	else
		p39.globalRemaining -= 1
		var27 = true
	end
	if var27 then
		local labels = deriveResolvedFieldsModule.getLabels(var26, p40.tourType)
		
		if not deriveResolvedFieldsModule.hasLabels(labels) then
			local warnings = p40.warnings
			local GATEWAY_COPY_FALLBACK = constantsModule.WarningCodes.GATEWAY_COPY_FALLBACK
			
			if warnings ~= nil then
				table.insert(warnings, `{GATEWAY_COPY_FALLBACK}:{p36}`)
			end
		end
		local var29 = buildNestedGatewayTip(var26, p37[p36], labels)
		table.insert(p37[p35].tourTips, var29)
		p38[p36] = { parentScopeId = p35, tip = var29 }
		
		return true
	else
		local warnings = p40.warnings
		local screenScopeId = p40.screenScopeId
		
		if not p39.truncated then
			p39.truncated = true
			local TOUR_TIPS_TRUNCATED = constantsModule.WarningCodes.TOUR_TIPS_TRUNCATED
			
			if warnings ~= nil then
				table.insert(warnings, `{TOUR_TIPS_TRUNCATED}:{screenScopeId}`)
			end
		end
		return false
	end
end

local function ensureScopeChainForEntry(p41, p42, p43, p44, p45) --[[ line: 280 ]]
	-- upvalues: getScopePathFromScreen (ref), ensureNestedGateway (ref)
	local var30 = getScopePathFromScreen(p41, p45.screenScopeId, p45.scopeTours)
	
	for i = 1, #var30 - 1 do
		if ensureNestedGateway(var30[i], var30[i + 1], p42, p43, p44, p45) then
			continue
		end
		return false
	end
	return true
end

local function buildScopeTourForScreen(p46, p47) --[[ line: 298 ]]
	-- upvalues: filterEntriesInSubtree (ref), groupEntriesByScopeId (ref), collectRelevantScopeIds (ref), buildEmptyScopeTree (ref), deriveResolvedFieldsModule (ref), ensureScopeChainForEntry (ref), entryToTourTip (ref), constantsModule (ref)
	local screenScopeId = p46.scopeTours[p46.screenScopeId]
	local var31 = if screenScopeId then screenScopeId.parentScopeId else nil
	local maxTourTips = p46.constants.maxTourTips
	local var32 = filterEntriesInSubtree(p47, p46)
	local var33 = buildEmptyScopeTree(collectRelevantScopeIds(p46.screenScopeId, groupEntriesByScopeId(var32), p46.scopeTours), p46.scopeTours)
	local t = { truncated = false, globalRemaining = maxTourTips }
	local t_1 = {}
	
	for i, v in var32 do
		local var36 = deriveResolvedFieldsModule.deriveEntryDisplay(v, p46.tourType, p46.deps, p46.constants)
		
		if var36.toShow and ensureScopeChainForEntry(v.scopeId, var33, t_1, t, p46) then
			local warnings
			local var37 = entryToTourTip(var36, v)
			local scopeId = v.scopeId
			
			if t.globalRemaining < 1 then
				warnings = false
			else
				t.globalRemaining -= 1
				warnings = true
			end
			if warnings then
				table.insert(var33[scopeId].tourTips, var37)
			else
				warnings = p46.warnings
				local screenScopeId_1 = p46.screenScopeId
				
				if not t.truncated then
					t.truncated = true
					local TOUR_TIPS_TRUNCATED = constantsModule.WarningCodes.TOUR_TIPS_TRUNCATED
					
					if warnings ~= nil then
						table.insert(warnings, `{TOUR_TIPS_TRUNCATED}:{screenScopeId_1}`)
					end
				end
			end
		end
	end
	local screenScopeId_1 = var33[p46.screenScopeId]
	
	return if screenScopeId_1 == nil then {
		truncated = false,
		globalTotalSteps = 0,
		scope = {
			id = p46.screenScopeId,
			parentScopeId = var31,
			tourTips = {}
		}
	} else {
		scope = screenScopeId_1,
		truncated = t.truncated,
		globalTotalSteps = deriveResolvedFieldsModule.countScopeSteps(screenScopeId_1)
	}
end

return function(p48, p49, p50, p51, p52, p53) --[[ line: 351 | named "buildTourTips" ]]
	-- upvalues: buildScopeTourForScreen (ref)
	return buildScopeTourForScreen({
		document = p48,
		deps = p49,
		screenScopeId = p50,
		tourType = p51,
		warnings = p53,
		constants = p48.constants,
		scopeTours = p48.scopeTours
	}, p52)
end