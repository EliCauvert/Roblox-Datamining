local whatsNew = script:FindFirstAncestor("WhatsNew")
local constantsModule = require(whatsNew.Constants)
local _ = require(whatsNew.Types)
local deriveResolvedFieldsModule = require(script.Parent.DeriveResolvedFields)

local function _(p1, p2, p3)
	if p1 == nil then
		return
	end
	table.insert(p1, `{p2}:{p3}`)
end

local _ = function(p1, p2, p3, p4, p5)
	return {
		document = p1,
		deps = p2,
		screenScopeId = p3,
		tourType = p4,
		warnings = p5,
		constants = p1.constants,
		scopeTours = p1.scopeTours
	}
end

local function filterEntriesInSubtree(p1, p2)
	-- upvalues: deriveResolvedFieldsModule (ref)
	local t = {}
	
	for i, v in p1 do
		if deriveResolvedFieldsModule.isEntryInScopeSubtree(v, p2.screenScopeId, p2.scopeTours) then
			table.insert(t, v)
		end
	end
	return t
end

local function groupEntriesByScopeId(p3)
	local t = {}
	
	for i, v in p3 do
		local scopeId = t[v.scopeId]
		
		if scopeId == nil then
			scopeId = {}
			t[v.scopeId] = scopeId
		end
		table.insert(scopeId, v)
	end
	return t
end

local function collectRelevantScopeIds(p4, p5, p6)
	local t = { [p4] = true }
	
	local function addAncestorChain(p7)
		-- upvalues: t (ref), p4 (ref), p6 (ref)
		local var1 = p7
		while var1 ~= nil and not t[var1] do
			t[var1] = true
			
			if var1 == p4 then break end
			local var2 = p6[var1]
			var1 = if var2 then var2.parentScopeId else nil
		end
	end
	
	for i in p5 do
		addAncestorChain(i)
	end
	local t_1 = {}
	
	for i_1 in t do
		table.insert(t_1, i_1)
	end
	return t_1
end

local function buildEmptyScopeTree(p8, p9)
	local t = {}
	
	for i, v in p8 do
		local var3 = p9[v]
		t[v] = {
			id = v,
			parentScopeId = if var3 then var3.parentScopeId else nil,
			tourTips = {}
		}
	end
	return t
end

local _ = function(p10, p11)
	if p10.globalRemaining < p11 then
		return false
	end
	p10.globalRemaining -= p11
	
	return true
end

local _ = function(p10, p11, p12)
	-- upvalues: constantsModule (ref)
	if p10.truncated then return end
	p10.truncated = true
	local TOUR_TIPS_TRUNCATED = constantsModule.WarningCodes.TOUR_TIPS_TRUNCATED
	
	if p11 == nil then
		return
	end
	table.insert(p11, `{TOUR_TIPS_TRUNCATED}:{p12}`)
end

local function getScopePathFromScreen(p10, p11, p12)
	local t = {}
	local var4 = p10
	while var4 ~= nil do
		table.insert(t, 1, var4)
		
		if var4 == p11 then break end
		local var5 = p12[var4]
		var4 = if var5 then var5.parentScopeId else nil
	end
	return t
end

local function entryToTourTip(p13, p14)
	return {
		stepCount = 1,
		id = p13.id,
		scopeId = p13.scopeId,
		title = p13.title,
		text = p13.text,
		icon = p13.icon,
		enabled = p13.enabled,
		publishedTime = p13.publishedTime,
		disabledTime = p13.disabledTime,
		expired = p13.expired,
		seen = p13.seen,
		optOutCount = p13.optOutCount,
		adopted = p13.adopted,
		toShow = p13.toShow,
		anchorId = p14.anchorId,
		side = p14.side,
		align = p14.align
	}
end

local function buildNestedGatewayTip(p13, p14, p15)
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
		id = `gateway:{p13.id}`,
		scopeId = p13.parentScopeId or p13.id,
		title = p15.title,
		text = p15.text,
		anchorId = p13.anchorId or "",
		side = p13.side,
		align = p13.align,
		gateway = {
			openActionKey = p13.openActionKey or "",
			closeActionKey = p13.closeActionKey or "",
			scope = p14
		}
	}
end

local _ = function(p13, p14, p15, _, p16, p17)
	-- upvalues: constantsModule (ref)
	local var6
	if p16.globalRemaining < 1 then
		var6 = false
	else
		p16.globalRemaining -= 1
		var6 = true
	end
	if var6 then
		table.insert(p15[p13].tourTips, p14)
		
		return true
	end
	local warnings = p17.warnings
	local screenScopeId = p17.screenScopeId
	
	if not p16.truncated then
		p16.truncated = true
		local TOUR_TIPS_TRUNCATED = constantsModule.WarningCodes.TOUR_TIPS_TRUNCATED
		
		if warnings ~= nil then
			table.insert(warnings, `{TOUR_TIPS_TRUNCATED}:{screenScopeId}`)
		end
	end
	return false
