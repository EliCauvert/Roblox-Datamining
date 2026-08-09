local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local argCheckModule = require(parent.ArgCheck)
local tModule = require(parent.t)
local fFlagUseNavigationSelectors = require(parent.SharedFlags).FFlagUseNavigationSelectors
local selectors = require(parent.NavigationRodux).Selectors
local fFlagSignalsNavP3gAvatarExperience = require(parent.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useSignalState = require(parent.SignalsReact).useSignalState
local var6 = if fFlagSignalsNavP3gAvatarExperience then require(parent.NavigationRodux).GetLegacyNavigationStore else nil
local avatarExperienceImpressionsDetector = roactModule.PureComponent:extend("AvatarExperienceImpressionsDetector")

local _ = function(p0) --[[ line: 24 ]]
	-- upvalues: fFlagUseNavigationSelectors (ref), selectors (ref)
	if fFlagUseNavigationSelectors then
		return selectors.selectCurrentPageName(p0)
	end
	local history = p0.Navigation.history
	local var9 = history[#history]
	
	return var9[#var9].name
end

avatarExperienceImpressionsDetector.validateProps = tModule.strictInterface({
	scanDebounceSeconds = tModule.optional(tModule.number),
	viewFillPercent = tModule.optional(tModule.number),
	parentRef = tModule.optional(tModule.table),
	onRequestImpressionsSignal = tModule.table,
	viewPortBounds = tModule.strictInterface({ min = tModule.Vector2, max = tModule.Vector2 }),
	appPage = tModule.optional(tModule.string),
	currentPage = tModule.optional(tModule.string),
	pageFilter = tModule.optional(tModule.callback),
	collectObjectsFunc = tModule.optional(tModule.callback),
	filterImpressionFunc = tModule.optional(tModule.callback),
	onImpressionsDetected = tModule.union(tModule.callback, tModule.table)
})
avatarExperienceImpressionsDetector.defaultProps = { scanDebounceSeconds = 1, viewFillPercent = 0.25 }

function avatarExperienceImpressionsDetector.init(p1) --[[ line: 62 ]]
	p1.isMounted = false
	p1.lastImpressionTick = nil
	p1.nextImpressionTick = nil
end

function avatarExperienceImpressionsDetector._isInstanceVisible(p2, p3) --[[ line: 68 ]]
	-- upvalues: argCheckModule (ref)
	if not p3 then
		return false
	end
	local viewPortBounds = p2.props.viewPortBounds
	argCheckModule.assert(viewPortBounds ~= nil)
	
	if not viewPortBounds then
		return false
	end
	local _ = nil
	local var10 = viewPortBounds.max - viewPortBounds.min
	argCheckModule.assert(var10.X > 0)
	argCheckModule.assert(var10.Y > 0)
	local var11 = var10 * p2.props.viewFillPercent
	argCheckModule.assert(var11.X > 0 and var11.Y > 0)
	
	if var11.X <= 0 or var11.Y <= 0 then
		return false
	end
	local absolutePosition = p3.AbsolutePosition
	local var12 = absolutePosition + p3.AbsoluteSize / 2
	local var13 = absolutePosition + p3.AbsoluteSize
	local var14 = viewPortBounds.min.X < var12.X and var12.X < viewPortBounds.max.X
	local var15 = viewPortBounds.min.Y < var12.Y and var12.Y < viewPortBounds.max.Y
	
	if var14 and var15 then
		return true
	end
	local var16 = var13:Min(viewPortBounds.max) - absolutePosition:Max(viewPortBounds.min)
	local var17 = var11.X <= var16.X
	
	if var15 and var17 then
		return true
	end
	local var18 = var11.Y <= var16.Y
	
	return if var14 and var18 then true else var17 and var18
end

function avatarExperienceImpressionsDetector._defaultObjectCollector(p4) --[[ line: 132 ]]
	return p4:GetChildren()
end

function avatarExperienceImpressionsDetector._calculateImpressions(p5) --[[ line: 136 ]]
	-- upvalues: argCheckModule (ref)
	if not p5.isMounted then return end
	if p5.props.pageFilter then
		if not p5.props.pageFilter(p5.props.currentPage) then return end
	elseif p5.props.appPage ~= p5.props.currentPage then return end
	local current = p5.props.parentRef and p5.props.parentRef.current
	
	if not current or not p5:_isInstanceVisible(current) then return end
	p5.lastImpressionTick = tick()
	local t = {}
	local var21 = (p5.props.collectObjectsFunc or p5._defaultObjectCollector)(current)
	
	if var21 then
		for i, v in var21 do
			if v:IsA("GuiObject") and p5:_isInstanceVisible(v) and (p5.props.filterImpressionFunc == nil or p5.props.filterImpressionFunc(v)) then
				table.insert(t, v)
			end
		end
	end
	if #t > 0 then
		argCheckModule.assert(p5.props.onImpressionsDetected ~= nil)
		p5.props.onImpressionsDetected(t)
	end
end

function avatarExperienceImpressionsDetector._requestImpressions(p6) --[[ line: 176 ]]
	-- upvalues: argCheckModule (ref)
	if not p6.isMounted then return end
	if p6.nextImpressionTick ~= nil then return end
	if not p6.props.parentRef or not p6.props.parentRef.current then return end
	local var22 = 0
	
	if p6.lastImpressionTick ~= nil then
		p6.nextImpressionTick = p6.lastImpressionTick + p6.props.scanDebounceSeconds
		var22 = p6.nextImpressionTick - tick()
	end
	if var22 > 0 then
		task.delay(var22, function() --[[ line: 195 ]]
			-- upvalues: argCheckModule (copy), p6 (ref)
			argCheckModule.assert(p6.nextImpressionTick ~= nil and p6.nextImpressionTick < tick())
			p6.nextImpressionTick = nil
			p6:_calculateImpressions()
		end)
		
		return
	end
	p6.nextImpressionTick = nil
	p6:_calculateImpressions()
end

function avatarExperienceImpressionsDetector.render(_) --[[ line: 207 ]]
	return nil
end

function avatarExperienceImpressionsDetector.didMount(p7) --[[ line: 211 ]]
	p7.isMounted = true
	p7:_requestImpressions()
	
	if p7.props.onRequestImpressionsSignal then
		p7.onRequestImpressionsConnection = p7.props.onRequestImpressionsSignal:connect(function() --[[ line: 215 ]]
			-- upvalues: p7 (ref)
			p7:_requestImpressions()
		end)
	end
end

function avatarExperienceImpressionsDetector.willUnmount(p8) --[[ line: 221 ]]
	p8.isMounted = false
	
	if p8.onRequestImpressionsConnection ~= nil then
		p8.onRequestImpressionsConnection:disconnect()
		p8.onRequestImpressionsConnection = nil
	end
end

function avatarExperienceImpressionsDetector.didUpdate(p9, _, _) --[[ line: 229 ]]
	p9:_requestImpressions()
end

if fFlagSignalsNavP3gAvatarExperience then
	local var8 = avatarExperienceImpressionsDetector
	
	avatarExperienceImpressionsDetector = function(p10) --[[ line: 235 ]]
		-- upvalues: var6 (ref), useSignalState (ref), reactModule (ref), var8 (ref), cryoModule (ref)
		local var23 = useSignalState(var6(false).getCurrentLegacyRoute)
		
		if var23 then
			local var24 = var23[#var23]
			
			return reactModule.createElement(var8, cryoModule.Dictionary.union(p10, { currentPage = if var24 then var24.name else nil }))
		end
		return reactModule.createElement(var8, p10)
	end
	
	return avatarExperienceImpressionsDetector
end
return roactRoduxModule.connect(function(p11, _) --[[ line: 252 ]]
	-- upvalues: fFlagUseNavigationSelectors (ref), selectors (ref)
	local var26
	local t = {}
	
	if fFlagUseNavigationSelectors then
		var26 = selectors.selectCurrentPageName(p11)
	else
		local history = p11.Navigation.history
		local var27 = history[#history]
		var26 = var27[#var27].name
	end
	t.currentPage = var26
	
	return t
end)(avatarExperienceImpressionsDetector)