local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CoreGuiCommonModule = require(Parent.CoreGuiCommon)
local DisplayModule = require(Parent.Display)
local FoundationModule = require(Parent.Foundation)
local MotionModule = require(Parent.Motion)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local BuildPillMenuPageHostModule = require(BuildExperience.Components.BuildPillMenu.BuildPillMenuPageHost)
local PublishSheetControllerModule = require(BuildExperience.Components.PublishSheet.PublishSheetController)
local GetCurrentExperienceProjectModule = require(BuildExperience.utils.getCurrentExperienceProject)
local UseHardwareInsetsModule = require(script.Parent.useHardwareInsets)
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local UseGamePermissionsModule = require(BuildExperience.useGamePermissions)
local Image = FoundationModule.Image
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseOverlayFunction = FoundationModule.Hooks.useOverlay
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function noop() end

local function createToolbarButtons(p1, UseResult, p2, p3)
	-- upvalues: FFlagBuildCheckGamePermissionsModule (copy), ReactModule (copy), IconButton (copy), IconName (copy), noop (copy), InputSize (copy), ButtonVariant (copy)
	local NoCanEditOnBuild: boolean = FFlagBuildCheckGamePermissionsModule and not p3.canEditOnBuild
	
	if p1.isSelecting then
		return {
			Cancel = ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				icon = IconName.X,
				onActivated = p1.onSelectionCancelled or noop,
				size = InputSize.Medium,
				testId = `{p2}-cancel-selection`,
				variant = ButtonVariant.Utility
			}),
			Confirm = if p1.onSelectionConfirmed == nil then nil else ReactModule.createElement(IconButton, {
				LayoutOrder = 2,
				icon = IconName.CheckLarge,
				isDisabled = NoCanEditOnBuild,
				onActivated = p1.onSelectionConfirmed,
				size = InputSize.Medium,
				testId = `{p2}-confirm-selection`,
				variant = ButtonVariant.Utility
			})
		}
	end
	local config = {
		Chat = ReactModule.createElement(IconButton, {
			LayoutOrder = 1,
			icon = IconName.Nebula,
			onActivated = p1.onActivated,
			size = InputSize.Medium,
			testId = `{p2}-chat`,
			variant = ButtonVariant.Utility
		}),
		Select = ReactModule.createElement(IconButton, {
			LayoutOrder = 2,
			icon = IconName.CursorStars,
			isDisabled = NoCanEditOnBuild,
			onActivated = p1.onSelectionActivated or noop,
			size = InputSize.Medium,
			testId = `{p2}-select`,
			variant = ButtonVariant.Utility
		}),
		Capture = ReactModule.createElement(IconButton, {
			LayoutOrder = 3,
			icon = IconName.FrameCameraCenter,
			isDisabled = NoCanEditOnBuild,
			onActivated = p1.onCaptureActivated or noop,
			size = InputSize.Medium,
			testId = `{p2}-capture`,
			variant = ButtonVariant.Utility
		}),
		Publish = ReactModule.createElement(IconButton, {
			LayoutOrder = 4,
			icon = IconName.ArrowUpRightFromSquare,
			isDisabled = FFlagBuildCheckGamePermissionsModule and not p3.canPublish,
			onActivated = UseResult,
			size = InputSize.Medium,
			testId = `{p2}-publish`,
			variant = ButtonVariant.Utility
		})
	}
	
	if p1.isLibraryMode then
		config.Select = nil
		config.Capture = nil
	end
	return config
end

