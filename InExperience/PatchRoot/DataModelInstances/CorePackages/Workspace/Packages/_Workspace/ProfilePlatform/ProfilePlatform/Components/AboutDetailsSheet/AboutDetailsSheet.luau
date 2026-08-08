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
local fFlagEnableSplitPane = sharedFlagsModule.FFlagEnableSplitPane
local var14 = if fFlagEnableSplitPane then require(parent.SplitPane).SplitPaneStore else nil
local var15 = if fFlagEnableSplitPane then require(parent.SignalsReact).useSignalState else nil
local var16 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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

local function AboutDetailsSheetLegacy(_) --[[ line: 58 ]]
	-- upvalues: useTopBarHeight (ref), useDispatch (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagEnableSplitPane (ref), var15 (ref), var14 (ref), useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), reactModule (ref), fFlagSignalsNavP3Dispatch (ref), var16 (ref), navigateBack (ref), peekViewState (ref), useNavigationProps (ref), t (ref), view (ref), peekViewWithTopBar (ref), iconButton (ref)
	local uDim = UDim.new(0.55, 0)
	local var22 = useTopBarHeight()
	local var23 = useDispatch()
	local var24 = useProfileFormFactorModule()
	local var25 = var24.formFactor == enumsModule.ProfileFormFactor.Wide
	local var26 = if fFlagEnableSplitPane then var15(var14.getStore().getIsSplitEnabled) else false
	local var27 = useSelector(function(p0) --[[ line: 72 ]]
		return p0.TopBar.statusBarHeight
	end)
	local var28 = getSafeAreaSize(useScreenSize(), useSelector(function(p1) --[[ line: 69 ]]
		return p1.GlobalGuiInset
	end))
	local var29 = (if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var25) else math.min(var28.X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)) / var28.X.Offset
	local var30 = reactModule.useCallback(function() --[[ line: 85 ]]
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var16 (copy), var23 (ref), navigateBack (copy)
		if fFlagSignalsNavP3Dispatch then
			var16.back(true)
			
			return
		end
		var23(navigateBack(true))
	end, { var23 })
	local var31 = reactModule.useCallback(function() --[[ line: 93 ]]
		-- upvalues: var30 (ref)
		var30()
	end, { var30 })
	local var32 = reactModule.useCallback(function(p2, _, _) --[[ line: 97 ]]
		-- upvalues: peekViewState (copy), var30 (ref)
		if p2 == peekViewState.Closed then
			var30()
		end
	end, { var30 })
	local sections = useNavigationProps(function(_, p3) --[[ line: 103 ]]
		return { sections = p3.sections }
	end).sections or {}
	local t_1 = {
		position = UDim2.fromScale(1, 0),
		size = UDim2.fromScale(var29, 1),
		anchorPoint = Vector2.new(1, 0)
	}
	local var35 = reactModule.useMemo(function() --[[ line: 116 ]]
		-- upvalues: fFlagEnableSplitPane (copy), var26 (ref), t (copy), var25 (ref), t_1 (ref)
		return if fFlagEnableSplitPane and var26 then t elseif var25 then t_1 else t
	end, { var24.formFactor, var26 })
	
	return reactModule.createElement(view, {
		Size = var35.size,
		Position = var35.position,
		AnchorPoint = var35.anchorPoint
	}, {
		AboutDetailsSheet = reactModule.createElement(peekViewWithTopBar, {
			briefViewContentHeight = uDim,
			fullViewContentHeight = UDim.new(1, -var22),
			onViewStateChanged = var32,
			topBarHeight = var22,
			topBarSlot = reactModule.createElement(view, {
				tag = "bg-surface-100",
				Active = true,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(0, 0, 0, var22)
			}, {
				LeftNavigationButton = reactModule.createElement(iconButton, {
					BackgroundTransparency = 1,
					icon = "icons/navigation/close",
					Position = UDim2.new(0, 15, 0, var27),
					onActivated = var31
				})
			}),
			contentSlot = reactModule.createElement(view, {
				tag = "auto-y align-x-center col padding-bottom-large",
				Size = UDim2.new(1, 0, 1, -var22)
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

local function AboutDetailsSheetFoundation(_) --[[ line: 167 ]]
	-- upvalues: useDispatch (ref), fFlagEnableSplitPane (ref), var15 (ref), var14 (ref), reactModule (ref), fFlagSignalsNavP3Dispatch (ref), var16 (ref), navigateBack (ref), useNavigationProps (ref), useLocalization (ref), textKeysModule (ref), view (ref), overlayProvider (ref), sheet (ref), list (ref), text (ref)
	local var36 = useDispatch()
	local var37 = if fFlagEnableSplitPane then var15(var14.getStore().getIsSplitEnabled) else false
	local var38 = reactModule.useCallback(function() --[[ line: 173 ]]
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var16 (copy), var36 (ref), navigateBack (copy)
		if fFlagSignalsNavP3Dispatch then
			var16.back(true)
			
			return
		end
		var36(navigateBack(true))
	end, { var36 })
	local var39 = useNavigationProps(function(_, p4) --[[ line: 181 ]]
		return { sections = p4.sections, profileName = p4.profileName }
	end)
	local sections = var39.sections or {}
	local profileName = var39.profileName
	local var41, var42 = reactModule.useState(nil)
	local var43 = useLocalization({
		about = textKeysModule.About,
		aboutHeading = {
			textKeysModule.AboutDetailsHeading,
			name = profileName or ""
		}
	})
	local var44 = var41
	local var45 = var41 ~= nil
	
	if fFlagEnableSplitPane and var37 then
		var44 = nil
		var45 = true
	end
	return reactModule.createElement(view, { ref = var42, Size = UDim2.fromScale(1, 1) }, {
		Overlay = var45 and (reactModule.createElement(overlayProvider, { gui = var44 }, {
			AboutSheet = reactModule.createElement(sheet.Root, {
				isOpen = true,
				preferCenterSheet = true,
				defaultSnapPointIndex = 1,
				onClose = var38,
				snapPoints = list
			}, {
				Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
					HeaderContent = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-heading-small text-align-x-left",
						Text = if profileName then var43.aboutHeading else var43.about
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

return function(p5) --[[ line: 242 | named "AboutDetailsSheet" ]]
	-- upvalues: fFlagProfileAboutDetailsUseSheet (ref), AboutDetailsSheetFoundation (ref), AboutDetailsSheetLegacy (ref)
	return if fFlagProfileAboutDetailsUseSheet then AboutDetailsSheetFoundation(p5) else AboutDetailsSheetLegacy(p5)
end