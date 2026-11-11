local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UserInputService = game:GetService("UserInputService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")
local RoactModule = require(Modules.Common.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local RoactMotionModule = require(Modules.LuaApp.RoactMotion)
local LuaAppEventsModule = require(Modules.LuaApp.LuaAppEvents)
local EndOfScrollModule = require(Modules.LuaApp.Components.EndOfScroll)
local SetRSFNotSelectable = game:DefineFastFlag("SetRSFNotSelectable", false)
local FFlagSearchOmniAutocompletePage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppLayoutParamsInContext = SharedFlagsModule.FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppSduiSeeAllLayoutParamsFix = SharedFlagsModule.FFlagLuaAppSduiSeeAllLayoutParamsFix
local FFlagExtendScrollingFramesBySafeInsets = SharedFlagsModule.FFlagExtendScrollingFramesBySafeInsets
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconSize = UIBloxModule.App.ImageSet.getIconSize(UIBloxModule.App.ImageSet.Enum.IconSize.Medium)

local function Spinner(Image)
	-- upvalues: RoactModule (copy), ImageSetLabel (copy), IconSize (copy), Images (copy)
	local Activated = Image.activated
	local Offset: number = Image.offset
	local Position = Image.Position
	local Timer: number = Image.timer
	local Tween = Image.tween
	local Rotation = 0
	local v1 = 1
	local ImageTransparency = 0
	
	if Offset > 0 then return end
	local v2 = nil
	if Activated then
		Rotation = Timer * 540
		v2 = 0
	elseif Tween then
		v2 = 0
		ImageTransparency = 2 * Timer
	elseif Offset > -52 then
		v2 = -Offset
		Rotation = 9.6 * v2 - 240
		ImageTransparency = 1 - 0.04 * v2
	else
		v1 = 1
		v2 = 52
	end
	return RoactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, IconSize * v1, 0, IconSize * v1),
		Position = Position + UDim2.new(0.5, 0, 0, v2 - IconSize / 2),
		ImageTransparency = ImageTransparency,
		Image = Images["icons/common/refresh"],
		ImageColor3 = Image.ImageColor3,
		Rotation = Rotation,
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end

local RefreshScrollingFrame = RoactModule.Component:extend("RefreshScrollingFrame")
RefreshScrollingFrame.defaultProps = {
	preloadDistance = 2000,
	createEndOfScrollElement = false,
	Selectable = not SetRSFNotSelectable and nil,
	canvasTopPadding = if FFlagAppIaScrollAway then 0 else nil,
	canvasSidePadding = if FFlagLuaAppLayoutParamsInContext then 0 else nil,
	bottomPadding = if FFlagExtendScrollingFramesBySafeInsets then 0 else nil,
	shouldExtendIntoSafeArea = if FFlagExtendScrollingFramesBySafeInsets then { left = false, top = false, right = false, bottom = false } else nil
}

function RefreshScrollingFrame.startTweenBack(p1)
	p1:setState({ activated = false, tween = true, timer = 0, offset = 0 })
end

function RefreshScrollingFrame.startSpin(p1)
	p1:setState({ activated = true, tween = false, timer = 0 })
end

function RefreshScrollingFrame.startTween(p1)
	p1:setState({ activated = true, tween = true, timer = 0 })
end

function RefreshScrollingFrame.didMount(p1)
	p1._isMounted = true
	p1.updateIsScrollable()
end

function RefreshScrollingFrame.willUnmount(p1)
	p1._isMounted = false
	
	if p1.luaAppReloadPageEventConnection ~= nil then
		p1.luaAppReloadPageEventConnection:disconnect()
		p1.luaAppReloadPageEventConnection = nil
	end
end

