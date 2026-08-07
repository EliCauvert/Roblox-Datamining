local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local packages = corePackagesService.Packages
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local reactModule = require(packages.React)
local useAppPolicy = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local useSelector = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local luauPolyfillModule = require(packages.LuauPolyfill)
local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout
local _ = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Service.WindowSizeSignal)
local useWindowSizeIsLargeModule = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Hooks.useWindowSizeIsLarge)
local UIBloxModule = require(packages.UIBlox)
local interactable = UIBloxModule.Core.Control.Interactable
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local controlState = UIBloxModule.Core.Control.Enum.ControlState
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local cameraStatusIconModule = require(script.Parent.CameraStatusIcon)
local cameraStatusDotModule = require(script.Parent.CameraStatusDot)
local sizingUtilsModule = require(script.Parent.Parent.Utils.SizingUtils)
local faceChatUtilsModule = require(script.Parent.Parent.Utils.FaceChatUtils)
local modelUtilsModule = require(script.Parent.Parent.Utils.ModelUtils)
local useCameraOnModule = require(script.Parent.Parent.Hooks.useCameraOn)
local useLocalPlayerModule = require(script.Parent.Parent.Hooks.useLocalPlayer)
local useTrackerMessageModule = require(script.Parent.Parent.Hooks.useTrackerMessage)
local useTooltipDismissalModule = require(script.Parent.Parent.Hooks.useTooltipDismissal)
local useScreenSizeModule = require(coreGuiService.RobloxGui.Modules.Common.Hooks.useScreenSize)
local constantsModule = require(script.Parent.Parent.Parent.Chrome.ChromeShared.Unibar.Constants)
local chrome = script.Parent.Parent.Parent.Chrome
local var18 = if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then require(chrome.Service) else nil
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local fFlagTopBarSignalizeScreenSize = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local reactDevtoolsFixTopbar = game:DefineFastFlag("ReactDevtoolsFixTopbar", true)
local var20 = require(robloxGui.Modules.SelfView.Analytics).new()
local previewShrink = images["icons/actions/previewShrink"]
local previewExpand = images["icons/actions/previewExpand"]
local faceCloneModule = require(script.Parent.FaceClone)

