local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local PeekViewModule = require(Parent.PeekView)
local RoactUtilsModule = require(Parent.RoactUtils)
local FoundationModule = require(Parent.Foundation)
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local SharedFlagsModule = require(Parent.SharedFlags)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local UseProfileCardWidthModule = require(ProfilePlatform.Hooks.useProfileCardWidth)
local UseProfileCardWidthFunction = require(Parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local UseScreenSizeFunction = RobloxAppHooksModule.useScreenSize
local UseTopBarHeightFunction = RobloxAppHooksModule.useTopBarHeight
local GetSafeAreaSizeFunction = require(Parent.InputUi).getSafeAreaSize
local PeekViewWithTopBar = PeekViewModule.PeekViewWithTopBar
local PeekViewState = PeekViewModule.PeekViewState
local FFlagProfilePlatformNewProfileHeader = SharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local FFlagSwitchProfileWidthHookToSocialCommon = SharedFlagsModule.FFlagSwitchProfileWidthHookToSocialCommon
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local FFlagProfileAboutDetailsUseSheet = SharedFlagsModule.FFlagProfileAboutDetailsUseSheet
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local Text = FoundationModule.Text
local Sheet = FoundationModule.Sheet
local OverlayProvider = FoundationModule.OverlayProvider
local SnapPoints = { 0.55, 1 }
local config = {
	position = UDim2.fromScale(0, 0),
	size = UDim2.fromScale(1, 1),
	anchorPoint = Vector2.new(0, 0)
}

local function AboutDetailsSheetLegacy(_)
	-- upvalues: UseTopBarHeightFunction (copy), UseDispatchFunction (copy), UseProfileFormFactorModule (copy), EnumsModule (copy), UseScreenSizeFunction (copy), UseSelectorFunction (copy), GetSafeAreaSizeFunction (copy), FFlagProfilePlatformNewProfileHeader (copy), FFlagSwitchProfileWidthHookToSocialCommon (copy), UseProfileCardWidthFunction (copy), UseProfileCardWidthModule (copy), ConstantsModule (copy), ReactModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), PeekViewState (copy), UseNavigationPropsFunction (copy), config (copy), View (copy), PeekViewWithTopBar (copy), IconButton (copy)
	local UseTopBarHeightResult = UseTopBarHeightFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseProfileFormFactorModuleResult = UseProfileFormFactorModule()
	local IsFormFactorMatch = UseProfileFormFactorModuleResult.formFactor == EnumsModule.ProfileFormFactor.Wide
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.GlobalGuiInset
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		return p1.TopBar.statusBarHeight
	end)
	local SafeAreaSize = GetSafeAreaSizeFunction(UseScreenSizeResult, UseSelectorResult)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval)
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back(true)
			
			return
		else
			UseDispatchResult(NavigateBackFunction(true))
		end
	end, { UseDispatchResult })
	local config1 = {
		position = UDim2.fromScale(1, 0),
		size = UDim2.fromScale((if FFlagProfilePlatformNewProfileHeader then if FFlagSwitchProfileWidthHookToSocialCommon then UseProfileCardWidthFunction() else UseProfileCardWidthModule(IsFormFactorMatch) else math.min(SafeAreaSize.X.Offset, ConstantsModule.MAXIMUM_CONTAINER_WIDTH)) / SafeAreaSize.X.Offset, 1),
		anchorPoint = Vector2.new(1, 0)
	}
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsFormFactorMatch (copy), config1 (copy), config (upval)
		return if IsFormFactorMatch then config1 else config
	end, { UseProfileFormFactorModuleResult.formFactor })
	
	return ReactModule.createElement(View, {
		Size = UseMemoResult.size,
		Position = UseMemoResult.position,
		AnchorPoint = UseMemoResult.anchorPoint
	}, {
		AboutDetailsSheet = ReactModule.createElement(PeekViewWithTopBar, {
			briefViewContentHeight = UDim.new(0.55, 0),
			fullViewContentHeight = UDim.new(1, -UseTopBarHeightResult),
			onViewStateChanged = ReactModule.useCallback(function(Closed, _, _)
				-- upvalues: PeekViewState (upval), UseResult (copy)
				if Closed == PeekViewState.Closed then
					UseResult()
				end
			end, { UseResult }),
			topBarHeight = UseTopBarHeightResult,
			topBarSlot = ReactModule.createElement(View, {
				tag = "bg-surface-100",
				Active = true,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(0, 0, 0, UseTopBarHeightResult)
			}, {
				LeftNavigationButton = ReactModule.createElement(IconButton, {
					BackgroundTransparency = 1,
					icon = "icons/navigation/close",
					Position = UDim2.new(0, 15, 0, UseSelectorResult1),
					onActivated = ReactModule.useCallback(function()
						-- upvalues: UseResult (copy)
						UseResult()
					end, { UseResult })
				})
			}),
			contentSlot = ReactModule.createElement(View, {
				tag = "auto-y align-x-center col padding-bottom-large",
				Size = UDim2.new(1, 0, 1, -UseTopBarHeightResult)
			}, {
				Contents = ReactModule.createElement(View, {
					tag = "align-x-center col padding-x-xlarge gap-xlarge padding-top-large padding-bottom-large",
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					ContentSections = ReactModule.createElement(ReactModule.Fragment, {}, UseNavigationPropsFunction(function(_, p1)
						return { sections = p1.sections }
					end).sections or {})
				})
			})
		})
	})
end

local function AboutDetailsSheetFoundation(_)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), UseNavigationPropsFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), View (copy), OverlayProvider (copy), Sheet (copy), SnapPoints (copy), Text (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval)
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back(true)
			
			return
		else
			UseDispatchResult(NavigateBackFunction(true))
		end
	end, { UseDispatchResult })
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p1)
		return { sections = p1.sections, profileName = p1.profileName }
	end)
	local Sections = UseNavigationPropsResult.sections or {}
	local ProfileName = UseNavigationPropsResult.profileName
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseLocalizationResult = UseLocalizationFunction({
		about = TextKeysModule.About,
		aboutHeading = {
			TextKeysModule.AboutDetailsHeading,
			name = ProfileName or ""
		}
	})
	
	return ReactModule.createElement(View, { ref = UseStateResult2, Size = UDim2.fromScale(1, 1) }, {
		Overlay = UseStateResult and ReactModule.createElement(OverlayProvider, { gui = UseStateResult }, {
			AboutSheet = ReactModule.createElement(Sheet.Root, {
				isOpen = true,
				preferCenterSheet = true,
				defaultSnapPointIndex = 1,
				onClose = UseResult,
				snapPoints = SnapPoints
			}, {
				Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
					HeaderContent = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-heading-small text-align-x-left",
						Text = if ProfileName then UseLocalizationResult.aboutHeading else UseLocalizationResult.about
					})
				}),
				Content = ReactModule.createElement(Sheet.Content, nil, {
					Contents = ReactModule.createElement(View, {
						tag = "col align-x-center gap-xlarge padding-bottom-large",
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						ContentSections = ReactModule.createElement(ReactModule.Fragment, {}, Sections)
					})
				})
			})
		}) or nil
	})
end

return function(p1)
	-- upvalues: FFlagProfileAboutDetailsUseSheet (copy), AboutDetailsSheetFoundation (copy), AboutDetailsSheetLegacy (copy)
	return if FFlagProfileAboutDetailsUseSheet then AboutDetailsSheetFoundation(p1) else AboutDetailsSheetLegacy(p1)
end