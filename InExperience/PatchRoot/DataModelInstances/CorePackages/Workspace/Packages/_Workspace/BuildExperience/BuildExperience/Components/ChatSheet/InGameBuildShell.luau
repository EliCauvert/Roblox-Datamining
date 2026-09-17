local parent = script:FindFirstAncestor("BuildExperience").Parent
local coreGuiCommonModule = require(parent.CoreGuiCommon)
local displayModule = require(parent.Display)
local foundationModule = require(parent.Foundation)
local motionModule = require(parent.Motion)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useHardwareInsetsModule = require(script.Parent.useHardwareInsets)
local image = foundationModule.Image
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useOverlay = foundationModule.Hooks.useOverlay
local usePreferences = foundationModule.Hooks.usePreferences
local useTokens = foundationModule.Hooks.useTokens

local function noop() end

local function createToolbarButtons(p1, p2)
	-- upvalues: reactModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), noop (ref)
	return {
		Chat = reactModule.createElement(iconButton, {
			LayoutOrder = 1,
			icon = iconName.Nebula,
			onActivated = p1,
			size = inputSize.Medium,
			testId = `{p2}-chat`,
			variant = buttonVariant.Utility
		}),
		Select = reactModule.createElement(iconButton, {
			LayoutOrder = 2,
			icon = iconName.CursorStars,
			onActivated = noop,
			size = inputSize.Medium,
			testId = `{p2}-select`,
			variant = buttonVariant.Utility
		}),
		Capture = reactModule.createElement(iconButton, {
			LayoutOrder = 3,
			icon = iconName.FrameCameraCenter,
			onActivated = noop,
			size = inputSize.Medium,
			testId = `{p2}-capture`,
			variant = buttonVariant.Utility
		}),
		Publish = reactModule.createElement(iconButton, {
			LayoutOrder = 4,
			icon = iconName.ArrowUpRightFromSquare,
			onActivated = noop,
			size = inputSize.Medium,
			testId = `{p2}-publish`,
			variant = buttonVariant.Utility
		})
	}
end

