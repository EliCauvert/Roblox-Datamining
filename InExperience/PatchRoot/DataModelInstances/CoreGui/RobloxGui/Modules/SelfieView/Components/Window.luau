local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local Packages = CorePackages.Packages
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ReactModule = require(Packages.React)
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local LuauPolyfillModule = require(Packages.LuauPolyfill)
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local _ = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Service.WindowSizeSignal)
local UseWindowSizeIsLargeModule = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Hooks.useWindowSizeIsLarge)
local UIBloxModule = require(Packages.UIBlox)
local Interactable = UIBloxModule.Core.Control.Interactable
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local CameraStatusIconModule = require(script.Parent.CameraStatusIcon)
local CameraStatusDotModule = require(script.Parent.CameraStatusDot)
local SizingUtilsModule = require(script.Parent.Parent.Utils.SizingUtils)
local FaceChatUtilsModule = require(script.Parent.Parent.Utils.FaceChatUtils)
local ModelUtilsModule = require(script.Parent.Parent.Utils.ModelUtils)
local UseCameraOnModule = require(script.Parent.Parent.Hooks.useCameraOn)
local UseLocalPlayerModule = require(script.Parent.Parent.Hooks.useLocalPlayer)
local UseTrackerMessageModule = require(script.Parent.Parent.Hooks.useTrackerMessage)
local UseTooltipDismissalModule = require(script.Parent.Parent.Hooks.useTooltipDismissal)
local UseScreenSizeModule = require(CoreGui.RobloxGui.Modules.Common.Hooks.useScreenSize)
local ConstantsModule = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Unibar.Constants)
local Chrome = script.Parent.Parent.Parent.Chrome
local ServiceModule = if require(CorePackages.Workspace.Packages.Chrome).Enabled() then require(Chrome.Service) else nil
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(Chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local FFlagTopBarSignalizeScreenSize = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local ReactDevtoolsFixTopbar = game:DefineFastFlag("ReactDevtoolsFixTopbar", true)
local NewResult = require(CoreGui:WaitForChild("RobloxGui").Modules.SelfView.Analytics).new()
local IconsActionsPreviewShrink = Images["icons/actions/previewShrink"]
local IconsActionsPreviewExpand = Images["icons/actions/previewExpand"]
local FaceCloneModule = require(script.Parent.FaceClone)

return function(p1) --[[ Line: 78 | Named "Window" ]]
	-- upvalues: UseStyleFunction (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), UseCameraOnModule (copy), UseTrackerMessageModule (copy), UseWindowSizeIsLargeModule (copy), UseScreenSizeModule (copy), FFlagTopBarSignalizeScreenSize (copy), SizingUtilsModule (copy), UseSelectorFunction (copy), ReactModule (copy), UseLocalPlayerModule (copy), FaceChatUtilsModule (copy), UseTooltipDismissalModule (copy), ClearTimeoutFunction (copy), SetTimeoutFunction (copy), ModelUtilsModule (copy), NewResult (copy), FaceCloneModule (copy), ControlState (copy), Interactable (copy), CameraStatusIconModule (copy), ServiceModule (copy), ImageSetLabel (copy), IconsActionsPreviewShrink (copy), IconsActionsPreviewExpand (copy), StyledTextLabel (copy), ReactDevtoolsFixTopbar (copy), WithTooltipFunction (copy), CoreGui (copy), TooltipOrientation (copy), CameraStatusDotModule (copy)
	local Id = p1.id
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local CLOSEBUTTONFRAME = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().CLOSE_BUTTON_FRAME else ConstantsModule.CLOSE_BUTTON_FRAME
	local UseLocalizationResult = UseLocalizationFunction({
		robloxPermissionErrorHeader = "CoreScripts.TopBar.RobloxPermissionErrorHeader",
		dynamicAvatarMissingErrorHeader = "CoreScripts.TopBar.DynamicAvatarMissingErrorHeader",
		dynamicAvatarMissingErrorBody = "CoreScripts.TopBar.DynamicAvatarMissingErrorBody",
		robloxPermissionErrorBody = if UseAppPolicyFunction(function(p2) --[[ Line: 93 ]]
			return p2.getShowUpdatedCameraPath()
		end) then "CoreScripts.TopBar.RobloxPermissionErrorBodyTwo" else "CoreScripts.TopBar.RobloxPermissionErrorBody"
	})
	local UseCameraOnModuleResult = UseCameraOnModule()
	local UseTrackerMessageModuleResult = UseTrackerMessageModule()
	local UseWindowSizeIsLargeModuleResult = UseWindowSizeIsLargeModule(p1.windowSize)
	local UseScreenSizeModuleResult = UseScreenSizeModule()
	local Size = if FFlagTopBarSignalizeScreenSize then SizingUtilsModule.getSize(UseScreenSizeModuleResult, UseWindowSizeIsLargeModuleResult) else UseSelectorFunction(function(p2) --[[ Line: 114 ]]
		-- upvalues: SizingUtilsModule (upval), UseWindowSizeIsLargeModuleResult (copy)
		return SizingUtilsModule.getSize(p2.displayOptions.screenSize, UseWindowSizeIsLargeModuleResult)
	end)
	ReactModule.useEffect(function() --[[ Line: 117 ]]
		-- upvalues: p1 (copy), Size (copy)
		p1.windowSize:requestSize(Size.X, Size.Y)
	end, { Size })
	local UseLocalPlayerModuleResult = UseLocalPlayerModule()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 123 ]]
		-- upvalues: FaceChatUtilsModule (upval)
		return FaceChatUtilsModule.getPermissions().userCamEligible and FaceChatUtilsModule.getPermissions().placeCamEnabled
	end)
	local UseTooltipDismissalModuleResult, UseTooltipDismissalModuleResult2, UseTooltipDismissalModuleResult3, UseTooltipDismissalModuleResult4 = UseTooltipDismissalModule(2000)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	
	local function v61() --[[ Line: 136 ]]
		-- upvalues: UseRefResult (copy), ClearTimeoutFunction (upval), UseStateResult2 (copy), SetTimeoutFunction (upval)
		if UseRefResult.current then
			ClearTimeoutFunction(UseRefResult.current)
		end
		UseStateResult2(true)
		UseRefResult.current = SetTimeoutFunction(function() --[[ Line: 141 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end, 2000)
	end
	
	ReactModule.useEffect(function() --[[ Line: 145 ]]
		-- upvalues: UseRefResult (copy), ClearTimeoutFunction (upval), UseStateResult2 (copy), SetTimeoutFunction (upval)
		if UseRefResult.current then
			ClearTimeoutFunction(UseRefResult.current)
		end
		UseStateResult2(true)
		UseRefResult.current = SetTimeoutFunction(function() --[[ Line: 141 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end, 2000)
		
		return function() --[[ Line: 148 ]]
			-- upvalues: UseRefResult (upval), ClearTimeoutFunction (upval)
			if UseRefResult.current then
				ClearTimeoutFunction(UseRefResult.current)
			end
		end
	end, { UseRefResult })
	
	local function v62(p2) --[[ Line: 155 ]]
		-- upvalues: UseRefResult (copy), ClearTimeoutFunction (upval), UseStateResult2 (copy), SetTimeoutFunction (upval), FaceChatUtilsModule (upval), UseTooltipDismissalModuleResult4 (copy), UseLocalizationResult (copy), UseLocalPlayerModuleResult (copy), ModelUtilsModule (upval), NewResult (upval)
		if UseRefResult.current then
			ClearTimeoutFunction(UseRefResult.current)
		end
		UseStateResult2(true)
		UseRefResult.current = SetTimeoutFunction(function() --[[ Line: 141 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end, 2000)
		
		if not FaceChatUtilsModule.getPermissions().userCamEnabled and not p2 then
			UseTooltipDismissalModuleResult4(UseLocalizationResult.robloxPermissionErrorHeader, UseLocalizationResult.robloxPermissionErrorBody)
			
			return
		end
		if UseLocalPlayerModuleResult.Character and not ModelUtilsModule.hasDynamicHead(UseLocalPlayerModuleResult.Character) and not FaceChatUtilsModule.isCameraOn() and not p2 then
			UseTooltipDismissalModuleResult4(UseLocalizationResult.dynamicAvatarMissingErrorHeader, UseLocalizationResult.dynamicAvatarMissingErrorBody)
		end
		NewResult:setLastCtx("SelfView")
		FaceChatUtilsModule.toggleVideoAnimation()
	end
	
	local UseResult = ReactModule.useCallback(function() --[[ Line: 173 ]]
		-- upvalues: v62 (copy)
		v62(false)
	end, {
		FaceChatUtilsModule,
		ModelUtilsModule,
		UseLocalizationResult,
		UseLocalPlayerModuleResult
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 177 ]]
		-- upvalues: UseRefResult (copy), ClearTimeoutFunction (upval), UseStateResult2 (copy), SetTimeoutFunction (upval)
		if UseRefResult.current then
			ClearTimeoutFunction(UseRefResult.current)
		end
		UseStateResult2(true)
		UseRefResult.current = SetTimeoutFunction(function() --[[ Line: 141 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end, 2000)
	end, { v61, UseStateResult, p1.windowSize })
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 182 ]]
		-- upvalues: FaceCloneModule (upval), UseLocalPlayerModuleResult (copy), UseRefResult1 (copy)
		if _G.__TESTEZ_RUNNING_TEST__ then return end
		local FaceCloneModuleResult = FaceCloneModule(UseLocalPlayerModuleResult, UseRefResult1.current)
		
		return function() --[[ Line: 193 ]]
			-- upvalues: FaceCloneModuleResult (copy)
			if FaceCloneModuleResult then
				FaceCloneModuleResult()
			end
		end
	end, { UseLocalPlayerModuleResult, UseRefResult1 })
	local UseResult2 = ReactModule.useCallback(function(_, Hover) --[[ Line: 200 ]]
		-- upvalues: UseStateResult2_2 (copy), ControlState (upval)
		UseStateResult2_2(Hover == ControlState.Hover)
	end, { UseStateResult2_2 })
	local UseResult3 = ReactModule.useCallback(function(_, Hover) --[[ Line: 204 ]]
		-- upvalues: UseStateResult2_1 (copy), ControlState (upval)
		UseStateResult2_1(Hover == ControlState.Hover)
	end, { UseStateResult2_1 })
	local UseResult4 = ReactModule.useCallback(function(_, Hover) --[[ Line: 208 ]]
		-- upvalues: UseStateResult2_3 (copy), ControlState (upval)
		UseStateResult2_3(Hover == ControlState.Hover)
	end, { UseStateResult2_3 })
	local UseResult5 = ReactModule.useCallback(function(p2) --[[ Line: 212 ]]
		-- upvalues: ReactModule (upval), Interactable (upval), UseStateResult3 (copy), FaceChatUtilsModule (upval), UseStyleResult (copy), UseResult2 (copy), UseResult (copy), CameraStatusIconModule (upval)
		return ReactModule.createElement(Interactable, {
			Size = UDim2.fromOffset(36, 36),
			BackgroundColor3 = if UseStateResult3 and FaceChatUtilsModule.getPermissions().userCamEnabled then UseStyleResult.Theme.BackgroundOnHover.Color else UseStyleResult.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = UseStyleResult.Theme.Overlay.Transparency,
			onStateChanged = UseResult2,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			[ReactModule.Change.AbsoluteSize] = p2,
			[ReactModule.Change.AbsolutePosition] = p2,
			[ReactModule.Event.Activated] = UseResult
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			CameraStatusIcon = ReactModule.createElement(CameraStatusIconModule, {
				iconSize = UDim2.fromOffset(28, 28),
				transparency = if FaceChatUtilsModule.getPermissions().userCamEnabled then 0 else 0.5
			})
		})
	end, { UseResult2, UseResult })
	
	return ReactModule.createElement("Frame", {
		Name = "SelfieViewFrame",
		Active = true,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = 0,
		[ReactModule.Event.MouseEnter] = v61,
		[ReactModule.Event.MouseMoved] = v61,
		ref = UseRefResult1
	}, {}, {
		CloseButtonWrapper = UseStateResult and ReactModule.createElement("Frame", {
			ZIndex = 2,
			BackgroundTransparency = 1,
			Size = CLOSEBUTTONFRAME
		}, {
			CloseButtonLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			CloseButtonInteractable = ReactModule.createElement(Interactable, {
				Size = UDim2.fromOffset(36, 36),
				BackgroundColor3 = if UseStateResult1 then UseStyleResult.Theme.BackgroundOnHover.Color else UseStyleResult.Theme.BackgroundUIContrast.Color,
				BackgroundTransparency = 0.8,
				onStateChanged = UseResult3,
				[ReactModule.Event.Activated] = if ServiceModule then function() --[[ Line: 267 ]]
					-- upvalues: ServiceModule (upval), Id (copy)
					ServiceModule:toggleWindow(Id)
				end else nil
			}, {
				Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				Fragment = ReactModule.createElement(ReactModule.Fragment, nil, {
					ReactModule.createElement("Frame", {
						Name = "X1",
						BorderSizePixel = 0,
						BackgroundTransparency = 0,
						Rotation = 45,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Size = UDim2.new(0, 16, 0, 2),
						BackgroundColor3 = UseStyleResult.Theme.IconEmphasis.Color
					}, {
						Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
					}),
					(ReactModule.createElement("Frame", {
						Name = "X2",
						BorderSizePixel = 0,
						BackgroundTransparency = 0,
						Rotation = -45,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Size = UDim2.new(0, 16, 0, 2),
						BackgroundColor3 = UseStyleResult.Theme.IconEmphasis.Color
					}, {
						Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
					}))
				})
			})
		}),
		ExpandButtonWrapper = if UseStateResult then ReactModule.createElement("Frame", {
			ZIndex = 2,
			BackgroundTransparency = 1,
			Size = CLOSEBUTTONFRAME,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 0)
		}, {
			ExpandButtonLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			ExpandButtonPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 4),
				PaddingLeft = UDim.new(0, 4),
				PaddingRight = UDim.new(0, 4),
				PaddingBottom = UDim.new(0, 4)
			}),
			ExpandButtonInteractable = ReactModule.createElement(Interactable, {
				Size = UDim2.fromOffset(36, 36),
				BackgroundColor3 = if UseStateResult4 then UseStyleResult.Theme.BackgroundOnHover.Color else UseStyleResult.Theme.BackgroundUIContrast.Color,
				BackgroundTransparency = 0.8,
				onStateChanged = UseResult4,
				[ReactModule.Event.Activated] = if ServiceModule then function() --[[ Line: 337 ]]
					-- upvalues: p1 (copy)
					p1.windowSize:toggleIsLarge()
				end else nil
			}, {
				Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				ExpandImage = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromOffset(28, 28),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Image = if UseWindowSizeIsLargeModuleResult then IconsActionsPreviewShrink else IconsActionsPreviewExpand,
					ImageColor3 = Theme.TextEmphasis.Color,
					ImageTransparency = Theme.TextEmphasis.Transparency
				})
			})
		}) else nil,
		Corners = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		ControlMessage = ReactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, -44),
			BackgroundColor3 = Theme.BackgroundUIDefault.Color,
			AutomaticSize = Enum.AutomaticSize.XY,
			Visible = UseTrackerMessageModuleResult.visible
		}, {
			Corners = ReactModule.createElement("UICorner", {}),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 4),
				PaddingRight = UDim.new(0, 8),
				PaddingBottom = UDim.new(0, 4),
				PaddingLeft = UDim.new(0, 8)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", { FillDirection = Enum.FillDirection.Vertical }),
			Line1 = ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 1,
				text = UseTrackerMessageModuleResult.text,
				fontStyle = UseStyleResultFont.Footer,
				colorStyle = Theme.TextDefault,
				textXAlignment = Enum.TextXAlignment.Center,
				size = UDim2.fromOffset(46, 36),
				TextWrapped = not ReactDevtoolsFixTopbar or nil,
				textWrapped = if ReactDevtoolsFixTopbar then true else nil
			}),
			Line2 = ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 2,
				text = UseTrackerMessageModuleResult.status,
				fontStyle = UseStyleResultFont.Footer,
				colorStyle = Theme.ContextualPrimaryContent,
				textXAlignment = Enum.TextXAlignment.Center,
				size = UDim2.fromOffset(46, 12),
				automaticSize = Enum.AutomaticSize.Y
			})
		}),
		IconFrame = UseStateResult and UseMemoResult and ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = CLOSEBUTTONFRAME,
			Position = UDim2.fromScale(0.5, 1),
			AnchorPoint = Vector2.new(0.5, 1)
		}, {
			Tooltip = WithTooltipFunction({
				headerText = UseTooltipDismissalModuleResult,
				bodyText = UseTooltipDismissalModuleResult2,
				textXAlignment = Enum.TextXAlignment.Left
			}, {
				DisplayOrder = 101,
				guiTarget = CoreGui,
				active = UseTooltipDismissalModuleResult3,
				preferredOrientation = TooltipOrientation.Bottom
			}, UseResult5),
			Hover = ReactModule.createElement("Frame", {
				Size = UDim2.fromOffset(32, 32),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundTransparency = UseStyleResult.Theme.BackgroundOnHover.Transparency,
				BackgroundColor3 = UseStyleResult.Theme.BackgroundOnHover.Color
			}, {
				Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
			})
		}) or nil,
		CameraStatusDot = if UseCameraOnModuleResult then ReactModule.createElement(CameraStatusDotModule, {
			ZIndex = 2,
			Position = UDim2.new(1, -12, 1, -12),
			Size = UDim2.fromOffset(8, 8)
		}) else nil,
		Interactable = ReactModule.createElement(Interactable, {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			[ReactModule.Event.Activated] = UseResult1
		})
	})
end