end

local function ensureNestedGateway(p13, p14, p15, p16, p17, p18)
	-- upvalues: constantsModule (ref), deriveResolvedFieldsModule (ref), buildNestedGatewayTip (ref)
	if p16[p14] ~= nil then
		return true
	end
	local var6
	local var7 = p18.scopeTours[p14]
	
	if var7 == nil then
		return false
	elseif p17.globalRemaining < 1 then
		var6 = false
	else
		p17.globalRemaining -= 1
		var6 = true
	end
	if var6 then
		local labels = deriveResolvedFieldsModule.getLabels(var7, p18.tourType)
		
		if not deriveResolvedFieldsModule.hasLabels(labels) then
			local warnings = p18.warnings
			local GATEWAY_COPY_FALLBACK = constantsModule.WarningCodes.GATEWAY_COPY_FALLBACK
			
			if warnings ~= nil then
				table.insert(warnings, `{GATEWAY_COPY_FALLBACK}:{p14}`)
			end
		end
		local var8 = buildNestedGatewayTip(var7, p15[p14], labels)
		table.insert(p15[p13].tourTips, var8)
		p16[p14] = { parentScopeId = p13, tip = var8 }
		
		return true
	else
		local warnings = p18.warnings
		local screenScopeId = p18.screenScopeId
		
		if not p17.truncated then
			p17.truncated = true
			local TOUR_TIPS_TRUNCATED = constantsModule.WarningCodes.TOUR_TIPS_TRUNCATED
			
			if warnings ~= nil then
				table.insert(warnings, `{TOUR_TIPS_TRUNCATED}:{screenScopeId}`)
			end
		end
		return false
	end
end

local function ensureScopeChainForEntry(p13, p14, p15, p16, p17)
	-- upvalues: getScopePathFromScreen (ref), ensureNestedGateway (ref)
	local var6 = getScopePathFromScreen(p13, p17.screenScopeId, p17.scopeTours)
	
	for i = 1, #var6 - 1 do
		if ensureNestedGateway(var6[i], var6[i + 1], p14, p15, p16, p17) then
			continue
		end
		return false
	end
	return true
end

local function buildScopeTourForScreen(p18, p19)
	-- upvalues: filterEntriesInSubtree (ref), groupEntriesByScopeId (ref), collectRelevantScopeIds (ref), buildEmptyScopeTree (ref), deriveResolvedFieldsModule (ref), ensureScopeChainForEntry (ref), entryToTourTip (ref), constantsModule (ref)
	local screenScopeId = p18.scopeTours[p18.screenScopeId]
	local var7 = if screenScopeId then screenScopeId.parentScopeId else nil
	local maxTourTips = p18.constants.maxTourTips
	local var8 = filterEntriesInSubtree(p19, p18)
	local var9 = buildEmptyScopeTree(collectRelevantScopeIds(p18.screenScopeId, groupEntriesByScopeId(var8), p18.scopeTours), p18.scopeTours)
	local t = { truncated = false, globalRemaining = maxTourTips }
	local t_1 = {}
	
	for i, v in var8 do
		local var10 = deriveResolvedFieldsModule.deriveEntryDisplay(v, p18.tourType, p18.deps)
		
		if var10.toShow and ensureScopeChainForEntry(v.scopeId, var9, t_1, t, p18) then
			local warnings
			local var11 = entryToTourTip(var10, v)
			local scopeId = v.scopeId
			
			if t.globalRemaining < 1 then
				warnings = false
			else
				t.globalRemaining -= 1
				warnings = true
			end
			if warnings then
				table.insert(var9[scopeId].tourTips, var11)
			else
				warnings = p18.warnings
				local screenScopeId_1 = p18.screenScopeId
				
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
	local screenScopeId_1 = var9[p18.screenScopeId]
	
	return if screenScopeId_1 == nil then {
		truncated = false,
		globalTotalSteps = 0,
		scope = {
			id = p18.screenScopeId,
			parentScopeId = var7,
			tourTips = {}
		}
	} else {
		scope = screenScopeId_1,
		truncated = t.truncated,
		globalTotalSteps = deriveResolvedFieldsModule.countScopeSteps(screenScopeId_1)
	}
end

return function(p20, p21, p22, p23, p24, p25)
	-- upvalues: buildScopeTourForScreen (ref)
	return buildScopeTourForScreen({
		document = p20,
		deps = p21,
		screenScopeId = p22,
		tourType = p23,
		warnings = p25,
		constants = p20.constants,
		scopeTours = p20.scopeTours
	}, p24)
end