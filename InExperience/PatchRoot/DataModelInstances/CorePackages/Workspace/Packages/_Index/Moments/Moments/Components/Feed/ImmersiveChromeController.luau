local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(script.Parent.FeedTypes)
local useImmersiveChromeModule = require(script.Parent.useImmersiveChrome)
local usePreferredInputModule = require(moments.Hooks.usePreferredInput)
local _ = require(moments.Components.VerticalPager)
local mediaPreloadProvider = momentsCommonModule.Media.MediaPreloadProvider
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local formFactor = momentsCommonModule.Enums.FormFactor
local usePreferences = foundationModule.Hooks.usePreferences

return function(p1)
	-- upvalues: mediaPreloadProvider (ref), usePreferredInputModule (ref), useFormFactor (ref), usePreferences (ref), formFactor (ref), reactModule (ref), useImmersiveChromeModule (ref)
	local pager = p1.pager
	local var1 = mediaPreloadProvider.useMediaControllerProvider()
	useImmersiveChromeModule({
		pager = pager,
		active = p1.active,
		getActiveIsPlaying = reactModule.useMemo(function()
			-- upvalues: var1 (ref), pager (ref)
			return function(p2)
				-- upvalues: var1 (copy), pager (copy)
				if var1 == nil then
					return true
				end
				local currentItem = pager.getCurrentItem(p2)
				
				if currentItem == nil or currentItem.kind ~= "moment" then
					return true
				end
				local momentId = var1.getControllerMap(p2)[currentItem.moment.momentId]
				
				return momentId == nil or momentId.getState(p2).isPlaying
			end
		end, { pager, var1 }),
		getIsScrolling = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return function(p2)
				-- upvalues: p1 (copy)
				local current = p1.controllerRef.current
				
				return if current == nil then false else current.getScrollState(p2) ~= "Idle"
			end
		end, { p1.controllerRef }),
		inputAllowed = usePreferredInputModule() == Enum.PreferredInput.Touch and useFormFactor() == formFactor.MobilePortrait,
		reducedMotion = usePreferences().reducedMotion,
		coveringOverlay = p1.coveringOverlay
	})
	
	return nil
end