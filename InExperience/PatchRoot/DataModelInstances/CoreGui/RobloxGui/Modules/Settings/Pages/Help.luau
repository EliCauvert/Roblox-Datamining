local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local textService = game:GetService("TextService")
local corePackagesService = game:GetService("CorePackages")
local gameSettings = UserSettings().GameSettings
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local builderIconsModule = require(corePackagesService.Packages.BuilderIcons)
local uiblox = builderIconsModule.Migration.uiblox
local _ = nil
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local var10 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local var11 = if isInExperienceUIVREnabled then require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId) else nil
local var12 = if isInExperienceUIVREnabled then require(robloxGui.Modules.Settings.Resources.HelpConstants) else nil
local var13 = (function() --[[ line: 66 | named "Initialize" ]]
	-- upvalues: robloxGui (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), userInputService (ref), create (ref), themeModule (ref), robloxTranslatorModule (ref), cachedPolicyServiceModule (ref), var10 (ref), textService (ref), utilityModule (ref), guiService (ref), var12 (ref), var11 (write), gameSettings (ref), uiblox (ref), builderIconsModule (ref)
	local help_1 = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	help_1.HelpPages = {}
	help_1.HelpPageContents = {}
	help_1.ActiveHelpScheme = nil
	local var15 = nil
	
	function help_1.GetCurrentInputType(_) --[[ line: 75 ]]
		-- upvalues: isInExperienceUIVREnabled (copy), isSpatial (copy), var15 (write), userInputService (copy)
		if isInExperienceUIVREnabled and isSpatial() then
			return "SpatialGamepad"
		elseif var15 == nil then
			local platform = userInputService:GetPlatform()
			
			return if platform == Enum.Platform.XBoxOne or platform == Enum.Platform.WiiU then "Gamepad" elseif platform == Enum.Platform.Windows or platform == Enum.Platform.OSX then "KeyboardMouse" else "Touch"
		end
		return if var15 == Enum.UserInputType.Keyboard or var15 == Enum.UserInputType.MouseMovement or (var15 == Enum.UserInputType.MouseButton1 or var15 == Enum.UserInputType.MouseButton2) or (var15 == Enum.UserInputType.MouseButton3 or var15 == Enum.UserInputType.MouseWheel) then "KeyboardMouse" elseif var15 == Enum.UserInputType.Touch then "Touch" elseif var15 == Enum.UserInputType.Gamepad1 or var15 == Enum.UserInputType.Gamepad2 or (var15 == Enum.UserInputType.Gamepad3 or var15 == Enum.UserInputType.Gamepad4) then "Gamepad" else "KeyboardMouse"
	end
	
	local function createPCHelp(p0) --[[ line: 107 ]]
		-- upvalues: create (copy), themeModule (copy), userInputService (copy), robloxTranslatorModule (copy), cachedPolicyServiceModule (copy)
		local function createPCGroup(p1, p2) --[[ line: 108 ]]
			-- upvalues: create (copy), themeModule (copy)
			local var36 = create("Frame")({
				BackgroundTransparency = 1,
				Size = UDim2.new(0.333333333333, -4, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Name = "PCGroupFrame" .. tostring(p1)
			})
			local _ = create("UIListLayout")({
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 2),
				Parent = var36,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
			local var37 = create("TextLabel")({
				BackgroundTransparency = 1,
				TextWrapped = true,
				ZIndex = 2,
				LayoutOrder = 1,
				Position = UDim2.new(0, 9, 0, 0),
				Size = UDim2.new(1, -9, 0, 30),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = p1,
				Font = themeModule.font(Enum.Font.SourceSansBold, "HelpTitle"),
				FontSize = themeModule.fontSize(Enum.FontSize.Size18, "HelpTitle"),
				TextColor3 = Color3.new(1, 1, 1),
				TextXAlignment = Enum.TextXAlignment.Left,
				Name = "PCGroupTitle" .. tostring(p1),
				Parent = var36
			})
			local _ = create("UIPadding")({ PaddingLeft = UDim.new(0, 9), Parent = var37 })
			local var38 = 0
			local offset = var37.Size.Y.Offset
			
			for i_1 = 1, #p2 do
				for i, v in pairs(p2[i_1]) do
					local var39 = create("Frame")({
						BorderSizePixel = 0,
						ZIndex = 2,
						Size = UDim2.new(1, 0, 0, 42),
						Position = UDim2.new(0, 0, 0, offset + var38 * 44),
						BackgroundTransparency = themeModule.transparency("InputActionBackground", 0.65),
						AutomaticSize = Enum.AutomaticSize.Y,
						LayoutOrder = i_1 + 1,
						Name = "ActionInputBinding" .. tostring(i),
						Parent = var36
					})
					var39.BackgroundColor3 = themeModule.color("InputActionBackground")
					create("UICorner")({ CornerRadius = UDim.new(0, 3), Parent = var39 })
					Instance.new("UITextSizeConstraint", create("TextLabel")({
						BackgroundTransparency = 1,
						ZIndex = 2,
						TextWrapped = true,
						Size = UDim2.new(0.4, -9, 0, 42),
						AutomaticSize = Enum.AutomaticSize.Y,
						Position = UDim2.new(0, 9, 0, 0),
						Text = i,
						Font = themeModule.font(Enum.Font.SourceSansBold, "HelpTitle"),
						FontSize = themeModule.fontSize(Enum.FontSize.Size18, "HelpTitle"),
						TextColor3 = Color3.new(1, 1, 1),
						TextXAlignment = Enum.TextXAlignment.Left,
						Name = i .. "Label",
						Parent = var39
					})).MaxTextSize = themeModule.textSize(28)
					local _ = create("TextLabel")({
						BackgroundTransparency = 1,
						ZIndex = 2,
						TextWrapped = true,
						TextScaled = false,
						Size = UDim2.new(0.5, 0, 0, 42),
						Position = UDim2.new(0.5, -4, 0, 0),
						Text = v,
						Font = themeModule.font(Enum.Font.SourceSans, "HelpText"),
						FontSize = themeModule.fontSize(Enum.FontSize.Size18, "HelpText"),
						TextColor3 = Color3.new(1, 1, 1),
						TextXAlignment = Enum.TextXAlignment.Left,
						Name = v .. "Label",
						Parent = var39,
						AutomaticSize = Enum.AutomaticSize.Y
					})
					var38 += 1
				end
			end
			var36.Size = UDim2.new(var36.Size.X.Scale, var36.Size.X.Offset, 0, offset + var38 * 44)
			
			return var36
		end
		
		local var27 = userInputService:GetPlatform() == Enum.Platform.OSX
		local var28 = createPCGroup("Character Movement", {
			[1] = {
				["Move Forward"] = userInputService:GetStringForKeyCode(Enum.KeyCode.W) .. "/" .. robloxTranslatorModule:FormatByKey("InGame.HelpMenu.UpArrow")
			},
			[2] = {
				["Move Backward"] = userInputService:GetStringForKeyCode(Enum.KeyCode.S) .. "/" .. robloxTranslatorModule:FormatByKey("InGame.HelpMenu.DownArrow")
			},
			[3] = {
				["Move Left"] = userInputService:GetStringForKeyCode(Enum.KeyCode.A) .. "/" .. robloxTranslatorModule:FormatByKey("InGame.HelpMenu.LeftArrow")
			},
			[4] = {
				["Move Right"] = userInputService:GetStringForKeyCode(Enum.KeyCode.D) .. "/" .. robloxTranslatorModule:FormatByKey("InGame.HelpMenu.RightArrow")
			},
			[5] = { Jump = "Space" }
		})
		var28.Parent = p0
		var28.LayoutOrder = 1
		local text = userInputService:GetStringForKeyCode(Enum.KeyCode.One) .. "," .. userInputService:GetStringForKeyCode(Enum.KeyCode.Two) .. "," .. userInputService:GetStringForKeyCode(Enum.KeyCode.Three) .. "..."
		local var30 = createPCGroup("Accessories", {
			[1] = { ["Equip Tools"] = text },
			[2] = { ["Unequip Tools"] = text },
			[3] = { ["Drop Tool"] = "Backspace" },
			[4] = { ["Use Tool"] = "Left Mouse Button" }
		})
		var30.Position = UDim2.new(0.333333333333, 4, 0, 0)
		var30.Parent = p0
		var30.LayoutOrder = 2
		local t = {}
		table.insert(t, {
			["UI Selection Toggle"] = userInputService:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		})
		local var32 = not cachedPolicyServiceModule:IsSubjectToChinaPolicies()
		
		if var32 then
			table.insert(t, { Screenshot = if var27 then "Opt + 1" else "Alt + 1" })
			
			if not var27 then
				table.insert(t, { ["Record Video"] = "F12" })
			end
		end
		if var32 then
			table.insert(t, { ["Dev Console"] = if var27 then "F9/fn + F9" else "F9" })
		end
		table.insert(t, { Mouselock = "Shift" })
		
		if var32 then
			table.insert(t, {
				["Graphics Level"] = if var27 then "F10/fn + F10" else "F10"
			})
			table.insert(t, { Fullscreen = if var27 then "Ctrl + Cmd + F" else "F11" })
		end
		if var32 then
			table.insert(t, {
				["Perf. Stats"] = if var27 then "Fn+Opt+Cmd+F7" else "Ctrl + Shift + F7"
			})
		end
		local var33 = createPCGroup("Misc", t)
		var33.Position = UDim2.new(0.666666666667, 8, 0, 0)
		var33.Parent = p0
		var33.LayoutOrder = 3
		local var34 = createPCGroup("Camera Movement", {
			[1] = { Rotate = "Right Mouse Button" },
			[2] = { ["Zoom In/Out"] = "Mouse Wheel" },
			[3] = {
				["Zoom In"] = userInputService:GetStringForKeyCode(Enum.KeyCode.I)
			},
			[4] = {
				["Zoom Out"] = userInputService:GetStringForKeyCode(Enum.KeyCode.O)
			}
		})
		var34.Position = UDim2.new(0, 0, var28.Size.Y.Scale, var28.Size.Y.Offset + 50)
		var34.Parent = p0
		var34.LayoutOrder = 4
		local var35 = createPCGroup("Menu Items", {
			[1] = { ["Roblox Menu"] = "Esc" },
			[2] = {
				Backpack = userInputService:GetStringForKeyCode(Enum.KeyCode.Backquote)
			},
			[3] = { Playerlist = "Tab" },
			[4] = {
				Chat = userInputService:GetStringForKeyCode(Enum.KeyCode.Slash)
			}
		})
		var35.Position = UDim2.new(0.333333333333, 4, var28.Size.Y.Scale, var28.Size.Y.Offset + 50)
		var35.Parent = p0
		var35.LayoutOrder = 5
		p0.Size = UDim2.new(p0.Size.X.Scale, p0.Size.X.Offset, 0, var35.Size.Y.Offset + var35.Position.Y.Offset)
	end
	
	local function createGamepadHelp(p3) --[[ line: 312 ]]
		-- upvalues: help_1 (ref), create (copy), var10 (copy), themeModule (copy), textService (copy), robloxTranslatorModule (copy)
		local maxValue = math.max(help_1.Page.AbsoluteSize.X * 0.58, 270)
		local uDim2 = UDim2.new(0, maxValue, 0, maxValue * 0.64)
		local var42 = create("ImageLabel")({
			Name = "GamepadImage",
			Image = "rbxasset://textures/ui/Settings/Help/PlatformController.png",
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = uDim2,
			Position = UDim2.new(0.5, -uDim2.X.Offset / 2 + 30, 0.5, -uDim2.Y.Offset / 2 + 7),
			Parent = p3
		})
		p3.Size = UDim2.new(p3.Size.X.Scale, p3.Size.X.Offset, 0, var42.Size.Y.Offset + 100)
		local size36 = var10 and themeModule.fontSize(Enum.FontSize.Size36) or themeModule.fontSize(Enum.FontSize.Size24)
		local var44 = size36 == themeModule.fontSize(Enum.FontSize.Size36) and themeModule.textSize(36) or themeModule.textSize(24)
		
		local function createGamepadLabel(p4, p5, p6, p7) --[[ line: 332 ]]
			-- upvalues: create (copy), themeModule (copy), size36 (ref), var42 (ref), textService (copy), var44 (ref), p3 (ref)
			local var49 = create("TextLabel")({
				BackgroundTransparency = 1,
				ZIndex = 2,
				Position = p5,
				Size = p6,
				Text = p4,
				TextXAlignment = if p7 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left,
				AnchorPoint = p7 and Vector2.new(1, 0.5) or Vector2.new(0, 0.5),
				Font = themeModule.font(Enum.Font.SourceSansBold, "HelpGamepad"),
				FontSize = size36,
				TextColor3 = Color3.new(1, 1, 1),
				Name = p4 .. "Label",
				Parent = var42,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
			var49.TextWrapped = true
			local x = textService:GetTextSize(p4, var44, themeModule.font(Enum.Font.SourceSansBold, "Bold"), Vector2.new(0, 0)).X
			local absValue = math.abs(p5.X.Offset)
			
			local function updateNameLabelSize() --[[ line: 356 ]]
				-- upvalues: p7 (ref), p3 (ref), absValue (ref), var49 (ref), var44 (copy), x (ref), size36 (copy)
				local var52 = if p7 then p3.AbsoluteSize.X / 2 + 30 - absValue else p3.AbsoluteSize.X / 2 - 30 - absValue
				var49.Size = UDim2.new(var49.Size.X.Scale, var52, var49.Size.Y.Scale, var44 * 2)
				var49.TextScaled = false
				
				if var52 >= x then
					var49.FontSize = size36
				end
			end
			
			local _ = p3:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ line: 369 ]]
				-- upvalues: updateNameLabelSize (ref)
				updateNameLabelSize()
			end)
			updateNameLabelSize()
		end
		
		local var46 = -var42.Size.X.Offset / 2 - 20
		local var47 = var42.Size.X.Offset / 2 - 20
		local var48 = var47 + 40
		createGamepadLabel("Switch Tool", UDim2.new(0.5, var46, 0, 15), UDim2.new(0, 100, 0, var44), true)
		createGamepadLabel(robloxTranslatorModule:FormatByKey("InGame.HelpMenu.Controls.ToggleGameMenu"), UDim2.new(0.5, var46, 0.15, 10), UDim2.new(0, 164, 0, var44), true)
		createGamepadLabel("Move", UDim2.new(0.5, var46, 0.31, 5), UDim2.new(0, 46, 0, var44), true)
		createGamepadLabel("Menu Navigation", UDim2.new(0.5, var46, 0.46, 0), UDim2.new(0, 164, 0, var44), true)
		createGamepadLabel("Use Tool", UDim2.new(0.5, var47, 0, 15), UDim2.new(0, 73, 0, var44))
		createGamepadLabel("Roblox Menu", UDim2.new(0.5, var47, 0.15, 10), UDim2.new(0, 122, 0, var44))
		createGamepadLabel("Back", UDim2.new(0.5, var47, 0.31, 5), UDim2.new(0, 43, 0, var44))
		createGamepadLabel("Jump", UDim2.new(0.5, var47, 0.46, 0), UDim2.new(0, 49, 0, var44))
		createGamepadLabel("Rotate Camera", UDim2.new(0.5, var48, 0.62, -10), UDim2.new(0, 132, 0, var44))
		createGamepadLabel("Camera Zoom", UDim2.new(0.5, var48, 0.77, -10), UDim2.new(0, 122, 0, var44))
	end
	
	local function updateTouchLayout(p8) --[[ line: 401 ]]
		-- upvalues: help_1 (ref), utilityModule (copy)
		help_1.ActiveHelpScheme = p8
		local var53 = utilityModule:IsPortrait()
		
		if help_1.HelpPages.Touch then
			local t
			local touch = help_1.HelpPageContents.Touch
			
			local function _(p9) --[[ line: 409 | named "hideUneeded" ]]
				-- upvalues: touch (ref)
				if p9 then
					for i, v in pairs(touch) do
						v.Visible = not p9[i]
					end
				end
			end
			
			local _ = nil
			
			if p8 == Enum.TouchMovementMode.DynamicThumbstick or p8 == Enum.TouchMovementMode.Default then
				t = { MoveImageCTM = true }
				touch.MoveLabel.Position = var53 and UDim2.new(0.25, -touch.MoveLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.15, -touch.MoveLabel.AbsoluteSize.x / 2, 0.85, -touch.MoveLabel.AbsoluteSize.y)
				touch.JumpLabel.Position = var53 and UDim2.new(0.75, -touch.JumpLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.85, -60, 0.85, -touch.JumpLabel.AbsoluteSize.y)
				touch.RotateLabel.Position = var53 and UDim2.new(1, (-touch.RotateLabel.AbsoluteSize.x) - 20, 0.02, 0) or UDim2.new(0.85, -touch.RotateLabel.AbsoluteSize.x / 2, 0.02, 0)
				touch.UseToolLabel.Position = var53 and UDim2.new(0.5, -touch.UseToolLabel.AbsoluteSize.x / 2, 0.5, -100) or UDim2.new(0.5, -touch.UseToolLabel.AbsoluteSize.x / 2, 0.5, -60)
				touch.EquipLabel.Position = var53 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0)
				touch.ZoomLabel.Position = var53 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0)
			elseif p8 == Enum.TouchMovementMode.ClickToMove then
				t = { MoveImageDTS = true, JumpLabel = true }
				touch.MoveLabel.Position = var53 and UDim2.new(0.25, -touch.MoveLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.25, -touch.MoveLabel.AbsoluteSize.x / 2, 0.5, 40)
				touch.RotateLabel.Position = var53 and UDim2.new(1, (-touch.RotateLabel.AbsoluteSize.x) - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0)
				touch.UseToolLabel.Position = var53 and UDim2.new(0.75, -touch.UseToolLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.85, -60, 0.02, 0)
				touch.EquipLabel.Position = var53 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0)
				touch.ZoomLabel.Position = var53 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0)
			else
				t = {
					MoveImageDTS = true,
					MoveImageCTM = true,
					JumpImage = true
				}
				touch.MoveLabel.Position = var53 and UDim2.new(0.06, 0, 1, -120) or UDim2.new(0.06, 0, 0.58, 0)
				touch.JumpLabel.Position = var53 and UDim2.new(0.94, -touch.JumpLabel.AbsoluteSize.x, 1, -120) or UDim2.new(0.8, 0, 0.58, 0)
				touch.RotateLabel.Position = var53 and UDim2.new(1, (-touch.RotateLabel.AbsoluteSize.x) - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0)
				touch.UseToolLabel.Position = var53 and UDim2.new(0.5, -touch.UseToolLabel.AbsoluteSize.x / 2, 0.25, 50) or UDim2.new(0.85, -60, 0.02, 0)
				touch.EquipLabel.Position = var53 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0)
				touch.ZoomLabel.Position = var53 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0)
			end
			local var55 = t
			
			if var55 then
				for i, v in pairs(touch) do
					v.Visible = not var55[i]
				end
			end
		end
	end
	
	local function createTouchHelp(p10) --[[ line: 457 ]]
		-- upvalues: utilityModule (copy), guiService (copy), create (copy), themeModule (copy)
		local t = {}
		local var57 = utilityModule:IsSmallTouchScreen()
		p10.Size = UDim2.new(1, 0, 0, if var57 then guiService:GetScreenResolution().y - 100 else guiService:GetScreenResolution().y - 350)
		
		local function createTouchLabel(p11, p12, p13, p14) --[[ line: 466 ]]
			-- upvalues: create (copy), themeModule (copy), var57 (ref)
			local var60 = create("TextLabel")({
				BackgroundTransparency = 1,
				Position = p12,
				Size = p13,
				Name = p11 .. "Frame",
				Parent = p14
			})
			local var61 = create("TextLabel")({
				BackgroundTransparency = 1,
				ZIndex = 3,
				TextScaled = true,
				TextWrapped = true,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				Text = p11,
				Font = themeModule.font(Enum.Font.SourceSansBold, "HelpTouch"),
				FontSize = themeModule.fontSize(Enum.FontSize.Size14, "HelpTouch"),
				TextColor3 = Color3.new(1, 1, 1),
				Name = p11 .. "Label",
				Parent = var60
			})
			
			if not var57 then
				var61.FontSize = themeModule.fontSize(Enum.FontSize.Size18, "HelpTitle")
				var61.Size = UDim2.new(var61.Size.X.Scale, var61.Size.X.Offset, var61.Size.Y.Scale, var61.Size.Y.Offset + 4)
			end
			local _ = create("ImageLabel")({
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/Settings/Radial/RadialLabel.png",
				ZIndex = 2,
				Name = p11 .. "BackgroundImage",
				Size = UDim2.new(1.25, 0, 1.25, 0),
				Position = UDim2.new(-0.125, 0, -0.065, 0),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(12, 2, 65, 21),
				Parent = var60
			})
			Instance.new("UITextSizeConstraint", var61).MaxTextSize = themeModule.textSize(18, "HelpText")
			
			return var60
		end
		
		local function _(p15, p16, p17, p18, p19) --[[ line: 516 | named "createTouchGestureImage" ]]
			-- upvalues: create (copy)
			return create("ImageLabel")({
				BackgroundTransparency = 1,
				ZIndex = 2,
				Name = p15,
				Size = p18,
				Position = p17,
				Image = p16,
				Parent = p19
			})
		end
		
		local var59 = if var57 then 0 else 30
		t.MoveLabel = createTouchLabel("Move", UDim2.new(0.06, 0, 0.58, 0), UDim2.new(0, var59 + 77, 0, 25), p10)
		t.MoveImageDTS = create("ImageLabel")({
			Name = "MoveImageDTS",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 65, 0, 48),
			Position = UDim2.new(0.5, -32, 1, 3),
			Parent = t.MoveLabel
		})
		t.MoveImageCTM = create("ImageLabel")({
			Name = "MoveImageCTM",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 38, 0, 52),
			Position = UDim2.new(0.5, -19, 1, 3),
			Parent = t.MoveLabel
		})
		t.JumpLabel = createTouchLabel("Jump", UDim2.new(0.8, 0, 0.58, 0), UDim2.new(0, var59 + 77, 0, 25), p10)
		t.JumpImage = create("ImageLabel")({
			Name = "JumpImage",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 38, 0, 52),
			Position = UDim2.new(0.5, -19, 1, 3),
			Parent = t.JumpLabel
		})
		t.EquipLabel = createTouchLabel("Equip/Unequip Tools", UDim2.new(0.5, -60, 0.64, 0), UDim2.new(0, var59 + 120, 0, 25), p10)
		t.ZoomLabel = createTouchLabel("Zoom In/Out", UDim2.new(0.15, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), p10)
		t.ZoomImage = create("ImageLabel")({
			Name = "ZoomImage",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/ZoomGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 53, 0, 59),
			Position = UDim2.new(0.5, -26, 1, 3),
			Parent = t.ZoomLabel
		})
		t.RotateLabel = createTouchLabel("Rotate Camera", UDim2.new(0.5, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), p10)
		t.RotateImage = create("ImageLabel")({
			Name = "RotateImage",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 65, 0, 48),
			Position = UDim2.new(0.5, -32, 1, 3),
			Parent = t.RotateLabel
		})
		t.UseToolLabel = createTouchLabel("Use Tool", UDim2.new(0.85, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), p10)
		t.ToolImage = create("ImageLabel")({
			Name = "ToolImage",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 38, 0, 52),
			Position = UDim2.new(0.5, -19, 1, 3),
			Parent = t.UseToolLabel
		})
		
		return t
	end
	
	local function createSpatialGamepadHelp(p20) --[[ line: 556 ]]
		-- upvalues: var12 (copy), create (copy), help_1 (ref), var11 (copy), themeModule (copy)
		local gamepadQuest = var12.Images.GamepadQuest
		local questGamepadLabels = var12.Labels.QuestGamepadLabels
		local image = gamepadQuest.Image
		local heightRatio = gamepadQuest.HeightRatio
		local localizationKeyPrefix = questGamepadLabels.LocalizationKeyPrefix
		local labelRelativeTextHeight = questGamepadLabels.LabelRelativeTextHeight
		local labelsInfo = questGamepadLabels.LabelsInfo
		local var62 = create("ImageLabel")({
			Name = "SpatialGamepadImage",
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1, 0, heightRatio, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			Image = image,
			Parent = p20
		})
		local UIPadding = help_1.Page:FindFirstChildOfClass("UIPadding")
		p20.Size = UDim2.new(p20.Size.X.Scale, p20.Size.X.Offset, 0, (help_1.Page.AbsoluteSize.X - (if UIPadding then UIPadding.PaddingLeft.Offset + UIPadding.PaddingRight.Offset else 0)) * heightRatio)
		
		for i, v in labelsInfo do
			create("TextLabel")({
				BackgroundTransparency = 1,
				ZIndex = 2,
				TextScaled = true,
				Name = v.labelKey,
				Position = UDim2.fromScale(v.xPosition, v.yPosition),
				Size = UDim2.fromScale(v.width, labelRelativeTextHeight),
				Text = var11:Format(localizationKeyPrefix .. v.labelKey),
				TextXAlignment = v.xAlignment or Enum.TextXAlignment.Right,
				Font = themeModule.font(nil, "HelpGamepad"),
				TextColor3 = themeModule.color("TextEmphasis"),
				TextTransparency = themeModule.transparency("TextEmphasis"),
				Parent = var62
			})
		end
	end
	
	local function createHelpDisplay(p21) --[[ line: 608 ]]
		-- upvalues: create (copy), createPCHelp (ref), createGamepadHelp (ref), createTouchHelp (ref), isInExperienceUIVREnabled (copy), createSpatialGamepadHelp (ref)
		local var64 = nil
		local var65 = create("Frame")({
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Name = "HelpFrame" .. tostring(p21)
		})
		
		if p21 == "KeyboardMouse" then
			local _ = create("UIListLayout")({
				Wraps = true,
				FillDirection = Enum.FillDirection.Horizontal,
				Parent = var65,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			})
		end
		if p21 == "KeyboardMouse" then
			createPCHelp(var65)
		elseif p21 == "Gamepad" then
			createGamepadHelp(var65)
		elseif p21 == "Touch" then
			var64 = createTouchHelp(var65)
		elseif isInExperienceUIVREnabled and p21 == "SpatialGamepad" then
			createSpatialGamepadHelp(var65)
		end
		return var65, var64
	end
	
	local function displayHelp(p22) --[[ line: 642 ]]
		-- upvalues: help_1 (ref), var10 (copy), userInputService (copy)
		for i, v in pairs(help_1.HelpPages) do
			if v == p22 then
				v.Parent = help_1.Page
				help_1.Page.Size = v.Size
				
				if var10 then
					help_1.Page.Size = UDim2.new(v.Size.X.Scale, v.Size.X.Offset, v.Size.Y.Scale, 0)
				end
			else
				v.Parent = nil
			end
		end
		if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			help_1.HubRef.PageViewClipper.ClipsDescendants = false
			help_1.HubRef.PageView.ClipsDescendants = false
		end
	end
	
	local function switchToHelp(p23) --[[ line: 660 ]]
		-- upvalues: help_1 (ref), displayHelp (ref), gameSettings (copy), updateTouchLayout (ref), createHelpDisplay (ref), switchToHelp (ref)
		local var66 = help_1.HelpPages[p23]
		
		if var66 then
			displayHelp(var66)
			
			if p23 == "Touch" then
				local touchMovementMode = gameSettings.TouchMovementMode
				
				if help_1.ActiveHelpScheme == touchMovementMode then
					return
				else
					updateTouchLayout(touchMovementMode)
					
					return
				end
			end
		else
			local helpPages = help_1.HelpPages
			local helpPageContents = help_1.HelpPageContents
			local var67, var68 = createHelpDisplay(p23)
			helpPages[p23] = var67
			helpPageContents[p23] = var68
			switchToHelp(p23)
		end
	end
	
	local function _() --[[ line: 677 | named "showTypeOfHelp" ]]
		-- upvalues: switchToHelp (ref), help_1 (ref)
		switchToHelp(help_1:GetCurrentInputType())
	end
	
	function help_1.PageDisplayed(_) --[[ line: 681 ]]
		-- upvalues: help_1 (ref), userInputService (copy), var15 (write), switchToHelp (ref)
		if not help_1.LastInputTypeChangedConnection then
			help_1.LastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p24) --[[ line: 683 ]]
				-- upvalues: var15 (copy), switchToHelp (copy), help_1 (copy)
				if p24 ~= Enum.UserInputType.Focus and p24 ~= Enum.UserInputType.None then
					var15 = p24
					switchToHelp(help_1:GetCurrentInputType())
				end
			end)
		end
		var15 = userInputService:GetLastInputType()
		switchToHelp(help_1:GetCurrentInputType())
	end
	
	function help_1.PageHidden(_) --[[ line: 694 ]]
		-- upvalues: help_1 (ref)
		if help_1.LastInputTypeChangedConnection then
			help_1.LastInputTypeChangedConnection:Disconnect()
			help_1.LastInputTypeChangedConnection = nil
		end
	end
	
	local function adjustForScreenLayout(p25) --[[ line: 701 ]]
		-- upvalues: help_1 (ref), gameSettings (copy), utilityModule (copy), guiService (copy), updateTouchLayout (ref)
		if help_1:GetCurrentInputType() == "Touch" then
			local touchMovementMode = gameSettings.TouchMovementMode
			p25 = p25 or guiService:GetScreenResolution()
			help_1.HelpPages.Touch.Size = UDim2.new(1, 0, 0, if utilityModule:IsSmallTouchScreen() then p25.y - 120 else p25.y - 350)
			updateTouchLayout(touchMovementMode)
		end
	end
	
	help_1.TabHeader.Name = "HelpTab"
	local help = uiblox["icons/menu/help"]
	help_1.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[help.variant]
	help_1.TabHeader.TabLabel.Icon.Text = help.name
	help_1.TabHeader.TabLabel.Title.Text = "Help"
	help_1.Page.Name = "Help"
	utilityModule:OnResized(help_1, function(p26, _) --[[ line: 725 ]]
		-- upvalues: help_1 (ref), adjustForScreenLayout (ref)
		if help_1.HelpPages.Touch then
			adjustForScreenLayout(p26)
		end
	end)
	
	return help_1
end)()
var13.Displayed.Event:connect(function() --[[ line: 739 ]]
	-- upvalues: var13 (write)
	var13:PageDisplayed()
	
	if var13.HubRef.VersionContainer then
		var13.HubRef.VersionContainer.Visible = true
	end
end)
var13.Hidden.Event:connect(function() --[[ line: 746 ]]
	-- upvalues: var13 (write)
	var13:PageHidden()
	var13.HubRef.PageViewClipper.ClipsDescendants = true
	var13.HubRef.PageView.ClipsDescendants = true
	var13.HubRef:ShowShield()
	
	if var13.HubRef.VersionContainer then
		var13.HubRef.VersionContainer.Visible = false
	end
end)

return var13