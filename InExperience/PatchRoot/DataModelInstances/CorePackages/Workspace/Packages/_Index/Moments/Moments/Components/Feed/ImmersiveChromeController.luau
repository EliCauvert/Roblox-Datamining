local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(script.Parent.FeedTypes)
local UseImmersiveChromeModule = require(script.Parent.useImmersiveChrome)
local UsePreferredInputModule = require(Moments.Hooks.usePreferredInput)
local _ = require(Moments.Components.VerticalPager)
local MediaPreloadProvider = MomentsCommonModule.Media.MediaPreloadProvider
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local FormFactor = MomentsCommonModule.Enums.FormFactor
local UsePreferencesFunction = require(Parent.Foundation).Hooks.usePreferences

return function(p1)
	-- upvalues: MediaPreloadProvider (copy), UsePreferredInputModule (copy), UseFormFactorFunction (copy), UsePreferencesFunction (copy), FormFactor (copy), ReactModule (copy), UseImmersiveChromeModule (copy)
	local Pager = p1.pager
	local UseMediaControllerProviderResult = MediaPreloadProvider.useMediaControllerProvider()
	local UsePreferredInputModuleResult = UsePreferredInputModule()
	local UseFormFactorResult = UseFormFactorFunction()
	UseImmersiveChromeModule({
		pager = Pager,
		active = p1.active,
		getActiveIsPlaying = ReactModule.useMemo(function()
			-- upvalues: UseMediaControllerProviderResult (copy), Pager (copy)
			return function(p2)
				-- upvalues: UseMediaControllerProviderResult (upval), Pager (upval)
				if UseMediaControllerProviderResult == nil then
					return true
				end
				local CurrentItem = Pager.getCurrentItem(p2)
				
				if CurrentItem == nil or CurrentItem.kind ~= "moment" then
					return true
				else
					local Controller = UseMediaControllerProviderResult.getControllerMap(p2)[CurrentItem.moment.momentId]
					
					return Controller == nil or Controller.getState(p2).isPlaying
				end
			end
		end, { Pager, UseMediaControllerProviderResult }),
		getIsScrolling = ReactModule.useMemo(function()
			-- upvalues: p1 (copy)
			return function(p2): boolean
				-- upvalues: p1 (upval)
				local Current = p1.controllerRef.current
				
				return Current ~= nil and Current.getScrollState(p2) ~= "Idle"
			end
		end, { p1.controllerRef }),
		inputAllowed = UsePreferredInputModuleResult == Enum.PreferredInput.Touch and UseFormFactorResult == FormFactor.MobilePortrait,
		reducedMotion = UsePreferencesFunction().reducedMotion,
		coveringOverlay = p1.coveringOverlay
	})
	
	return nil
end