local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local slidingDirectionModule = require(parent_2.Core.Animation.Enum.SlidingDirection)
local slidingContainerModule = require(parent_2.Core.Animation.SlidingContainer)
local validateColorInfoModule = require(parent_2.Core.Style.Validator.validateColorInfo)
local stateTableModule = require(parent_2.StateTable.StateTable)
local buttonTypeModule = require(parent_1.Button.Enum.ButtonType)
local animationStateModule = require(parent.Enum.AnimationState)
local informativeToastModule = require(parent.InformativeToast)
local interactiveToastModule = require(parent.InteractiveToast)
local toastContainerModule = require(parent.ToastContainer)
local toast = roactModule.PureComponent:extend("Toast")
toast.validateProps = tModule.strictInterface({
	anchorPoint = tModule.optional(tModule.Vector2),
	duration = tModule.optional(tModule.number),
	layoutOrder = tModule.optional(tModule.integer),
	position = tModule.optional(tModule.UDim2),
	show = tModule.optional(tModule.boolean),
	size = tModule.optional(tModule.UDim2),
	springOptions = tModule.optional(tModule.table),
	toastContent = tModule.strictInterface({
		buttonText = tModule.optional(tModule.string),
		iconColorStyle = tModule.optional(validateColorInfoModule),
		iconImage = tModule.optional(tModule.union(tModule.table, tModule.string, tModule.callback)),
		iconSize = tModule.optional(tModule.Vector2),
		iconChildren = tModule.optional(tModule.table),
		onActivated = tModule.optional(tModule.callback),
		onAppeared = tModule.optional(tModule.callback),
		onDismissed = tModule.optional(tModule.callback),
		swipeUpDismiss = tModule.optional(tModule.boolean),
		toastSubtitle = tModule.optional(tModule.string),
		sequenceNumber = tModule.optional(tModule.integer),
		toastTitle = tModule.string,
		buttonType = tModule.optional(buttonTypeModule.isEnumValue),
		onTouchSwipeUp = tModule.optional(tModule.callback)
	})
})
toast.defaultProps = {
	show = true,
	anchorPoint = Vector2.new(0.5, 0),
	position = UDim2.new(0.5, 0, 0, 20)
}

local function toastContentEqual(p1, p2)
	return p1.iconColorStyle == p2.iconColorStyle and p1.iconImage == p2.iconImage and (p1.iconSize == p2.iconSize and p1.iconChildren == p2.iconChildren) and (p1.onActivated == p2.onActivated and p1.onDismissed == p2.onDismissed and (p1.sequenceNumber == p2.sequenceNumber and p1.swipeUpDismiss == p2.swipeUpDismiss)) and (p1.toastSubtitle == p2.toastSubtitle and p1.toastTitle == p2.toastTitle)
end

