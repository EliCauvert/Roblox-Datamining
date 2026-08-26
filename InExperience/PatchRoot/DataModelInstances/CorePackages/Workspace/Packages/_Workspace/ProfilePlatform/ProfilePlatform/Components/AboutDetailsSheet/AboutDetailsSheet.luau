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
local var1 = if fFlagEnableSplitPane then require(parent.SplitPane).SplitPaneStore else nil
local var2 = if fFlagEnableSplitPane then require(parent.SignalsReact).useSignalState else nil
local var3 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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

local function AboutDetailsSheetLegacy(_)
	-- upvalues: useTopBarHeight (ref), useDispatch (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagEnableSplitPane (ref), var2 (ref), var1 (ref), useScreenSize (ref), useSelector (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), reactModule (ref), fFlagSignalsNavP3Dispatch (ref), var3 (ref), navigateBack (ref), peekViewState (ref), useNavigationProps (ref), t (ref), view (ref), peekViewWithTopBar (ref), iconButton (ref)
	local uDim = UDim.new(0.55, 0)
	local var4 = useTopBarHeight()
	local var5 = useDispatch()
	local var6 = useProfileFormFactorModule()
	local var7 = var6.formFactor == enumsModule.ProfileFormFactor.Wide
	local var8 = if fFlagEnableSplitPane then var2(var1.getStore().getIsSplitEnabled) else false
	local var9 = useSelector(function(p1)
		return p1.TopBar.statusBarHeight
	end)
	local var10 = getSafeAreaSize(useScreenSize(), useSelector(function(p1)
		return p1.GlobalGuiInset
	end))
	local var11 = (if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var7) else math.min(var10.X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)) / var10.X.Offset
	local var12 = reactModule.useCallback(function()
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var3 (copy), var5 (ref), navigateBack (copy)
		if fFlagSignalsNavP3Dispatch then
			var3.back(true)
			
			return
		end
		var5(navigateBack(true))
	end, { var5 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12()
	end, { var12 })
	local var14 = reactModule.useCallback(function(p1, _, _)
		-- upvalues: peekViewState (copy), var12 (ref)
		if p1 == peekViewState.Closed then
			var12()
		end
	end, { var12 })
	local sections = useNavigationProps(function(_, p1)
		return { sections = p1.sections }
	end).sections or {}
	local t_1 = {
		position = UDim2.fromScale(1, 0),
		size = UDim2.fromScale(var11, 1),
		anchorPoint = Vector2.new(1, 0)
	}
	local var15 = reactModule.useMemo(function()
		-- upvalues: fFlagEnableSplitPane (copy), var8 (ref), t (copy), var7 (ref), t_1 (ref)
		return if fFlagEnableSplitPane and var8 then t elseif var7 then t_1 else t
	end, { var6.formFactor, var8 })
	
	return reactModule.createElement(view, {
		Size = var15.size,
		Position = var15.position,
		AnchorPoint = var15.anchorPoint
	}, {
		AboutDetailsSheet = reactModule.createElement(peekViewWithTopBar, {
			briefViewContentHeight = uDim,
			fullViewContentHeight = UDim.new(1, -var4),
			onViewStateChanged = var14,
			topBarHeight = var4,
			topBarSlot = reactModule.createElement(view, {
				tag = "bg-surface-100",
				Active = true,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(0, 0, 0, var4)
			}, {
				LeftNavigationButton = reactModule.createElement(iconButton, {
					BackgroundTransparency = 1,
					icon = "icons/navigation/close",
					Position = UDim2.new(0, 15, 0, var9),
					onActivated = var13
				})
			}),
			contentSlot = reactModule.createElement(view, {
				tag = "auto-y align-x-center col padding-bottom-large",
				Size = UDim2.new(1, 0, 1, -var4)
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

local function AboutDetailsSheetFoundation(_)
	-- upvalues: useDispatch (ref), fFlagEnableSplitPane (ref), var2 (ref), var1 (ref), reactModule (ref), fFlagSignalsNavP3Dispatch (ref), var3 (ref), navigateBack (ref), useNavigationProps (ref), useLocalization (ref), textKeysModule (ref), view (ref), overlayProvider (ref), sheet (ref), list (ref), text (ref)
	local var4 = useDispatch()
	local var5 = if fFlagEnableSplitPane then var2(var1.getStore().getIsSplitEnabled) else false
	local var6 = reactModule.useCallback(function()
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var3 (copy), var4 (ref), navigateBack (copy)
		if fFlagSignalsNavP3Dispatch then
			var3.back(true)
			
			return
		end
		var4(navigateBack(true))
	end, { var4 })
	local var7 = useNavigationProps(function(_, p1)
		return { sections = p1.sections, profileName = p1.profileName }
	end)
	local sections = var7.sections or {}
	local profileName = var7.profileName
	local var8, var9 = reactModule.useState(nil)
	local var10 = useLocalization({
		about = textKeysModule.About,
		aboutHeading = {
			textKeysModule.AboutDetailsHeading,
			name = profileName or ""
		}
	})
	local var11 = var8
	local var12 = var8 ~= nil
	
	if fFlagEnableSplitPane and var5 then
		var11 = nil
		var12 = true
	end
	return reactModule.createElement(view, { ref = var9, Size = UDim2.fromScale(1, 1) }, {
		Overlay = var12 and (reactModule.createElement(overlayProvider, { gui = var11 }, {
			AboutSheet = reactModule.createElement(sheet.Root, {
				isOpen = true,
				preferCenterSheet = true,
				defaultSnapPointIndex = 1,
				onClose = var6,
				snapPoints = list
			}, {
				Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
					HeaderContent = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-heading-small text-align-x-left",
						Text = if profileName then var10.aboutHeading else var10.about
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

return function(p1)
	-- upvalues: fFlagProfileAboutDetailsUseSheet (ref), AboutDetailsSheetFoundation (ref), AboutDetailsSheetLegacy (ref)
	return if fFlagProfileAboutDetailsUseSheet then AboutDetailsSheetFoundation(p1) else AboutDetailsSheetLegacy(p1)
end