return function(p0) --[[ line: 78 | named "Window" ]]
	-- upvalues: useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), useAppPolicy (ref), useLocalization (ref), useCameraOnModule (ref), useTrackerMessageModule (ref), useWindowSizeIsLargeModule (ref), useScreenSizeModule (ref), fFlagTopBarSignalizeScreenSize (ref), sizingUtilsModule (ref), useSelector (ref), reactModule (ref), useLocalPlayerModule (ref), faceChatUtilsModule (ref), useTooltipDismissalModule (ref), clearTimeout (ref), setTimeout (ref), modelUtilsModule (ref), var20 (ref), faceCloneModule (ref), controlState (ref), interactable (ref), cameraStatusIconModule (ref), var18 (ref), imageSetLabel (ref), previewShrink (ref), previewExpand (ref), styledTextLabel (ref), reactDevtoolsFixTopbar (ref), withTooltip (ref), coreGuiService (ref), tooltipOrientation (ref), cameraStatusDotModule (ref)
	local id = p0.id
	local var22 = useStyle()
	local _ = nil
	local theme = var22.Theme
	local font = var22.Font
	local var23 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().CLOSE_BUTTON_FRAME else constantsModule.CLOSE_BUTTON_FRAME
	local var24 = useLocalization({
		robloxPermissionErrorHeader = "CoreScripts.TopBar.RobloxPermissionErrorHeader",
		dynamicAvatarMissingErrorHeader = "CoreScripts.TopBar.DynamicAvatarMissingErrorHeader",
		dynamicAvatarMissingErrorBody = "CoreScripts.TopBar.DynamicAvatarMissingErrorBody",
		robloxPermissionErrorBody = if useAppPolicy(function(p1) --[[ line: 93 ]]
			return p1.getShowUpdatedCameraPath()
		end) then "CoreScripts.TopBar.RobloxPermissionErrorBodyTwo" else "CoreScripts.TopBar.RobloxPermissionErrorBody"
	})
	local var25 = useCameraOnModule()
	local var26 = useTrackerMessageModule()
	local var27 = useWindowSizeIsLargeModule(p0.windowSize)
	local var28 = if fFlagTopBarSignalizeScreenSize then sizingUtilsModule.getSize(useScreenSizeModule(), var27) else useSelector(function(p2) --[[ line: 114 ]]
		-- upvalues: sizingUtilsModule (copy), var27 (ref)
		return sizingUtilsModule.getSize(p2.displayOptions.screenSize, var27)
	end)
	reactModule.useEffect(function() --[[ line: 117 ]]
		-- upvalues: p0 (ref), var28 (ref)
		p0.windowSize:requestSize(var28.X, var28.Y)
	end, { var28 })
	local var29 = useLocalPlayerModule()
	local var30 = reactModule.useMemo(function() --[[ line: 123 ]]
		-- upvalues: faceChatUtilsModule (copy)
		return faceChatUtilsModule.getPermissions().userCamEligible and faceChatUtilsModule.getPermissions().placeCamEnabled
	end)
	local var31, var32, var33, var34 = useTooltipDismissalModule(2000)
	local var35, var36 = reactModule.useState(true)
	local var37, var38 = reactModule.useState(false)
	local var39, var40 = reactModule.useState(false)
	local var41, var42 = reactModule.useState(false)
	local var43 = reactModule.useRef(nil)
	
	local var44 = function() --[[ line: 136 ]]
		-- upvalues: var43 (ref), clearTimeout (copy), var36 (ref), setTimeout (copy)
		if var43.current then
			clearTimeout(var43.current)
		end
		var36(true)
		var43.current = setTimeout(function() --[[ line: 141 ]]
			-- upvalues: var36 (copy)
			var36(false)
		end, 2000)
	end
	
	reactModule.useEffect(function() --[[ line: 145 ]]
		-- upvalues: var43 (ref), clearTimeout (copy), var36 (ref), setTimeout (copy)
		if var43.current then
			clearTimeout(var43.current)
		end
		var36(true)
		var43.current = setTimeout(function() --[[ line: 141 ]]
			-- upvalues: var36 (copy)
			var36(false)
		end, 2000)
		
		return function() --[[ line: 148 ]]
			-- upvalues: var43 (copy), clearTimeout (copy)
			if var43.current then
				clearTimeout(var43.current)
			end
		end
	end, { var43 })
	
	local var45 = function(p3) --[[ line: 155 ]]
		-- upvalues: var43 (ref), clearTimeout (copy), var36 (ref), setTimeout (copy), faceChatUtilsModule (copy), var34 (ref), var24 (ref), var29 (ref), modelUtilsModule (copy), var20 (copy)
		if var43.current then
			clearTimeout(var43.current)
		end
		var36(true)
		var43.current = setTimeout(function() --[[ line: 141 ]]
			-- upvalues: var36 (copy)
			var36(false)
		end, 2000)
		
		if not faceChatUtilsModule.getPermissions().userCamEnabled and not p3 then
			var34(var24.robloxPermissionErrorHeader, var24.robloxPermissionErrorBody)
			
			return
		elseif var29.Character and not modelUtilsModule.hasDynamicHead(var29.Character) and (not faceChatUtilsModule.isCameraOn() and not p3) then
			var34(var24.dynamicAvatarMissingErrorHeader, var24.dynamicAvatarMissingErrorBody)
		end
		var20:setLastCtx("SelfView")
		faceChatUtilsModule.toggleVideoAnimation()
	end
	
	local var46 = reactModule.useCallback(function() --[[ line: 173 ]]
		-- upvalues: var45 (ref)
		var45(false)
	end, { faceChatUtilsModule, modelUtilsModule, var24, var29 })
	local var47 = reactModule.useCallback(function() --[[ line: 177 ]]
		-- upvalues: var43 (ref), clearTimeout (copy), var36 (ref), setTimeout (copy)
		if var43.current then
			clearTimeout(var43.current)
		end
		var36(true)
		var43.current = setTimeout(function() --[[ line: 141 ]]
			-- upvalues: var36 (copy)
			var36(false)
		end, 2000)
	end, { var44, var35, p0.windowSize })
	local var48 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 182 ]]
		-- upvalues: faceCloneModule (copy), var29 (ref), var48 (ref)
		if _G.__TESTEZ_RUNNING_TEST__ then
			return
		end
		local var50 = faceCloneModule(var29, var48.current)
		
		return function() --[[ line: 193 ]]
			-- upvalues: var50 (ref)
			if var50 then
				var50()
			end
		end
	end, { var29, var48 })
	local var49 = reactModule.useCallback(function(_, p4) --[[ line: 200 ]]
		-- upvalues: var40 (ref), controlState (copy)
		var40(p4 == controlState.Hover)
	end, { var40 })
	
	return reactModule.createElement("Frame", {
		Name = "SelfieViewFrame",
		Active = true,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = var22.Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = 0,
		[reactModule.Event.MouseEnter] = var44,
		[reactModule.Event.MouseMoved] = var44,
		ref = var48
	}, {}, {
		CloseButtonWrapper = var35 and reactModule.createElement("Frame", { ZIndex = 2, BackgroundTransparency = 1, Size = var23 }, {
			CloseButtonLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			CloseButtonInteractable = reactModule.createElement(interactable, {
				Size = UDim2.fromOffset(36, 36),
				BackgroundColor3 = if var37 then var22.Theme.BackgroundOnHover.Color else var22.Theme.BackgroundUIContrast.Color,
				BackgroundTransparency = 0.8,
				onStateChanged = reactModule.useCallback(function(_, p5) --[[ line: 204 ]]
					-- upvalues: var38 (ref), controlState (copy)
					var38(p5 == controlState.Hover)
				end, { var38 }),
				[reactModule.Event.Activated] = if var18 then function() --[[ line: 267 ]]
					-- upvalues: var18 (copy), id (ref)
					var18:toggleWindow(id)
				end else nil
			}, {
				Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				Fragment = reactModule.createElement(reactModule.Fragment, nil, {
					reactModule.createElement("Frame", {
						Name = "X1",
						BorderSizePixel = 0,
						BackgroundTransparency = 0,
						Rotation = 45,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Size = UDim2.new(0, 16, 0, 2),
						BackgroundColor3 = var22.Theme.IconEmphasis.Color
					}, {
						Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
					}),
					reactModule.createElement("Frame", {
						Name = "X2",
						BorderSizePixel = 0,
						BackgroundTransparency = 0,
						Rotation = -45,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Size = UDim2.new(0, 16, 0, 2),
						BackgroundColor3 = var22.Theme.IconEmphasis.Color
					}, {
						Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
					})
				})
			})
		}),
		ExpandButtonWrapper = if var35 then reactModule.createElement("Frame", {
			ZIndex = 2,
			BackgroundTransparency = 1,
			Size = var23,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 0)
		}, {
			ExpandButtonLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			ExpandButtonPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 4),
				PaddingLeft = UDim.new(0, 4),
				PaddingRight = UDim.new(0, 4),
				PaddingBottom = UDim.new(0, 4)
			}),
			ExpandButtonInteractable = reactModule.createElement(interactable, {
				Size = UDim2.fromOffset(36, 36),
				BackgroundColor3 = if var41 then var22.Theme.BackgroundOnHover.Color else var22.Theme.BackgroundUIContrast.Color,
				BackgroundTransparency = 0.8,
				onStateChanged = reactModule.useCallback(function(_, p6) --[[ line: 208 ]]
					-- upvalues: var42 (ref), controlState (copy)
					var42(p6 == controlState.Hover)
				end, { var42 }),
				[reactModule.Event.Activated] = if var18 then function() --[[ line: 337 ]]
					-- upvalues: p0 (ref)
					p0.windowSize:toggleIsLarge()
				end else nil
			}, {
				Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				ExpandImage = reactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromOffset(28, 28),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Image = if var27 then previewShrink else previewExpand,
					ImageColor3 = theme.TextEmphasis.Color,
					ImageTransparency = theme.TextEmphasis.Transparency
				})
			})
		}) else nil,
		Corners = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		ControlMessage = reactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, -44),
			BackgroundColor3 = theme.BackgroundUIDefault.Color,
			AutomaticSize = Enum.AutomaticSize.XY,
			Visible = var26.visible
		}, {
			Corners = reactModule.createElement("UICorner", {}),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 4),
				PaddingRight = UDim.new(0, 8),
				PaddingBottom = UDim.new(0, 4),
				PaddingLeft = UDim.new(0, 8)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", { FillDirection = Enum.FillDirection.Vertical }),
			Line1 = reactModule.createElement(styledTextLabel, {
				layoutOrder = 1,
				text = var26.text,
				fontStyle = font.Footer,
				colorStyle = theme.TextDefault,
				textXAlignment = Enum.TextXAlignment.Center,
				size = UDim2.fromOffset(46, 36),
				TextWrapped = if reactDevtoolsFixTopbar then nil else true,
				textWrapped = if reactDevtoolsFixTopbar then true else nil
			}),
			Line2 = reactModule.createElement(styledTextLabel, {
				layoutOrder = 2,
				text = var26.status,
				fontStyle = font.Footer,
				colorStyle = theme.ContextualPrimaryContent,
				textXAlignment = Enum.TextXAlignment.Center,
				size = UDim2.fromOffset(46, 12),
				automaticSize = Enum.AutomaticSize.Y
			})
		}),
		IconFrame = var35 and (var30 and (reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = var23,
			Position = UDim2.fromScale(0.5, 1),
			AnchorPoint = Vector2.new(0.5, 1)
		}, {
			Tooltip = withTooltip({
				headerText = var31,
				bodyText = var32,
				textXAlignment = Enum.TextXAlignment.Left
			}, {
				DisplayOrder = 101,
				guiTarget = coreGuiService,
				active = var33,
				preferredOrientation = tooltipOrientation.Bottom
			}, reactModule.useCallback(function(p7) --[[ line: 212 ]]
				-- upvalues: reactModule (copy), interactable (copy), var39 (ref), faceChatUtilsModule (copy), var22 (ref), var49 (ref), var46 (ref), cameraStatusIconModule (copy)
				return reactModule.createElement(interactable, {
					Size = UDim2.fromOffset(36, 36),
					BackgroundColor3 = if var39 and faceChatUtilsModule.getPermissions().userCamEnabled then var22.Theme.BackgroundOnHover.Color else var22.Theme.BackgroundUIContrast.Color,
					BackgroundTransparency = var22.Theme.Overlay.Transparency,
					onStateChanged = var49,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					[reactModule.Change.AbsoluteSize] = p7,
					[reactModule.Change.AbsolutePosition] = p7,
					[reactModule.Event.Activated] = var46
				}, {
					Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
					CameraStatusIcon = reactModule.createElement(cameraStatusIconModule, {
						iconSize = UDim2.fromOffset(28, 28),
						transparency = if not faceChatUtilsModule.getPermissions().userCamEnabled then 0.5 else 0
					})
				})
			end, { var49, var46 })),
			Hover = reactModule.createElement("Frame", {
				Size = UDim2.fromOffset(32, 32),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundTransparency = var22.Theme.BackgroundOnHover.Transparency,
				BackgroundColor3 = var22.Theme.BackgroundOnHover.Color
			}, {
				Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
			})
		}) or nil)),
		CameraStatusDot = if var25 then reactModule.createElement(cameraStatusDotModule, {
			ZIndex = 2,
			Position = UDim2.new(1, -12, 1, -12),
			Size = UDim2.fromOffset(8, 8)
		}) else nil,
		Interactable = reactModule.createElement(interactable, {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			[reactModule.Event.Activated] = var47
		})
	})
end