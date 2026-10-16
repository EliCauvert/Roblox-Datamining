local UserInputService = game:GetService("UserInputService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local Otter = DependenciesModule.Otter
local T = DependenciesModule.t
local Cryo = DependenciesModule.Cryo
local WithStyleFunction = UIBlox.Style.withStyle
local ExternalEventConnectionModule = require(script.Parent.ExternalEventConnection)
local SpinnerModule = require(script.Parent.Spinner)
local IconSize = UIBlox.App.ImageSet.getIconSize(UIBlox.App.ImageSet.Enum.IconSize.Medium)
local config = { dampingRatio = 1, frequency = 3.5 }

local function _(p1, p2, p3: number) --[[ Line: 37 | Named "lerp" ]]
	local Smallest = math.min(1, (math.max(0, p3)))
	
	return p1 * (1 - Smallest) + p2 * Smallest
end

local RefreshScrollingFrameNew = Roact.PureComponent:extend("RefreshScrollingFrameNew")
RefreshScrollingFrameNew.defaultProps = {
	ScrollingElement = "ScrollingFrame",
	refreshThreshold = 52,
	scrollingElementProps = {}
}
RefreshScrollingFrameNew.validateProps = T.interface({
	ScrollingElement = T.union(T.string, T.callback, T.table),
	scrollingElementProps = T.optional(T.table),
	refreshThreshold = T.number,
	forwardRef = T.optional(T.table),
	onCanvasPositionChangedCallback = T.optional(T.callback),
	onStatusBarTapped = T.optional(T.callback),
	refresh = T.optional(T.callback),
	usesBuilderIcon = T.optional(T.boolean),
	[Roact.Children] = T.optional(T.any)
})

function RefreshScrollingFrameNew.init(p1) --[[ Line: 67 ]]
	-- upvalues: RefreshScrollingFrameNew (copy), Roact (copy), Otter (copy), config (copy), UserGameSettings (copy)
	p1.state = { isRefreshing = false }
	p1.startHeight = 0
	p1.isUserInteracting = false
	local ForwardRefFunction = p1.props.forwardRef
	assert(type(ForwardRefFunction) ~= "function", ("%s does not support function ref forwarding"):format((tostring(RefreshScrollingFrameNew))))
	p1.scrollingFrameRef = ForwardRefFunction or Roact.createRef()
	p1.spinnerFrameRef = Roact.createRef()
	p1.spinnerRef = Roact.createRef()
	
	function p1.updateSpinner(YOffset) --[[ Line: 88 ]]
		-- upvalues: p1 (copy)
		if p1.spinnerFrameRef.current then
			p1.spinnerFrameRef.current.Size = UDim2.new(1, 0, 0, YOffset)
			local YOffsetRatio = YOffset / p1.props.refreshThreshold
			
			if p1.props.usesBuilderIcon then
				local Smallest = math.min(1, (math.max(0, YOffsetRatio)))
				p1.spinnerRef.current.TextTransparency = 1 * (1 - Smallest) + 0 * Smallest
			else
				local Smallest = math.min(1, (math.max(0, YOffsetRatio)))
				p1.spinnerRef.current.ImageTransparency = 1 * (1 - Smallest) + 0 * Smallest
			end
			if not p1.state.isRefreshing then
				local Smallest = math.min(1, (math.max(0, YOffsetRatio)))
				p1.spinnerRef.current.Rotation = -240 * (1 - Smallest) + 0 * Smallest
			end
		end
	end
	
	p1.motor = Otter.createSingleMotor(0)
	p1.motor:onStep(p1.updateSpinner)
	
	function p1.resetSpinner() --[[ Line: 119 ]]
		-- upvalues: p1 (copy), Otter (upval), config (upval)
		p1.motor:setGoal(Otter.spring(0, config))
	end
	
	function p1.scrollBack() --[[ Line: 123 ]]
		-- upvalues: p1 (copy), UserGameSettings (upval)
		if p1.scrollingFrameRef.current then
			if UserGameSettings.ReducedMotion then
				p1.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0)
				
				return
			end
			p1.scrollingFrameRef.current:ScrollToTop()
		end
	end
	
	function p1.dispatchRefresh() --[[ Line: 133 ]]
		-- upvalues: p1 (copy), Otter (upval), config (upval)
		local RefreshFunction = p1.props.refresh
		local RefreshThreshold = p1.props.refreshThreshold
		local IsRefreshing = p1.state.isRefreshing
		
		if RefreshFunction == nil then return end
		if not IsRefreshing then
			p1:setState({ isRefreshing = true })
			p1.motor:setGoal(Otter.spring(RefreshThreshold, config))
			
			local function onRefreshComplete() --[[ Line: 149 ]]
				-- upvalues: p1 (upval)
				if p1.isMounted then
					p1:setState({ isRefreshing = false })
					p1.resetSpinner()
				end
			end
			
			RefreshFunction():andThen(onRefreshComplete, onRefreshComplete)
		end
	end
	
	function p1:onInputBegan() --[[ Line: 162 ]]
		-- upvalues: p1 (copy)
		if not p1.isUserInteracting then
			p1.startHeight = p1.scrollingFrameRef.current.CanvasPosition.Y
		end
		p1.isUserInteracting = true
	end
	
	function p1:onInputEnded() --[[ Line: 171 ]]
		-- upvalues: p1 (copy)
		p1.isUserInteracting = false
		local StartHeight = p1.startHeight
		p1.startHeight = 0
		
		if p1.props.refresh ~= nil and p1.scrollingFrameRef.current then
			local Negated = -p1.scrollingFrameRef.current.CanvasPosition.Y
			
			if p1.props.refreshThreshold < Negated and StartHeight < Negated then
				p1.dispatchRefresh()
				
				return
			end
			if Negated > 0 then
				p1.resetSpinner()
			end
		end
	end
	
	function p1.statusBarTapCallback() --[[ Line: 191 ]]
		-- upvalues: p1 (copy)
		if p1.props.onStatusBarTapped then
			p1.props.onStatusBarTapped()
		end
		p1.scrollBack()
	end
	
	function p1.onCanvasPositionChanged(ScrollFrame) --[[ Line: 198 ]]
		-- upvalues: p1 (copy), Otter (upval)
		if p1.props.onCanvasPositionChangedCallback ~= nil then
			p1.props.onCanvasPositionChangedCallback(ScrollFrame)
		end
		if p1.props.refresh ~= nil and p1.isUserInteracting and not p1.state.isRefreshing then
			local Negated = -ScrollFrame.CanvasPosition.Y
			local RefreshThreshold = p1.props.refreshThreshold
			
			if Negated >= 0 and Negated <= RefreshThreshold then
				p1.motor:setGoal(Otter.instant(Negated))
			end
		end
	end
	
	function p1.onCanvasSizeChanged(p2) --[[ Line: 213 ]]
		-- upvalues: p1 (copy)
		if p1.props.onCanvasSizeChangedCallback ~= nil then
			p1.props.onCanvasSizeChangedCallback(p2)
		end
	end
