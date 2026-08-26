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
local var1 = if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then require(chrome.Service) else nil
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local fFlagTopBarSignalizeScreenSize = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local reactDevtoolsFixTopbar = game:DefineFastFlag("ReactDevtoolsFixTopbar", true)
local var2 = require(robloxGui.Modules.SelfView.Analytics).new()
local previewShrink = images["icons/actions/previewShrink"]
local previewExpand = images["icons/actions/previewExpand"]
local faceCloneModule = require(script.Parent.FaceClone)

return function(p1)
	-- upvalues: useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), useAppPolicy (ref), useLocalization (ref), useCameraOnModule (ref), useTrackerMessageModule (ref), useWindowSizeIsLargeModule (ref), useScreenSizeModule (ref), fFlagTopBarSignalizeScreenSize (ref), sizingUtilsModule (ref), useSelector (ref), reactModule (ref), useLocalPlayerModule (ref), faceChatUtilsModule (ref), useTooltipDismissalModule (ref), clearTimeout (ref), setTimeout (ref), modelUtilsModule (ref), var2 (ref), faceCloneModule (ref), controlState (ref), interactable (ref), cameraStatusIconModule (ref), var1 (ref), imageSetLabel (ref), previewShrink (ref), previewExpand (ref), styledTextLabel (ref), reactDevtoolsFixTopbar (ref), withTooltip (ref), coreGuiService (ref), tooltipOrientation (ref), cameraStatusDotModule (ref)
	local id = p1.id
	local var3 = useStyle()
	local _ = nil
	local theme = var3.Theme
	local font = var3.Font
	local var4 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().CLOSE_BUTTON_FRAME else constantsModule.CLOSE_BUTTON_FRAME
	local var5 = useLocalization({
		robloxPermissionErrorHeader = "CoreScripts.TopBar.RobloxPermissionErrorHeader",
		dynamicAvatarMissingErrorHeader = "CoreScripts.TopBar.DynamicAvatarMissingErrorHeader",
		dynamicAvatarMissingErrorBody = "CoreScripts.TopBar.DynamicAvatarMissingErrorBody",
		robloxPermissionErrorBody = if useAppPolicy(function(p2)
			return p2.getShowUpdatedCameraPath()
		end) then "CoreScripts.TopBar.RobloxPermissionErrorBodyTwo" else "CoreScripts.TopBar.RobloxPermissionErrorBody"
	})
	local var6 = useCameraOnModule()
	local var7 = useTrackerMessageModule()
	local var8 = useWindowSizeIsLargeModule(p1.windowSize)
	local var9 = if fFlagTopBarSignalizeScreenSize then sizingUtilsModule.getSize(useScreenSizeModule(), var8) else useSelector(function(p2)
		-- upvalues: sizingUtilsModule (copy), var8 (ref)
		return sizingUtilsModule.getSize(p2.displayOptions.screenSize, var8)
	end)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var9 (ref)
		p1.windowSize:requestSize(var9.X, var9.Y)
	end, { var9 })
	local var10 = useLocalPlayerModule()
	local var11 = reactModule.useMemo(function()
		-- upvalues: faceChatUtilsModule (copy)
		return faceChatUtilsModule.getPermissions().userCamEligible and faceChatUtilsModule.getPermissions().placeCamEnabled
	end)
	local var12, var13, var14, var15 = useTooltipDismissalModule(2000)
	local var16, var17 = reactModule.useState(true)
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(false)
	local var22, var23 = reactModule.useState(false)
	local var24 = reactModule.useRef(nil)
	
	local var25 = function()
		-- upvalues: var24 (ref), clearTimeout (copy), var17 (ref), setTimeout (copy)
		if var24.current then
			clearTimeout(var24.current)
		end
		var17(true)
		var24.current = setTimeout(function()
			-- upvalues: var17 (copy)
			var17(false)
		end, 2000)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), clearTimeout (copy), var17 (ref), setTimeout (copy)
		if var24.current then
			clearTimeout(var24.current)
		end
		var17(true)
		var24.current = setTimeout(function()
			-- upvalues: var17 (copy)
			var17(false)
		end, 2000)
		
		return function()
			-- upvalues: var24 (copy), clearTimeout (copy)
			if var24.current then
				clearTimeout(var24.current)
			end
		end
	end, { var24 })
	
	local var26 = function(p2)
		-- upvalues: var24 (ref), clearTimeout (copy), var17 (ref), setTimeout (copy), faceChatUtilsModule (copy), var15 (ref), var5 (ref), var10 (ref), modelUtilsModule (copy), var2 (copy)
		if var24.current then
			clearTimeout(var24.current)
		end
		var17(true)
		var24.current = setTimeout(function()
			-- upvalues: var17 (copy)
			var17(false)
		end, 2000)
		
		if not faceChatUtilsModule.getPermissions().userCamEnabled and not p2 then
			var15(var5.robloxPermissionErrorHeader, var5.robloxPermissionErrorBody)
			
			return
		elseif var10.Character and not modelUtilsModule.hasDynamicHead(var10.Character) and (not faceChatUtilsModule.isCameraOn() and not p2) then
			var15(var5.dynamicAvatarMissingErrorHeader, var5.dynamicAvatarMissingErrorBody)
		end
		var2:setLastCtx("SelfView")
		faceChatUtilsModule.toggleVideoAnimation()
	end
	
	local var27 = reactModule.useCallback(function()
		-- upvalues: var26 (ref)
		var26(false)
	end, { faceChatUtilsModule, modelUtilsModule, var5, var10 })
	local var28 = reactModule.useCallback(function()
		-- upvalues: var24 (ref), clearTimeout (copy), var17 (ref), setTimeout (copy)
		if var24.current then
			clearTimeout(var24.current)
		end
		var17(true)
		var24.current = setTimeout(function()
			-- upvalues: var17 (copy)
			var17(false)
		end, 2000)
	end, { var25, var16, p1.windowSize })
	local var29 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: faceCloneModule (copy), var10 (ref), var29 (ref)
		if _G.__TESTEZ_RUNNING_TEST__ then
			return
		end
		local var30 = faceCloneModule(var10, var29.current)
		
		return function()
			-- upvalues: var30 (ref)
			if var30 then
				var30()
			end
		end
	end, { var10, var29 })
	local var30 = reactModule.useCallback(function(_, p2)
		-- upvalues: var21 (ref), controlState (copy)
		var21(p2 == controlState.Hover)
	end, { var21 })
	
	return reactModule.createElement("Frame", {
		Name = "SelfieViewFrame",
		Active = true,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = var3.Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = 0,
		[reactModule.Event.MouseEnter] = var25,
		[reactModule.Event.MouseMoved] = var25,
		ref = var29
	}, {}, {
		CloseButtonWrapper = var16 and reactModule.createElement("Frame", { ZIndex = 2, BackgroundTransparency = 1, Size = var4 }, {
			CloseButtonLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			CloseButtonInteractable = reactModule.createElement(interactable, {
				Size = UDim2.fromOffset(36, 36),
				BackgroundColor3 = if var18 then var3.Theme.BackgroundOnHover.Color else var3.Theme.BackgroundUIContrast.Color,
				BackgroundTransparency = 0.8,
				onStateChanged = reactModule.useCallback(function(_, p2)
					-- upvalues: var19 (ref), controlState (copy)
					var19(p2 == controlState.Hover)
				end, { var19 }),
				[reactModule.Event.Activated] = if var1 then function()
					-- upvalues: var1 (copy), id (ref)
					var1:toggleWindow(id)
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
						BackgroundColor3 = var3.Theme.IconEmphasis.Color
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
						BackgroundColor3 = var3.Theme.IconEmphasis.Color
					}, {
						Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
					})
				})
			})
		}),
		ExpandButtonWrapper = if var16 then reactModule.createElement("Frame", {
			ZIndex = 2,
			BackgroundTransparency = 1,
			Size = var4,
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
				BackgroundColor3 = if var22 then var3.Theme.BackgroundOnHover.Color else var3.Theme.BackgroundUIContrast.Color,
				BackgroundTransparency = 0.8,
				onStateChanged = reactModule.useCallback(function(_, p2)
					-- upvalues: var23 (ref), controlState (copy)
					var23(p2 == controlState.Hover)
				end, { var23 }),
				[reactModule.Event.Activated] = if var1 then function()
					-- upvalues: p1 (ref)
					p1.windowSize:toggleIsLarge()
				end else nil
			}, {
				Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				ExpandImage = reactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromOffset(28, 28),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Image = if var8 then previewShrink else previewExpand,
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
			Visible = var7.visible
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
				text = var7.text,
				fontStyle = font.Footer,
				colorStyle = theme.TextDefault,
				textXAlignment = Enum.TextXAlignment.Center,
				size = UDim2.fromOffset(46, 36),
				TextWrapped = if reactDevtoolsFixTopbar then nil else true,
				textWrapped = if reactDevtoolsFixTopbar then true else nil
			}),
			Line2 = reactModule.createElement(styledTextLabel, {
				layoutOrder = 2,
				text = var7.status,
				fontStyle = font.Footer,
				colorStyle = theme.ContextualPrimaryContent,
				textXAlignment = Enum.TextXAlignment.Center,
				size = UDim2.fromOffset(46, 12),
				automaticSize = Enum.AutomaticSize.Y
			})
		}),
		IconFrame = var16 and (var11 and (reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = var4,
			Position = UDim2.fromScale(0.5, 1),
			AnchorPoint = Vector2.new(0.5, 1)
		}, {
			Tooltip = withTooltip({
				headerText = var12,
				bodyText = var13,
				textXAlignment = Enum.TextXAlignment.Left
			}, {
				DisplayOrder = 101,
				guiTarget = coreGuiService,
				active = var14,
				preferredOrientation = tooltipOrientation.Bottom
			}, reactModule.useCallback(function(p2)
				-- upvalues: reactModule (copy), interactable (copy), var20 (ref), faceChatUtilsModule (copy), var3 (ref), var30 (ref), var27 (ref), cameraStatusIconModule (copy)
				return reactModule.createElement(interactable, {
					Size = UDim2.fromOffset(36, 36),
					BackgroundColor3 = if var20 and faceChatUtilsModule.getPermissions().userCamEnabled then var3.Theme.BackgroundOnHover.Color else var3.Theme.BackgroundUIContrast.Color,
					BackgroundTransparency = var3.Theme.Overlay.Transparency,
					onStateChanged = var30,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					[reactModule.Change.AbsoluteSize] = p2,
					[reactModule.Change.AbsolutePosition] = p2,
					[reactModule.Event.Activated] = var27
				}, {
					Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
					CameraStatusIcon = reactModule.createElement(cameraStatusIconModule, {
						iconSize = UDim2.fromOffset(28, 28),
						transparency = if not faceChatUtilsModule.getPermissions().userCamEnabled then 0.5 else 0
					})
				})
			end, { var30, var27 })),
			Hover = reactModule.createElement("Frame", {
				Size = UDim2.fromOffset(32, 32),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundTransparency = var3.Theme.BackgroundOnHover.Transparency,
				BackgroundColor3 = var3.Theme.BackgroundOnHover.Color
			}, {
				Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
			})
		}) or nil)),
		CameraStatusDot = if var6 then reactModule.createElement(cameraStatusDotModule, {
			ZIndex = 2,
			Position = UDim2.new(1, -12, 1, -12),
			Size = UDim2.fromOffset(8, 8)
		}) else nil,
		Interactable = reactModule.createElement(interactable, {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			[reactModule.Event.Activated] = var28
		})
	})
end