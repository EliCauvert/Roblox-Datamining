local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local SlidingDirectionModule = require(Parent2.Core.Animation.Enum.SlidingDirection)
local SlidingContainerModule = require(Parent2.Core.Animation.SlidingContainer)
local StateTableModule = require(Parent2.StateTable.StateTable)
local AnimationStateModule = require(Parent.Enum.AnimationState)
local InformativeToastModule = require(Parent.InformativeToast)
local InteractiveToastModule = require(Parent.InteractiveToast)
local ToastContainerModule = require(Parent.ToastContainer)
local Toast = RoactModule.PureComponent:extend("Toast")
Toast.validateProps = TModule.strictInterface({
	anchorPoint = TModule.optional(TModule.Vector2),
	duration = TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.integer),
	position = TModule.optional(TModule.UDim2),
	show = TModule.optional(TModule.boolean),
	size = TModule.optional(TModule.UDim2),
	springOptions = TModule.optional(TModule.table),
	toastContent = TModule.strictInterface({
		buttonText = TModule.optional(TModule.string),
		iconColorStyle = TModule.optional((require(Parent2.Core.Style.Validator.validateColorInfo))),
		iconImage = TModule.optional(TModule.union(TModule.table, TModule.string, TModule.callback)),
		iconSize = TModule.optional(TModule.Vector2),
		iconChildren = TModule.optional(TModule.table),
		onActivated = TModule.optional(TModule.callback),
		onAppeared = TModule.optional(TModule.callback),
		onDismissed = TModule.optional(TModule.callback),
		swipeUpDismiss = TModule.optional(TModule.boolean),
		toastSubtitle = TModule.optional(TModule.string),
		sequenceNumber = TModule.optional(TModule.integer),
		toastTitle = TModule.string,
		buttonType = TModule.optional(require(Parent1.Button.Enum.ButtonType).isEnumValue),
		onTouchSwipeUp = TModule.optional(TModule.callback)
	})
})
Toast.defaultProps = {
	show = true,
	anchorPoint = Vector2.new(0.5, 0),
	position = UDim2.new(0.5, 0, 0, 20)
}

local function toastContentEqual(ToastContent, ToastContent1): boolean --[[ Line: 90 ]]
	return ToastContent.iconColorStyle == ToastContent1.iconColorStyle and ToastContent.iconImage == ToastContent1.iconImage and ToastContent.iconSize == ToastContent1.iconSize and ToastContent.iconChildren == ToastContent1.iconChildren and ToastContent.onActivated == ToastContent1.onActivated and ToastContent.onDismissed == ToastContent1.onDismissed and ToastContent.sequenceNumber == ToastContent1.sequenceNumber and ToastContent.swipeUpDismiss == ToastContent1.swipeUpDismiss and ToastContent.toastSubtitle == ToastContent1.toastSubtitle and ToastContent.toastTitle == ToastContent1.toastTitle
end

