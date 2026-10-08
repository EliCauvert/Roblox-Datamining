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

local function createToolbarButtons(p1, p2, p3)
	-- upvalues: reactModule (ref), iconButton (ref), iconName (ref), noop (ref), inputSize (ref), buttonVariant (ref)
	if p1.isSelecting then
		return {
			Cancel = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				icon = iconName.X,
				onActivated = p1.onSelectionCancelled or noop,
				size = inputSize.Medium,
				testId = `{p3}-cancel-selection`,
				variant = buttonVariant.Utility
			}),
			Confirm = if p1.onSelectionConfirmed ~= nil then nil else reactModule.createElement(iconButton, {
				LayoutOrder = 2,
				icon = iconName.CheckLarge,
				onActivated = p1.onSelectionConfirmed,
				size = inputSize.Medium,
				testId = `{p3}-confirm-selection`,
				variant = buttonVariant.Utility
			})
		}
	end
	local t = {
		Chat = reactModule.createElement(iconButton, {
			LayoutOrder = 1,
			icon = iconName.Nebula,
			onActivated = p1.onActivated,
			size = inputSize.Medium,
			testId = `{p3}-chat`,
			variant = buttonVariant.Utility
		}),
		Select = reactModule.createElement(iconButton, {
			LayoutOrder = 2,
			icon = iconName.CursorStars,
			onActivated = p1.onSelectionActivated or noop,
			size = inputSize.Medium,
			testId = `{p3}-select`,
			variant = buttonVariant.Utility
		}),
		Capture = reactModule.createElement(iconButton, {
			LayoutOrder = 3,
			icon = iconName.FrameCameraCenter,
			onActivated = p1.onCaptureActivated or noop,
			size = inputSize.Medium,
			testId = `{p3}-capture`,
			variant = buttonVariant.Utility
		}),
		Publish = reactModule.createElement(iconButton, {
			LayoutOrder = 4,
			icon = iconName.ArrowUpRightFromSquare,
			onActivated = p2,
			size = inputSize.Medium,
			testId = `{p3}-publish`,
			variant = buttonVariant.Utility
		})
	}
	
	if p1.isLibraryMode then
		t.Select = nil
		t.Capture = nil
	end
	return t
end

