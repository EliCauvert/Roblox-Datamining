local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local peekViewModule = require(parent.PeekView)
local roactUtilsModule = require(parent.RoactUtils)
local navigationRoduxModule = require(parent.NavigationRodux)
local foundationModule = require(parent.Foundation)
local inputUiModule = require(parent.InputUi)
local useNavigationProps = require(parent.RobloxAppNavigation).useNavigationProps
local sharedFlagsModule = require(parent.SharedFlags)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local enumsModule = require(profilePlatform.Common.Enums)
local constantsModule = require(profilePlatform.Common.Constants)
local useProfileCardWidthModule = require(profilePlatform.Hooks.useProfileCardWidth)
local useProfileCardWidth = require(parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local navigateBack = navigationRoduxModule.Thunks.NavigateBack
local useScreenSize = robloxAppHooksModule.useScreenSize
local useTopBarHeight = robloxAppHooksModule.useTopBarHeight
local getSafeAreaSize = inputUiModule.getSafeAreaSize
local peekViewWithTopBar = peekViewModule.PeekViewWithTopBar
local peekViewState = peekViewModule.PeekViewState
local fFlagProfilePlatformNewProfileHeader = sharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local fFlagSwitchProfileWidthHookToSocialCommon = sharedFlagsModule.FFlagSwitchProfileWidthHookToSocialCommon
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local fFlagProfileAboutDetailsUseSheet = sharedFlagsModule.FFlagProfileAboutDetailsUseSheet
local var14 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local text = foundationModule.Text
local sheet = foundationModule.Sheet
local overlayProvider = foundationModule.OverlayProvider
local list = { 0.55, 1 }
local t = {
	position = UDim2.fromScale(0, 0),
	size = UDim2.fromScale(1, 1),
	anchorPoint = Vector2.new(0, 0)
}

local function AboutDetailsSheetLegacy(_) --[[ line: 55 ]]
	-- upvalues: useTopBarHeight (ref), useDispatch (ref), useProfileFormFactorModule (ref), enumsModule (ref), useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), reactModule (ref), fFlagSignalsNavP3Dispatch (ref), var14 (ref), navigateBack (ref), peekViewState (ref), useNavigationProps (ref), t (ref), view (ref), peekViewWithTopBar (ref), iconButton (ref)
	local uDim = UDim.new(0.55, 0)
	local var20 = useTopBarHeight()
	local var21 = useDispatch()
	local var22 = useProfileFormFactorModule()
	local var23 = var22.formFactor == enumsModule.ProfileFormFactor.Wide
	local var24 = useSelector(function(p0) --[[ line: 66 ]]
		return p0.TopBar.statusBarHeight
	end)
	local var25 = getSafeAreaSize(useScreenSize(), useSelector(function(p1) --[[ line: 63 ]]
		return p1.GlobalGuiInset
	end))
	local var26 = (if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var23) else math.min(var25.X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)) / var25.X.Offset
	local var27 = reactModule.useCallback(function() --[[ line: 79 ]]
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var14 (copy), var21 (ref), navigateBack (copy)
		if fFlagSignalsNavP3Dispatch then
			var14.back(true)
			
			return
		end
		var21(navigateBack(true))
	end, { var21 })
	local var28 = reactModule.useCallback(function() --[[ line: 87 ]]
		-- upvalues: var27 (ref)
		var27()
	end, { var27 })
	local var29 = reactModule.useCallback(function(p2, _, _) --[[ line: 91 ]]
		-- upvalues: peekViewState (copy), var27 (ref)
		if p2 == peekViewState.Closed then
			var27()
		end
	end, { var27 })
	local sections = useNavigationProps(function(_, p3) --[[ line: 97 ]]
		return { sections = p3.sections }
	end).sections or {}
	local t_1 = {
		position = UDim2.fromScale(1, 0),
		size = UDim2.fromScale(var26, 1),
		anchorPoint = Vector2.new(1, 0)
	}
	local var32 = reactModule.useMemo(function() --[[ line: 110 ]]
		-- upvalues: var23 (ref), t_1 (ref), t (copy)
		return if var23 then t_1 else t
	end, { var22.formFactor })
	
	return reactModule.createElement(view, {
		Size = var32.size,
		Position = var32.position,
		AnchorPoint = var32.anchorPoint
	}, {
		AboutDetailsSheet = reactModule.createElement(peekViewWithTopBar, {
			briefViewContentHeight = uDim,
			fullViewContentHeight = UDim.new(1, -var20),
			onViewStateChanged = var29,
			topBarHeight = var20,
			topBarSlot = reactModule.createElement(view, {
				tag = "bg-surface-100",
				Active = true,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(0, 0, 0, var20)
			}, {
				LeftNavigationButton = reactModule.createElement(iconButton, {
					BackgroundTransparency = 1,
					icon = "icons/navigation/close",
					Position = UDim2.new(0, 15, 0, var24),
					onActivated = var28
				})
			}),
			contentSlot = reactModule.createElement(view, {
				tag = "auto-y align-x-center col padding-bottom-large",
				Size = UDim2.new(1, 0, 1, -var20)
			}, {
				Contents = reactModule.createElement(view, {
					tag = "align-x-center col padding-x-xlarge gap-xlarge padding-top-large padding-bottom-large",
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					ContentSections = reactModule.createElement(reactModule.Fragment, {}, sections)
				})
			})
		})
	})