function RefreshScrollingFrame.init(p1)
	-- upvalues: FitChildrenModule (copy), RoactModule (copy), FFlagLuaAppLayoutParamsInContext (copy), TweenService (copy), GuiService (copy), UserGameSettings (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), HttpService (copy), LuaAppEventsModule (copy)
	p1._inputCount = 0
	p1._isMounted = false
	p1._isUserInteracting = false
	p1._isRefreshing = false
	p1._lastReloadEventTime = tick()
	p1.state = {
		activated = false,
		tween = false,
		timer = 0,
		offset = 0,
		isScrollable = false
	}
	p1.fitFieldCanvasSize = { CanvasSize = FitChildrenModule.FitAxis.Height }
	local ForwardRefFunction = p1.props.forwardRef
	
	if type(ForwardRefFunction) == "table" then
		p1.scrollingFrameRef = ForwardRefFunction
	else
		p1.scrollingFrameRef = RoactModule.createRef()
	end
	function p1.setScrollingFrameRef(Current)
		-- upvalues: p1 (copy), ForwardRefFunction (copy)
		p1.scrollingFrameRef.current = Current
		
		if type(ForwardRefFunction) == "function" then
			ForwardRefFunction(Current)
		end
	end
	
	p1.contentFrameRef = RoactModule.createRef()
	
	if FFlagLuaAppLayoutParamsInContext then
		function p1.setContentFrameRef(Current)
			-- upvalues: p1 (copy)
			p1.contentFrameRef.current = Current
			
			if p1.props.contentFrameRefCallback then
				p1.props.contentFrameRefCallback(Current)
			end
		end
	end
	function p1.scrollBackWithFocus(Target)
		-- upvalues: TweenService (upval), GuiService (upval)
		local Tween = TweenService:Create(Target, TweenInfo.new(0.3), { CanvasPosition = Vector2.new(0, 0) })
		Tween:Play()
		Tween.Completed:Connect(function()
			-- upvalues: GuiService (upval), Target (copy)
			GuiService:Select(Target)
		end)
	end
	
	function p1.scrollBack()
		-- upvalues: p1 (copy), UserGameSettings (upval)
		if p1.scrollingFrameRef.current then
			if UserGameSettings.ReducedMotion then
				p1.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0)
				
				return
			end
			if p1.props.isInputDirectional then
				p1.scrollBackWithFocus(p1.scrollingFrameRef.current)
				
				return
			end
			p1.scrollingFrameRef.current:ScrollToTop()
		end
	end
	
	function p1.dispatchRefresh()
		-- upvalues: p1 (copy)
		local RefreshFunction = p1.props.refresh
		
		if p1._isMounted and p1.scrollingFrameRef.current then
			local Y: number = p1.scrollingFrameRef.current.CanvasPosition.Y
			
			if RefreshFunction and not p1._isRefreshing then
				p1._isRefreshing = true
				
				if Y < -52 then
					p1:startSpin()
				else
					p1:startTween()
				end
				RefreshFunction():andThen(function()
					-- upvalues: p1 (upval)
					p1._isRefreshing = false
					
					if p1._isMounted then
						p1:startTweenBack()
					end
				end, function()
					-- upvalues: p1 (upval)
					p1._isRefreshing = false
					
					if p1._isMounted then
						p1:startTweenBack()
					end
				end)
			end
		end
	end
	
	function p1.onCanvasPositionChanged(ScrollFrame)
		-- upvalues: p1 (copy), FFlagAppIaScrollAway (upval), AppNavBarModule (upval)
		local OnCanvasPositionChangedCallbackFunction: (any) -> () = p1.props.onCanvasPositionChangedCallback
		local Y: number = ScrollFrame.CanvasPosition.Y
		
		if p1.props.refresh and Y < 52 then
			p1:setState({ offset = Y })
		end
		if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() and Y <= 0 then
			AppNavBarModule.VisibilityControl.show()
		end
		if OnCanvasPositionChangedCallbackFunction then
			OnCanvasPositionChangedCallbackFunction(ScrollFrame)
		end
	end
	
	function p1.renderSteppedCallback(p2)
		-- upvalues: p1 (copy)
		if p1.state.activated or p1.state.tween then
			local config = { timer = p1.state.timer + p2 }
			
			if p1.state.tween and p1.state.timer > 0.5 then
				config.tween = false
			end
			p1:setState(config)
		end
	end
	
	function p1.inputBeganCallback(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.Touch then
			p1._isUserInteracting = true
			p1._inputCount += 1
			
			return
		end
	end
	
	function p1.inputEndedCallback(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputType ~= Enum.UserInputType.Touch then return end
		if p1._inputCount > 0 then
			p1._inputCount -= 1
		end
		if p1._inputCount > 0 then return end
		p1._isUserInteracting = false
		
		if p1.state.offset < -52 and not p1.state.activated then
			p1.dispatchRefresh()
		end
	end
	
	function p1.statusBarTapCallback()
		-- upvalues: p1 (copy)
		p1.scrollBack()
	end
	
	function p1.onReloadPage()
		-- upvalues: p1 (copy)
		if p1._isMounted and p1.scrollingFrameRef.current then
			local CurrentTime = tick()
			
			if p1.scrollingFrameRef.current.CanvasPosition.Y == 0 then
				p1.dispatchRefresh()
			else
				p1.scrollBack()
				
				if CurrentTime - p1._lastReloadEventTime < 0.5 then
					p1.dispatchRefresh()
				end
			end
			p1._lastReloadEventTime = CurrentTime
		end
	end
	
	function p1.onNavigationEventReceived(p2)
		-- upvalues: p1 (copy), HttpService (upval)
		local ParentAppPage = p1.props.parentAppPage
		local CurrentRoute = p1.props.currentRoute
		
		if p2.namespace == "Navigations" and p2.detailType == "Reload" and HttpService:JSONDecode(p2.detail).appName == ParentAppPage and #CurrentRoute == 1 then
			p1.onReloadPage()
		end
	end
	
	p1.luaAppReloadPageEventConnection = LuaAppEventsModule.ReloadPage:connect(function(ParentAppPage)
		-- upvalues: p1 (copy)
		local CurrentRoute = p1.props.currentRoute
		
		if ParentAppPage == p1.props.parentAppPage and #CurrentRoute == 1 then
			p1.onReloadPage()
		end
	end)
	
	function p1.updateIsScrollable()
		-- upvalues: p1 (copy)
		if p1.scrollingFrameRef.current and p1.contentFrameRef and p1.contentFrameRef.current then
			local Y: number = p1.scrollingFrameRef.current.AbsoluteSize.Y
			local Y1: number = p1.contentFrameRef.current.AbsoluteSize.Y
			local IsYBelow = Y < Y1
			
			if Y >= 0 and Y1 >= 0 and IsYBelow ~= p1.state.isScrollable then
				p1:setState({ isScrollable = IsYBelow })
			end
		end
	end
	
	function p1.onCanvasSizeChanged(p2)
		-- upvalues: p1 (copy)
		if p1.props.onCanvasSizeChangedCallback ~= nil then
			p1.props.onCanvasSizeChangedCallback(p2)
		end
	end
end

function RefreshScrollingFrame.render(p1)
	-- upvalues: FFlagExtendScrollingFramesBySafeInsets (copy), FFlagAppIaScrollAway (copy), FFlagLuaAppLayoutParamsInContext (copy), RoactModule (copy), RoactMotionModule (copy), Spinner (copy), FitChildrenModule (copy), SetRSFNotSelectable (copy), FFlagLuaAppSduiSeeAllLayoutParamsFix (copy), FFlagSearchOmniAutocompletePage (copy), ReactModule (copy), EndOfScrollModule (copy), ExternalEventConnectionModule (copy), RunService (copy), UserInputService (copy), WithStyleFunction (copy)
	local Position = nil
	
	if FFlagExtendScrollingFramesBySafeInsets then
		Position = p1.props.Position or UDim2.new(0, 0, 0, 0)
		
		if p1.props.shouldExtendIntoSafeArea.left then
			Position += UDim2.fromOffset(-p1.props.deviceSafePadding.left, 0)
		end
		if p1.props.shouldExtendIntoSafeArea.top then
			Position += UDim2.fromOffset(0, -p1.props.deviceSafePadding.top)
		end
	end
	local Size = p1.props.Size
	
	if FFlagExtendScrollingFramesBySafeInsets then
		if p1.props.shouldExtendIntoSafeArea.left then
			Size += UDim2.new(0, p1.props.deviceSafePadding.left, 0, 0)
		end
		if p1.props.shouldExtendIntoSafeArea.top then
			Size += UDim2.new(0, 0, 0, p1.props.deviceSafePadding.top)
		end
		if p1.props.shouldExtendIntoSafeArea.right then
			Size += UDim2.new(0, p1.props.deviceSafePadding.right, 0, 0)
		end
		if p1.props.shouldExtendIntoSafeArea.bottom then
			Size += UDim2.new(0, 0, 0, p1.props.deviceSafePadding.bottom)
		end
	end
	local BackgroundColor3 = p1.props.BackgroundColor3
	local BackgroundTransparency = p1.props.BackgroundTransparency
	local ScrollBarImageColor3 = p1.props.ScrollBarImageColor3
	local ScrollBarThickness = p1.props.ScrollBarThickness or 0
	local ScrollBarImageTransparency = p1.props.ScrollBarImageTransparency or 0
	local CanvasTopPadding = if FFlagAppIaScrollAway then p1.props.canvasTopPadding else nil
	local CanvasSidePadding = if FFlagLuaAppLayoutParamsInContext then p1.props.canvasSidePadding else nil
	local Offset = if FFlagExtendScrollingFramesBySafeInsets then Position.Y.Offset else p1.props.Position.Y.Offset
	local NotificationService = p1.props.NotificationService
	local CreateFooterFunction = p1.props.createFooter
	local UseAutomaticSizeContentFrame = p1.props.useAutomaticSizeContentFrame
	local Activated = p1.state.activated
	local Tween = p1.state.tween
	local Offset1: number = p1.state.offset
	local CreateEndOfScrollElement = p1.state.isScrollable and p1.props.createEndOfScrollElement
	local Activated1 = Activated or (Tween or p1._isUserInteracting)
	
	if Activated then
		if Offset1 > 0 and Offset1 < 52 then
			Offset = Offset - Offset1 + 52
		elseif Offset1 <= 0 then
			Offset += 52
		end
	end
	local function renderRSF(BackgroundColor3, BackgroundTransparency, ImageColor3, ScrollBarImageColor3)
		-- upvalues: RoactModule (upval), p1 (copy), RoactMotionModule (upval), Offset (ref), FFlagAppIaScrollAway (upval), CanvasTopPadding (copy), Activated1 (copy), Spinner (upval), FitChildrenModule (upval), FFlagExtendScrollingFramesBySafeInsets (upval), Position (ref), Size (ref), ScrollBarThickness (copy), ScrollBarImageTransparency (copy), SetRSFNotSelectable (upval), FFlagLuaAppSduiSeeAllLayoutParamsFix (upval), FFlagSearchOmniAutocompletePage (upval), FFlagLuaAppLayoutParamsInContext (upval), CanvasSidePadding (copy), CreateEndOfScrollElement (copy), UseAutomaticSizeContentFrame (copy), ReactModule (upval), CreateFooterFunction (copy), EndOfScrollModule (upval), ExternalEventConnectionModule (upval), RunService (upval), UserInputService (upval), NotificationService (copy)
		return RoactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = BackgroundColor3,
			BackgroundTransparency = BackgroundTransparency,
			[RoactModule.Change.AbsoluteSize] = p1.props.onAbsoluteSizeChangedCallback
		}, {
			layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			spinnerFrame = RoactModule.createElement(RoactMotionModule.SimpleMotion, {
				style = { sizeY = RoactMotionModule.spring(Offset, 150, 18, 2) },
				render = function(p2)
					-- upvalues: p1 (upval), Offset (upval), FFlagAppIaScrollAway (upval), CanvasTopPadding (upval), RoactModule (upval), Activated1 (upval), Spinner (upval), ImageColor3 (copy)
					local SizeY = p1.state.tween and p2.sizeY or Offset
					
					if FFlagAppIaScrollAway and CanvasTopPadding > 0 then
						SizeY += CanvasTopPadding
					end
					return RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, p2.sizeY)
					}, {
						spinner = Activated1 and Spinner({
							Position = UDim2.new(0, 0, 0, SizeY),
							ImageColor3 = ImageColor3,
							offset = p1.state.offset,
							activated = p1.state.activated,
							timer = p1.state.timer,
							tween = p1.state.tween
						})
					})
				end
			}),
			scrollingFrame = RoactModule.createElement(FitChildrenModule.FitScrollingFrame, {
				Position = if FFlagExtendScrollingFramesBySafeInsets then Position else nil,
				Size = Size,
				CanvasPosition = p1.props.canvasPosition,
				ScrollBarThickness = ScrollBarThickness,
				ScrollBarImageColor3 = ScrollBarImageColor3,
				ScrollBarImageTransparency = ScrollBarImageTransparency,
				Selectable = if SetRSFNotSelectable then p1.props.Selectable else nil,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				ScrollingEnabled = p1.props.ScrollingEnabled,
				ElasticBehavior = Enum.ElasticBehavior.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				fitFields = p1.fitFieldCanvasSize,
				AutomaticCanvasSize = if FFlagLuaAppSduiSeeAllLayoutParamsFix then p1.props.AutomaticCanvasSize else nil,
				[RoactModule.Ref] = p1.setScrollingFrameRef,
				[RoactModule.Change.CanvasPosition] = p1.onCanvasPositionChanged,
				[RoactModule.Change.CanvasSize] = p1.onCanvasSizeChanged,
				[RoactModule.Change.AbsoluteWindowSize] = p1.props.onAbsoluteWindowSizeChangedCallback,
				[RoactModule.Event.SelectionChanged] = p1.props.onSelectionChanged
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					[RoactModule.Change.AbsoluteContentSize] = if FFlagSearchOmniAutocompletePage then p1.props.onAbsoluteContentSizeChanged else nil
				}),
				UIPadding = if FFlagAppIaScrollAway and CanvasTopPadding > 0 then RoactModule.createElement("UIPadding", {
					PaddingTop = if FFlagAppIaScrollAway or FFlagExtendScrollingFramesBySafeInsets then UDim.new(0, CanvasTopPadding + (FFlagExtendScrollingFramesBySafeInsets and p1.props.shouldExtendIntoSafeArea.top and p1.props.deviceSafePadding.top or 0)) else nil,
					PaddingLeft = if FFlagLuaAppLayoutParamsInContext or FFlagExtendScrollingFramesBySafeInsets then UDim.new(0, CanvasSidePadding + (FFlagExtendScrollingFramesBySafeInsets and p1.props.shouldExtendIntoSafeArea.left and p1.props.deviceSafePadding.left or 0)) else nil,
					PaddingRight = if FFlagLuaAppLayoutParamsInContext or FFlagExtendScrollingFramesBySafeInsets then UDim.new(0, CanvasSidePadding + (FFlagExtendScrollingFramesBySafeInsets and p1.props.shouldExtendIntoSafeArea.right and p1.props.deviceSafePadding.right or 0)) else nil,
					PaddingBottom = if FFlagExtendScrollingFramesBySafeInsets and not CreateEndOfScrollElement then UDim.new(0, p1.props.shouldExtendIntoSafeArea.bottom and p1.props.deviceSafePadding.bottom or 0) else nil
				}) elseif FFlagLuaAppLayoutParamsInContext and CanvasSidePadding > 0 then RoactModule.createElement("UIPadding", {
					PaddingTop = if FFlagAppIaScrollAway or FFlagExtendScrollingFramesBySafeInsets then UDim.new(0, CanvasTopPadding + (FFlagExtendScrollingFramesBySafeInsets and p1.props.shouldExtendIntoSafeArea.top and p1.props.deviceSafePadding.top or 0)) else nil,
					PaddingLeft = if FFlagLuaAppLayoutParamsInContext or FFlagExtendScrollingFramesBySafeInsets then UDim.new(0, CanvasSidePadding + (FFlagExtendScrollingFramesBySafeInsets and p1.props.shouldExtendIntoSafeArea.left and p1.props.deviceSafePadding.left or 0)) else nil,
					PaddingRight = if FFlagLuaAppLayoutParamsInContext or FFlagExtendScrollingFramesBySafeInsets then UDim.new(0, CanvasSidePadding + (FFlagExtendScrollingFramesBySafeInsets and p1.props.shouldExtendIntoSafeArea.right and p1.props.deviceSafePadding.right or 0)) else nil,
					PaddingBottom = if FFlagExtendScrollingFramesBySafeInsets and not CreateEndOfScrollElement then UDim.new(0, p1.props.shouldExtendIntoSafeArea.bottom and p1.props.deviceSafePadding.bottom or 0) else nil
				}) elseif FFlagExtendScrollingFramesBySafeInsets then RoactModule.createElement("UIPadding", {
					PaddingTop = if FFlagAppIaScrollAway or FFlagExtendScrollingFramesBySafeInsets then UDim.new(0, CanvasTopPadding + (FFlagExtendScrollingFramesBySafeInsets and p1.props.shouldExtendIntoSafeArea.top and p1.props.deviceSafePadding.top or 0)) else nil,
					PaddingLeft = if FFlagLuaAppLayoutParamsInContext or FFlagExtendScrollingFramesBySafeInsets then UDim.new(0, CanvasSidePadding + (FFlagExtendScrollingFramesBySafeInsets and p1.props.shouldExtendIntoSafeArea.left and p1.props.deviceSafePadding.left or 0)) else nil,
					PaddingRight = if FFlagLuaAppLayoutParamsInContext or FFlagExtendScrollingFramesBySafeInsets then UDim.new(0, CanvasSidePadding + (FFlagExtendScrollingFramesBySafeInsets and p1.props.shouldExtendIntoSafeArea.right and p1.props.deviceSafePadding.right or 0)) else nil,
					PaddingBottom = if FFlagExtendScrollingFramesBySafeInsets and not CreateEndOfScrollElement then UDim.new(0, p1.props.shouldExtendIntoSafeArea.bottom and p1.props.deviceSafePadding.bottom or 0) else nil
				}) else nil,
				Content = RoactModule.createElement(if UseAutomaticSizeContentFrame then "Frame" else FitChildrenModule.FitFrame, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					[ReactModule.Tag] = p1.props.contentTag,
					Size = if UseAutomaticSizeContentFrame then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0),
					fitFields = if UseAutomaticSizeContentFrame then nil else { Size = FitChildrenModule.FitAxis.Height },
					AutomaticSize = if UseAutomaticSizeContentFrame then Enum.AutomaticSize.Y else nil,
					[RoactModule.Ref] = p1.setContentFrameRef,
					[RoactModule.Change.AbsoluteSize] = function()
						-- upvalues: p1 (upval)
						spawn(p1.updateIsScrollable)
					end
				}, p1.props[RoactModule.Children]),
				Footer = CreateFooterFunction and RoactModule.createElement(FitChildrenModule.FitFrame, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 1, 0),
					fitFields = { Size = FitChildrenModule.FitAxis.Height }
				}, { FooterContent = CreateFooterFunction() }),
				EndOfScroll = CreateEndOfScrollElement and RoactModule.createElement(EndOfScrollModule, {
					LayoutOrder = 3,
					bottomPadding = if FFlagExtendScrollingFramesBySafeInsets then p1.props.bottomPadding + (p1.props.shouldExtendIntoSafeArea.bottom and p1.props.deviceSafePadding.bottom or 0) else p1.props.bottomPadding,
					backToTopCallback = p1.scrollBack
				})
			}),
			renderStepped = RoactModule.createElement(ExternalEventConnectionModule, {
				event = RunService.renderStepped,
				callback = p1.renderSteppedCallback
			}),
			inputBegan = RoactModule.createElement(ExternalEventConnectionModule, {
				event = UserInputService.InputBegan,
				callback = p1.inputBeganCallback
			}),
			inputEnded = RoactModule.createElement(ExternalEventConnectionModule, {
				event = UserInputService.InputEnded,
				callback = p1.inputEndedCallback
			}),
			statusBarTapped = not _G.__TESTEZ_RUNNING_TEST__ and RoactModule.createElement(ExternalEventConnectionModule, {
				event = UserInputService.StatusBarTapped,
				callback = p1.statusBarTapCallback
			}),
			bottomBarButtonPressed = RoactModule.createElement(ExternalEventConnectionModule, {
				event = NotificationService.RobloxEventReceived,
				callback = p1.onNavigationEventReceived
			})
		})
	end
	
	return WithStyleFunction(function(p2)
		-- upvalues: renderRSF (copy), BackgroundColor3 (copy), BackgroundTransparency (copy), ScrollBarImageColor3 (copy)
		return renderRSF(BackgroundColor3 or p2.Theme.BackgroundDefault.Color, BackgroundTransparency or p2.Theme.BackgroundDefault.Transparency, p2.Theme.IconEmphasis.Color, ScrollBarImageColor3 or p2.Theme.UIEmphasis.Color)
	end)
