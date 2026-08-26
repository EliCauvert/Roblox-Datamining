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
local var1 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local var2 = if isInExperienceUIVREnabled then require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId) else nil
local var3 = if isInExperienceUIVREnabled then require(robloxGui.Modules.Settings.Resources.HelpConstants) else nil
local var4 = (function()
	-- upvalues: robloxGui (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), userInputService (ref), create (ref), themeModule (ref), robloxTranslatorModule (ref), cachedPolicyServiceModule (ref), var1 (ref), textService (ref), utilityModule (ref), guiService (ref), var3 (ref), var2 (write), gameSettings (ref), uiblox (ref), builderIconsModule (ref)
	local help_1 = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	help_1.HelpPages = {}
	help_1.HelpPageContents = {}
	help_1.ActiveHelpScheme = nil
	local var5 = nil
	
	function help_1.GetCurrentInputType(_)
		-- upvalues: isInExperienceUIVREnabled (copy), isSpatial (copy), var5 (write), userInputService (copy)
		if isInExperienceUIVREnabled and isSpatial() then
			return "SpatialGamepad"
		elseif var5 == nil then
			local platform = userInputService:GetPlatform()
			
			return if platform == Enum.Platform.XBoxOne or platform == Enum.Platform.WiiU then "Gamepad" elseif platform == Enum.Platform.Windows or platform == Enum.Platform.OSX then "KeyboardMouse" else "Touch"
		end
		return if var5 == Enum.UserInputType.Keyboard or var5 == Enum.UserInputType.MouseMovement or (var5 == Enum.UserInputType.MouseButton1 or var5 == Enum.UserInputType.MouseButton2) or (var5 == Enum.UserInputType.MouseButton3 or var5 == Enum.UserInputType.MouseWheel) then "KeyboardMouse" elseif var5 == Enum.UserInputType.Touch then "Touch" elseif var5 == Enum.UserInputType.Gamepad1 or var5 == Enum.UserInputType.Gamepad2 or (var5 == Enum.UserInputType.Gamepad3 or var5 == Enum.UserInputType.Gamepad4) then "Gamepad" else "KeyboardMouse"
	end
	
	local function createPCHelp(p1)
		-- upvalues: create (copy), themeModule (copy), userInputService (copy), robloxTranslatorModule (copy), cachedPolicyServiceModule (copy)
		local function createPCGroup(p2, p3)
			-- upvalues: create (copy), themeModule (copy)
			local var6 = create("Frame")({
				BackgroundTransparency = 1,
				Size = UDim2.new(0.333333333333, -4, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Name = "PCGroupFrame" .. tostring(p2)
			})
			local _ = create("UIListLayout")({
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 2),
				Parent = var6,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
			local var7 = create("TextLabel")({
				BackgroundTransparency = 1,
				TextWrapped = true,
				ZIndex = 2,
				LayoutOrder = 1,
				Position = UDim2.new(0, 9, 0, 0),
				Size = UDim2.new(1, -9, 0, 30),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = p2,
				Font = themeModule.font(Enum.Font.SourceSansBold, "HelpTitle"),
				FontSize = themeModule.fontSize(Enum.FontSize.Size18, "HelpTitle"),
				TextColor3 = Color3.new(1, 1, 1),
				TextXAlignment = Enum.TextXAlignment.Left,
				Name = "PCGroupTitle" .. tostring(p2),
				Parent = var6
			})
			local _ = create("UIPadding")({ PaddingLeft = UDim.new(0, 9), Parent = var7 })
			local var8 = 0
			local offset = var7.Size.Y.Offset
			
			for i_1 = 1, #p3 do
				for i, v in pairs(p3[i_1]) do
					local var9 = create("Frame")({
						BorderSizePixel = 0,
						ZIndex = 2,
						Size = UDim2.new(1, 0, 0, 42),
						Position = UDim2.new(0, 0, 0, offset + var8 * 44),
						BackgroundTransparency = themeModule.transparency("InputActionBackground", 0.65),
						AutomaticSize = Enum.AutomaticSize.Y,
						LayoutOrder = i_1 + 1,
						Name = "ActionInputBinding" .. tostring(i),
						Parent = var6
					})
					var9.BackgroundColor3 = themeModule.color("InputActionBackground")
					create("UICorner")({ CornerRadius = UDim.new(0, 3), Parent = var9 })
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
						Parent = var9
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
						Parent = var9,
						AutomaticSize = Enum.AutomaticSize.Y
					})
					var8 += 1
				end
			end
			var6.Size = UDim2.new(var6.Size.X.Scale, var6.Size.X.Offset, 0, offset + var8 * 44)
			
			return var6
		end
		
		local var10 = userInputService:GetPlatform() == Enum.Platform.OSX
		local var11 = createPCGroup("Character Movement", {
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
		var11.Parent = p1
		var11.LayoutOrder = 1
		local text = userInputService:GetStringForKeyCode(Enum.KeyCode.One) .. "," .. userInputService:GetStringForKeyCode(Enum.KeyCode.Two) .. "," .. userInputService:GetStringForKeyCode(Enum.KeyCode.Three) .. "..."
		local var12 = createPCGroup("Accessories", {
			[1] = { ["Equip Tools"] = text },
			[2] = { ["Unequip Tools"] = text },
			[3] = { ["Drop Tool"] = "Backspace" },
			[4] = { ["Use Tool"] = "Left Mouse Button" }
		})
		var12.Position = UDim2.new(0.333333333333, 4, 0, 0)
		var12.Parent = p1
		var12.LayoutOrder = 2
		local t = {}
		table.insert(t, {
			["UI Selection Toggle"] = userInputService:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		})
		local var13 = not cachedPolicyServiceModule:IsSubjectToChinaPolicies()
		
		if var13 then
			table.insert(t, { Screenshot = if var10 then "Opt + 1" else "Alt + 1" })
			
			if not var10 then
				table.insert(t, { ["Record Video"] = "F12" })
			end
		end
		if var13 then
			table.insert(t, { ["Dev Console"] = if var10 then "F9/fn + F9" else "F9" })
		end
		table.insert(t, { Mouselock = "Shift" })
		
		if var13 then
			table.insert(t, {
				["Graphics Level"] = if var10 then "F10/fn + F10" else "F10"
			})
			table.insert(t, { Fullscreen = if var10 then "Ctrl + Cmd + F" else "F11" })
		end
		if var13 then
			table.insert(t, {
				["Perf. Stats"] = if var10 then "Fn+Opt+Cmd+F7" else "Ctrl + Shift + F7"
			})
		end
		local var14 = createPCGroup("Misc", t)
		var14.Position = UDim2.new(0.666666666667, 8, 0, 0)
		var14.Parent = p1
		var14.LayoutOrder = 3
		local var15 = createPCGroup("Camera Movement", {
			[1] = { Rotate = "Right Mouse Button" },
			[2] = { ["Zoom In/Out"] = "Mouse Wheel" },
			[3] = {
				["Zoom In"] = userInputService:GetStringForKeyCode(Enum.KeyCode.I)
			},
			[4] = {
				["Zoom Out"] = userInputService:GetStringForKeyCode(Enum.KeyCode.O)
			}
		})
		var15.Position = UDim2.new(0, 0, var11.Size.Y.Scale, var11.Size.Y.Offset + 50)
		var15.Parent = p1
		var15.LayoutOrder = 4
		local var16 = createPCGroup("Menu Items", {
			[1] = { ["Roblox Menu"] = "Esc" },
			[2] = {
				Backpack = userInputService:GetStringForKeyCode(Enum.KeyCode.Backquote)
			},
			[3] = { Playerlist = "Tab" },
			[4] = {
				Chat = userInputService:GetStringForKeyCode(Enum.KeyCode.Slash)
			}
		})
		var16.Position = UDim2.new(0.333333333333, 4, var11.Size.Y.Scale, var11.Size.Y.Offset + 50)
		var16.Parent = p1
		var16.LayoutOrder = 5
		p1.Size = UDim2.new(p1.Size.X.Scale, p1.Size.X.Offset, 0, var16.Size.Y.Offset + var16.Position.Y.Offset)
	end
	
	local function createGamepadHelp(p4)
		-- upvalues: help_1 (ref), create (copy), var1 (copy), themeModule (copy), textService (copy), robloxTranslatorModule (copy)
		local maxValue = math.max(help_1.Page.AbsoluteSize.X * 0.58, 270)
		local uDim2 = UDim2.new(0, maxValue, 0, maxValue * 0.64)
		local var17 = create("ImageLabel")({
			Name = "GamepadImage",
			Image = "rbxasset://textures/ui/Settings/Help/PlatformController.png",
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = uDim2,
			Position = UDim2.new(0.5, -uDim2.X.Offset / 2 + 30, 0.5, -uDim2.Y.Offset / 2 + 7),
			Parent = p4
		})
		p4.Size = UDim2.new(p4.Size.X.Scale, p4.Size.X.Offset, 0, var17.Size.Y.Offset + 100)
		local size36 = var1 and themeModule.fontSize(Enum.FontSize.Size36) or themeModule.fontSize(Enum.FontSize.Size24)
		local var18 = size36 == themeModule.fontSize(Enum.FontSize.Size36) and themeModule.textSize(36) or themeModule.textSize(24)
		
		local function createGamepadLabel(p5, p6, p7, p8)
			-- upvalues: create (copy), themeModule (copy), size36 (ref), var17 (ref), textService (copy), var18 (ref), p4 (ref)
			local var19 = create("TextLabel")({
				BackgroundTransparency = 1,
				ZIndex = 2,
				Position = p6,
				Size = p7,
				Text = p5,
				TextXAlignment = if p8 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left,
				AnchorPoint = p8 and Vector2.new(1, 0.5) or Vector2.new(0, 0.5),
				Font = themeModule.font(Enum.Font.SourceSansBold, "HelpGamepad"),
				FontSize = size36,
				TextColor3 = Color3.new(1, 1, 1),
				Name = p5 .. "Label",
				Parent = var17,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
			var19.TextWrapped = true
			local x = textService:GetTextSize(p5, var18, themeModule.font(Enum.Font.SourceSansBold, "Bold"), Vector2.new(0, 0)).X
			local absValue = math.abs(p6.X.Offset)
			
			local function updateNameLabelSize()
				-- upvalues: p8 (ref), p4 (ref), absValue (ref), var19 (ref), var18 (copy), x (ref), size36 (copy)
				local var20 = if p8 then p4.AbsoluteSize.X / 2 + 30 - absValue else p4.AbsoluteSize.X / 2 - 30 - absValue
				var19.Size = UDim2.new(var19.Size.X.Scale, var20, var19.Size.Y.Scale, var18 * 2)
				var19.TextScaled = false
				
				if var20 >= x then
					var19.FontSize = size36
				end
			end
			
			local _ = p4:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
				-- upvalues: updateNameLabelSize (ref)
				updateNameLabelSize()
			end)
			updateNameLabelSize()
		end
		
		local var19 = -var17.Size.X.Offset / 2 - 20
		local var20 = var17.Size.X.Offset / 2 - 20
		local var21 = var20 + 40
		createGamepadLabel("Switch Tool", UDim2.new(0.5, var19, 0, 15), UDim2.new(0, 100, 0, var18), true)
		createGamepadLabel(robloxTranslatorModule:FormatByKey("InGame.HelpMenu.Controls.ToggleGameMenu"), UDim2.new(0.5, var19, 0.15, 10), UDim2.new(0, 164, 0, var18), true)
		createGamepadLabel("Move", UDim2.new(0.5, var19, 0.31, 5), UDim2.new(0, 46, 0, var18), true)
		createGamepadLabel("Menu Navigation", UDim2.new(0.5, var19, 0.46, 0), UDim2.new(0, 164, 0, var18), true)
		createGamepadLabel("Use Tool", UDim2.new(0.5, var20, 0, 15), UDim2.new(0, 73, 0, var18))
		createGamepadLabel("Roblox Menu", UDim2.new(0.5, var20, 0.15, 10), UDim2.new(0, 122, 0, var18))
		createGamepadLabel("Back", UDim2.new(0.5, var20, 0.31, 5), UDim2.new(0, 43, 0, var18))
		createGamepadLabel("Jump", UDim2.new(0.5, var20, 0.46, 0), UDim2.new(0, 49, 0, var18))
		createGamepadLabel("Rotate Camera", UDim2.new(0.5, var21, 0.62, -10), UDim2.new(0, 132, 0, var18))
		createGamepadLabel("Camera Zoom", UDim2.new(0.5, var21, 0.77, -10), UDim2.new(0, 122, 0, var18))
	end
	
	local function updateTouchLayout(p4)
		-- upvalues: help_1 (ref), utilityModule (copy)
		help_1.ActiveHelpScheme = p4
		local var17 = utilityModule:IsPortrait()
		
		if help_1.HelpPages.Touch then
			local t
			local touch = help_1.HelpPageContents.Touch
			
			local function _(p5)
				-- upvalues: touch (ref)
				if p5 then
					for i, v in pairs(touch) do
						v.Visible = not p5[i]
					end
				end
			end
			
			local _ = nil
			
			if p4 == Enum.TouchMovementMode.DynamicThumbstick or p4 == Enum.TouchMovementMode.Default then
				t = { MoveImageCTM = true }
				touch.MoveLabel.Position = var17 and UDim2.new(0.25, -touch.MoveLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.15, -touch.MoveLabel.AbsoluteSize.x / 2, 0.85, -touch.MoveLabel.AbsoluteSize.y)
				touch.JumpLabel.Position = var17 and UDim2.new(0.75, -touch.JumpLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.85, -60, 0.85, -touch.JumpLabel.AbsoluteSize.y)
				touch.RotateLabel.Position = var17 and UDim2.new(1, (-touch.RotateLabel.AbsoluteSize.x) - 20, 0.02, 0) or UDim2.new(0.85, -touch.RotateLabel.AbsoluteSize.x / 2, 0.02, 0)
				touch.UseToolLabel.Position = var17 and UDim2.new(0.5, -touch.UseToolLabel.AbsoluteSize.x / 2, 0.5, -100) or UDim2.new(0.5, -touch.UseToolLabel.AbsoluteSize.x / 2, 0.5, -60)
				touch.EquipLabel.Position = var17 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0)
				touch.ZoomLabel.Position = var17 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0)
			elseif p4 == Enum.TouchMovementMode.ClickToMove then
				t = { MoveImageDTS = true, JumpLabel = true }
				touch.MoveLabel.Position = var17 and UDim2.new(0.25, -touch.MoveLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.25, -touch.MoveLabel.AbsoluteSize.x / 2, 0.5, 40)
				touch.RotateLabel.Position = var17 and UDim2.new(1, (-touch.RotateLabel.AbsoluteSize.x) - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0)
				touch.UseToolLabel.Position = var17 and UDim2.new(0.75, -touch.UseToolLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.85, -60, 0.02, 0)
				touch.EquipLabel.Position = var17 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0)
				touch.ZoomLabel.Position = var17 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0)
			else
				t = {
					MoveImageDTS = true,
					MoveImageCTM = true,
					JumpImage = true
				}
				touch.MoveLabel.Position = var17 and UDim2.new(0.06, 0, 1, -120) or UDim2.new(0.06, 0, 0.58, 0)
				touch.JumpLabel.Position = var17 and UDim2.new(0.94, -touch.JumpLabel.AbsoluteSize.x, 1, -120) or UDim2.new(0.8, 0, 0.58, 0)
				touch.RotateLabel.Position = var17 and UDim2.new(1, (-touch.RotateLabel.AbsoluteSize.x) - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0)
				touch.UseToolLabel.Position = var17 and UDim2.new(0.5, -touch.UseToolLabel.AbsoluteSize.x / 2, 0.25, 50) or UDim2.new(0.85, -60, 0.02, 0)
				touch.EquipLabel.Position = var17 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0)
				touch.ZoomLabel.Position = var17 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0)
			end
			local var18 = t
			
			if var18 then
				for i, v in pairs(touch) do
					v.Visible = not var18[i]
				end
			end
		end
	end
	
	local function createTouchHelp(p5)
		-- upvalues: utilityModule (copy), guiService (copy), create (copy), themeModule (copy)
		local t = {}
		local var18 = utilityModule:IsSmallTouchScreen()
		p5.Size = UDim2.new(1, 0, 0, if var18 then guiService:GetScreenResolution().y - 100 else guiService:GetScreenResolution().y - 350)
		
		local function createTouchLabel(p6, p7, p8, p9)
			-- upvalues: create (copy), themeModule (copy), var18 (ref)
			local var19 = create("TextLabel")({
				BackgroundTransparency = 1,
				Position = p7,
				Size = p8,
				Name = p6 .. "Frame",
				Parent = p9
			})
			local var20 = create("TextLabel")({
				BackgroundTransparency = 1,
				ZIndex = 3,
				TextScaled = true,
				TextWrapped = true,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				Text = p6,
				Font = themeModule.font(Enum.Font.SourceSansBold, "HelpTouch"),
				FontSize = themeModule.fontSize(Enum.FontSize.Size14, "HelpTouch"),
				TextColor3 = Color3.new(1, 1, 1),
				Name = p6 .. "Label",
				Parent = var19
			})
			
			if not var18 then
				var20.FontSize = themeModule.fontSize(Enum.FontSize.Size18, "HelpTitle")
				var20.Size = UDim2.new(var20.Size.X.Scale, var20.Size.X.Offset, var20.Size.Y.Scale, var20.Size.Y.Offset + 4)
			end
			local _ = create("ImageLabel")({
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/Settings/Radial/RadialLabel.png",
				ZIndex = 2,
				Name = p6 .. "BackgroundImage",
				Size = UDim2.new(1.25, 0, 1.25, 0),
				Position = UDim2.new(-0.125, 0, -0.065, 0),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(12, 2, 65, 21),
				Parent = var19
			})
			Instance.new("UITextSizeConstraint", var20).MaxTextSize = themeModule.textSize(18, "HelpText")
			
			return var19
		end
		
		local function _(p6, p7, p8, p9, p10)
			-- upvalues: create (copy)
			return create("ImageLabel")({
				BackgroundTransparency = 1,
				ZIndex = 2,
				Name = p6,
				Size = p9,
				Position = p8,
				Image = p7,
				Parent = p10
			})
		end
		
		local var19 = if var18 then 0 else 30
		t.MoveLabel = createTouchLabel("Move", UDim2.new(0.06, 0, 0.58, 0), UDim2.new(0, var19 + 77, 0, 25), p5)
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
		t.JumpLabel = createTouchLabel("Jump", UDim2.new(0.8, 0, 0.58, 0), UDim2.new(0, var19 + 77, 0, 25), p5)
		t.JumpImage = create("ImageLabel")({
			Name = "JumpImage",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 38, 0, 52),
			Position = UDim2.new(0.5, -19, 1, 3),
			Parent = t.JumpLabel
		})
		t.EquipLabel = createTouchLabel("Equip/Unequip Tools", UDim2.new(0.5, -60, 0.64, 0), UDim2.new(0, var19 + 120, 0, 25), p5)
		t.ZoomLabel = createTouchLabel("Zoom In/Out", UDim2.new(0.15, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), p5)
		t.ZoomImage = create("ImageLabel")({
			Name = "ZoomImage",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/ZoomGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 53, 0, 59),
			Position = UDim2.new(0.5, -26, 1, 3),
			Parent = t.ZoomLabel
		})
		t.RotateLabel = createTouchLabel("Rotate Camera", UDim2.new(0.5, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), p5)
		t.RotateImage = create("ImageLabel")({
			Name = "RotateImage",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 65, 0, 48),
			Position = UDim2.new(0.5, -32, 1, 3),
			Parent = t.RotateLabel
		})
		t.UseToolLabel = createTouchLabel("Use Tool", UDim2.new(0.85, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), p5)
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
	
	local function createSpatialGamepadHelp(p5)
		-- upvalues: var3 (copy), create (copy), help_1 (ref), var2 (copy), themeModule (copy)
		local gamepadQuest = var3.Images.GamepadQuest
		local questGamepadLabels = var3.Labels.QuestGamepadLabels
		local image = gamepadQuest.Image
		local heightRatio = gamepadQuest.HeightRatio
		local localizationKeyPrefix = questGamepadLabels.LocalizationKeyPrefix
		local labelRelativeTextHeight = questGamepadLabels.LabelRelativeTextHeight
		local labelsInfo = questGamepadLabels.LabelsInfo
		local var18 = create("ImageLabel")({
			Name = "SpatialGamepadImage",
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1, 0, heightRatio, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			Image = image,
			Parent = p5
		})
		local UIPadding = help_1.Page:FindFirstChildOfClass("UIPadding")
		p5.Size = UDim2.new(p5.Size.X.Scale, p5.Size.X.Offset, 0, (help_1.Page.AbsoluteSize.X - (if UIPadding then UIPadding.PaddingLeft.Offset + UIPadding.PaddingRight.Offset else 0)) * heightRatio)
		
		for i, v in labelsInfo do
			create("TextLabel")({
				BackgroundTransparency = 1,
				ZIndex = 2,
				TextScaled = true,
				Name = v.labelKey,
				Position = UDim2.fromScale(v.xPosition, v.yPosition),
				Size = UDim2.fromScale(v.width, labelRelativeTextHeight),
				Text = var2:Format(localizationKeyPrefix .. v.labelKey),
				TextXAlignment = v.xAlignment or Enum.TextXAlignment.Right,
				Font = themeModule.font(nil, "HelpGamepad"),
				TextColor3 = themeModule.color("TextEmphasis"),
				TextTransparency = themeModule.transparency("TextEmphasis"),
				Parent = var18
			})
		end
	end
	
	local function createHelpDisplay(p6)
		-- upvalues: create (copy), createPCHelp (ref), createGamepadHelp (ref), createTouchHelp (ref), isInExperienceUIVREnabled (copy), createSpatialGamepadHelp (ref)
		local var19 = nil
		local var20 = create("Frame")({
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Name = "HelpFrame" .. tostring(p6)
		})
		
		if p6 == "KeyboardMouse" then
			local _ = create("UIListLayout")({
				Wraps = true,
				FillDirection = Enum.FillDirection.Horizontal,
				Parent = var20,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			})
		end
		if p6 == "KeyboardMouse" then
			createPCHelp(var20)
		elseif p6 == "Gamepad" then
			createGamepadHelp(var20)
		elseif p6 == "Touch" then
			var19 = createTouchHelp(var20)
		elseif isInExperienceUIVREnabled and p6 == "SpatialGamepad" then
			createSpatialGamepadHelp(var20)
		end
		return var20, var19
	end
	
	local function displayHelp(p6)
		-- upvalues: help_1 (ref), var1 (copy), userInputService (copy)
		for i, v in pairs(help_1.HelpPages) do
			if v == p6 then
				v.Parent = help_1.Page
				help_1.Page.Size = v.Size
				
				if var1 then
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
	
	local function switchToHelp(p7)
		-- upvalues: help_1 (ref), displayHelp (ref), gameSettings (copy), updateTouchLayout (ref), createHelpDisplay (ref), switchToHelp (ref)
		local var19 = help_1.HelpPages[p7]
		
		if var19 then
			displayHelp(var19)
			
			if p7 == "Touch" then
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
			local var20, var21 = createHelpDisplay(p7)
			helpPages[p7] = var20
			helpPageContents[p7] = var21
			switchToHelp(p7)
		end
	end
	
	local function _()
		-- upvalues: switchToHelp (ref), help_1 (ref)
		switchToHelp(help_1:GetCurrentInputType())
	end
	
	function help_1.PageDisplayed(_)
		-- upvalues: help_1 (ref), userInputService (copy), var5 (write), switchToHelp (ref)
		if not help_1.LastInputTypeChangedConnection then
			help_1.LastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p7)
				-- upvalues: var5 (copy), switchToHelp (copy), help_1 (copy)
				if p7 ~= Enum.UserInputType.Focus and p7 ~= Enum.UserInputType.None then
					var5 = p7
					switchToHelp(help_1:GetCurrentInputType())
				end
			end)
		end
		var5 = userInputService:GetLastInputType()
		switchToHelp(help_1:GetCurrentInputType())
	end
	
	function help_1.PageHidden(_)
		-- upvalues: help_1 (ref)
		if help_1.LastInputTypeChangedConnection then
			help_1.LastInputTypeChangedConnection:Disconnect()
			help_1.LastInputTypeChangedConnection = nil
		end
	end
	
	local function adjustForScreenLayout(p7)
		-- upvalues: help_1 (ref), gameSettings (copy), utilityModule (copy), guiService (copy), updateTouchLayout (ref)
		if help_1:GetCurrentInputType() == "Touch" then
			local touchMovementMode = gameSettings.TouchMovementMode
			p7 = p7 or guiService:GetScreenResolution()
			help_1.HelpPages.Touch.Size = UDim2.new(1, 0, 0, if utilityModule:IsSmallTouchScreen() then p7.y - 120 else p7.y - 350)
			updateTouchLayout(touchMovementMode)
		end
	end
	
	help_1.TabHeader.Name = "HelpTab"
	local help = uiblox["icons/menu/help"]
	help_1.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[help.variant]
	help_1.TabHeader.TabLabel.Icon.Text = help.name
	help_1.TabHeader.TabLabel.Title.Text = "Help"
	help_1.Page.Name = "Help"
	utilityModule:OnResized(help_1, function(p7, _)
		-- upvalues: help_1 (ref), adjustForScreenLayout (ref)
		if help_1.HelpPages.Touch then
			adjustForScreenLayout(p7)
		end
	end)
	
	return help_1
end)()
var4.Displayed.Event:connect(function()
	-- upvalues: var4 (write)
	var4:PageDisplayed()
	
	if var4.HubRef.VersionContainer then
		var4.HubRef.VersionContainer.Visible = true
	end
end)
var4.Hidden.Event:connect(function()
	-- upvalues: var4 (write)
	var4:PageHidden()
	var4.HubRef.PageViewClipper.ClipsDescendants = true
	var4.HubRef.PageView.ClipsDescendants = true
	var4.HubRef:ShowShield()
	
	if var4.HubRef.VersionContainer then
		var4.HubRef.VersionContainer.Visible = false
	end
end)

return var4