end

local function AboutDetailsSheetFoundation(_) --[[ line: 159 ]]
	-- upvalues: useDispatch (ref), reactModule (ref), fFlagSignalsNavP3Dispatch (ref), var14 (ref), navigateBack (ref), useNavigationProps (ref), useLocalization (ref), textKeysModule (ref), view (ref), overlayProvider (ref), sheet (ref), list (ref), text (ref)
	local var33 = useDispatch()
	local var34 = reactModule.useCallback(function() --[[ line: 162 ]]
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var14 (copy), var33 (ref), navigateBack (copy)
		if fFlagSignalsNavP3Dispatch then
			var14.back(true)
			
			return
		end
		var33(navigateBack(true))
	end, { var33 })
	local var35 = useNavigationProps(function(_, p4) --[[ line: 170 ]]
		return { sections = p4.sections, profileName = p4.profileName }
	end)
	local sections = var35.sections or {}
	local profileName = var35.profileName
	local var37, var38 = reactModule.useState(nil)
	local var39 = useLocalization({
		about = textKeysModule.About,
		aboutHeading = {
			textKeysModule.AboutDetailsHeading,
			name = profileName or ""
		}
	})
	
	return reactModule.createElement(view, { ref = var38, Size = UDim2.fromScale(1, 1) }, {
		Overlay = var37 and (reactModule.createElement(overlayProvider, { gui = var37 }, {
			AboutSheet = reactModule.createElement(sheet.Root, {
				isOpen = true,
				preferCenterSheet = true,
				defaultSnapPointIndex = 1,
				onClose = var34,
				snapPoints = list
			}, {
				Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
					HeaderContent = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-heading-small text-align-x-left",
						Text = if profileName then var39.aboutHeading else var39.about
					})
				}),
				Content = reactModule.createElement(sheet.Content, nil, {
					Contents = reactModule.createElement(view, {
						tag = "col align-x-center gap-xlarge padding-bottom-large",
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						ContentSections = reactModule.createElement(reactModule.Fragment, {}, sections)
					})
				})
			})
		}) or nil)
	})
end

return function(p5) --[[ line: 222 | named "AboutDetailsSheet" ]]
	-- upvalues: fFlagProfileAboutDetailsUseSheet (ref), AboutDetailsSheetFoundation (ref), AboutDetailsSheetLegacy (ref)
	return if fFlagProfileAboutDetailsUseSheet then AboutDetailsSheetFoundation(p5) else AboutDetailsSheetLegacy(p5)
end