function Toast.init(p1) --[[ Line: 108 ]]
	-- upvalues: AnimationStateModule (copy), RoactModule (copy), InteractiveToastModule (copy), InformativeToastModule (copy), StateTableModule (copy)
	p1.isMounted = false
	p1.currentToastContent = p1.props.toastContent
	
	function p1.onActivated() --[[ Line: 113 ]]
		-- upvalues: p1 (copy)
		p1.stateTable.events.Activated({ activated = true })
	end
	
	function p1.onAppeared() --[[ Line: 119 ]]
		-- upvalues: p1 (copy)
		if p1.currentToastContent.onAppeared then
			p1.currentToastContent.onAppeared()
		end
		local Duration: number = p1.props.duration
		
		if Duration and Duration > 0 then
			local CurrentToastContent = p1.currentToastContent
			delay(Duration, function() --[[ Line: 126 ]]
				-- upvalues: CurrentToastContent (copy), p1 (upval)
				if CurrentToastContent == p1.currentToastContent then
					p1.stateTable.events.AutoDismiss()
				end
			end)
		end
	end
	
	function p1.onComplete() --[[ Line: 134 ]]
		-- upvalues: p1 (copy), AnimationStateModule (upval)
		local Duration: number = p1.props.duration
		
		if p1.state.currentState == AnimationStateModule.Appearing and Duration and Duration <= 0 then
			p1.stateTable.events.AutoDismiss()
			
			return
		else
			p1.stateTable.events.AnimationComplete()
		end
	end
	
	function p1.onDisappeared() --[[ Line: 144 ]]
		-- upvalues: p1 (copy)
		if p1.state.context.activated then
			if p1.currentToastContent.onActivated then
				p1.currentToastContent.onActivated()
				
				return
			end
		elseif p1.currentToastContent.onDismissed then
			p1.currentToastContent.onDismissed()
		end
	end
	
	function p1:onTouchSwipe(SwipeDirection) --[[ Line: 156 ]]
		-- upvalues: p1 (copy)
		if SwipeDirection == Enum.SwipeDirection.Up then
			p1.stateTable.events.ForceDismiss()
			
			if p1.currentToastContent.onTouchSwipeUp then
				p1.currentToastContent.onTouchSwipeUp()
			end
		end
	end
	
	function p1.renderInteractiveToast(p2) --[[ Line: 165 ]]
		-- upvalues: RoactModule (upval), InteractiveToastModule (upval)
		return RoactModule.createElement(InteractiveToastModule, p2)
	end
	
	function p1.renderInformativeToast(p2) --[[ Line: 169 ]]
		-- upvalues: RoactModule (upval), InformativeToastModule (upval)
		return RoactModule.createElement(InformativeToastModule, p2)
	end
	
	function p1:setContext(_, p2) --[[ Line: 173 ]]
		return p2
	end
	
	function p1.updateToastContent() --[[ Line: 177 ]]
		-- upvalues: p1 (copy)
		if p1.currentToastContent ~= p1.props.toastContent then
			p1.currentToastContent = p1.props.toastContent
			
			if p1.props.show then
				p1.stateTable.events.ForceAppear({ activated = false })
			end
		end
	end
	
	local Disappeared = AnimationStateModule.Disappeared
	p1.state = {
		currentState = Disappeared,
		context = { activated = false }
	}
	p1.stateTable = StateTableModule.new(string.format("Animated(%s)", (tostring(p1))), Disappeared, {}, {
		[AnimationStateModule.Appearing] = {
			AnimationComplete = {
				nextState = AnimationStateModule.Appeared,
				action = p1.onAppeared
			},
			AutoDismiss = {
				nextState = AnimationStateModule.Disappearing,
				action = p1.onAppeared
			},
			ContentChanged = { nextState = AnimationStateModule.Disappearing },
			ForceDismiss = { nextState = AnimationStateModule.Disappearing }
		},
		[AnimationStateModule.Appeared] = {
			Activated = {
				nextState = AnimationStateModule.Disappearing,
				action = p1.setContext
			},
			AutoDismiss = { nextState = AnimationStateModule.Disappearing },
			ContentChanged = { nextState = AnimationStateModule.Disappearing },
			ForceDismiss = { nextState = AnimationStateModule.Disappearing }
		},
		[AnimationStateModule.Disappearing] = {
			AnimationComplete = {
				nextState = AnimationStateModule.Disappeared,
				action = p1.onDisappeared
			}
		},
		[AnimationStateModule.Disappeared] = {
			ContentChanged = {
				nextState = AnimationStateModule.Appearing,
				action = p1.updateToastContent
			},
			ForceAppear = {
				nextState = AnimationStateModule.Appearing,
				action = p1.setContext
			}
		}
	})
	p1.stateTable:onStateChange(function(CurrentState, CurrentState1, Context) --[[ Line: 220 ]]
		-- upvalues: p1 (copy)
		if p1.isMounted and CurrentState ~= CurrentState1 then
			p1:setState({ currentState = CurrentState1, context = Context })
		end
	end)
end

function Toast.isShowing(p1): boolean --[[ Line: 230 ]]
	-- upvalues: AnimationStateModule (copy)
	return p1.state.currentState == AnimationStateModule.Appearing or p1.state.currentState == AnimationStateModule.Appeared
end

function Toast.render(p1) --[[ Line: 234 ]]
	-- upvalues: RoactModule (copy), SlidingContainerModule (copy), SlidingDirectionModule (copy), ToastContainerModule (copy)
	local OnActivated = p1.currentToastContent.onActivated
	local SwipeUpDismiss = p1.currentToastContent.swipeUpDismiss
	
	if SwipeUpDismiss == nil then
		SwipeUpDismiss = true
	end
	return RoactModule.createElement(SlidingContainerModule, {
		show = p1:isShowing(),
		layoutOrder = p1.props.layoutOrder,
		onComplete = p1.onComplete,
		slidingDirection = SlidingDirectionModule.Down,
		springOptions = p1.props.springOptions
	}, {
		ToastContainer = RoactModule.createElement(ToastContainerModule, {
			anchorPoint = p1.props.anchorPoint,
			buttonText = p1.currentToastContent.buttonText,
			position = p1.props.position,
			size = p1.props.size,
			iconColorStyle = p1.currentToastContent.iconColorStyle,
			iconImage = p1.currentToastContent.iconImage,
			iconSize = p1.currentToastContent.iconSize,
			iconChildren = p1.currentToastContent.iconChildren,
			onActivated = OnActivated and p1.onActivated,
			onTouchSwipe = SwipeUpDismiss and p1.onTouchSwipe,
			renderToast = OnActivated and p1.renderInteractiveToast or p1.renderInformativeToast,
			toastSubtitle = p1.currentToastContent.toastSubtitle,
			toastTitle = p1.currentToastContent.toastTitle,
			buttonType = p1.currentToastContent.buttonType
		})
	})
end

function Toast.didMount(p1) --[[ Line: 267 ]]
	p1.isMounted = true
	
	if p1.props.show then
		p1.stateTable.events.ForceAppear({ activated = false })
	end
end

function Toast.willUnmount(p1) --[[ Line: 276 ]]
	p1.isMounted = false
end

function Toast.didUpdate(p1, p2, p3) --[[ Line: 280 ]]
	-- upvalues: toastContentEqual (copy), AnimationStateModule (copy)
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
	if p3.currentState ~= p1.state.currentState and p1.state.currentState == AnimationStateModule.Disappeared then
		p1.updateToastContent()
	end
end

return Toast