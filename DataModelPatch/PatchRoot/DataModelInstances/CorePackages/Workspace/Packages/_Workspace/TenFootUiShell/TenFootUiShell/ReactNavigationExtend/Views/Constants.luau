local Parent = script:FindFirstAncestor("TenFootUiShell").Parent
local _ = require(Parent.ReactOtter)
local VirtualResolutionScale = require(Parent.Responsive).getVirtualResolutionScale() or 1
local X = 1920 / VirtualResolutionScale
local Y = 1080 / VirtualResolutionScale
local Y1 = 144 / VirtualResolutionScale
local Y2 = 98 / VirtualResolutionScale
local YRatio = Y1 / Y

return {
	DEFAULT_SCREEN_DISTANCE_TO_CAMERA = 6,
	DEFAULT_BACKGROUND_DISTANCE_TO_CAMERA = 50,
	Z_DIRECTION_ZOOM_FACTOR = 0.1,
	ADORNEE_DEPTH = 0.01,
	CANVAS_SIZE = Vector2.new(X, Y),
	TOP_BAR_HEIGHT_RATIO = YRatio,
	TOP_BAR_CANVAS_SIZE = Vector2.new(X, Y1),
	DEFAULT_CANVAS_SIZE = Vector2.new(X, Y),
	FULLSCREEN_CANVAS_SIZE = Vector2.new(X, Y),
	CONTROLLER_BAR_HEIGHT_RATIO = Y2 / Y,
	CONTROLLER_BAR_CANVAS_SIZE = Vector2.new(X, Y2),
	PAGE_CONTENT_CANVAS_HEIGHT = Y - Y1,
	PAGE_CONTENT_HEIGHT_RATIO = 1 - YRatio,
	X_DIRECTION_ANIMATION_SPRING_CONFIG = { stiffness = 150, damping = 20, mass = 1 },
	Z_DIRECTION_ANIMATION_SPRING_CONFIG = { stiffness = 710, damping = 40, mass = 1 }
}