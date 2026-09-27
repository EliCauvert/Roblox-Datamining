local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local coreGuiCommonModule = require(parent.CoreGuiCommon)
local displayModule = require(parent.Display)
local foundationModule = require(parent.Foundation)
local motionModule = require(parent.Motion)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local buildPillMenuPageHostModule = require(buildExperience.Components.BuildPillMenu.BuildPillMenuPageHost)
local publishSheetControllerModule = require(buildExperience.Components.PublishSheet.PublishSheetController)
local getCurrentExperienceProjectModule = require(buildExperience.utils.getCurrentExperienceProject)
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

local function createToolbarButtons(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), noop (ref)
	return {
		Chat = reactModule.createElement(iconButton, {
			LayoutOrder = 1,
			icon = iconName.Nebula,
			onActivated = p1,
			size = inputSize.Medium,
			testId = `{p4}-chat`,
			variant = buttonVariant.Utility
		}),
		Select = reactModule.createElement(iconButton, {
			LayoutOrder = 2,
			icon = iconName.CursorStars,
			onActivated = noop,
			size = inputSize.Medium,
			testId = `{p4}-select`,
			variant = buttonVariant.Utility
		}),
		Capture = reactModule.createElement(iconButton, {
			LayoutOrder = 3,
			icon = iconName.FrameCameraCenter,
			onActivated = p2 or noop,
			size = inputSize.Medium,
			testId = `{p4}-capture`,
			variant = buttonVariant.Utility
		}),
		Publish = reactModule.createElement(iconButton, {
			LayoutOrder = 4,
			icon = iconName.ArrowUpRightFromSquare,
			onActivated = p3,
			size = inputSize.Medium,
			testId = `{p4}-publish`,
			variant = buttonVariant.Utility
		})
	}
end

