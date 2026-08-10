local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local momentsCommonModule = require(parent.MomentsCommon)
local useSignalState = require(parent.SignalsReact).useSignalState
local _ = require(script.Parent.FeedTypes)
local immersiveChromeMachineModule = require(script.Parent.immersiveChromeMachine)
local getImmersiveChromeStoreModule = require(moments.Stores.GetImmersiveChromeStore)
local fFlagMomentsImmersiveChromeModule = require(moments.Flags.FFlagMomentsImmersiveChrome)
local getFIntMomentsImmersiveHideAfterAdvancesModule = require(moments.Flags.GetFIntMomentsImmersiveHideAfterAdvances)
local getFIntMomentsImmersiveShownDwellMsModule = require(moments.Flags.GetFIntMomentsImmersiveShownDwellMs)
local getFIntMomentsImmersiveHiddenCooldownMsModule = require(moments.Flags.GetFIntMomentsImmersiveHiddenCooldownMs)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent

local function defaultFireEvent(p0, p1, p2) --[[ line: 73 ]]
	-- upvalues: eventNames (ref), fireAnalyticsEvent (ref)
	fireAnalyticsEvent(if p0 then eventNames.MomentsChromeRestored else eventNames.MomentsChromeAutoHidden, { trigger = p1, index = tostring(p2) })
end

return function(p3) --[[ line: 81 | named "useImmersiveChrome" ]]
	-- upvalues: reactModule (ref), getImmersiveChromeStoreModule (ref), fFlagMomentsImmersiveChromeModule (ref), defaultFireEvent (ref), getFIntMomentsImmersiveHideAfterAdvancesModule (ref), getFIntMomentsImmersiveShownDwellMsModule (ref), getFIntMomentsImmersiveHiddenCooldownMsModule (ref), immersiveChromeMachineModule (ref), signalsModule (ref), useSignalState (ref)
	local pager = p3.pager
	local active = p3.active
	local getActiveIsPlaying = p3.getActiveIsPlaying
	local getIsScrolling = p3.getIsScrolling
	local inputAllowed = p3.inputAllowed
	local reducedMotion = p3.reducedMotion
	local var11 = reactModule.useMemo(function() --[[ line: 91 ]]
		-- upvalues: p3 (ref), getImmersiveChromeStoreModule (copy)
		return p3.store or getImmersiveChromeStoreModule(false)
	end, {})
	local var12 = if p3.featureEnabledOverride ~= nil then fFlagMomentsImmersiveChromeModule else p3.featureEnabledOverride
	local var13 = reactModule.useRef(1)
	local var14 = reactModule.useRef(var12)
	var14.current = var12
	local var15 = reactModule.useRef(p3.fireEvent or defaultFireEvent)
	var15.current = p3.fireEvent or defaultFireEvent
	local var16 = reactModule.useMemo(function() --[[ line: 110 ]]
		-- upvalues: p3 (ref), getFIntMomentsImmersiveHideAfterAdvancesModule (copy), getFIntMomentsImmersiveShownDwellMsModule (copy), getFIntMomentsImmersiveHiddenCooldownMsModule (copy), immersiveChromeMachineModule (copy), var11 (ref), var14 (ref), var15 (ref), var13 (ref)
		return immersiveChromeMachineModule(p3.config or {
			hideAfterAdvances = getFIntMomentsImmersiveHideAfterAdvancesModule(),
			shownDwellMs = getFIntMomentsImmersiveShownDwellMsModule(),
			hiddenCooldownMs = getFIntMomentsImmersiveHiddenCooldownMsModule()
		}, {
			now = p3.now or function() --[[ line: 117 ]]
				return os.clock() * 1000
			end,
			setChromeVisible = function(value, p4) --[[ line: 122 ]]
				-- upvalues: var11 (copy), var14 (copy), var15 (copy), var13 (copy)
				var11.setChromeVisible(value)
				
				if var14.current then
					var15.current(value, p4, var13.current)
				end
			end
		})
	end, {})
	reactModule.useEffect(function() --[[ line: 133 ]]
		-- upvalues: signalsModule (copy), pager (ref), getActiveIsPlaying (ref), getIsScrolling (ref), var13 (ref), var16 (ref)
		return signalsModule.createEffect(function(p5) --[[ line: 134 ]]
			-- upvalues: pager (copy), getActiveIsPlaying (copy), getIsScrolling (copy), var13 (copy), var16 (copy)
			local count = pager.getCount(p5)
			local currentIndex = pager.getCurrentIndex(p5)
			local var20 = getActiveIsPlaying(p5)
			local var21 = getIsScrolling(p5)
			var13.current = currentIndex
			var16.setCount(count)
			var16.onActiveUpdate(currentIndex, var20, var21)
		end)
	end, { pager, getActiveIsPlaying, getIsScrolling, var16 })
	local var17 = useSignalState(var11.getOverlayCovering)
	reactModule.useEffect(function() --[[ line: 158 ]]
		-- upvalues: active (ref), inputAllowed (ref), reducedMotion (ref), var12 (ref), var16 (ref), var17 (ref)
		var16.setForceShow((not active or (not inputAllowed or (reducedMotion or not var12))) and not var17)
		var16.setForceHide(var17)
	end, {
		active, inputAllowed, reducedMotion, var12, var17, var16
	})
	reactModule.useEffect(function() --[[ line: 167 ]]
		-- upvalues: var11 (ref), var16 (ref)
		var11.setRevealHandler(var16.reveal)
		
		return function() --[[ line: 169 ]]
			-- upvalues: var11 (copy)
			var11.setRevealHandler(nil)
		end
	end, { var11, var16 })
	reactModule.useEffect(function() --[[ line: 175 ]]
		-- upvalues: var11 (ref)
		return function() --[[ line: 176 ]]
			-- upvalues: var11 (copy)
			var11.setChromeVisible(true)
		end
	end, { var11 })
end