return function(p1)
	-- upvalues: useTokens (ref), usePreferences (ref), useOverlay (ref), useHardwareInsetsModule (ref), displayModule (ref), coreGuiCommonModule (ref), signalsReactModule (ref), reactModule (ref), motionModule (ref), view (ref), noop (ref), stateLayerAffordance (ref), createToolbarButtons (ref), image (ref)
	local var1 = useTokens()
	local reducedMotion = usePreferences().reducedMotion
	local var2 = useHardwareInsetsModule(useOverlay())
	local displayStore = displayModule.GetDisplayStore(false)
	local keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	local var3 = signalsReactModule.useSignalState(displayStore.getViewportSize)
	local var4 = signalsReactModule.useSignalState(displayStore.getDisplaySize)
	local var5 = var3.Y < var3.X
	local var6 = var4 ~= nil and var4 ~= Enum.DisplaySize.Small
	local var7 = var6 or p1.isVisible ~= false
	local var8, var9 = reactModule.useState(nil)
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref)
		var9(p2)
	end, {})
	local size1200 = var1.Size.Size_1200
	local var11 = reactModule.useMemo(function()
		-- upvalues: motionModule (copy), reducedMotion (ref), var1 (ref)
		return {
			visible = motionModule.createState({ progress = 1 }, {
				default = motionModule.transition({
					duration = if reducedMotion then 0 else var1.Time.Time_300,
					easingStyle = var1.Ease.StandardOut
				})
			}),
			hidden = motionModule.createState({ progress = 0 }, {
				default = motionModule.transition({
					duration = if reducedMotion then 0 else var1.Time.Time_100,
					easingStyle = var1.Ease.StandardIn
				})
			})
		}
	end, { reducedMotion, var1 })
	local var12, var13 = motionModule.useMotion(if var7 then var11.visible else var11.hidden)
	local var14, var15 = reactModule.useState(var7)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var13 (ref), var11 (ref), p1 (ref), var15 (ref)
		local var16 = false
		
		if var7 then
			var15(true)
			var13(var11.visible)
		else
			var13(var11.hidden, {
				onAnimationComplete = function(p2)
					-- upvalues: var16 (write), p1 (copy), var15 (copy)
					if not var16 and p2 == true then
						if p1.onInsetsChanged ~= nil then
							p1.onInsetsChanged(0, 0, 0)
						end
						var15(false)
					end
				end
			})
		end
		return function()
			-- upvalues: var16 (write)
			var16 = true
		end
	end, { var13, var11, var7, p1.onInsetsChanged })
	local var16, var17 = reactModule.useState(0)
	local var18, var19 = reactModule.useState(0)
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref)
		var17(p2.AbsoluteSize.Y)
	end, {})
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: var19 (ref), keepOutAreasStore (ref)
		var19(p2.AbsoluteSize.X)
		keepOutAreasStore.setKeepOutArea("build-shell-right-inset", p2.AbsolutePosition, p2.AbsoluteSize)
	end, { keepOutAreasStore })
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var5 (ref), var6 (ref)
		if p1.onInsetsChanged ~= nil then
			p1.onInsetsChanged(0, if var5 and not var6 then p2.AbsoluteSize.X else 0, if var5 or var6 then 0 else p2.AbsoluteSize.Y)
		end
	end, { var5, p1.onInsetsChanged, var6 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), p1 (ref)
		if var6 and p1.onInsetsChanged ~= nil then
			p1.onInsetsChanged(0, 0, 0)
		end
	end, { p1.onInsetsChanged, var6 })
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var5 (ref), var6 (ref), keepOutAreasStore (ref)
		if not var14 or not var5 or var6 then
			keepOutAreasStore.removeKeepOutArea("build-shell-right-inset")
		end
	end, { var5, var14, keepOutAreasStore, var6 })
	reactModule.useEffect(function()
		-- upvalues: keepOutAreasStore (ref)
		return function()
			-- upvalues: keepOutAreasStore (copy)
			keepOutAreasStore.removeKeepOutArea("build-shell-right-inset")
		end
	end, { keepOutAreasStore })
	local progress = var12.progress
	local var23 = progress:map(function(p2)
		-- upvalues: var18 (ref)
		return UDim2.new(1, var18 * (1 - p2), 0, 0)
	end)
	local var24 = progress:map(function(p2)
		-- upvalues: var18 (ref)
		return UDim2.new(1, -var18 * p2 + 1, 0, 0)
	end)
	local var25 = progress:map(function(p2)
		-- upvalues: var16 (ref)
		return UDim2.new(0, 0, 1, var16 * (1 - p2))
	end)
	local var26 = progress:map(function(p2)
		-- upvalues: var16 (ref)
		return UDim2.new(0, -1, 1, -var16 * p2 + 1)
	end)
	local var27 = progress:map(function(p2)
		-- upvalues: var5 (ref), var18 (ref), var16 (ref)
		return UDim2.new(1, -(if var5 then var18 else 0) * p2 + 1, 1, -(if var5 then 0 else var16) * p2 + 1)
	end)
	local var28 = progress:map(function(p2)
		-- upvalues: var6 (ref), var5 (ref), var18 (ref), var16 (ref)
		return if var6 then UDim2.fromOffset(0, 0) else UDim2.fromOffset((if var5 then var18 else 0) * p2, (if var5 then 0 else var16) * p2)
	end)
	local surface100 = var1.Color.Surface.Surface_100
	local var29 = progress:map(function(p2)
		-- upvalues: surface100 (ref)
		return {
			Color3 = surface100.Color3,
			Transparency = 1 - (1 - surface100.Transparency) * p2
		}
	end)
	
	return reactModule.createElement(view, {
		tag = "size-full",
		Visible = var14,
		testId = p1.testId or "in-game-build-shell"
	}, {
		FloatingToolbarBounds = if var6 then reactModule.createElement(view, {
			testId = "in-game-build-shell-floating-toolbar-bounds",
			Position = UDim2.fromOffset(var2.left + var1.Padding.Large, var2.top + var1.Padding.Large),
			Size = UDim2.new(1, -(var2.left + var2.right + var1.Padding.Large * 2), 1, -(var2.top + var2.bottom + var1.Padding.Large * 2)),
			ref = var10
		}, {
			Toolbar = reactModule.createElement(view, {
				ZIndex = 1000,
				tag = "col align-x-center gap-xsmall position-center-right anchor-center-right auto-xy padding-xsmall radius-medium bg-surface-100",
				testId = "in-game-build-shell-floating-toolbar",
				Visible = var7,
				onActivated = noop,
				stateLayer = { affordance = stateLayerAffordance.None }
			}, {
				DragDetector = reactModule.createElement("UIDragDetector", {
					BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
					BoundingUI = var8,
					DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
					ReferenceUIInstance = var8,
					ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale
				}),
				Buttons = reactModule.createElement(reactModule.Fragment, nil, createToolbarButtons(p1.onActivated, "in-game-build-shell-floating")),
				DragAffordance = reactModule.createElement(view, {
					LayoutOrder = 6,
					tag = "position-center-center anchor-center-center auto-xy padding-xxsmall"
				}, {
					Icon = reactModule.createElement(image, {
						Image = "component_assets/dragger_small",
						tag = "position-center-center anchor-center-center size-600-400 content-muted"
					})
				})
			})
		}) else nil,
		InsetReporter = reactModule.createElement(view, {
			testId = "in-game-build-shell-inset-reporter",
			Size = var28,
			onAbsoluteSizeChanged = var22
		}),
		RightInset = if var5 and not var6 then reactModule.createElement(view, {
			ZIndex = 1000,
			tag = "col align-x-center align-y-center gap-xsmall anchor-top-right size-0-full auto-x bg-surface-100",
			testId = "in-game-build-shell-right-toolbar",
			Position = var23,
			padding = {
				left = UDim.new(0, var1.Padding.Small),
				right = UDim.new(0, math.max(var2.right, var1.Padding.Small))
			},
			onAbsolutePositionChanged = var21,
			onAbsoluteSizeChanged = var21
		}, createToolbarButtons(p1.onActivated, "in-game-build-shell-landscape")) else nil,
		TopRightInnerCorner = if var5 and not var6 then reactModule.createElement(view, {
			ZIndex = 1000,
			tag = "anchor-top-right clip",
			testId = "in-game-build-shell-top-right-inner-corner",
			Position = var24,
			Size = UDim2.fromOffset(size1200, size1200)
		}, {
			Image = reactModule.createElement(image, {
				Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
				ZIndex = 1000,
				testId = "in-game-build-shell-top-right-inner-corner-image",
				Position = UDim2.fromOffset(-size1200, 0),
				Size = UDim2.fromOffset(size1200 * 2, size1200 * 2),
				imageStyle = var29
			})
		}) else nil,
		BottomLeftInnerCorner = if var6 or var5 or var16 == 0 then nil else reactModule.createElement(view, {
			ZIndex = 1000,
			tag = "anchor-bottom-left clip",
			testId = "in-game-build-shell-bottom-left-inner-corner",
			Position = var26,
			Size = UDim2.fromOffset(size1200, size1200)
		}, {
			Image = reactModule.createElement(image, {
				Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
				ZIndex = 1000,
				testId = "in-game-build-shell-bottom-left-inner-corner-image",
				Position = UDim2.fromOffset(0, -size1200),
				Size = UDim2.fromOffset(size1200 * 2, size1200 * 2),
				imageStyle = var29
			})
		}),
		BottomRightInnerCorner = if var6 or not var5 and var16 == 0 then nil else reactModule.createElement(view, {
			ZIndex = 1000,
			tag = "anchor-bottom-right clip",
			testId = "in-game-build-shell-bottom-right-inner-corner",
			Position = var27,
			Size = UDim2.fromOffset(size1200, size1200)
		}, {
			Image = reactModule.createElement(image, {
				Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
				ZIndex = 1000,
				testId = "in-game-build-shell-bottom-right-inner-corner-image",
				Position = UDim2.fromOffset(-size1200, -size1200),
				Size = UDim2.fromOffset(size1200 * 2, size1200 * 2),
				imageStyle = var29
			})
		}),
		BottomBar = reactModule.createElement(view, {
			tag = "row align-x-center align-y-center gap-xsmall anchor-bottom-left size-full-0 auto-y bg-surface-100",
			testId = "in-game-build-shell-bottom-inset",
			Position = var25,
			Visible = not var5 and not var6,
			onAbsoluteSizeChanged = var20,
			padding = {
				top = UDim.new(0, var1.Padding.Small),
				left = UDim.new(0, var1.Padding.Large),
				right = UDim.new(0, var1.Padding.Large),
				bottom = UDim.new(0, var1.Margin.Small + var2.bottom)
			}
		}, createToolbarButtons(p1.onActivated, "in-game-build-shell"))
	})
end