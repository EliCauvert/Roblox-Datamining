-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:54 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local _ = require(parent.Types)
local tooltipOrientationModule = require(parent_1.Tooltip.Enum.TooltipOrientation)
local imagesModule = require(parent_2.ImageSet.Images)
local uDim2 = UDim2.fromOffset(16, 8)
local var3 = uDim2.Y.Offset - 1

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
	CONTENT_TO_CARET_TIP = var3,
	CONTENT_TO_CARET_CENTER = var3 - uDim2.Y.Offset / 2,
	CARET_IMAGE = imagesModule["component_assets/triangleDown_16"],
	CARET_ROTATION = {
		[tooltipOrientationModule.Top] = 0,
		[tooltipOrientationModule.Bottom] = 180,
		[tooltipOrientationModule.Right] = 90,
		[tooltipOrientationModule.Left] = 270
	},
	CARET_SIZE = uDim2,
	DropShadow = {
		Small = {
			IMAGE = imagesModule["component_assets/dropshadow_17_4"],
			SLICE_CENTER = Rect.new(12, 12, 13, 13),
			OFFSET = {
				[tooltipOrientationModule.Top] = 2,
				[tooltipOrientationModule.Bottom] = 6,
				[tooltipOrientationModule.Right] = 4,
				[tooltipOrientationModule.Left] = 4
			}
		},
		Large = {
			IMAGE = imagesModule["component_assets/dropshadow_17_16"],
			SLICE_CENTER = Rect.new(36, 36, 37, 37),
			OFFSET = {
				[tooltipOrientationModule.Top] = 28,
				[tooltipOrientationModule.Bottom] = 28,
				[tooltipOrientationModule.Right] = 28,
				[tooltipOrientationModule.Left] = 28
			}
		}
	},
	ORIENTATION_VECTOR = {
		[tooltipOrientationModule.Top] = Vector2.new(0, -1),
		[tooltipOrientationModule.Bottom] = Vector2.new(0, 1),
		[tooltipOrientationModule.Left] = Vector2.new(-1, 0),
		[tooltipOrientationModule.Right] = Vector2.new(1, 0)
	},
	OPPOSITE_ORIENTATION = {
		[tooltipOrientationModule.Top] = tooltipOrientationModule.Bottom,
		[tooltipOrientationModule.Bottom] = tooltipOrientationModule.Top,
		[tooltipOrientationModule.Right] = tooltipOrientationModule.Left,
		[tooltipOrientationModule.Left] = tooltipOrientationModule.Right
	},
	DISTANCE_TO_CONTENT = 4 + var3,
	MIN_DISTANCE_TO_CARET_MIDDLE = 12 + uDim2.X.Offset / 2,
	INACTIVE_ANIMATION_TARGETS = { distanceOffset = -4, transparency = 1 },
	ACTIVE_ANIMATION_TARGETS = { distanceOffset = 0, transparency = 0 },
	ANIMATION_OPTIONS = { frequency = 5 }
})