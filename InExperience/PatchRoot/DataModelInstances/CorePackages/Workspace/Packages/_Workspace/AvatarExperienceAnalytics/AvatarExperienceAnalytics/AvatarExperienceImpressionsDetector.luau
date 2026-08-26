local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local argCheckModule = require(parent.ArgCheck)
local tModule = require(parent.t)
local fFlagUseNavigationSelectors = require(parent.SharedFlags).FFlagUseNavigationSelectors
local selectors = require(parent.NavigationRodux).Selectors
local fFlagSignalsNavP3gAvatarExperience = require(parent.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local fFlagAXSduiCatalogScrollImpressions = require(parent.AvatarExperienceFlags).FFlagAXSduiCatalogScrollImpressions
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useSignalState = require(parent.SignalsReact).useSignalState
local var1 = if fFlagSignalsNavP3gAvatarExperience then require(parent.NavigationRodux).GetLegacyNavigationStore else nil
local avatarExperienceImpressionsDetector = roactModule.PureComponent:extend("AvatarExperienceImpressionsDetector")

local _ = function(p1)
	-- upvalues: fFlagUseNavigationSelectors (ref), selectors (ref)
	if fFlagUseNavigationSelectors then
		return selectors.selectCurrentPageName(p1)
	end
	local history = p1.Navigation.history
	local var2 = history[#history]
	
	return var2[#var2].name
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

function avatarExperienceImpressionsDetector.init(p1)
	p1.isMounted = false
	p1.lastImpressionTick = nil
	p1.nextImpressionTick = nil
end

function avatarExperienceImpressionsDetector._isInstanceVisible(p1, p2)
	-- upvalues: argCheckModule (ref), fFlagAXSduiCatalogScrollImpressions (ref)
	if not p2 then
		return false
	end
	local viewPortBounds = p1.props.viewPortBounds
	argCheckModule.assert(viewPortBounds ~= nil)
	
	if not viewPortBounds then
		return false
	end
	local _ = nil
	local var2 = viewPortBounds.max - viewPortBounds.min
	argCheckModule.assert(var2.X > 0)
	argCheckModule.assert(var2.Y > 0)
	local var3 = var2 * p1.props.viewFillPercent
	argCheckModule.assert(var3.X > 0 and var3.Y > 0)
	
	if var3.X <= 0 or var3.Y <= 0 then
		return false
	elseif fFlagAXSduiCatalogScrollImpressions and (p2.AbsoluteSize.X <= 0 or p2.AbsoluteSize.Y <= 0) then
		return false
	end
	local absolutePosition = p2.AbsolutePosition
	local var4 = absolutePosition + p2.AbsoluteSize / 2
	local var5 = absolutePosition + p2.AbsoluteSize
	local var6 = viewPortBounds.min.X < var4.X and var4.X < viewPortBounds.max.X
	local var7 = viewPortBounds.min.Y < var4.Y and var4.Y < viewPortBounds.max.Y
	
	if var6 and var7 then
		return true
	end
	local var8 = var5:Min(viewPortBounds.max) - absolutePosition:Max(viewPortBounds.min)
	local var9 = var3.X <= var8.X
	
	if var7 and var9 then
		return true
	end
	local var10 = var3.Y <= var8.Y
	
	return if var6 and var10 then true else var9 and var10
end

function avatarExperienceImpressionsDetector._defaultObjectCollector(p1)
	return p1:GetChildren()
end

function avatarExperienceImpressionsDetector._calculateImpressions(p1)
	-- upvalues: argCheckModule (ref)
	if not p1.isMounted then return end
	if p1.props.pageFilter then
		if not p1.props.pageFilter(p1.props.currentPage) then return end
	elseif p1.props.appPage ~= p1.props.currentPage then return end
	local current = p1.props.parentRef and p1.props.parentRef.current
	
	if not current or not p1:_isInstanceVisible(current) then return end
	p1.lastImpressionTick = tick()
	local t = {}
	local var2 = (p1.props.collectObjectsFunc or p1._defaultObjectCollector)(current)
	
	if var2 then
		for i, v in var2 do
			if v:IsA("GuiObject") and p1:_isInstanceVisible(v) and (p1.props.filterImpressionFunc == nil or p1.props.filterImpressionFunc(v)) then
				table.insert(t, v)
			end
		end
	end
	if #t > 0 then
		argCheckModule.assert(p1.props.onImpressionsDetected ~= nil)
		p1.props.onImpressionsDetected(t)
	end
end

function avatarExperienceImpressionsDetector._requestImpressions(p2)
	-- upvalues: argCheckModule (ref)
	if not p2.isMounted then return end
	if p2.nextImpressionTick ~= nil then return end
	if not p2.props.parentRef or not p2.props.parentRef.current then return end
	local var3 = 0
	
	if p2.lastImpressionTick ~= nil then
		p2.nextImpressionTick = p2.lastImpressionTick + p2.props.scanDebounceSeconds
		var3 = p2.nextImpressionTick - tick()
	end
	if var3 > 0 then
		task.delay(var3, function()
			-- upvalues: argCheckModule (copy), p2 (ref)
			argCheckModule.assert(p2.nextImpressionTick ~= nil and p2.nextImpressionTick < tick())
			p2.nextImpressionTick = nil
			p2:_calculateImpressions()
		end)
		
		return
	end
	p2.nextImpressionTick = nil
	p2:_calculateImpressions()
end

function avatarExperienceImpressionsDetector.render(_)
	return nil
end

function avatarExperienceImpressionsDetector.didMount(p2)
	p2.isMounted = true
	p2:_requestImpressions()
	
	if p2.props.onRequestImpressionsSignal then
		p2.onRequestImpressionsConnection = p2.props.onRequestImpressionsSignal:connect(function()
			-- upvalues: p2 (ref)
			p2:_requestImpressions()
		end)
	end
end

function avatarExperienceImpressionsDetector.willUnmount(p2)
	p2.isMounted = false
	
	if p2.onRequestImpressionsConnection ~= nil then
		p2.onRequestImpressionsConnection:disconnect()
		p2.onRequestImpressionsConnection = nil
	end
end

function avatarExperienceImpressionsDetector.didUpdate(p2, _, _)
	p2:_requestImpressions()
end

if fFlagSignalsNavP3gAvatarExperience then
	local var3 = avatarExperienceImpressionsDetector
	
	avatarExperienceImpressionsDetector = function(p2)
		-- upvalues: var1 (ref), useSignalState (ref), reactModule (ref), var3 (ref), cryoModule (ref)
		return reactModule.createElement(var3, cryoModule.Dictionary.union(p2, {
			currentPage = useSignalState(var1(false).getCurrentPageName)
		}))
	end
	
	return avatarExperienceImpressionsDetector
end
return roactRoduxModule.connect(function(p2, _)
	-- upvalues: fFlagUseNavigationSelectors (ref), selectors (ref)
	local var4
	local t = {}
	
	if fFlagUseNavigationSelectors then
		var4 = selectors.selectCurrentPageName(p2)
	else
		local history = p2.Navigation.history
		local var5 = history[#history]
		var4 = var5[#var5].name
	end
	t.currentPage = var4
	
	return t
end)(avatarExperienceImpressionsDetector)