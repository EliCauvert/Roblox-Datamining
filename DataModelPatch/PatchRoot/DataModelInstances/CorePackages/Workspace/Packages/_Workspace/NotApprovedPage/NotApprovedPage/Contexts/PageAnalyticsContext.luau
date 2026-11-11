local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local SendNotApprovedPageEventModule = require(NotApprovedPage.Utils.sendNotApprovedPageEvent)
local UsePageNavigationFunction = require(NotApprovedPage.Contexts.PageNavigationContext).usePageNavigation
local EVENTTYPES = require(Parent.NotApprovedPageShared).Constants.EVENT_TYPES
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local ArgCheckModule = require(Parent.ArgCheck)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseContextFunction = ReactModule.useContext
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local _ = require(NotApprovedPage.Common.Types)
local Context = ReactModule.createContext({})

return {
	PageAnalyticsProvider = function(p1)
		-- upvalues: UsePageNavigationFunction (copy), UseRefFunction (copy), UseEffectFunction (copy), SendNotApprovedPageEventModule (copy), EVENTTYPES (copy), UseCallbackFunction (copy), CryoModule (copy), UseMemoFunction (copy), ReactModule (copy), Context (copy)
		local UsePageNavigationResult = UsePageNavigationFunction()
		local CurrentPage = UsePageNavigationResult.currentPage
		local CurrentPageName = UsePageNavigationResult.currentPageName
		local UnmappedViolationKeys = UsePageNavigationResult.unmappedViolationKeys
		local UseRefResult = UseRefFunction(DateTime.now().UnixTimestampMillis)
		local UseRefResult1 = UseRefFunction(CurrentPage)
		local UseRefResult2 = UseRefFunction(CurrentPageName)
		local UseRefResult3 = UseRefFunction(true)
		
		local function _()
			-- upvalues: UseRefResult (copy)
			return DateTime.now().UnixTimestampMillis - UseRefResult.current
		end
		
		UseEffectFunction(function()
			-- upvalues: UnmappedViolationKeys (copy), SendNotApprovedPageEventModule (upval), EVENTTYPES (upval)
			for _, unmappedViolationKey in UnmappedViolationKeys do
				SendNotApprovedPageEventModule({
					eventType = EVENTTYPES.UnmappedViolationKey,
					unmappedViolationKey = unmappedViolationKey
				})
			end
		end, {})
		UseEffectFunction(function()
			-- upvalues: UseRefResult3 (copy), UseRefResult (copy), CurrentPage (copy), UseRefResult1 (copy), EVENTTYPES (upval), SendNotApprovedPageEventModule (upval), UseRefResult2 (copy), CurrentPageName (copy)
			if UseRefResult3.current then
				UseRefResult3.current = false
				
				return
			else
				SendNotApprovedPageEventModule({
					eventType = if UseRefResult1.current < CurrentPage then EVENTTYPES.ContinueClicked else EVENTTYPES.BackClicked,
					pageName = UseRefResult2.current,
					timeOnPageMs = DateTime.now().UnixTimestampMillis - UseRefResult.current
				})
				UseRefResult.current = DateTime.now().UnixTimestampMillis
				UseRefResult1.current = CurrentPage
				UseRefResult2.current = CurrentPageName
			end
		end, { CurrentPage, CurrentPageName })
		local UseCallbackResult = UseCallbackFunction(function(EventType, p2)
			-- upvalues: UseRefResult (copy), CryoModule (upval), CurrentPageName (copy), SendNotApprovedPageEventModule (upval)
			SendNotApprovedPageEventModule((CryoModule.Dictionary.join({
				eventType = EventType,
				pageName = CurrentPageName,
				timeOnPageMs = DateTime.now().UnixTimestampMillis - UseRefResult.current
			}, p2 or {})))
		end, { CurrentPageName })
		
		return ReactModule.createElement(Context.Provider, {
			value = UseMemoFunction(function()
				-- upvalues: UseCallbackResult (copy)
				return { sendPageEvent = UseCallbackResult }
			end, { UseCallbackResult })
		}, p1.children)
	end,
	usePageAnalytics = function()
		-- upvalues: UseContextFunction (copy), Context (copy), ArgCheckModule (copy)
		local UseContextResult = UseContextFunction(Context)
		ArgCheckModule.assert(UseContextResult and UseContextResult.sendPageEvent ~= nil, "usePageAnalytics must be used within PageAnalyticsProvider (which must also be nested inside PageNavigationProvider)")
		
		return UseContextResult
	end
}