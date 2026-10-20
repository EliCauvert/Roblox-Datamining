local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local AnimatedFrame = require(Parent.UIBlox).Utility.SpringAnimatedItem.AnimatedFrame
local DashModule = require(Parent.Dash)
local SpringOptions = { dampingRatio = 1, frequency = 3.5 }

local function ExpandingFrame(Frame)
	-- upvalues: ReactModule (copy), AnimatedFrame (copy), SpringOptions (copy)
	return ReactModule.createElement(AnimatedFrame, {
		regularProps = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = Frame.LayoutOrder,
			ClipsDescendants = true,
			ref = Frame.frameRef,
			NextSelectionUp = Frame.NextSelectionUp,
			NextSelectionDown = Frame.NextSelectionDown,
			NextSelectionLeft = Frame.NextSelectionLeft,
			NextSelectionRight = Frame.NextSelectionRight,
			[ReactModule.Change.AbsoluteSize] = Frame.onAbsoluteSizeChanged
		},
		animatedValues = {
			yOffset = if Frame.isExpanded then Frame.Size.Y.Offset else 0,
			yScale = if Frame.isExpanded then Frame.Size.Y.Scale else 0
		},
		mapValuesToProps = function(p1)
			-- upvalues: Frame (copy)
			return {
				Size = UDim2.new(Frame.Size.X.Scale, Frame.Size.X.Offset, p1.yScale, p1.yOffset)
			}
		end,
		springOptions = SpringOptions
	}, Frame.children)
end

return ReactModule.forwardRef(function(p1, FrameRef)
	-- upvalues: ReactModule (copy), ExpandingFrame (copy), DashModule (copy)
	return ReactModule.createElement(ExpandingFrame, DashModule.join(p1, { frameRef = FrameRef }))
end)