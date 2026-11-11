local LocalizationService = game:GetService("LocalizationService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local MotionModule = require(Parent.Motion)
local ReactModule = require(Parent.React)
local RobloxAppLocalesModule = require(Parent.RobloxAppLocales)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local BuildExperienceCompositionStyleSheetModule = require(BuildExperience.Components.BuildExperienceCompositionStyleSheet)
local LibraryBrowserViewModule = require(script.Parent.LibraryBrowser.LibraryBrowserView)
local LibraryExperienceViewModule = require(script.Parent.LibraryExperienceView)
local LibraryThemeProviderModule = require(script.Parent.LibraryThemeProvider)
local UseLibraryStringsModule = require(script.Parent.useLibraryStrings)

local function noop() end

local function useSlideIn()
	-- upvalues: FoundationModule (copy), UserGameSettings (copy), ReactModule (copy), MotionModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Inverted = not (FoundationModule.Hooks.usePreferences().reducedMotion or UserGameSettings.ReducedMotion)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Inverted)
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion({ offset = if Inverted then 1 else 0 })
	ReactModule.useEffect(function()
		-- upvalues: Inverted (copy), MotionModule (upval), UseTokensResult (copy), UseMotionResult2 (copy), UseStateResult2 (copy)
		if Inverted then
			local Flag = false
			UseMotionResult2(MotionModule.createState({ offset = 0 }, {
				default = MotionModule.transition({
					duration = UseTokensResult.Time.Time_400,
					easingStyle = UseTokensResult.Ease.StandardOut
				})
			}), {
				onAnimationComplete = function()
					-- upvalues: Flag (ref), UseStateResult2 (upval)
					if not Flag then
						UseStateResult2(false)
					end
				end
			})
			
			return function()
				-- upvalues: Flag (ref)
				Flag = true
			end
		else
			return nil
		end
	end, { Inverted, UseMotionResult2, UseTokensResult })
	
	if Inverted then
		return UseMotionResult.offset:map(function(XScale): UDim2
			return UDim2.fromScale(XScale, 0)
		end), UseStateResult
	else
		return nil, false
	end
end

local function LibraryPregameContent(p1)
	-- upvalues: UseLibraryStringsModule (copy), noop (copy), ReactModule (copy), LibraryExperienceViewModule (copy), LibraryBrowserViewModule (copy), FFlagBuildExperienceLibrary (copy), useSlideIn (copy), FoundationModule (copy)
	local UseLibraryStringsModuleResult = UseLibraryStringsModule()
	local Element = ReactModule.createElement(LibraryExperienceViewModule, {
		isOpen = true,
		assetLabel = UseLibraryStringsModuleResult.title,
		worldLabel = UseLibraryStringsModuleResult.world,
		title = UseLibraryStringsModuleResult.title,
		searchPlaceholder = UseLibraryStringsModuleResult.searchPlaceholder,
		onShowLibrary = noop,
		onShowWorld = noop,
		onLeave = p1.onCancel
	}, {
		Browser = ReactModule.createElement(LibraryBrowserViewModule, {
			status = "Loading",
			categories = {},
			strings = UseLibraryStringsModuleResult,
			worldCutout = {
				title = UseLibraryStringsModuleResult.world,
				onActivated = noop,
				onRectChanged = noop
			}
		})
	})
	
	if FFlagBuildExperienceLibrary then
		local UseSlideInResult, UseSlideInResult2 = useSlideIn()
		
		return ReactModule.createElement(FoundationModule.View, {
			tag = "size-full",
			testId = "Library.Pregame.Page",
			Position = UseSlideInResult,
			ClipsDescendants = UseSlideInResult2,
			backgroundStyle = { Transparency = 1 }
		}, { Experience = Element })
	else
		return Element
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), RobloxAppLocalesModule (copy), LocalizationService (copy), LocalizationModule (copy), LibraryThemeProviderModule (copy), BuildExperienceCompositionStyleSheetModule (copy), LibraryPregameContent (copy)
	return ReactModule.createElement("ScreenGui", {
		ResetOnSpawn = false,
		ClipToDeviceSafeArea = false,
		DisplayOrder = p1.displayOrder,
		ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Localization = ReactModule.createElement(LocalizationModule.LocalizationProvider, {
			localization = ReactModule.useMemo(function()
				-- upvalues: RobloxAppLocalesModule (upval), LocalizationService (upval)
				return RobloxAppLocalesModule.Localization.new(LocalizationService.RobloxLocaleId)
			end, {})
		}, {
			Theme = ReactModule.createElement(LibraryThemeProviderModule, { displayOrder = p1.displayOrder }, {
				CompositionStyleSheet = ReactModule.createElement(BuildExperienceCompositionStyleSheetModule),
				Content = ReactModule.createElement(LibraryPregameContent, p1)
			})
		})
	})
end