local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local SignalModule = require(Modules.Common.Signal)
local ScrollMovementDirectionModule = require(Modules.LuaApp.Enum.ScrollMovementDirection)
local LoadingBarWithThemeModule = require(Modules.LuaApp.Components.LoadingBarWithTheme)
local RefreshScrollingFrameModule = require(Modules.LuaApp.Components.RefreshScrollingFrame)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Button = FoundationModule.Button
local View = FoundationModule.View
local InputSize = FoundationModule.Enums.InputSize
local RefreshScrollingFrameWithLoadMore = RoactModule.PureComponent:extend("RefreshScrollingFrameWithLoadMore")
RefreshScrollingFrameWithLoadMore.defaultProps = { preloadDistance = 2000 }

function RefreshScrollingFrameWithLoadMore.init(p1)
	-- upvalues: RoactModule (copy), SignalModule (copy), ScrollMovementDirectionModule (copy), View (copy), Button (copy), InputSize (copy), LoadingBarWithThemeModule (copy)
	p1._isMounted = false
	
	if type(p1.props.forwardRef) == "table" then
		p1.scrollingFrameRef = p1.props.forwardRef
	else
		p1.scrollingFrameRef = RoactModule.createRef()
	end
	function p1.setScrollingFrameRef(Current)
		-- upvalues: p1 (copy)
		p1.scrollingFrameRef.current = Current
		
		if p1.props.forwardRef and type(p1.props.forwardRef) == "function" then
			p1.props.forwardRef(Current)
		end
	end
	
	p1.scrollToTopSignal = SignalModule.new()
	
	function p1.scrollToTop()
		-- upvalues: p1 (copy)
		p1.scrollToTopSignal:fire()
	end
	
	p1.state = { isLoadingMore = false, isScrollable = false }
	p1.lastLoadMoreThreshold = 0
	p1.lastCanvasHeight = 0
	
	function p1.loadMore()
		-- upvalues: p1 (copy)
		local OnLoadMoreFunction = p1.props.onLoadMore
		p1:setState({ isLoadingMore = true })
		OnLoadMoreFunction():andThen(function()
			-- upvalues: p1 (upval)
			if p1._isMounted then
				p1:setState({ isLoadingMore = false })
			end
		end, function()
			-- upvalues: p1 (upval)
			if p1._isMounted then
				p1:setState({ isLoadingMore = false })
			end
			p1.lastLoadMoreThreshold = 0
		end)
	end
	
	p1.lastScrollPosition = 0
	p1.scrollMovementDirection = ScrollMovementDirectionModule.Backward
	
	function p1.checkScrollDirectionChanged(ScrollFrame)
		-- upvalues: p1 (copy), ScrollMovementDirectionModule (upval)
		local Y: number = ScrollFrame.CanvasPosition.Y
		
		if Y < 0 or Y == p1.lastScrollPosition then return end
		local Forward = if Y > p1.lastScrollPosition then ScrollMovementDirectionModule.Forward else ScrollMovementDirectionModule.Backward
		
		if Forward ~= p1.scrollMovementDirection then
			if p1.props.onScrollDirectionChanged ~= nil then
				p1.props.onScrollDirectionChanged(Forward)
			end
			p1.scrollMovementDirection = Forward
		end
		p1.lastScrollPosition = Y
	end
	
	function p1.onCanvasPositionChanged(ScrollFrame)
		-- upvalues: p1 (copy)
		local PreloadDistance = p1.props.preloadDistance
		local IsLoadingMore = p1.state.isLoadingMore
		local Y: number = ScrollFrame.CanvasPosition.Y
		
		if p1.props.onLoadMore and (not IsLoadingMore and (Y > 0 and not p1.props.loadMoreButtonText)) then
			if ScrollFrame.CanvasSize.Y.Scale ~= 0 then
				warn("RefreshScrollingFrame: Scrollingframe.CanvasSize.Y.Scale is not 0!\n\t\t\t\tContent loading would not work properly.")
				
				return
			end
			local OffsetDelta = ScrollFrame.CanvasSize.Y.Offset - (p1._absoluteWindowSize or ScrollFrame.AbsoluteWindowSize).Y - PreloadDistance
			
			if OffsetDelta < Y and (OffsetDelta ~= p1.lastLoadMoreThreshold and OffsetDelta ~= p1.lastLoadMoreThreshold + 56) then
				p1.lastLoadMoreThreshold = OffsetDelta
				p1.loadMore()
			end
		end
		if p1.props.onCanvasPositionChangedCallback then
			p1.props.onCanvasPositionChangedCallback(Y)
		end
		if p1.props.onScrollDirectionChanged ~= nil then
			p1.checkScrollDirectionChanged(ScrollFrame)
		end
	end
	
	function p1.onAbsoluteWindowSizeChanged(ScrollFrame)
		-- upvalues: p1 (copy)
		p1._absoluteWindowSize = ScrollFrame.AbsoluteWindowSize
		p1.onCanvasSizeChanged(ScrollFrame)
	end
	
	function p1.onCanvasSizeChanged(ScrollFrame)
		-- upvalues: p1 (copy)
		local Offset = ScrollFrame.CanvasSize.Y.Offset
		local Y = (p1._absoluteWindowSize or ScrollFrame.AbsoluteWindowSize).Y
		
		if Offset < p1.lastCanvasHeight and Offset ~= p1.lastCanvasHeight - 56 then
			p1.lastLoadMoreThreshold = 0
		end
		p1.lastCanvasHeight = Offset
		
		if Y == 0 then return end
		if not p1._isMounted then return end
		local IsOffsetAbove = Offset > Y
		
		if IsOffsetAbove ~= p1.state.isScrollable then
			p1:setState({ isScrollable = IsOffsetAbove })
		end
		if p1.props.onLoadMore and (not p1.state.isLoadingMore and (not IsOffsetAbove and (ScrollFrame.CanvasPosition.Y > 0 and not p1.props.loadMoreButtonText))) and not p1.props.initializing then
			p1.loadMore()
		end
	end
	
	function p1.createFooter()
		-- upvalues: p1 (copy), RoactModule (upval), View (upval), Button (upval), InputSize (upval), LoadingBarWithThemeModule (upval)
		local IsLoadingMore = p1.state.isLoadingMore
		
		return if IsLoadingMore or not p1.props.onLoadMore or not p1.props.loadMoreButtonText then IsLoadingMore and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 56)
		}, {
			LoadingBar = RoactModule.createElement(LoadingBarWithThemeModule)
		}) else RoactModule.createElement(View, {
			tag = "size-full-1200 row align-x-center align-y-center padding-x-xlarge padding-bottom-xxlarge"
		}, {
			RoactModule.createElement(Button, {
				fillBehavior = "Fill",
				size = InputSize.Large,
				onActivated = p1.loadMore,
				text = p1.props.loadMoreButtonText
			})
		})
	end
