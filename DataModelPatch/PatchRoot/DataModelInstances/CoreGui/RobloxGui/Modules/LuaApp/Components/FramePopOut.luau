local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local RoactMotionModule = require(Modules.LuaApp.RoactMotion)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local WithStyleFunction = require(game:GetService("CorePackages").Packages.UIBlox).Style.withStyle

local function _(p1: number, p2, p3)
	return (1 - p1) * p2 + p1 * p3
end

local function findPosition(Vector, ItemWidth: number, FrameHeight: number)
	local NewX = Vector.x + Vector.width * 0.5
	local NewY = Vector.y + Vector.height * 0.5
	local ScaledFrameHeight = 0.1 * FrameHeight
	local Vector1 = {
		pointerHeight = 6,
		pointerWidth = 12,
		x = Vector.x + Vector.width * 0.5 - ItemWidth * 0.5
	}
	Vector1.pointerX = NewX - Vector1.pointerWidth * 0.5
	
	if NewY < Vector.parentHeight * 0.5 then
		Vector1.y = Vector.y + Vector.height + Vector1.pointerHeight
		Vector1.height = math.min(Vector.parentHeight - Vector1.y - 10, FrameHeight)
		Vector1.pointerIcon = "LuaApp/dropdown/gr-tip-up"
		Vector1.pointerY = Vector.y + Vector.height
		Vector1.menuStartY = Vector1.y
	else
		local YDelta = Vector.y - Vector1.pointerHeight
		Vector1.height = math.min(YDelta - 10, FrameHeight)
		Vector1.y = YDelta - Vector1.height
		Vector1.pointerIcon = "LuaApp/dropdown/gr-tip-down"
		Vector1.pointerY = YDelta
		Vector1.menuStartY = Vector1.pointerY - ScaledFrameHeight
	end
	if Vector1.height < FrameHeight then
		Vector1.pointerHeight = 12
		Vector1.pointerWidth = 6
		Vector1.height = math.min(Vector.parentHeight - 20, FrameHeight)
		Vector1.y = NewY - Vector1.height * 0.5
		
		if Vector1.y < 10 then
			Vector1.y = 10
		elseif Vector.parentHeight - 10 < Vector1.y + Vector1.height then
			Vector1.y = Vector.parentHeight - 10 - Vector1.height
		end
		Vector1.pointerY = NewY - Vector1.pointerHeight * 0.5
		Vector1.menuStartY = Vector1.pointerY + Vector1.pointerHeight / 2 - ScaledFrameHeight / 2
		
		if NewX <= Vector.parentWidth * 0.5 then
			Vector1.x = Vector.x + Vector.width + Vector1.pointerWidth
			
			if Vector.parentWidth - 10 < Vector1.x + ItemWidth then
				Vector1.x = Vector.parentWidth - ItemWidth - 10
			end
			Vector1.pointerIcon = "LuaApp/dropdown/gr-tip-left"
			Vector1.pointerX = Vector1.x - Vector1.pointerWidth
		else
			Vector1.x = Vector.x - ItemWidth - Vector1.pointerWidth
			
			if Vector1.x < 10 then
				Vector1.x = 10
			end
			Vector1.pointerIcon = "LuaApp/dropdown/gr-tip-right"
			Vector1.pointerX = Vector1.x + ItemWidth
		end
	elseif Vector1.x < 10 then
		Vector1.x = 10
	elseif Vector.parentWidth - 10 < Vector1.x + ItemWidth then
		Vector1.x = Vector.parentWidth - ItemWidth - 10
	end
	Vector1.pointerX += -1
	Vector1.pointerY += -1
	Vector1.pointerWidth += 2
	Vector1.pointerHeight += 2
	
	return Vector1
end

local FramePopOut = RoactModule.PureComponent:extend("FramePopOut")
FramePopOut.defaultProps = { isAnimated = false }

function FramePopOut.init(p1)
	p1.state = { frameHeight = 0, hidden = p1.props.isAnimated }
	p1.isMounted = false
	p1.animationPercentage = if p1.state.hidden then 0 else 1
	p1.stiffness = nil
	p1.damping = nil
	p1.onRested = nil
	
	function p1.onActivated()
		-- upvalues: p1 (copy)
		p1:close()
	end
	
	function p1.onSizeChanged(Frame)
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval), Frame (copy)
			if p1.isMounted then
				p1:setState({ frameHeight = Frame.AbsoluteSize.Y })
			end
		end)
	end
