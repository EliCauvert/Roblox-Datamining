local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local RoactRoduxModule = require(Parent.RoactRodux)
local ArgCheckModule = require(Parent.ArgCheck)
local TModule = require(Parent.t)
local FFlagUseNavigationSelectors = require(Parent.SharedFlags).FFlagUseNavigationSelectors
local Selectors = require(Parent.NavigationRodux).Selectors
local FFlagSignalsNavP3gAvatarExperience = require(Parent.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local FFlagAXSduiCatalogScrollImpressions = require(Parent.AvatarExperienceFlags).FFlagAXSduiCatalogScrollImpressions
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseSignalState = require(Parent.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(Parent.NavigationRodux).GetLegacyNavigationStore else nil
local AvatarExperienceImpressionsDetector: (any) -> any = require(Parent.Roact).PureComponent:extend("AvatarExperienceImpressionsDetector")

local function _(p1)
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
	if FFlagUseNavigationSelectors then
		return Selectors.selectCurrentPageName(p1)
	else
		local History = p1.Navigation.history
		local HistoryEntry = History[#History]
		
		return HistoryEntry[#HistoryEntry].name
	end
end

AvatarExperienceImpressionsDetector.validateProps = TModule.strictInterface({
	scanDebounceSeconds = TModule.optional(TModule.number),
	viewFillPercent = TModule.optional(TModule.number),
	parentRef = TModule.optional(TModule.table),
	onRequestImpressionsSignal = TModule.table,
	viewPortBounds = TModule.strictInterface({ min = TModule.Vector2, max = TModule.Vector2 }),
	appPage = TModule.optional(TModule.string),
	currentPage = TModule.optional(TModule.string),
	pageFilter = TModule.optional(TModule.callback),
	collectObjectsFunc = TModule.optional(TModule.callback),
	filterImpressionFunc = TModule.optional(TModule.callback),
	onImpressionsDetected = TModule.union(TModule.callback, TModule.table)
})
AvatarExperienceImpressionsDetector.defaultProps = { scanDebounceSeconds = 1, viewFillPercent = 0.25 }

function AvatarExperienceImpressionsDetector.init(p1)
	p1.isMounted = false
	p1.lastImpressionTick = nil
	p1.nextImpressionTick = nil
end

function AvatarExperienceImpressionsDetector._isInstanceVisible(p1, Frame: Frame): boolean
	-- upvalues: ArgCheckModule (copy), FFlagAXSduiCatalogScrollImpressions (copy)
	if not Frame then
		return false
	end
	local ViewPortBounds = p1.props.viewPortBounds
	ArgCheckModule.assert(ViewPortBounds ~= nil)
	
	if not ViewPortBounds then
		return false
	end
	local MaxDelta = ViewPortBounds.max - ViewPortBounds.min
	ArgCheckModule.assert(MaxDelta.X > 0)
	ArgCheckModule.assert(MaxDelta.Y > 0)
	local ScaledMaxDelta = MaxDelta * p1.props.viewFillPercent
	ArgCheckModule.assert(ScaledMaxDelta.X > 0 and ScaledMaxDelta.Y > 0)
	
	if ScaledMaxDelta.X <= 0 or ScaledMaxDelta.Y <= 0 then
		return false
	elseif FFlagAXSduiCatalogScrollImpressions and (Frame.AbsoluteSize.X <= 0 or Frame.AbsoluteSize.Y <= 0) then
		return false
	else
		local AbsolutePosition = Frame.AbsolutePosition
		local NewAbsolutePosition = AbsolutePosition + Frame.AbsoluteSize / 2
		local NewAbsolutePosition1 = AbsolutePosition + Frame.AbsoluteSize
		local IsXBelow: boolean = ViewPortBounds.min.X < NewAbsolutePosition.X and NewAbsolutePosition.X < ViewPortBounds.max.X
		local IsYBelow: boolean = ViewPortBounds.min.Y < NewAbsolutePosition.Y and NewAbsolutePosition.Y < ViewPortBounds.max.Y
		
		if IsXBelow and IsYBelow then
			return true
		end
		local MinResultDelta = NewAbsolutePosition1:Min(ViewPortBounds.max) - AbsolutePosition:Max(ViewPortBounds.min)
		local IsXAbove = MinResultDelta.X >= ScaledMaxDelta.X
		
		if IsYBelow and IsXAbove then
			return true
		else
			local IsYAbove = MinResultDelta.Y >= ScaledMaxDelta.Y
			
			return if IsXBelow and IsYAbove then true elseif IsXAbove and IsYAbove then true else false
		end
	end
end

function AvatarExperienceImpressionsDetector._defaultObjectCollector(Object)
	return Object:GetChildren()
end

function AvatarExperienceImpressionsDetector._calculateImpressions(p1)
	-- upvalues: ArgCheckModule (copy)
	if not p1.isMounted then return end
	if p1.props.pageFilter then
		if not p1.props.pageFilter(p1.props.currentPage) then return end
	elseif p1.props.appPage ~= p1.props.currentPage then return end
	local Current = p1.props.parentRef and p1.props.parentRef.current
	
	if not Current or not p1:_isInstanceVisible(Current) then return end
	p1.lastImpressionTick = tick()
	local Guis = {}
	local Guis1 = (p1.props.collectObjectsFunc or p1._defaultObjectCollector)(Current)
	
	if Guis1 then
		for _, Gui in Guis1 do
			if Gui:IsA("GuiObject") and p1:_isInstanceVisible(Gui) and (p1.props.filterImpressionFunc == nil or p1.props.filterImpressionFunc(Gui)) then
				table.insert(Guis, Gui)
			end
		end
	end
	if #Guis > 0 then
		ArgCheckModule.assert(p1.props.onImpressionsDetected ~= nil)
		p1.props.onImpressionsDetected(Guis)
	end
end

function AvatarExperienceImpressionsDetector._requestImpressions(p2)
	-- upvalues: ArgCheckModule (copy)
	if not p2.isMounted then return end
	if p2.nextImpressionTick ~= nil then return end
	if not p2.props.parentRef or not p2.props.parentRef.current then return end
	local Delay = 0
	
	if p2.lastImpressionTick ~= nil then
		p2.nextImpressionTick = p2.lastImpressionTick + p2.props.scanDebounceSeconds
		Delay = p2.nextImpressionTick - tick()
	end
	if Delay > 0 then
		task.delay(Delay, function()
			-- upvalues: ArgCheckModule (upval), p2 (copy)
			ArgCheckModule.assert(p2.nextImpressionTick ~= nil and p2.nextImpressionTick < tick())
			p2.nextImpressionTick = nil
			p2:_calculateImpressions()
		end)
		
		return
	else
		p2.nextImpressionTick = nil
		p2:_calculateImpressions()
	end
end

function AvatarExperienceImpressionsDetector:render()
	return nil
end

function AvatarExperienceImpressionsDetector.didMount(p2)
	p2.isMounted = true
	p2:_requestImpressions()
	
	if p2.props.onRequestImpressionsSignal then
		p2.onRequestImpressionsConnection = p2.props.onRequestImpressionsSignal:connect(function()
			-- upvalues: p2 (copy)
			p2:_requestImpressions()
		end)
	end
end

function AvatarExperienceImpressionsDetector.willUnmount(p2)
	p2.isMounted = false
	
	if p2.onRequestImpressionsConnection ~= nil then
		p2.onRequestImpressionsConnection:disconnect()
		p2.onRequestImpressionsConnection = nil
	end
end

function AvatarExperienceImpressionsDetector.didUpdate(p2, _, _)
	p2:_requestImpressions()
end

if FFlagSignalsNavP3gAvatarExperience then
	AvatarExperienceImpressionsDetector = function(p2)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), ReactModule (copy), AvatarExperienceImpressionsDetector (copy), CryoModule (copy)
		return ReactModule.createElement(AvatarExperienceImpressionsDetector, CryoModule.Dictionary.union(p2, {
			currentPage = UseSignalState(GetLegacyNavigationStore(false).getCurrentPageName)
		}))
	end
	
	return AvatarExperienceImpressionsDetector
else
	return (RoactRoduxModule.connect(function(p2, _)
		-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
		local t = {}
		local SelectCurrentPageNameResult = nil
		
		if FFlagUseNavigationSelectors then
			SelectCurrentPageNameResult = Selectors.selectCurrentPageName(p2)
		else
			local History = p2.Navigation.history
			local HistoryEntry = History[#History]
			SelectCurrentPageNameResult = HistoryEntry[#HistoryEntry].name
		end
		t.currentPage = SelectCurrentPageNameResult
		
		return t
	end)(AvatarExperienceImpressionsDetector))
end