end

function RefreshScrollingFrameWithLoadMore.didMount(p1)
	p1._isMounted = true
	local Current = p1.scrollingFrameRef.current
	
	if Current then
		p1.onCanvasSizeChanged(Current)
		p1._absoluteWindowSize = Current.AbsoluteWindowSize
	end
end

function RefreshScrollingFrameWithLoadMore.willUnmount(p1)
	p1._isMounted = false
end

function RefreshScrollingFrameWithLoadMore.render(p1)
	-- upvalues: CryoModule (copy), RoactModule (copy), RefreshScrollingFrameModule (copy)
	return RoactModule.createElement(RefreshScrollingFrameModule, CryoModule.Dictionary.join(p1.props, {
		onCanvasPositionChangedCallback = p1.onCanvasPositionChanged,
		onCanvasSizeChangedCallback = p1.onCanvasSizeChanged,
		onAbsoluteWindowSizeChangedCallback = p1.onAbsoluteWindowSizeChanged,
		createFooter = p1.createFooter,
		onLoadMore = CryoModule.None,
		bottomPadding = p1.props.bottomPadding,
		[RoactModule.Children] = CryoModule.None,
		[RoactModule.Ref] = p1.setScrollingFrameRef
	}), p1.props[RoactModule.Children])
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), RefreshScrollingFrameWithLoadMore (copy), CryoModule (copy)
	return RoactModule.createElement(RefreshScrollingFrameWithLoadMore, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)