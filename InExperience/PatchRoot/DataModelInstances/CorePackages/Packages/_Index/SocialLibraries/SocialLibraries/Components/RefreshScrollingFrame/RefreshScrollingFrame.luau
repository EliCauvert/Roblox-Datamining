local userInputService = game:GetService("UserInputService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local otter = dependenciesModule.Otter
local t = dependenciesModule.t
local cryo = dependenciesModule.Cryo
local withStyle = UIBlox.Style.withStyle
local getIconSize = UIBlox.App.ImageSet.getIconSize
local externalEventConnectionModule = require(script.Parent.ExternalEventConnection)
local spinnerModule = require(script.Parent.Spinner)
local var5 = getIconSize(UIBlox.App.ImageSet.Enum.IconSize.Medium)
local _ = { Start = -240, End = 0 }
local _ = { Start = 1, End = 0 }
local t_1 = { dampingRatio = 1, frequency = 3.5 }

local function _(startValue, endValue, alpha)
	local minValue = math.min(1, math.max(0, alpha))
	
	return startValue * (1 - minValue) + endValue * minValue
end

local refreshScrollingFrameNew = roact.PureComponent:extend("RefreshScrollingFrameNew")
refreshScrollingFrameNew.defaultProps = {
	ScrollingElement = "ScrollingFrame",
	refreshThreshold = 52,
	scrollingElementProps = {}
}
refreshScrollingFrameNew.validateProps = t.interface({
	ScrollingElement = t.union(t.string, t.callback, t.table),
	scrollingElementProps = t.optional(t.table),
	refreshThreshold = t.number,
	forwardRef = t.optional(t.table),
	onCanvasPositionChangedCallback = t.optional(t.callback),
	onStatusBarTapped = t.optional(t.callback),
	refresh = t.optional(t.callback),
	usesBuilderIcon = t.optional(t.boolean),
	[roact.Children] = t.optional(t.any)
})

function refreshScrollingFrameNew.init(p0)
	-- upvalues: refreshScrollingFrameNew (ref), roact (ref), otter (ref), t_1 (ref), userGameSettingsService (ref)
	p0.state = { isRefreshing = false }
	p0.startHeight = 0
	p0.isUserInteracting = false
	local forwardRef = p0.props.forwardRef
	assert(type(forwardRef) ~= "function", ("%s does not support function ref forwarding"):format(tostring(refreshScrollingFrameNew)))
	p0.scrollingFrameRef = forwardRef or roact.createRef()
	p0.spinnerFrameRef = roact.createRef()
	p0.spinnerRef = roact.createRef()
	
	function p0.updateSpinner(p1)
		-- upvalues: p0 (ref)
		if p0.spinnerFrameRef.current then
			p0.spinnerFrameRef.current.Size = UDim2.new(1, 0, 0, p1)
			local var9 = p1 / p0.props.refreshThreshold
			
			if p0.props.usesBuilderIcon then
				local minValue = math.min(1, math.max(0, var9))
				p0.spinnerRef.current.TextTransparency = 1 * (1 - minValue) + 0 * minValue
			else
				local minValue = math.min(1, math.max(0, var9))
				p0.spinnerRef.current.ImageTransparency = 1 * (1 - minValue) + 0 * minValue
			end
			if not p0.state.isRefreshing then
				local minValue = math.min(1, math.max(0, var9))
				p0.spinnerRef.current.Rotation = -240 * (1 - minValue) + 0 * minValue
			end
		end
	end
	
	p0.motor = otter.createSingleMotor(0)
	p0.motor:onStep(p0.updateSpinner)
	
	function p0.resetSpinner()
		-- upvalues: p0 (ref), otter (copy), t_1 (copy)
		p0.motor:setGoal(otter.spring(0, t_1))
	end
	
	function p0.scrollBack()
		-- upvalues: p0 (ref), userGameSettingsService (copy)
		if p0.scrollingFrameRef.current then
			if userGameSettingsService.ReducedMotion then
				p0.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0)
				
				return
			end
			p0.scrollingFrameRef.current:ScrollToTop()
		end
	end
	
	function p0.dispatchRefresh()
		-- upvalues: p0 (ref), otter (copy), t_1 (copy)
		local refresh = p0.props.refresh
		local refreshThreshold = p0.props.refreshThreshold
		local isRefreshing = p0.state.isRefreshing
		
		if refresh == nil then return end
		if not isRefreshing then
			p0:setState({ isRefreshing = true })
			p0.motor:setGoal(otter.spring(refreshThreshold, t_1))
			
			local function onRefreshComplete()
				-- upvalues: p0 (copy)
				if p0.isMounted then
					p0:setState({ isRefreshing = false })
					p0.resetSpinner()
				end
			end
			
			refresh():andThen(onRefreshComplete, onRefreshComplete)
		end
	end
	
	function p0.onInputBegan(_)
		-- upvalues: p0 (ref)
		if not p0.isUserInteracting then
			p0.startHeight = p0.scrollingFrameRef.current.CanvasPosition.Y
		end
		p0.isUserInteracting = true
	end
	
	function p0.onInputEnded(_)
		-- upvalues: p0 (ref)
		p0.isUserInteracting = false
		local startHeight = p0.startHeight
		p0.startHeight = 0
		
		if p0.props.refresh ~= nil and p0.scrollingFrameRef.current then
			local var14 = -p0.scrollingFrameRef.current.CanvasPosition.Y
			
			if p0.props.refreshThreshold < var14 and startHeight < var14 then
				p0.dispatchRefresh()
				
				return
			elseif var14 > 0 then
				p0.resetSpinner()
			end
		end
	end
	
	function p0.statusBarTapCallback()
		-- upvalues: p0 (ref)
		if p0.props.onStatusBarTapped then
			p0.props.onStatusBarTapped()
		end
		p0.scrollBack()
	end
	
	function p0.onCanvasPositionChanged(p2)
		-- upvalues: p0 (ref), otter (copy)
		if p0.props.onCanvasPositionChangedCallback ~= nil then
			p0.props.onCanvasPositionChangedCallback(p2)
		end
		if p0.props.refresh ~= nil and p0.isUserInteracting and not p0.state.isRefreshing then
			local var15 = -p2.CanvasPosition.Y
			
			if var15 >= 0 and var15 <= p0.props.refreshThreshold then
				p0.motor:setGoal(otter.instant(var15))
			end
		end
	end
	
	function p0.onCanvasSizeChanged(p3)
		-- upvalues: p0 (ref)
		if p0.props.onCanvasSizeChangedCallback ~= nil then
			p0.props.onCanvasSizeChangedCallback(p3)
		end
	end
