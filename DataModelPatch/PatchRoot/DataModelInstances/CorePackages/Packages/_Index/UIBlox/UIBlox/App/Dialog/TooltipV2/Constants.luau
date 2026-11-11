local Parent = script.Parent
local Parent1 = Parent.Parent
local _ = require(Parent.Types)
local TooltipOrientationModule = require(Parent1.Tooltip.Enum.TooltipOrientation)
local ImagesModule = require(Parent1.Parent.ImageSet.Images)
local _UDim2 = UDim2.fromOffset(16, 8)
local OffsetDelta = _UDim2.Y.Offset - 1

return table.freeze({
	DEFAULT_PADDING = 12,
	DEFAULT_LIST_PADDING = 8,
	CARET_DISTANCE = 4,
	MAX_WIDTH = 240,
	HOTKEY_PADDING = 6,
	CLOSE_BUTTON_SIZE = 24,
	CLOSE_BUTTON_PADDING = 4,
	SCREEN_MARGIN = 12,
	DEFAULT_DELAY_TIME = 0.4,
	CORNER_RADIUS = UDim.new(0, 8),
	CONTENT_TO_CARET_TIP = OffsetDelta,
	CONTENT_TO_CARET_CENTER = OffsetDelta - _UDim2.Y.Offset / 2,
	CARET_IMAGE = ImagesModule["component_assets/triangleDown_16"],
	CARET_ROTATION = {
		[TooltipOrientationModule.Top] = 0,
		[TooltipOrientationModule.Bottom] = 180,
		[TooltipOrientationModule.Right] = 90,
		[TooltipOrientationModule.Left] = 270
	},
	CARET_SIZE = _UDim2,
	DropShadow = {
		Small = {
			IMAGE = ImagesModule["component_assets/dropshadow_17_4"],
			SLICE_CENTER = Rect.new(12, 12, 13, 13),
			OFFSET = {
				[TooltipOrientationModule.Top] = 2,
				[TooltipOrientationModule.Bottom] = 6,
				[TooltipOrientationModule.Right] = 4,
				[TooltipOrientationModule.Left] = 4
			}
		},
		Large = {
			IMAGE = ImagesModule["component_assets/dropshadow_17_16"],
			SLICE_CENTER = Rect.new(36, 36, 37, 37),
			OFFSET = {
				[TooltipOrientationModule.Top] = 28,
				[TooltipOrientationModule.Bottom] = 28,
				[TooltipOrientationModule.Right] = 28,
				[TooltipOrientationModule.Left] = 28
			}
		}
	},
	ORIENTATION_VECTOR = {
		[TooltipOrientationModule.Top] = Vector2.new(0, -1),
		[TooltipOrientationModule.Bottom] = Vector2.new(0, 1),
		[TooltipOrientationModule.Left] = Vector2.new(-1, 0),
		[TooltipOrientationModule.Right] = Vector2.new(1, 0)
	},
	OPPOSITE_ORIENTATION = {
		[TooltipOrientationModule.Top] = TooltipOrientationModule.Bottom,
		[TooltipOrientationModule.Bottom] = TooltipOrientationModule.Top,
		[TooltipOrientationModule.Right] = TooltipOrientationModule.Left,
		[TooltipOrientationModule.Left] = TooltipOrientationModule.Right
	},
	DISTANCE_TO_CONTENT = 4 + OffsetDelta,
	MIN_DISTANCE_TO_CARET_MIDDLE = 12 + _UDim2.X.Offset / 2,
	INACTIVE_ANIMATION_TARGETS = { distanceOffset = -4, transparency = 1 },
	ACTIVE_ANIMATION_TARGETS = { distanceOffset = 0, transparency = 0 },
	ANIMATION_OPTIONS = { frequency = 5 }
})