function toast.init(p1)
	-- upvalues: animationStateModule (ref), roactModule (ref), interactiveToastModule (ref), informativeToastModule (ref), stateTableModule (ref)
	p1.isMounted = false
	p1.currentToastContent = p1.props.toastContent
	
	function p2.onActivated()
		-- upvalues: p1 (ref)
		p1.stateTable.events.Activated({ activated = true })
	end
	
	function p2.onAppeared()
		-- upvalues: p1 (ref)
		if p1.currentToastContent.onAppeared then
			p1.currentToastContent.onAppeared()
		end
		local duration = p1.props.duration
		
		if duration and duration > 0 then
			local currentToastContent = p1.currentToastContent
			delay(duration, function()
				-- upvalues: currentToastContent (ref), p1 (copy)
				if currentToastContent == p1.currentToastContent then
					p1.stateTable.events.AutoDismiss()
				end
			end)
		end
	end
	
	function p2.onComplete()
		-- upvalues: p1 (ref), animationStateModule (copy)
		local duration = p1.props.duration
		
		if p1.state.currentState == animationStateModule.Appearing and duration and duration <= 0 then
			p1.stateTable.events.AutoDismiss()
			
			return
		end
		p1.stateTable.events.AnimationComplete()
	end
	
	function p2.onDisappeared()
		-- upvalues: p1 (ref)
		if p1.state.context.activated then
			if p1.currentToastContent.onActivated then
				p1.currentToastContent.onActivated()
				
				return
			end
		elseif p1.currentToastContent.onDismissed then
			p1.currentToastContent.onDismissed()
		end
	end
	
	function p2.onTouchSwipe(_, p2)
		-- upvalues: p1 (ref)
		if p2 == Enum.SwipeDirection.Up then
			p1.stateTable.events.ForceDismiss()
			
			if p1.currentToastContent.onTouchSwipeUp then
				p1.currentToastContent.onTouchSwipeUp()
			end
		end
	end
	
	function p2.renderInteractiveToast(p2)
		-- upvalues: roactModule (copy), interactiveToastModule (copy)
		return roactModule.createElement(interactiveToastModule, p2)
	end
	
	function p2.renderInformativeToast(p2)
		-- upvalues: roactModule (copy), informativeToastModule (copy)
		return roactModule.createElement(informativeToastModule, p2)
	end
	
	function p2.setContext(_, _, p2)
		return p2
	end
	
	function p2.updateToastContent()
		-- upvalues: p1 (ref)
		if p1.currentToastContent ~= p1.props.toastContent then
			p1.currentToastContent = p1.props.toastContent
			
			if p1.props.show then
				p1.stateTable.events.ForceAppear({ activated = false })
			end
		end
	end
	
	local disappeared = animationStateModule.Disappeared
	p1.state = {
		currentState = disappeared,
		context = { activated = false }
	}
	p1.stateTable = stateTableModule.new(string.format("Animated(%s)", tostring(p1)), disappeared, {}, {
		[animationStateModule.Appearing] = {
			AnimationComplete = {
				nextState = animationStateModule.Appeared,
				action = p1.onAppeared
			},
			AutoDismiss = {
				nextState = animationStateModule.Disappearing,
				action = p1.onAppeared
			},
			ContentChanged = { nextState = animationStateModule.Disappearing },
			ForceDismiss = { nextState = animationStateModule.Disappearing }
		},
		[animationStateModule.Appeared] = {
			Activated = {
				nextState = animationStateModule.Disappearing,
				action = p1.setContext
			},
			AutoDismiss = { nextState = animationStateModule.Disappearing },
			ContentChanged = { nextState = animationStateModule.Disappearing },
			ForceDismiss = { nextState = animationStateModule.Disappearing }
		},
		[animationStateModule.Disappearing] = {
			AnimationComplete = {
				nextState = animationStateModule.Disappeared,
				action = p1.onDisappeared
			}
		},
		[animationStateModule.Disappeared] = {
			ContentChanged = {
				nextState = animationStateModule.Appearing,
				action = p1.updateToastContent
			},
			ForceAppear = {
				nextState = animationStateModule.Appearing,
				action = p1.setContext
			}
		}
	})
	p1.stateTable:onStateChange(function(p2, p3, p4)
		-- upvalues: p1 (ref)
		if p1.isMounted and p2 ~= p3 then
			p1:setState({ currentState = p3, context = p4 })
		end
	end)
end

function toast.isShowing(p1)
	-- upvalues: animationStateModule (ref)
	return if p1.state.currentState ~= animationStateModule.Appearing then p1.state.currentState == animationStateModule.Appeared else true
end

function toast.render(p1)
	-- upvalues: roactModule (ref), slidingContainerModule (ref), slidingDirectionModule (ref), toastContainerModule (ref)
	local onActivated = p1.currentToastContent.onActivated
	local swipeUpDismiss = p1.currentToastContent.swipeUpDismiss
	
	if swipeUpDismiss == nil then
		swipeUpDismiss = true
	end
	return roactModule.createElement(slidingContainerModule, {
		show = p1:isShowing(),
		layoutOrder = p1.props.layoutOrder,
		onComplete = p1.onComplete,
		slidingDirection = slidingDirectionModule.Down,
		springOptions = p1.props.springOptions
	}, {
		ToastContainer = roactModule.createElement(toastContainerModule, {
			anchorPoint = p1.props.anchorPoint,
			buttonText = p1.currentToastContent.buttonText,
			position = p1.props.position,
			size = p1.props.size,
			iconColorStyle = p1.currentToastContent.iconColorStyle,
			iconImage = p1.currentToastContent.iconImage,
			iconSize = p1.currentToastContent.iconSize,
			iconChildren = p1.currentToastContent.iconChildren,
			onActivated = onActivated and p1.onActivated,
			onTouchSwipe = swipeUpDismiss and p1.onTouchSwipe,
			renderToast = if onActivated then p1.renderInteractiveToast else p1.renderInformativeToast,
			toastSubtitle = p1.currentToastContent.toastSubtitle,
			toastTitle = p1.currentToastContent.toastTitle,
			buttonType = p1.currentToastContent.buttonType
		})
	})
end

function toast.didMount(p1)
	p1.isMounted = true
	
	if p1.props.show then
		p1.stateTable.events.ForceAppear({ activated = false })
	end
end

function toast.willUnmount(p1)
	p1.isMounted = false
end

function toast.didUpdate(p1, p2, p3)
	-- upvalues: toastContentEqual (ref), animationStateModule (ref)
	if p2.show ~= p1.props.show then
		if p1.props.show then
			p1.stateTable.events.ForceAppear({ activated = false })
		else
			p1.stateTable.events.ForceDismiss()
		end
	end
	if not toastContentEqual(p2.toastContent, p1.props.toastContent) then
		p1.stateTable.events.ContentChanged({ activated = false })
	end
	if p3.currentState ~= p1.state.currentState and p1.state.currentState == animationStateModule.Disappeared then
		p1.updateToastContent()
	end
end

return toast