return function(p1)
	-- upvalues: reactModule (ref), getCurrentExperienceProjectModule (ref), useTokens (ref), usePreferences (ref), useOverlay (ref), useHardwareInsetsModule (ref), displayModule (ref), coreGuiCommonModule (ref), signalsReactModule (ref), motionModule (ref), view (ref), noop (ref), stateLayerAffordance (ref), createToolbarButtons (ref), image (ref), foundationModule (ref), publishSheetControllerModule (ref), buildPillMenuPageHostModule (ref)
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
	local var13 = signalsReactModule.useSignalState(displayStore.getGuiInset)
	local var14, var15 = reactModule.useState(nil)
	local var16 = signalsReactModule.useSignalState(displayStore.getViewportSize)
	local var17 = signalsReactModule.useSignalState(displayStore.getDisplaySize)
	local var18 = var16.Y < var16.X
	local var19 = var17 ~= nil and var17 ~= Enum.DisplaySize.Small
	local var20 = var19 or p1.isVisible ~= false
	local var21, var22 = reactModule.useState(nil)
	local var23 = reactModule.useCallback(function(p2)
		-- upvalues: var22 (ref)
		var22(p2)
	end, {})
	local size1200 = var11.Size.Size_1200
	local var24 = reactModule.useMemo(function()
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
	local var25, var26 = motionModule.useMotion(if var20 then var24.visible else var24.hidden)
	local var27, var28 = reactModule.useState(var20)
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), var26 (ref), var24 (ref), p1 (ref), var28 (ref)
		local var29 = false
		
		if var20 then
			var28(true)
			var26(var24.visible)
		else
			var26(var24.hidden, {
				onAnimationComplete = function(p2)
					-- upvalues: var29 (write), p1 (copy), var28 (copy)
					if not var29 and p2 == true then
						if p1.onInsetsChanged ~= nil then
							p1.onInsetsChanged(0, 0, 0)
						end
						var28(false)
					end
				end
			})
		end
		return function()
			-- upvalues: var29 (write)
			var29 = true
		end
	end, { var26, var24, var20, p1.onInsetsChanged })
	local var29, var30 = reactModule.useState(0)
	local var31, var32 = reactModule.useState(0)
	local var33 = reactModule.useCallback(function(p2)
		-- upvalues: var30 (ref)
		var30(p2.AbsoluteSize.Y)
	end, {})
	local var34 = reactModule.useCallback(function(p2)
		-- upvalues: var32 (ref), keepOutAreasStore (ref)
		var32(p2.AbsoluteSize.X)
		keepOutAreasStore.setKeepOutArea("build-shell-right-inset", p2.AbsolutePosition, p2.AbsoluteSize)
	end, { keepOutAreasStore })
	local var35 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var18 (ref), var19 (ref)
		if p1.onInsetsChanged ~= nil then
			p1.onInsetsChanged(0, if var18 and not var19 then p2.AbsoluteSize.X else 0, if var18 or var19 then 0 else p2.AbsoluteSize.Y)
		end
	end, { var18, p1.onInsetsChanged, var19 })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), p1 (ref)
		if var19 and p1.onInsetsChanged ~= nil then
			p1.onInsetsChanged(0, 0, 0)
		end
	end, { p1.onInsetsChanged, var19 })
	reactModule.useEffect(function()
		-- upvalues: var27 (ref), var18 (ref), var19 (ref), keepOutAreasStore (ref)
		if not var27 or not var18 or var19 then
			keepOutAreasStore.removeKeepOutArea("build-shell-right-inset")
		end
	end, { var18, var27, keepOutAreasStore, var19 })
	reactModule.useEffect(function()
		-- upvalues: keepOutAreasStore (ref)
		return function()
			-- upvalues: keepOutAreasStore (copy)
			keepOutAreasStore.removeKeepOutArea("build-shell-right-inset")
		end
	end, { keepOutAreasStore })
	local progress = var25.progress
	local var36 = progress:map(function(p2)
		-- upvalues: var31 (ref)
		return UDim2.new(1, var31 * (1 - p2), 0, 0)
	end)
	local var37 = progress:map(function(p2)
		-- upvalues: var31 (ref)
		return UDim2.new(1, -var31 * p2 + 1, 0, 0)
	end)
	local var38 = progress:map(function(p2)
		-- upvalues: var29 (ref)
		return UDim2.new(0, 0, 1, var29 * (1 - p2))
	end)
	local var39 = progress:map(function(p2)
		-- upvalues: var29 (ref)
		return UDim2.new(0, -1, 1, -var29 * p2 + 1)
	end)
	local var40 = progress:map(function(p2)
		-- upvalues: var18 (ref), var31 (ref), var29 (ref)
		return UDim2.new(1, -(if var18 then var31 else 0) * p2 + 1, 1, -(if var18 then 0 else var29) * p2 + 1)
	end)
	local var41 = progress:map(function(p2)
		-- upvalues: var19 (ref), var18 (ref), var31 (ref), var29 (ref)
		return if var19 then UDim2.fromOffset(0, 0) else UDim2.fromOffset((if var18 then var31 else 0) * p2, (if var18 then 0 else var29) * p2)
	end)
	local surface100 = var11.Color.Surface.Surface_100
	local var42 = progress:map(function(p2)
		-- upvalues: surface100 (ref)
		return {
			Color3 = surface100.Color3,
			Transparency = 1 - (1 - surface100.Transparency) * p2
		}
	end)
	local createElement = reactModule.createElement
	createElement = createElement(view, {
		tag = "size-full",
		Visible = var27,
		testId = p1.testId or "in-game-build-shell"
	}, {
		FloatingToolbarBounds = if var19 then reactModule.createElement(view, {
			testId = "in-game-build-shell-floating-toolbar-bounds",
			Position = UDim2.fromOffset(var12.left + var11.Padding.Large, var12.top + var11.Padding.Large),
			Size = UDim2.new(1, -(var12.left + var12.right + var11.Padding.Large * 2), 1, -(var12.top + var12.bottom + var11.Padding.Large * 2)),
			ref = var23
		}, {
			Toolbar = reactModule.createElement(view, {
				ZIndex = 1000,
				tag = "col align-x-center gap-xsmall position-center-right anchor-center-right auto-xy padding-xsmall radius-medium bg-surface-100",
				testId = "in-game-build-shell-floating-toolbar",
				Visible = var20,
				onActivated = noop,
				stateLayer = { affordance = stateLayerAffordance.None }
			}, {
				DragDetector = reactModule.createElement("UIDragDetector", {
					BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
					BoundingUI = var21,
					DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
					ReferenceUIInstance = var21,
					ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale
				}),
				Buttons = reactModule.createElement(reactModule.Fragment, nil, createToolbarButtons(p1, var7, "in-game-build-shell-floating")),
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
			Size = var41,
			onAbsoluteSizeChanged = var35
		}),
		RightInset = if var18 and not var19 then reactModule.createElement(view, {
			ZIndex = 1000,
			tag = "col align-x-center align-y-center gap-xsmall anchor-top-right size-0-full auto-x bg-surface-100",
			testId = "in-game-build-shell-right-toolbar",
			Position = var36,
			padding = {
				left = UDim.new(0, var11.Padding.Small),
				right = UDim.new(0, math.max(var12.right, var11.Padding.Small))
			},
			onAbsolutePositionChanged = var34,
			onAbsoluteSizeChanged = var34
		}, createToolbarButtons(p1, var7, "in-game-build-shell-landscape")) else nil,
		TopRightInnerCorner = if var18 and not var19 then reactModule.createElement(view, {
			ZIndex = 1000,
			tag = "anchor-top-right clip",
			testId = "in-game-build-shell-top-right-inner-corner",
			Position = var37,
			Size = UDim2.fromOffset(size1200, size1200)
		}, {
			Image = reactModule.createElement(image, {
				Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
				ZIndex = 1000,
				testId = "in-game-build-shell-top-right-inner-corner-image",
				Position = UDim2.fromOffset(-size1200, 0),
				Size = UDim2.fromOffset(size1200 * 2, size1200 * 2),
				imageStyle = var42
			})
		}) else nil,
		BottomLeftInnerCorner = if var19 or var18 or var29 == 0 then nil else reactModule.createElement(view, {
			ZIndex = 1000,
			tag = "anchor-bottom-left clip",
			testId = "in-game-build-shell-bottom-left-inner-corner",
			Position = var39,
			Size = UDim2.fromOffset(size1200, size1200)
		}, {
			Image = reactModule.createElement(image, {
				Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
				ZIndex = 1000,
				testId = "in-game-build-shell-bottom-left-inner-corner-image",
				Position = UDim2.fromOffset(0, -size1200),
				Size = UDim2.fromOffset(size1200 * 2, size1200 * 2),
				imageStyle = var42
			})
		}),
		BottomRightInnerCorner = if var19 or not var18 and var29 == 0 then nil else reactModule.createElement(view, {
			ZIndex = 1000,
			tag = "anchor-bottom-right clip",
			testId = "in-game-build-shell-bottom-right-inner-corner",
			Position = var40,
			Size = UDim2.fromOffset(size1200, size1200)
		}, {
			Image = reactModule.createElement(image, {
				Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
				ZIndex = 1000,
				testId = "in-game-build-shell-bottom-right-inner-corner-image",
				Position = UDim2.fromOffset(-size1200, -size1200),
				Size = UDim2.fromOffset(size1200 * 2, size1200 * 2),
				imageStyle = var42
			})
		}),
		BottomBar = reactModule.createElement(view, {
			tag = "row align-x-center align-y-center gap-xsmall anchor-bottom-left size-full-0 auto-y bg-surface-100",
			testId = "in-game-build-shell-bottom-inset",
			Position = var38,
			Visible = not var18 and not var19,
			onAbsoluteSizeChanged = var33,
			padding = {
				top = UDim.new(0, var11.Padding.Small),
				left = UDim.new(0, var11.Padding.Large),
				right = UDim.new(0, var11.Padding.Large),
				bottom = UDim.new(0, var11.Margin.Small + var12.bottom)
			}
		}, createToolbarButtons(p1, var7, "in-game-build-shell"))
	})
	local var43 = var12.top + var13.top
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Shell = createElement,
		PublishOverlay = if var5 == nil or p1.isLibraryMode then nil else reactModule.createElement(view, {
			ZIndex = 2,
			testId = "in-game-build-shell-publish-overlay",
			Position = UDim2.fromOffset(0, var43),
			Size = UDim2.new(1, 0, 1, -var43),
			ref = var15
		}),
		PublishSheet = if var5 == nil or not p1.isLibraryMode and var14 == nil then nil else reactModule.createElement(foundationModule.OverlayProvider, { gui = if p1.isLibraryMode then nil else var14 }, {
			Controller = reactModule.createElement(publishSheetControllerModule, {
				showPreviewButton = false,
				isOpen = var1,
				target = var5,
				onClose = var8,
				navigateToSubPage = var10
			})
		}),
		PublishPage = if var5 ~= nil then nil else reactModule.createElement(buildPillMenuPageHostModule, { activePage = var3, target = var5, onClose = var9 })
	})
end