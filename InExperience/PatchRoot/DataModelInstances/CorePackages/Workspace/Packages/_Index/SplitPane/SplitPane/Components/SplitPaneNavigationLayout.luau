local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local AppSplitViewModule = require(Parent.AppSplitView)
local Constants = require(Parent.NavigationRodux).Constants
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local SharedFlagsModule = require(Parent.SharedFlags)
local SplitView = AppSplitViewModule.SplitView
local Enums = AppSplitViewModule.Enums
local UseSplitPaneRenderModule = require(script.Parent.Parent.Hooks.useSplitPaneRender)
local UseSplitPaneFocusNavBridgeModule = require(script.Parent.Parent.Hooks.useSplitPaneFocusNavBridge)
local FFlagSplitPaneEducationalTour = SharedFlagsModule.FFlagSplitPaneEducationalTour
local FFlagNavigationCommandHandle = SharedFlagsModule.FFlagNavigationCommandHandle
local SplitPaneEducationalTourModule = if FFlagSplitPaneEducationalTour then require(script.Parent.SplitPaneEducationalTour) else nil
local SupportPaneTopRoutePublisherModule = if FFlagNavigationCommandHandle then require(script.Parent.SupportPaneTopRoutePublisher) else nil
local config = { [Constants.TempRnSwitchNavigatorName] = true }

if Constants.HomeContainerName ~= nil then
	config[Constants.HomeContainerName] = true
end
local function getActiveRouteName(State)
	-- upvalues: config (copy)
	local Route = State
	while Route ~= nil and (config[Route.routeName] and Route.routes ~= nil and Route.index ~= nil) do
		Route = Route.routes[Route.index]
	end
	return if Route == nil then nil else Route.routeName
end

local function isHomeActive(Entry): boolean
	-- upvalues: getActiveRouteName (copy), RobloxAppEnumsModule (copy), Enums (copy)
	local Entry1 = Entry[1]
	
	if getActiveRouteName(if Entry1 == nil or Entry1.descriptor == nil then nil else Entry1.descriptor.state) ~= RobloxAppEnumsModule.AppPage.Home then
		return false
	end
	for i = 2, #Entry do
		local Options = if Entry[i].descriptor == nil then nil else Entry[i].descriptor.options
		
		if Options == nil or Options.splitPaneEligibility ~= Enums.SplitPaneSlot.Support then
			return false
		end
	end
	return true
end

local function useSupportPaneAnchorRef()
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	return UseRefResult, (ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = Current
	end, {}))
end

return function(p1)
	-- upvalues: UseSplitPaneRenderModule (copy), ReactModule (copy), UseSplitPaneFocusNavBridgeModule (copy), FFlagSplitPaneEducationalTour (copy), useSupportPaneAnchorRef (copy), FFlagNavigationCommandHandle (copy), isHomeActive (copy), Enums (copy), SplitView (copy), SupportPaneTopRoutePublisherModule (copy), SplitPaneEducationalTourModule (copy)
	local UseSplitPaneRenderModuleResult = UseSplitPaneRenderModule(p1.screens, p1.cards, p1.paneIndices, p1.isRouteActiveOnPane)
	local UseRefResult = ReactModule.useRef(nil)
	UseSplitPaneFocusNavBridgeModule(UseRefResult)
	local IsRootAppStack = FFlagSplitPaneEducationalTour and UseSplitPaneRenderModuleResult.isRootAppStack
	local SupportPaneRef = nil
	local Ref = nil
	
	if FFlagSplitPaneEducationalTour then
		SupportPaneRef, Ref = useSupportPaneAnchorRef()
	end
	if UseSplitPaneRenderModuleResult.isBreakpointEnabled then
		local State = nil
		
		if FFlagNavigationCommandHandle and p1.isRouteActiveOnPane and #p1.paneIndices > 0 then
			local Screen = p1.screens[p1.paneIndices[#p1.paneIndices]]
			State = if Screen == nil then nil else Screen.descriptor.state
		end
		local SupportPaneMode = UseSplitPaneRenderModuleResult.supportPaneMode
		local IsHomeActive = IsRootAppStack and (UseSplitPaneRenderModuleResult.supportContentProps.paneCount == 0 and (not UseSplitPaneRenderModuleResult.supportContentProps.hasDetailOnTop and isHomeActive(p1.screens)))
		local Frame = if UseSplitPaneRenderModuleResult.renderSupportContent == nil then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, UseSplitPaneRenderModuleResult.supportSlotChildren) else UseSplitPaneRenderModuleResult.renderSupportContent(UseSplitPaneRenderModuleResult.supportContentProps, UseSplitPaneRenderModuleResult.supportSlotChildren)
		
		if IsRootAppStack and Ref ~= nil then
			Frame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ref = Ref,
				Size = UDim2.fromScale(1, 1)
			}, { SupportContent = Frame })
		end
		local HasNextEntry = next(UseSplitPaneRenderModuleResult.overlaySlotChildren) ~= nil
		
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			SplitView = ReactModule.createElement(SplitView, {
				supportPane = {
					width = UseSplitPaneRenderModuleResult.supportWidth,
					minWidth = UseSplitPaneRenderModuleResult.supportMinWidth,
					maxWidth = UseSplitPaneRenderModuleResult.supportMaxWidth,
					resizable = if SupportPaneMode == Enums.SupportPaneMode.Normal and UseSplitPaneRenderModuleResult.supportPaneResizable then Enums.PaneResizable.Horizontal else Enums.PaneResizable.None,
					element = Frame
				},
				supportPaneMode = SupportPaneMode,
				supportResizerAbovePane = UseSplitPaneRenderModuleResult.supportResizerAbovePane,
				onSupportPaneWidthChanged = UseSplitPaneRenderModuleResult.onSupportPaneWidthChanged,
				onContentRegionRectChanged = UseSplitPaneRenderModuleResult.onContentRegionRectChanged
			}, {
				ContentPaneSurface = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromScale(1, 1),
					ref = UseRefResult
				}, UseSplitPaneRenderModuleResult.primarySlotChildren)
			}),
			TopRoutePublisher = if State == nil then nil else ReactModule.createElement(SupportPaneTopRoutePublisherModule, { routeState = State }),
			EducationalTour = if IsRootAppStack then ReactModule.createElement(SplitPaneEducationalTourModule, {
				supportPaneRef = SupportPaneRef,
				supportPaneMode = SupportPaneMode,
				isSupportSurfaceEligible = IsHomeActive
			}) else nil,
			Overlay = if HasNextEntry then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 10,
				Size = UDim2.fromScale(1, 1)
			}, UseSplitPaneRenderModuleResult.overlaySlotChildren) else nil
		})
	else
		local Copy = table.clone(UseSplitPaneRenderModuleResult.primarySlotChildren)
		
		for i, value in UseSplitPaneRenderModuleResult.overlaySlotChildren do
			Copy[i] = value
		end
		return ReactModule.createElement(ReactModule.Fragment, nil, Copy)
	end
end