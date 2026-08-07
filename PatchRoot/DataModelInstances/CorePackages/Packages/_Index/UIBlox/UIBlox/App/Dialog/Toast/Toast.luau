-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:54 2026 Pacific Standard Time.

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

local function toastContentEqual(p0, p1) --[[ line: 90 ]]
	return p0.iconColorStyle == p1.iconColorStyle and p0.iconImage == p1.iconImage and (p0.iconSize == p1.iconSize and p0.iconChildren == p1.iconChildren) and (p0.onActivated == p1.onActivated and p0.onDismissed == p1.onDismissed and (p0.sequenceNumber == p1.sequenceNumber and p0.swipeUpDismiss == p1.swipeUpDismiss)) and (p0.toastSubtitle == p1.toastSubtitle and p0.toastTitle == p1.toastTitle)
end

function toast.init(p2) --[[ line: 108 ]]
	-- upvalues: animationStateModule (ref), roactModule (ref), interactiveToastModule (ref), informativeToastModule (ref), stateTableModule (ref)
	p2.isMounted = false
	p2.currentToastContent = p2.props.toastContent
	
	function p2.onActivated() --[[ line: 113 ]]
		-- upvalues: p2 (ref)
		p2.stateTable.events.Activated({ activated = true })
	end
	
	function p2.onAppeared() --[[ line: 119 ]]
		-- upvalues: p2 (ref)
		if p2.currentToastContent.onAppeared then
			p2.currentToastContent.onAppeared()
		end
		local duration = p2.props.duration
		
		if duration and duration > 0 then
			local currentToastContent = p2.currentToastContent
			delay(duration, function() --[[ line: 126 ]]
				-- upvalues: currentToastContent (ref), p2 (copy)
				if currentToastContent == p2.currentToastContent then
					p2.stateTable.events.AutoDismiss()
				end
			end)
		end
	end
	
	function p2.onComplete() --[[ line: 134 ]]
		-- upvalues: p2 (ref), animationStateModule (copy)
		local duration = p2.props.duration
		
		if p2.state.currentState == animationStateModule.Appearing and duration and duration <= 0 then
			p2.stateTable.events.AutoDismiss()
			
			return
		end
		p2.stateTable.events.AnimationComplete()
	end
	
	function p2.onDisappeared() --[[ line: 144 ]]
		-- upvalues: p2 (ref)
		if p2.state.context.activated then
			if p2.currentToastContent.onActivated then
				p2.currentToastContent.onActivated()
				
				return
			end
		elseif p2.currentToastContent.onDismissed then
			p2.currentToastContent.onDismissed()
		end
	end
	
	function p2.onTouchSwipe(_, p3) --[[ line: 156 ]]
		-- upvalues: p2 (ref)
		if p3 == Enum.SwipeDirection.Up then
			p2.stateTable.events.ForceDismiss()
			
			if p2.currentToastContent.onTouchSwipeUp then
				p2.currentToastContent.onTouchSwipeUp()
			end
		end
	end
	
	function p2.renderInteractiveToast(p4) --[[ line: 165 ]]
		-- upvalues: roactModule (copy), interactiveToastModule (copy)
		return roactModule.createElement(interactiveToastModule, p4)
	end
	
	function p2.renderInformativeToast(p5) --[[ line: 169 ]]
		-- upvalues: roactModule (copy), informativeToastModule (copy)
		return roactModule.createElement(informativeToastModule, p5)
	end
	
	function p2.setContext(_, _, p6) --[[ line: 173 ]]
		return p6
	end
	
	function p2.updateToastContent() --[[ line: 177 ]]
		-- upvalues: p2 (ref)
		if p2.currentToastContent ~= p2.props.toastContent then
			p2.currentToastContent = p2.props.toastContent
			
			if p2.props.show then
				p2.stateTable.events.ForceAppear({ activated = false })
			end
		end
	end
	
	local disappeared = animationStateModule.Disappeared
	p2.state = {
		currentState = disappeared,
		context = { activated = false }
	}
	p2.stateTable = stateTableModule.new(string.format("Animated(%s)", tostring(p2)), disappeared, {}, {
		[animationStateModule.Appearing] = {
			AnimationComplete = {
				nextState = animationStateModule.Appeared,
				action = p2.onAppeared
			},
			AutoDismiss = {
				nextState = animationStateModule.Disappearing,
				action = p2.onAppeared
			},
			ContentChanged = { nextState = animationStateModule.Disappearing },
			ForceDismiss = { nextState = animationStateModule.Disappearing }
		},
		[animationStateModule.Appeared] = {
			Activated = {
				nextState = animationStateModule.Disappearing,
				action = p2.setContext
			},
			AutoDismiss = { nextState = animationStateModule.Disappearing },
			ContentChanged = { nextState = animationStateModule.Disappearing },
			ForceDismiss = { nextState = animationStateModule.Disappearing }
		},
		[animationStateModule.Disappearing] = {
			AnimationComplete = {
				nextState = animationStateModule.Disappeared,
				action = p2.onDisappeared
			}
		},
		[animationStateModule.Disappeared] = {
			ContentChanged = {
				nextState = animationStateModule.Appearing,
				action = p2.updateToastContent
			},
			ForceAppear = {
				nextState = animationStateModule.Appearing,
				action = p2.setContext
			}
		}
	})
	p2.stateTable:onStateChange(function(p7, p8, p9) --[[ line: 220 ]]
		-- upvalues: p2 (ref)
		if p2.isMounted and p7 ~= p8 then
			p2:setState({ currentState = p8, context = p9 })
		end
	end)