return function(p1)
	-- upvalues: reactModule (ref), getCurrentExperienceProjectModule (ref), useTokens (ref), usePreferences (ref), useOverlay (ref), useHardwareInsetsModule (ref), displayModule (ref), coreGuiCommonModule (ref), signalsReactModule (ref), motionModule (ref), view (ref), noop (ref), stateLayerAffordance (ref), createToolbarButtons (ref), image (ref), publishSheetControllerModule (ref), buildPillMenuPageHostModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useState(nil)
	local var7 = reactModule.useCallback(function()
		-- upvalues: getCurrentExperienceProjectModule (copy), var6 (ref), var2 (ref)
		local var8 = getCurrentExperienceProjectModule()
		
		if var8.universeId == nil then
			return
		end
		var6({
			sessionId = nil,
			isNewGameTarget = false,
			universeId = var8.universeId,
			placeId = var8.placeId
		})
		var2(true)
	end, {})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(false)
	end, {})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(nil)
	end, {})
	local var10 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var4 (ref)
		var4({
			type = "screen",
			screen = p2,
			target = {
				universeId = p3.universeId,
				placeId = p3.placeId,
				sessionId = p3.sessionId,
				isNewGameTarget = p3.isNewGameTarget or false
			}
		})
	end, {})
	local var11 = useTokens()
	local reducedMotion = usePreferences().reducedMotion
	local var12 = useHardwareInsetsModule(useOverlay())
	local displayStore = displayModule.GetDisplayStore(false)
	local keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	local var13 = signalsReactModule.useSignalState(displayStore.getViewportSize)
	local var14 = signalsReactModule.useSignalState(displayStore.getDisplaySize)
	local var15 = var13.Y < var13.X
	local var16 = var14 ~= nil and var14 ~= Enum.DisplaySize.Small
	local var17 = var16 or p1.isVisible ~= false
	local var18, var19 = reactModule.useState(nil)
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: var19 (ref)
		var19(p2)
	end, {})
	local size1200 = var11.Size.Size_1200
	local var21 = reactModule.useMemo(function()
		-- upvalues: motionModule (copy), reducedMotion (ref), var11 (ref)
		return {
			visible = motionModule.createState({ progress = 1 }, {
				default = motionModule.transition({
					duration = if reducedMotion then 0 else var11.Time.Time_300,
					easingStyle = var11.Ease.StandardOut
				})
			}),
			hidden = motionModule.createState({ progress = 0 }, {
				default = motionModule.transition({
					duration = if reducedMotion then 0 else var11.Time.Time_100,
					easingStyle = var11.Ease.StandardIn
				})
			})
		}
	end, { reducedMotion, var11 })
	local var22, var23 = motionModule.useMotion(if var17 then var21.visible else var21.hidden)
	local var24, var25 = reactModule.useState(var17)
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var23 (ref), var21 (ref), p1 (ref), var25 (ref)
		local var26 = false
		
		if var17 then
			var25(true)
			var23(var21.visible)
		else
			var23(var21.hidden, {
				onAnimationComplete = function(p2)
					-- upvalues: var26 (write), p1 (copy), var25 (copy)
					if not var26 and p2 == true then
						if p1.onInsetsChanged ~= nil then
							p1.onInsetsChanged(0, 0, 0)
						end
						var25(false)
					end
				end
			})
		end
		return function()
			-- upvalues: var26 (write)
			var26 = true
		end
	end, { var23, var21, var17, p1.onInsetsChanged })
	local var26, var27 = reactModule.useState(0)
	local var28, var29 = reactModule.useState(0)
	local var30 = reactModule.useCallback(function(p2)
		-- upvalues: var27 (ref)
		var27(p2.AbsoluteSize.Y)
	end, {})
	local var31 = reactModule.useCallback(function(p2)
		-- upvalues: var29 (ref), keepOutAreasStore (ref)
		var29(p2.AbsoluteSize.X)
		keepOutAreasStore.setKeepOutArea("build-shell-right-inset", p2.AbsolutePosition, p2.AbsoluteSize)
	end, { keepOutAreasStore })
	local var32 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var15 (ref), var16 (ref)
		if p1.onInsetsChanged ~= nil then
			p1.onInsetsChanged(0, if var15 and not var16 then p2.AbsoluteSize.X else 0, if var15 or var16 then 0 else p2.AbsoluteSize.Y)
		end
	end, { var15, p1.onInsetsChanged, var16 })
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), p1 (ref)
		if var16 and p1.onInsetsChanged ~= nil then
			p1.onInsetsChanged(0, 0, 0)
		end
	end, { p1.onInsetsChanged, var16 })
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), var15 (ref), var16 (ref), keepOutAreasStore (ref)
		if not var24 or not var15 or var16 then
			keepOutAreasStore.removeKeepOutArea("build-shell-right-inset")
		end
	end, { var15, var24, keepOutAreasStore, var16 })
	reactModule.useEffect(function()
		-- upvalues: keepOutAreasStore (ref)
		return function()
			-- upvalues: keepOutAreasStore (copy)
			keepOutAreasStore.removeKeepOutArea("build-shell-right-inset")
		end
	end, { keepOutAreasStore })
	local progress = var22.progress
	local var33 = progress:map(function(p2)
		-- upvalues: var28 (ref)
		return UDim2.new(1, var28 * (1 - p2), 0, 0)
	end)
	local var34 = progress:map(function(p2)
		-- upvalues: var28 (ref)
		return UDim2.new(1, -var28 * p2 + 1, 0, 0)
	end)
	local var35 = progress:map(function(p2)
		-- upvalues: var26 (ref)
		return UDim2.new(0, 0, 1, var26 * (1 - p2))
	end)
	local var36 = progress:map(function(p2)
		-- upvalues: var26 (ref)
		return UDim2.new(0, -1, 1, -var26 * p2 + 1)
	end)
	local var37 = progress:map(function(p2)
		-- upvalues: var15 (ref), var28 (ref), var26 (ref)
		return UDim2.new(1, -(if var15 then var28 else 0) * p2 + 1, 1, -(if var15 then 0 else var26) * p2 + 1)
	end)
	local var38 = progress:map(function(p2)
		-- upvalues: var16 (ref), var15 (ref), var28 (ref), var26 (ref)
		return if var16 then UDim2.fromOffset(0, 0) else UDim2.fromOffset((if var15 then var28 else 0) * p2, (if var15 then 0 else var26) * p2)
	end)
	local surface100 = var11.Color.Surface.Surface_100
	local var39 = progress:map(function(p2)
		-- upvalues: surface100 (ref)
		return {
			Color3 = surface100.Color3,
			Transparency = 1 - (1 - surface100.Transparency) * p2
		}
	end)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Shell = reactModule.createElement(view, {
			tag = "size-full",
			Visible = var24,
			testId = p1.testId or "in-game-build-shell"
		}, {
			FloatingToolbarBounds = if var16 then reactModule.createElement(view, {
				testId = "in-game-build-shell-floating-toolbar-bounds",
				Position = UDim2.fromOffset(var12.left + var11.Padding.Large, var12.top + var11.Padding.Large),
				Size = UDim2.new(1, -(var12.left + var12.right + var11.Padding.Large * 2), 1, -(var12.top + var12.bottom + var11.Padding.Large * 2)),
				ref = var20
			}, {
				Toolbar = reactModule.createElement(view, {
					ZIndex = 1000,
					tag = "col align-x-center gap-xsmall position-center-right anchor-center-right auto-xy padding-xsmall radius-medium bg-surface-100",
					testId = "in-game-build-shell-floating-toolbar",
					Visible = var17,
					onActivated = noop,
					stateLayer = { affordance = stateLayerAffordance.None }
				}, {
					DragDetector = reactModule.createElement("UIDragDetector", {
						BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
						BoundingUI = var18,
						DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
						ReferenceUIInstance = var18,
						ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale
					}),
					Buttons = reactModule.createElement(reactModule.Fragment, nil, createToolbarButtons(p1.onActivated, p1.onCaptureActivated, var7, "in-game-build-shell-floating")),
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
				Size = var38,
				onAbsoluteSizeChanged = var32
			}),
			RightInset = if var15 and not var16 then reactModule.createElement(view, {
				ZIndex = 1000,
				tag = "col align-x-center align-y-center gap-xsmall anchor-top-right size-0-full auto-x bg-surface-100",
				testId = "in-game-build-shell-right-toolbar",
				Position = var33,
				padding = {
					left = UDim.new(0, var11.Padding.Small),
					right = UDim.new(0, math.max(var12.right, var11.Padding.Small))
				},
				onAbsolutePositionChanged = var31,
				onAbsoluteSizeChanged = var31
			}, createToolbarButtons(p1.onActivated, p1.onCaptureActivated, var7, "in-game-build-shell-landscape")) else nil,
			TopRightInnerCorner = if var15 and not var16 then reactModule.createElement(view, {
				ZIndex = 1000,
				tag = "anchor-top-right clip",
				testId = "in-game-build-shell-top-right-inner-corner",
				Position = var34,
				Size = UDim2.fromOffset(size1200, size1200)
			}, {
				Image = reactModule.createElement(image, {
					Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
					ZIndex = 1000,
					testId = "in-game-build-shell-top-right-inner-corner-image",
					Position = UDim2.fromOffset(-size1200, 0),
					Size = UDim2.fromOffset(size1200 * 2, size1200 * 2),
					imageStyle = var39
				})
			}) else nil,
			BottomLeftInnerCorner = if var16 or var15 or var26 == 0 then nil else reactModule.createElement(view, {
				ZIndex = 1000,
				tag = "anchor-bottom-left clip",
				testId = "in-game-build-shell-bottom-left-inner-corner",
				Position = var36,
				Size = UDim2.fromOffset(size1200, size1200)
			}, {
				Image = reactModule.createElement(image, {
					Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
					ZIndex = 1000,
					testId = "in-game-build-shell-bottom-left-inner-corner-image",
					Position = UDim2.fromOffset(0, -size1200),
					Size = UDim2.fromOffset(size1200 * 2, size1200 * 2),
					imageStyle = var39
				})
			}),
			BottomRightInnerCorner = if var16 or not var15 and var26 == 0 then nil else reactModule.createElement(view, {
				ZIndex = 1000,
				tag = "anchor-bottom-right clip",
				testId = "in-game-build-shell-bottom-right-inner-corner",
				Position = var37,
				Size = UDim2.fromOffset(size1200, size1200)
			}, {
				Image = reactModule.createElement(image, {
					Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
					ZIndex = 1000,
					testId = "in-game-build-shell-bottom-right-inner-corner-image",
					Position = UDim2.fromOffset(-size1200, -size1200),
					Size = UDim2.fromOffset(size1200 * 2, size1200 * 2),
					imageStyle = var39
				})
			}),
			BottomBar = reactModule.createElement(view, {
				tag = "row align-x-center align-y-center gap-xsmall anchor-bottom-left size-full-0 auto-y bg-surface-100",
				testId = "in-game-build-shell-bottom-inset",
				Position = var35,
				Visible = not var15 and not var16,
				onAbsoluteSizeChanged = var30,
				padding = {
					top = UDim.new(0, var11.Padding.Small),
					left = UDim.new(0, var11.Padding.Large),
					right = UDim.new(0, var11.Padding.Large),
					bottom = UDim.new(0, var11.Margin.Small + var12.bottom)
				}
			}, createToolbarButtons(p1.onActivated, p1.onCaptureActivated, var7, "in-game-build-shell"))
		}),
		PublishSheet = if var5 ~= nil then nil else reactModule.createElement(publishSheetControllerModule, {
			showPreviewButton = false,
			isOpen = var1,
			target = var5,
			onClose = var8,
			navigateToSubPage = var10
		}),
		PublishPage = if var5 ~= nil then nil else reactModule.createElement(buildPillMenuPageHostModule, { activePage = var3, target = var5, onClose = var9 })
	})
end