end

function RefreshScrollingFrameNew.didMount(p1) --[[ Line: 220 ]]
	p1.isMounted = true
	p1.resetSpinner()
end

function RefreshScrollingFrameNew.willUnmount(p1) --[[ Line: 225 ]]
	p1.isMounted = false
	p1.motor:destroy()
	p1.motor = nil
end

function RefreshScrollingFrameNew.render(p1) --[[ Line: 232 ]]
	-- upvalues: Roact (copy), WithStyleFunction (copy), Cryo (copy), SpinnerModule (copy), IconSize (copy), ExternalEventConnectionModule (copy), UserInputService (copy)
	local Prop = p1.props[Roact.Children]
	local IsRefreshing = p1.state.isRefreshing
	
	return WithStyleFunction(function(_) --[[ Line: 236 ]]
		-- upvalues: Roact (upval), p1 (copy), Cryo (upval), SpinnerModule (upval), IconSize (upval), IsRefreshing (copy), Prop (copy), ExternalEventConnectionModule (upval), UserInputService (upval)
		return Roact.createElement(p1.props.ScrollingElement, Cryo.Dictionary.join({
			[Roact.Change.CanvasPosition] = p1.onCanvasPositionChanged,
			[Roact.Change.CanvasSize] = p1.onCanvasSizeChanged,
			[Roact.Ref] = p1.scrollingFrameRef
		}, p1.props.scrollingElementProps), {
			Layout = Roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			SpinnerFrame = Roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				[Roact.Ref] = p1.spinnerFrameRef
			}, {
				Spinner = Roact.createElement(SpinnerModule, {
					Size = UDim2.new(0, IconSize, 0, IconSize),
					AnchorPoint = Vector2.new(0.5, 1),
					Position = UDim2.new(0.5, 0, 1, 0),
					isSpinning = IsRefreshing,
					[Roact.Ref] = p1.spinnerRef
				})
			}),
			Content = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 1, 0)
			}, Prop),
			inputBegan = Roact.createElement(ExternalEventConnectionModule, {
				event = UserInputService.InputBegan,
				callback = p1.onInputBegan
			}),
			inputEnded = Roact.createElement(ExternalEventConnectionModule, {
				event = UserInputService.InputEnded,
				callback = p1.onInputEnded
			}),
			statusBarTapped = Roact.createElement(ExternalEventConnectionModule, {
				event = UserInputService.StatusBarTapped,
				callback = p1.statusBarTapCallback
			})
		})
	end)
end

return Roact.forwardRef(function(p1, ForwardRef) --[[ Line: 289 ]]
	-- upvalues: Roact (copy), RefreshScrollingFrameNew (copy), Cryo (copy)
	return Roact.createElement(RefreshScrollingFrameNew, Cryo.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)