return function(p1)
	-- upvalues: ReactModule (copy), FFlagBuildCheckGamePermissionsModule (copy), UseGamePermissionsModule (copy), GetCurrentExperienceProjectModule (copy), UseTokensFunction (copy), UsePreferencesFunction (copy), UseOverlayFunction (copy), UseHardwareInsetsModule (copy), DisplayModule (copy), CoreGuiCommonModule (copy), SignalsReactModule (copy), MotionModule (copy), View (copy), noop (copy), StateLayerAffordance (copy), createToolbarButtons (copy), Image (copy), FoundationModule (copy), PublishSheetControllerModule (copy), BuildPillMenuPageHostModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseGamePermissionsModuleResult = if FFlagBuildCheckGamePermissionsModule then UseGamePermissionsModule({
		universeId = GetCurrentExperienceProjectModule().universeId
	}) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetCurrentExperienceProjectModule (upval), UseStateResult2_2 (copy), UseStateResult2 (copy)
		local CurrentExperienceProjectModule = GetCurrentExperienceProjectModule()
		
		if CurrentExperienceProjectModule.universeId ~= nil then
			UseStateResult2_2({
				sessionId = nil,
				isNewGameTarget = false,
				universeId = CurrentExperienceProjectModule.universeId,
				placeId = CurrentExperienceProjectModule.placeId
			})
			UseStateResult2(true)
			
			return
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(nil)
	end, {})
	local UseResult3 = ReactModule.useCallback(function(Screen, p2)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1({
			type = "screen",
			screen = Screen,
			target = {
				universeId = p2.universeId,
				placeId = p2.placeId,
				sessionId = p2.sessionId,
				isNewGameTarget = p2.isNewGameTarget or false
			}
		})
	end, {})
	local UseTokensResult = UseTokensFunction()
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseHardwareInsetsModuleResult = UseHardwareInsetsModule((UseOverlayFunction()))
	local DisplayStore = DisplayModule.GetDisplayStore(false)
	local KeepOutAreasStore = CoreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(DisplayStore.getGuiInset)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(DisplayStore.getViewportSize)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(DisplayStore.getDisplaySize)
	local IsYBelow = UseSignalStateResult1.Y < UseSignalStateResult1.X
	local IsNotUseSignalStateResultMatch: boolean = UseSignalStateResult2 ~= nil and UseSignalStateResult2 ~= Enum.DisplaySize.Small
	local IsNotUseSignalStateResultMatch1: boolean = IsNotUseSignalStateResultMatch or p1.isVisible ~= false
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(nil)
	local UseResult4 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_4 (copy)
		UseStateResult2_4(p2)
	end, {})
	local Size1200: number = UseTokensResult.Size.Size_1200
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: MotionModule (upval), ReducedMotion (copy), UseTokensResult (copy)
		return {
			visible = MotionModule.createState({ progress = 1 }, {
				default = MotionModule.transition({
					duration = if ReducedMotion then 0 else UseTokensResult.Time.Time_300,
					easingStyle = UseTokensResult.Ease.StandardOut
				})
			}),
			hidden = MotionModule.createState({ progress = 0 }, {
				default = MotionModule.transition({
					duration = if ReducedMotion then 0 else UseTokensResult.Time.Time_100,
					easingStyle = UseTokensResult.Ease.StandardIn
				})
			})
		}
	end, { ReducedMotion, UseTokensResult })
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion(if IsNotUseSignalStateResultMatch1 then UseMemoResult.visible else UseMemoResult.hidden)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(IsNotUseSignalStateResultMatch1)
	ReactModule.useEffect(function()
		-- upvalues: IsNotUseSignalStateResultMatch1 (copy), UseMotionResult2 (copy), UseMemoResult (copy), p1 (copy), UseStateResult2_5 (copy)
		local Flag = false
		
		if IsNotUseSignalStateResultMatch1 then
			UseStateResult2_5(true)
			UseMotionResult2(UseMemoResult.visible)
		else
			UseMotionResult2(UseMemoResult.hidden, {
				onAnimationComplete = function(Enabled)
					-- upvalues: Flag (ref), p1 (upval), UseStateResult2_5 (upval)
					if not Flag and Enabled == true then
						if p1.onInsetsChanged ~= nil then
							p1.onInsetsChanged(0, 0, 0)
						end
						UseStateResult2_5(false)
					end
				end
			})
		end
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		UseMotionResult2,
		UseMemoResult,
		IsNotUseSignalStateResultMatch1,
		p1.onInsetsChanged
	})
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(0)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(0)
	local UseResult5 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2_6 (copy)
		UseStateResult2_6(Frame.AbsoluteSize.Y)
	end, {})
	local UseResult6 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseStateResult2_7 (copy), KeepOutAreasStore (copy)
		UseStateResult2_7(Frame.AbsoluteSize.X)
		KeepOutAreasStore.setKeepOutArea("build-shell-right-inset", Frame.AbsolutePosition, Frame.AbsoluteSize)
	end, { KeepOutAreasStore })
	local UseResult7 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: p1 (copy), IsYBelow (copy), IsNotUseSignalStateResultMatch (copy)
		if p1.onInsetsChanged ~= nil then
			p1.onInsetsChanged(0, if IsYBelow and not IsNotUseSignalStateResultMatch then Frame.AbsoluteSize.X else 0, if IsYBelow or IsNotUseSignalStateResultMatch then 0 else Frame.AbsoluteSize.Y)
		end
	end, {
		IsYBelow,
		p1.onInsetsChanged,
		IsNotUseSignalStateResultMatch
	})
	ReactModule.useEffect(function()
		-- upvalues: IsNotUseSignalStateResultMatch (copy), p1 (copy)
		if IsNotUseSignalStateResultMatch and p1.onInsetsChanged ~= nil then
			p1.onInsetsChanged(0, 0, 0)
		end
	end, { p1.onInsetsChanged, IsNotUseSignalStateResultMatch })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult6 (copy), IsYBelow (copy), IsNotUseSignalStateResultMatch (copy), KeepOutAreasStore (copy)
		if not UseStateResult6 or not IsYBelow or IsNotUseSignalStateResultMatch then
			KeepOutAreasStore.removeKeepOutArea("build-shell-right-inset")
		end
	end, {
		IsYBelow,
		UseStateResult6,
		KeepOutAreasStore,
		IsNotUseSignalStateResultMatch
	})
	ReactModule.useEffect(function()
		-- upvalues: KeepOutAreasStore (copy)
		return function()
			-- upvalues: KeepOutAreasStore (upval)
			KeepOutAreasStore.removeKeepOutArea("build-shell-right-inset")
		end
	end, { KeepOutAreasStore })
	local Progress = UseMotionResult.progress
	local MapResult = Progress:map(function(p2: number): UDim2
		-- upvalues: UseStateResult8 (copy)
		return UDim2.new(1, UseStateResult8 * (1 - p2), 0, 0)
	end)
	local MapResult1 = Progress:map(function(p2): UDim2
		-- upvalues: UseStateResult8 (copy)
		return UDim2.new(1, -UseStateResult8 * p2 + 1, 0, 0)
	end)
	local MapResult2 = Progress:map(function(p2): UDim2
		-- upvalues: UseStateResult7 (copy)
		return UDim2.new(0, -1, 1, -UseStateResult7 * p2 + 1)
	end)
	local MapResult3 = Progress:map(function(p2): UDim2
		-- upvalues: IsYBelow (copy), UseStateResult8 (copy), UseStateResult7 (copy)
		return UDim2.new(1, -(if IsYBelow then UseStateResult8 else 0) * p2 + 1, 1, -(if IsYBelow then 0 else UseStateResult7) * p2 + 1)
	end)
	local Surface100 = UseTokensResult.Color.Surface.Surface_100
	local MapResult4 = Progress:map(function(p2)
		-- upvalues: Surface100 (copy)
		return {
			Color3 = Surface100.Color3,
			Transparency = 1 - (1 - Surface100.Transparency) * p2
		}
	end)
	local NewTop = UseHardwareInsetsModuleResult.top + UseSignalStateResult.top
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Shell = ReactModule.createElement(View, {
			tag = "size-full",
			Visible = UseStateResult6,
			testId = p1.testId or "in-game-build-shell"
		}, {
			FloatingToolbarBounds = if IsNotUseSignalStateResultMatch then ReactModule.createElement(View, {
				testId = "in-game-build-shell-floating-toolbar-bounds",
				Position = UDim2.fromOffset(UseHardwareInsetsModuleResult.left + UseTokensResult.Padding.Large, UseHardwareInsetsModuleResult.top + UseTokensResult.Padding.Large),
				Size = UDim2.new(1, -(UseHardwareInsetsModuleResult.left + UseHardwareInsetsModuleResult.right + UseTokensResult.Padding.Large * 2), 1, -(UseHardwareInsetsModuleResult.top + UseHardwareInsetsModuleResult.bottom + UseTokensResult.Padding.Large * 2)),
				ref = UseResult4
			}, {
				Toolbar = ReactModule.createElement(View, {
					ZIndex = 1000,
					tag = "col align-x-center gap-xsmall position-center-right anchor-center-right auto-xy padding-xsmall radius-medium bg-surface-100",
					testId = "in-game-build-shell-floating-toolbar",
					Visible = IsNotUseSignalStateResultMatch1,
					onActivated = noop,
					stateLayer = { affordance = StateLayerAffordance.None }
				}, {
					DragDetector = ReactModule.createElement("UIDragDetector", {
						BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
						BoundingUI = UseStateResult5,
						DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
						ReferenceUIInstance = UseStateResult5,
						ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale
					}),
					Buttons = ReactModule.createElement(ReactModule.Fragment, nil, (createToolbarButtons(p1, UseResult, "in-game-build-shell-floating", UseGamePermissionsModuleResult))),
					DragAffordance = ReactModule.createElement(View, {
						LayoutOrder = 6,
						tag = "position-center-center anchor-center-center auto-xy padding-xxsmall"
					}, {
						Icon = ReactModule.createElement(Image, {
							Image = "component_assets/dragger_small",
							tag = "position-center-center anchor-center-center size-600-400 content-muted"
						})
					})
				})
			}) else nil,
			InsetReporter = ReactModule.createElement(View, {
				testId = "in-game-build-shell-inset-reporter",
				Size = Progress:map(function(p2): UDim2
					-- upvalues: IsNotUseSignalStateResultMatch (copy), IsYBelow (copy), UseStateResult8 (copy), UseStateResult7 (copy)
					return if IsNotUseSignalStateResultMatch then UDim2.fromOffset(0, 0) else UDim2.fromOffset((if IsYBelow then UseStateResult8 else 0) * p2, (if IsYBelow then 0 else UseStateResult7) * p2)
				end),
				onAbsoluteSizeChanged = UseResult7
			}),
			RightInset = if IsYBelow and not IsNotUseSignalStateResultMatch then ReactModule.createElement(View, {
				ZIndex = 1000,
				tag = "col align-x-center align-y-center gap-xsmall anchor-top-right size-0-full auto-x bg-surface-100",
				testId = "in-game-build-shell-right-toolbar",
				Position = MapResult,
				padding = {
					left = UDim.new(0, UseTokensResult.Padding.Small),
					right = UDim.new(0, (math.max(UseHardwareInsetsModuleResult.right, UseTokensResult.Padding.Small)))
				},
				onAbsolutePositionChanged = UseResult6,
				onAbsoluteSizeChanged = UseResult6
			}, (createToolbarButtons(p1, UseResult, "in-game-build-shell-landscape", UseGamePermissionsModuleResult))) else nil,
			TopRightInnerCorner = if IsYBelow and not IsNotUseSignalStateResultMatch then ReactModule.createElement(View, {
				ZIndex = 1000,
				tag = "anchor-top-right clip",
				testId = "in-game-build-shell-top-right-inner-corner",
				Position = MapResult1,
				Size = UDim2.fromOffset(Size1200, Size1200)
			}, {
				Image = ReactModule.createElement(Image, {
					Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
					ZIndex = 1000,
					testId = "in-game-build-shell-top-right-inner-corner-image",
					Position = UDim2.fromOffset(-Size1200, 0),
					Size = UDim2.fromOffset(Size1200 * 2, Size1200 * 2),
					imageStyle = MapResult4
				})
			}) else nil,
			BottomLeftInnerCorner = if IsNotUseSignalStateResultMatch or IsYBelow or UseStateResult7 == 0 then nil else ReactModule.createElement(View, {
				ZIndex = 1000,
				tag = "anchor-bottom-left clip",
				testId = "in-game-build-shell-bottom-left-inner-corner",
				Position = MapResult2,
				Size = UDim2.fromOffset(Size1200, Size1200)
			}, {
				Image = ReactModule.createElement(Image, {
					Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
					ZIndex = 1000,
					testId = "in-game-build-shell-bottom-left-inner-corner-image",
					Position = UDim2.fromOffset(0, -Size1200),
					Size = UDim2.fromOffset(Size1200 * 2, Size1200 * 2),
					imageStyle = MapResult4
				})
			}),
			BottomRightInnerCorner = if IsNotUseSignalStateResultMatch or not IsYBelow and UseStateResult7 == 0 then nil else ReactModule.createElement(View, {
				ZIndex = 1000,
				tag = "anchor-bottom-right clip",
				testId = "in-game-build-shell-bottom-right-inner-corner",
				Position = MapResult3,
				Size = UDim2.fromOffset(Size1200, Size1200)
			}, {
				Image = ReactModule.createElement(Image, {
					Image = "rbxasset://textures/ui/AvatarExperience/CircleCutoutLargeNoBorder.png",
					ZIndex = 1000,
					testId = "in-game-build-shell-bottom-right-inner-corner-image",
					Position = UDim2.fromOffset(-Size1200, -Size1200),
					Size = UDim2.fromOffset(Size1200 * 2, Size1200 * 2),
					imageStyle = MapResult4
				})
			}),
			BottomBar = ReactModule.createElement(View, {
				tag = "row align-x-center align-y-center gap-xsmall anchor-bottom-left size-full-0 auto-y bg-surface-100",
				testId = "in-game-build-shell-bottom-inset",
				Position = Progress:map(function(p2: number): UDim2
					-- upvalues: UseStateResult7 (copy)
					return UDim2.new(0, 0, 1, UseStateResult7 * (1 - p2))
				end),
				Visible = not IsYBelow and not IsNotUseSignalStateResultMatch,
				onAbsoluteSizeChanged = UseResult5,
				padding = {
					top = UDim.new(0, UseTokensResult.Padding.Small),
					left = UDim.new(0, UseTokensResult.Padding.Large),
					right = UDim.new(0, UseTokensResult.Padding.Large),
					bottom = UDim.new(0, UseTokensResult.Margin.Small + UseHardwareInsetsModuleResult.bottom)
				}
			}, (createToolbarButtons(p1, UseResult, "in-game-build-shell", UseGamePermissionsModuleResult)))
		}),
		PublishOverlay = if UseStateResult3 == nil or p1.isLibraryMode then nil else ReactModule.createElement(View, {
			ZIndex = 2,
			testId = "in-game-build-shell-publish-overlay",
			Position = UDim2.fromOffset(0, NewTop),
			Size = UDim2.new(1, 0, 1, -NewTop),
			ref = UseStateResult2_3
		}),
		PublishSheet = if UseStateResult3 == nil or not p1.isLibraryMode and UseStateResult4 == nil then nil else ReactModule.createElement(FoundationModule.OverlayProvider, { gui = if p1.isLibraryMode then nil else UseStateResult4 }, {
			Controller = ReactModule.createElement(PublishSheetControllerModule, {
				showPreviewButton = false,
				isOpen = UseStateResult,
				target = UseStateResult3,
				onClose = UseResult1,
				navigateToSubPage = UseResult3
			})
		}),
		PublishPage = if UseStateResult3 == nil then nil else ReactModule.createElement(BuildPillMenuPageHostModule, {
			activePage = UseStateResult1,
			target = UseStateResult3,
			onClose = UseResult2
		})
	})
end