end

if FFlagSignalsNavP3hMisc then
	local RefreshScrollingFrame1 = RefreshScrollingFrame
	
	local function v40(p1)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), RoactModule (copy), RefreshScrollingFrame1 (copy), CryoModule (copy)
		return RoactModule.createElement(RefreshScrollingFrame1, CryoModule.Dictionary.union(p1, {
			currentRoute = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
		}))
	end
else
	local v1: (any) -> any = RoactRoduxModule.connect(function(p1, _)
		-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
		return {
			currentRoute = if FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p1) else p1.Navigation.history[#p1.Navigation.history]
		}
	end)(RefreshScrollingFrame)
end
local v2 = RoactServices.connect({ NotificationService = AppNotificationService })(v1)

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: ResponsiveModule (copy), FFlagExtendScrollingFramesBySafeInsets (copy), UseSignalStateFunction (copy), DisplayModule (copy), RoactModule (copy), v2 (ref), CryoModule (copy)
	local UseSignalStateResult = if FFlagExtendScrollingFramesBySafeInsets then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	
	return RoactModule.createElement(v2, CryoModule.Dictionary.join(p1, {
		forwardRef = ForwardRef,
		isInputDirectional = ResponsiveModule.useLastInput() == ResponsiveModule.Input.Directional,
		deviceSafePadding = if FFlagExtendScrollingFramesBySafeInsets then UseSignalStateResult else nil
	}))
end)