end

function refreshScrollingFrameNew.didMount(p4)
	p4.isMounted = true
	p4.resetSpinner()
end

function refreshScrollingFrameNew.willUnmount(p5)
	p5.isMounted = false
	p5.motor:destroy()
	p5.motor = nil
end

function refreshScrollingFrameNew.render(p6)
	-- upvalues: roact (ref), withStyle (ref), cryo (ref), spinnerModule (ref), var5 (ref), externalEventConnectionModule (ref), userInputService (ref)
	local children = p6.props[roact.Children]
	local isRefreshing = p6.state.isRefreshing
	
	return withStyle(function(_)
		-- upvalues: roact (copy), p6 (ref), cryo (copy), spinnerModule (copy), var5 (copy), isRefreshing (ref), children (ref), externalEventConnectionModule (copy), userInputService (copy)
		return roact.createElement(p6.props.ScrollingElement, cryo.Dictionary.join({
			[roact.Change.CanvasPosition] = p6.onCanvasPositionChanged,
			[roact.Change.CanvasSize] = p6.onCanvasSizeChanged,
			[roact.Ref] = p6.scrollingFrameRef
		}, p6.props.scrollingElementProps), {
			Layout = roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			SpinnerFrame = roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				[roact.Ref] = p6.spinnerFrameRef
			}, {
				Spinner = roact.createElement(spinnerModule, {
					Size = UDim2.new(0, var5, 0, var5),
					AnchorPoint = Vector2.new(0.5, 1),
					Position = UDim2.new(0.5, 0, 1, 0),
					isSpinning = isRefreshing,
					[roact.Ref] = p6.spinnerRef
				})
			}),
			Content = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 1, 0)
			}, children),
			inputBegan = roact.createElement(externalEventConnectionModule, {
				event = userInputService.InputBegan,
				callback = p6.onInputBegan
			}),
			inputEnded = roact.createElement(externalEventConnectionModule, {
				event = userInputService.InputEnded,
				callback = p6.onInputEnded
			}),
			statusBarTapped = roact.createElement(externalEventConnectionModule, {
				event = userInputService.StatusBarTapped,
				callback = p6.statusBarTapCallback
			})
		})
	end)
end

return roact.forwardRef(function(p7, p8)
	-- upvalues: roact (ref), refreshScrollingFrameNew (ref), cryo (ref)
	return roact.createElement(refreshScrollingFrameNew, cryo.Dictionary.join(p7, { forwardRef = p8 }))
end)