end

function FramePopOut.open(p1)
	if p1.state.hidden and p1.props.isAnimated then
		p1.animationPercentage = 1
		p1.stiffness = nil
		p1.damping = nil
		p1.onRested = nil
		p1:setState({ hidden = false })
	end
	p1.animationPercentage = 1
	p1.stiffness = nil
	p1.damping = nil
	p1.onRested = nil
	p1:setState({ hidden = false })
end

function FramePopOut.close(p1)
	local OnCancelFunction: () -> () = p1.props.onCancel
	
	if not p1.state.hidden and p1.props.isAnimated then
		p1.animationPercentage = 0
		p1.stiffness = 270
		p1.damping = nil
		p1.onRested = OnCancelFunction
		p1:setState({ hidden = true })
		
		return
	elseif not p1.props.isAnimated then
		OnCancelFunction()
	end
end

function FramePopOut.didMount(p1)
	p1.isMounted = true
	p1:open()
end

function FramePopOut.willUnmount(p1)
	p1.isMounted = false
end

function FramePopOut.render(p1)
	-- upvalues: RoactModule (copy), findPosition (copy), WithStyleFunction (copy), DEPRECATEDImageSetLabelModule (copy), RoactMotionModule (copy), FitChildrenModule (copy)
	local Prop = p1.props[RoactModule.Children]
	local ItemWidth = p1.props.itemWidth
	local ParentShape = p1.props.parentShape
	
	if p1.state.frameHeight == 0 then
		ItemWidth = 0
	end
	local Position = findPosition(ParentShape, ItemWidth, p1.state.frameHeight)
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), DEPRECATEDImageSetLabelModule (upval), Position (copy), RoactMotionModule (upval), ItemWidth (ref), FitChildrenModule (upval), Prop (copy)
		return RoactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Text = "",
			Selectable = false,
			[RoactModule.Event.Activated] = p1.onActivated
		}, {
			Pointer = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Image = Position.pointerIcon,
				ImageColor3 = p2.Theme.BackgroundUIDefault.Color,
				ImageTransparency = p2.Theme.BackgroundUIDefault.Transparency,
				Position = UDim2.new(0, Position.pointerX, 0, Position.pointerY),
				Size = UDim2.new(0, Position.pointerWidth, 0, Position.pointerHeight)
			}),
			AnimatedPopout = RoactModule.createElement(RoactMotionModule.SimpleMotion, {
				style = {
					animationPercentage = RoactMotionModule.spring(p1.animationPercentage, p1.stiffness, p1.damping)
				},
				onRested = function()
					-- upvalues: p1 (upval)
					if p1.onRested then
						p1.onRested()
					end
				end,
				render = function(p3)
					-- upvalues: RoactModule (upval), p2 (copy), Position (upval), ItemWidth (upval), p1 (upval), FitChildrenModule (upval), Prop (upval)
					local AnimationPercentage: number = p3.animationPercentage
					local AnimationPercentage1: number = p3.animationPercentage
					
					return RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						ClipsDescendants = true,
						BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color,
						BackgroundTransparency = p2.Theme.BackgroundUIDefault.Transparency,
						Position = UDim2.new(0, Position.x, 0, (1 - AnimationPercentage) * Position.menuStartY + AnimationPercentage * Position.y),
						Size = UDim2.new(0, ItemWidth, 0, ((1 - AnimationPercentage1) * 0.1 + AnimationPercentage1 * 1) * p1.state.frameHeight)
					}, {
						Frame = RoactModule.createElement(FitChildrenModule.FitFrame, {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							Position = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(1, 0, 1, 0),
							fitAxis = FitChildrenModule.FitAxis.Height,
							ClipsDescendants = false,
							[RoactModule.Change.AbsoluteSize] = p1.onSizeChanged
						}, Prop)
					})
				end
			})
		})
	end)
end

return FramePopOut