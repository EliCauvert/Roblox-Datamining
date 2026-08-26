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
local var1 = getIconSize(UIBlox.App.ImageSet.Enum.IconSize.Medium)
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

function refreshScrollingFrameNew.init(p1)
	-- upvalues: refreshScrollingFrameNew (ref), roact (ref), otter (ref), t_1 (ref), userGameSettingsService (ref)
	p1.state = { isRefreshing = false }
	p1.startHeight = 0
	p1.isUserInteracting = false
	local forwardRef = p1.props.forwardRef
	assert(type(forwardRef) ~= "function", ("%s does not support function ref forwarding"):format(tostring(refreshScrollingFrameNew)))
	p1.scrollingFrameRef = forwardRef or roact.createRef()
	p1.spinnerFrameRef = roact.createRef()
	p1.spinnerRef = roact.createRef()
	
	function p0.updateSpinner(p2)
		-- upvalues: p1 (ref)
		if p1.spinnerFrameRef.current then
			p1.spinnerFrameRef.current.Size = UDim2.new(1, 0, 0, p2)
			local var2 = p2 / p1.props.refreshThreshold
			
			if p1.props.usesBuilderIcon then
				local minValue = math.min(1, math.max(0, var2))
				p1.spinnerRef.current.TextTransparency = 1 * (1 - minValue) + 0 * minValue
			else
				local minValue = math.min(1, math.max(0, var2))
				p1.spinnerRef.current.ImageTransparency = 1 * (1 - minValue) + 0 * minValue
			end
			if not p1.state.isRefreshing then
				local minValue = math.min(1, math.max(0, var2))
				p1.spinnerRef.current.Rotation = -240 * (1 - minValue) + 0 * minValue
			end
		end
	end
	
	p1.motor = otter.createSingleMotor(0)
	p1.motor:onStep(p1.updateSpinner)
	
	function p0.resetSpinner()
		-- upvalues: p1 (ref), otter (copy), t_1 (copy)
		p1.motor:setGoal(otter.spring(0, t_1))
	end
	
	function p0.scrollBack()
		-- upvalues: p1 (ref), userGameSettingsService (copy)
		if p1.scrollingFrameRef.current then
			if userGameSettingsService.ReducedMotion then
				p1.scrollingFrameRef.current.CanvasPosition = Vector2.new(0, 0)
				
				return
			end
			p1.scrollingFrameRef.current:ScrollToTop()
		end
	end
	
	function p0.dispatchRefresh()
		-- upvalues: p1 (ref), otter (copy), t_1 (copy)
		local refresh = p1.props.refresh
		local refreshThreshold = p1.props.refreshThreshold
		local isRefreshing = p1.state.isRefreshing
		
		if refresh == nil then return end
		if not isRefreshing then
			p1:setState({ isRefreshing = true })
			p1.motor:setGoal(otter.spring(refreshThreshold, t_1))
			
			local function onRefreshComplete()
				-- upvalues: p1 (copy)
				if p1.isMounted then
					p1:setState({ isRefreshing = false })
					p1.resetSpinner()
				end
			end
			
			refresh():andThen(onRefreshComplete, onRefreshComplete)
		end
	end
	
	function p0.onInputBegan(_)
		-- upvalues: p1 (ref)
		if not p1.isUserInteracting then
			p1.startHeight = p1.scrollingFrameRef.current.CanvasPosition.Y
		end
		p1.isUserInteracting = true
	end
	
	function p0.onInputEnded(_)
		-- upvalues: p1 (ref)
		p1.isUserInteracting = false
		local startHeight = p1.startHeight
		p1.startHeight = 0
		
		if p1.props.refresh ~= nil and p1.scrollingFrameRef.current then
			local var2 = -p1.scrollingFrameRef.current.CanvasPosition.Y
			
			if p1.props.refreshThreshold < var2 and startHeight < var2 then
				p1.dispatchRefresh()
				
				return
			elseif var2 > 0 then
				p1.resetSpinner()
			end
		end
	end
	
	function p0.statusBarTapCallback()
		-- upvalues: p1 (ref)
		if p1.props.onStatusBarTapped then
			p1.props.onStatusBarTapped()
		end
		p1.scrollBack()
	end
	
	function p0.onCanvasPositionChanged(p2)
		-- upvalues: p1 (ref), otter (copy)
		if p1.props.onCanvasPositionChangedCallback ~= nil then
			p1.props.onCanvasPositionChangedCallback(p2)
		end
		if p1.props.refresh ~= nil and p1.isUserInteracting and not p1.state.isRefreshing then
			local var2 = -p2.CanvasPosition.Y
			
			if var2 >= 0 and var2 <= p1.props.refreshThreshold then
				p1.motor:setGoal(otter.instant(var2))
			end
		end
	end
	
	function p0.onCanvasSizeChanged(p2)
		-- upvalues: p1 (ref)
		if p1.props.onCanvasSizeChangedCallback ~= nil then
			p1.props.onCanvasSizeChangedCallback(p2)
		end
	end
end

function refreshScrollingFrameNew.didMount(p1)
	p1.isMounted = true
	p1.resetSpinner()
end

function refreshScrollingFrameNew.willUnmount(p1)
	p1.isMounted = false
	p1.motor:destroy()
	p1.motor = nil
end

function refreshScrollingFrameNew.render(p1)
	-- upvalues: roact (ref), withStyle (ref), cryo (ref), spinnerModule (ref), var1 (ref), externalEventConnectionModule (ref), userInputService (ref)
	local children = p1.props[roact.Children]
	local isRefreshing = p1.state.isRefreshing
	
	return withStyle(function(_)
		-- upvalues: roact (copy), p1 (ref), cryo (copy), spinnerModule (copy), var1 (copy), isRefreshing (ref), children (ref), externalEventConnectionModule (copy), userInputService (copy)
		return roact.createElement(p1.props.ScrollingElement, cryo.Dictionary.join({
			[roact.Change.CanvasPosition] = p1.onCanvasPositionChanged,
			[roact.Change.CanvasSize] = p1.onCanvasSizeChanged,
			[roact.Ref] = p1.scrollingFrameRef
		}, p1.props.scrollingElementProps), {
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
				[roact.Ref] = p1.spinnerFrameRef
			}, {
				Spinner = roact.createElement(spinnerModule, {
					Size = UDim2.new(0, var1, 0, var1),
					AnchorPoint = Vector2.new(0.5, 1),
					Position = UDim2.new(0.5, 0, 1, 0),
					isSpinning = isRefreshing,
					[roact.Ref] = p1.spinnerRef
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
				callback = p1.onInputBegan
			}),
			inputEnded = roact.createElement(externalEventConnectionModule, {
				event = userInputService.InputEnded,
				callback = p1.onInputEnded
			}),
			statusBarTapped = roact.createElement(externalEventConnectionModule, {
				event = userInputService.StatusBarTapped,
				callback = p1.statusBarTapCallback
			})
		})
	end)
end

return roact.forwardRef(function(p1, p2)
	-- upvalues: roact (ref), refreshScrollingFrameNew (ref), cryo (ref)
	return roact.createElement(refreshScrollingFrameNew, cryo.Dictionary.join(p1, { forwardRef = p2 }))
end)