end

function toast.isShowing(p10) --[[ line: 230 ]]
	-- upvalues: animationStateModule (ref)
	return if p10.state.currentState ~= animationStateModule.Appearing then p10.state.currentState == animationStateModule.Appeared else true
end

function toast.render(p11) --[[ line: 234 ]]
	-- upvalues: roactModule (ref), slidingContainerModule (ref), slidingDirectionModule (ref), toastContainerModule (ref)
	local onActivated = p11.currentToastContent.onActivated
	local swipeUpDismiss = p11.currentToastContent.swipeUpDismiss
	
	if swipeUpDismiss == nil then
		swipeUpDismiss = true
	end
	return roactModule.createElement(slidingContainerModule, {
		show = p11:isShowing(),
		layoutOrder = p11.props.layoutOrder,
		onComplete = p11.onComplete,
		slidingDirection = slidingDirectionModule.Down,
		springOptions = p11.props.springOptions
	}, {
		ToastContainer = roactModule.createElement(toastContainerModule, {
			anchorPoint = p11.props.anchorPoint,
			buttonText = p11.currentToastContent.buttonText,
			position = p11.props.position,
			size = p11.props.size,
			iconColorStyle = p11.currentToastContent.iconColorStyle,
			iconImage = p11.currentToastContent.iconImage,
			iconSize = p11.currentToastContent.iconSize,
			iconChildren = p11.currentToastContent.iconChildren,
			onActivated = onActivated and p11.onActivated,
			onTouchSwipe = swipeUpDismiss and p11.onTouchSwipe,
			renderToast = if onActivated then p11.renderInteractiveToast else p11.renderInformativeToast,
			toastSubtitle = p11.currentToastContent.toastSubtitle,
			toastTitle = p11.currentToastContent.toastTitle,
			buttonType = p11.currentToastContent.buttonType
		})
	})
end

function toast.didMount(p12) --[[ line: 267 ]]
	p12.isMounted = true
	
	if p12.props.show then
		p12.stateTable.events.ForceAppear({ activated = false })
	end
end

function toast.willUnmount(p13) --[[ line: 276 ]]
	p13.isMounted = false
end

function toast.didUpdate(p14, p15, p16) --[[ line: 280 ]]
	-- upvalues: toastContentEqual (ref), animationStateModule (ref)
	if p15.show ~= p14.props.show then
		if p14.props.show then
			p14.stateTable.events.ForceAppear({ activated = false })
		else
			p14.stateTable.events.ForceDismiss()
		end
	end
	if not toastContentEqual(p15.toastContent, p14.props.toastContent) then
		p14.stateTable.events.ContentChanged({ activated = false })
	end
	if p16.currentState ~= p14.state.currentState and p14.state.currentState == animationStateModule.Disappeared then
		p14.updateToastContent()
	end
end

return toast