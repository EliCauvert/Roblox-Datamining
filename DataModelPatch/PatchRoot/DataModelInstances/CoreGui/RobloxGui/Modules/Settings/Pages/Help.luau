local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local TextService = game:GetService("TextService")
local CorePackages = game:GetService("CorePackages")
local GameSettings = UserSettings().GameSettings
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local CachedPolicyServiceModule = require(CorePackages.Workspace.Packages.CachedPolicyService)
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local Uiblox = BuilderIconsModule.Migration.uiblox
local v1 = nil
RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local IsEnabled = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local NewResult = if IsInExperienceUIVREnabled then require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId) else nil
local HelpConstantsModule = if IsInExperienceUIVREnabled then require(RobloxGui.Modules.Settings.Resources.HelpConstants) else nil
v1 = (function()
	-- upvalues: RobloxGui (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), UserInputService (copy), CreateFunction (copy), ThemeModule (copy), RobloxTranslatorModule (copy), CachedPolicyServiceModule (copy), IsEnabled (copy), TextService (copy), UtilityModule (copy), GuiService (copy), HelpConstantsModule (copy), NewResult (ref), GameSettings (copy), Uiblox (copy), BuilderIconsModule (copy)
	local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	NewPage.HelpPages = {}
	NewPage.HelpPageContents = {}
	NewPage.ActiveHelpScheme = nil
	local LastInputType = nil
	
	function NewPage:GetCurrentInputType(): string
		-- upvalues: IsInExperienceUIVREnabled (upval), IsSpatialFunction (upval), LastInputType (ref), UserInputService (upval)
		if IsInExperienceUIVREnabled and IsSpatialFunction() then
			return "SpatialGamepad"
		elseif LastInputType == nil then
			local Platform = UserInputService:GetPlatform()
			
			return if Platform == Enum.Platform.XBoxOne or Platform == Enum.Platform.WiiU then "Gamepad" elseif Platform == Enum.Platform.Windows or Platform == Enum.Platform.OSX then "KeyboardMouse" else "Touch"
		else
			return if LastInputType == Enum.UserInputType.Keyboard or LastInputType == Enum.UserInputType.MouseMovement or LastInputType == Enum.UserInputType.MouseButton1 or LastInputType == Enum.UserInputType.MouseButton2 or LastInputType == Enum.UserInputType.MouseButton3 or LastInputType == Enum.UserInputType.MouseWheel then "KeyboardMouse" elseif LastInputType == Enum.UserInputType.Touch then "Touch" elseif LastInputType == Enum.UserInputType.Gamepad1 or LastInputType == Enum.UserInputType.Gamepad2 or LastInputType == Enum.UserInputType.Gamepad3 or LastInputType == Enum.UserInputType.Gamepad4 then "Gamepad" else "KeyboardMouse"
		end
	end
	
	local function createPCHelp(Parent)
		-- upvalues: CreateFunction (upval), ThemeModule (upval), UserInputService (upval), RobloxTranslatorModule (upval), CachedPolicyServiceModule (upval)
		local function createPCGroup(Text, p1)
			-- upvalues: CreateFunction (upval), ThemeModule (upval)
			local Parent = CreateFunction("Frame")({
				BackgroundTransparency = 1,
				Size = UDim2.new(0.3333333333333333, -4, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Name = "PCGroupFrame" .. tostring(Text)
			})
			local _ = CreateFunction("UIListLayout")({
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 2),
				Parent = Parent,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
			local Parent1 = CreateFunction("TextLabel")({
				BackgroundTransparency = 1,
				TextWrapped = true,
				ZIndex = 2,
				LayoutOrder = 1,
				Position = UDim2.new(0, 9, 0, 0),
				Size = UDim2.new(1, -9, 0, 30),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = Text,
				Font = ThemeModule.font(Enum.Font.SourceSansBold, "HelpTitle"),
				FontSize = ThemeModule.fontSize(Enum.FontSize.Size18, "HelpTitle"),
				TextColor3 = Color3.new(1, 1, 1),
				TextXAlignment = Enum.TextXAlignment.Left,
				Name = "PCGroupTitle" .. tostring(Text),
				Parent = Parent
			})
			local _ = CreateFunction("UIPadding")({ PaddingLeft = UDim.new(0, 9), Parent = Parent1 })
			local Count = 0
			local Offset = Parent1.Size.Y.Offset
			
			for i = 1, #p1 do
				for Text1, Text2 in pairs(p1[i]) do
					local Parent2 = CreateFunction("Frame")({
						BorderSizePixel = 0,
						ZIndex = 2,
						Size = UDim2.new(1, 0, 0, 42),
						Position = UDim2.new(0, 0, 0, Offset + Count * 44),
						BackgroundTransparency = ThemeModule.transparency("InputActionBackground", 0.65),
						AutomaticSize = Enum.AutomaticSize.Y,
						LayoutOrder = i + 1,
						Name = "ActionInputBinding" .. tostring(Text1),
						Parent = Parent
					})
					Parent2.BackgroundColor3 = ThemeModule.color("InputActionBackground")
					CreateFunction("UICorner")({ CornerRadius = UDim.new(0, 3), Parent = Parent2 })
					Instance.new("UITextSizeConstraint", (CreateFunction("TextLabel")({
						BackgroundTransparency = 1,
						ZIndex = 2,
						TextWrapped = true,
						Size = UDim2.new(0.4, -9, 0, 42),
						AutomaticSize = Enum.AutomaticSize.Y,
						Position = UDim2.new(0, 9, 0, 0),
						Text = Text1,
						Font = ThemeModule.font(Enum.Font.SourceSansBold, "HelpTitle"),
						FontSize = ThemeModule.fontSize(Enum.FontSize.Size18, "HelpTitle"),
						TextColor3 = Color3.new(1, 1, 1),
						TextXAlignment = Enum.TextXAlignment.Left,
						Name = Text1 .. "Label",
						Parent = Parent2
					}))).MaxTextSize = ThemeModule.textSize(28)
					local _ = CreateFunction("TextLabel")({
						BackgroundTransparency = 1,
						ZIndex = 2,
						TextWrapped = true,
						TextScaled = false,
						Size = UDim2.new(0.5, 0, 0, 42),
						Position = UDim2.new(0.5, -4, 0, 0),
						Text = Text2,
						Font = ThemeModule.font(Enum.Font.SourceSans, "HelpText"),
						FontSize = ThemeModule.fontSize(Enum.FontSize.Size18, "HelpText"),
						TextColor3 = Color3.new(1, 1, 1),
						TextXAlignment = Enum.TextXAlignment.Left,
						Name = Text2 .. "Label",
						Parent = Parent2,
						AutomaticSize = Enum.AutomaticSize.Y
					})
					Count += 1
				end
			end
			Parent.Size = UDim2.new(Parent.Size.X.Scale, Parent.Size.X.Offset, 0, Offset + Count * 44)
			
			return Parent
		end
		
		local IsPlatformMatch = UserInputService:GetPlatform() == Enum.Platform.OSX
		local CharacterMovement = createPCGroup("Character Movement", {
			[1] = {
				["Move Forward"] = UserInputService:GetStringForKeyCode(Enum.KeyCode.W) .. "/" .. RobloxTranslatorModule:FormatByKey("InGame.HelpMenu.UpArrow")
			},
			[2] = {
				["Move Backward"] = UserInputService:GetStringForKeyCode(Enum.KeyCode.S) .. "/" .. RobloxTranslatorModule:FormatByKey("InGame.HelpMenu.DownArrow")
			},
			[3] = {
				["Move Left"] = UserInputService:GetStringForKeyCode(Enum.KeyCode.A) .. "/" .. RobloxTranslatorModule:FormatByKey("InGame.HelpMenu.LeftArrow")
			},
			[4] = {
				["Move Right"] = UserInputService:GetStringForKeyCode(Enum.KeyCode.D) .. "/" .. RobloxTranslatorModule:FormatByKey("InGame.HelpMenu.RightArrow")
			},
			[5] = { Jump = "Space" }
		})
		CharacterMovement.Parent = Parent
		CharacterMovement.LayoutOrder = 1
		local Text = UserInputService:GetStringForKeyCode(Enum.KeyCode.One) .. "," .. UserInputService:GetStringForKeyCode(Enum.KeyCode.Two) .. "," .. UserInputService:GetStringForKeyCode(Enum.KeyCode.Three) .. "..."
		local Accessories = createPCGroup("Accessories", {
			[1] = { ["Equip Tools"] = Text },
			[2] = { ["Unequip Tools"] = Text },
			[3] = { ["Drop Tool"] = "Backspace" },
			[4] = { ["Use Tool"] = "Left Mouse Button" }
		})
		Accessories.Position = UDim2.new(0.3333333333333333, 4, 0, 0)
		Accessories.Parent = Parent
		Accessories.LayoutOrder = 2
		local List = {}
		table.insert(List, {
			["UI Selection Toggle"] = UserInputService:GetStringForKeyCode(Enum.KeyCode.BackSlash)
		})
		local Inverted = not CachedPolicyServiceModule:IsSubjectToChinaPolicies()
		
		if Inverted then
			table.insert(List, {
				Screenshot = if IsPlatformMatch then "Opt + 1" else "Alt + 1"
			})
			
			if not IsPlatformMatch then
				table.insert(List, { ["Record Video"] = "F12" })
			end
		end
		if Inverted then
			table.insert(List, {
				["Dev Console"] = if IsPlatformMatch then "F9/fn + F9" else "F9"
			})
		end
		table.insert(List, { Mouselock = "Shift" })
		
		if Inverted then
			table.insert(List, {
				["Graphics Level"] = if IsPlatformMatch then "F10/fn + F10" else "F10"
			})
			table.insert(List, {
				Fullscreen = if IsPlatformMatch then "Ctrl + Cmd + F" else "F11"
			})
		end
		if Inverted then
			table.insert(List, {
				["Perf. Stats"] = if IsPlatformMatch then "Fn+Opt+Cmd+F7" else "Ctrl + Shift + F7"
			})
		end
		local Misc = createPCGroup("Misc", List)
		Misc.Position = UDim2.new(0.6666666666666666, 8, 0, 0)
		Misc.Parent = Parent
		Misc.LayoutOrder = 3
		local CameraMovement = createPCGroup("Camera Movement", {
			[1] = { Rotate = "Right Mouse Button" },
			[2] = { ["Zoom In/Out"] = "Mouse Wheel" },
			[3] = {
				["Zoom In"] = UserInputService:GetStringForKeyCode(Enum.KeyCode.I)
			},
			[4] = {
				["Zoom Out"] = UserInputService:GetStringForKeyCode(Enum.KeyCode.O)
			}
		})
		CameraMovement.Position = UDim2.new(0, 0, CharacterMovement.Size.Y.Scale, CharacterMovement.Size.Y.Offset + 50)
		CameraMovement.Parent = Parent
		CameraMovement.LayoutOrder = 4
		local MenuItems = createPCGroup("Menu Items", {
			[1] = { ["Roblox Menu"] = "Esc" },
			[2] = {
				Backpack = UserInputService:GetStringForKeyCode(Enum.KeyCode.Backquote)
			},
			[3] = { Playerlist = "Tab" },
			[4] = {
				Chat = UserInputService:GetStringForKeyCode(Enum.KeyCode.Slash)
			}
		})
		MenuItems.Position = UDim2.new(0.3333333333333333, 4, CharacterMovement.Size.Y.Scale, CharacterMovement.Size.Y.Offset + 50)
		MenuItems.Parent = Parent
		MenuItems.LayoutOrder = 5
		Parent.Size = UDim2.new(Parent.Size.X.Scale, Parent.Size.X.Offset, 0, MenuItems.Size.Y.Offset + MenuItems.Position.Y.Offset)
	end
	
	local function createGamepadHelp(Frame: Frame)
		-- upvalues: NewPage (copy), CreateFunction (upval), IsEnabled (upval), ThemeModule (upval), TextService (upval), RobloxTranslatorModule (upval)
		local Largest = math.max(NewPage.Page.AbsoluteSize.X * 0.58, 270)
		local _UDim2 = UDim2.new(0, Largest, 0, Largest * 0.64)
		local Parent = CreateFunction("ImageLabel")({
			Name = "GamepadImage",
			Image = "rbxasset://textures/ui/Settings/Help/PlatformController.png",
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = _UDim2,
			Position = UDim2.new(0.5, -_UDim2.X.Offset / 2 + 30, 0.5, -_UDim2.Y.Offset / 2 + 7),
			Parent = Frame
		})
		Frame.Size = UDim2.new(Frame.Size.X.Scale, Frame.Size.X.Offset, 0, Parent.Size.Y.Offset + 100)
		local FontSizeResult = IsEnabled and ThemeModule.fontSize(Enum.FontSize.Size36) or ThemeModule.fontSize(Enum.FontSize.Size24)
		local TextSizeResult = FontSizeResult == ThemeModule.fontSize(Enum.FontSize.Size36) and ThemeModule.textSize(36) or ThemeModule.textSize(24)
		
		local function createGamepadLabel(Text, Position, Size, p2)
			-- upvalues: CreateFunction (upval), ThemeModule (upval), FontSizeResult (copy), Parent (copy), TextService (upval), TextSizeResult (copy), Frame (copy)
			local Label = CreateFunction("TextLabel")({
				BackgroundTransparency = 1,
				ZIndex = 2,
				Position = Position,
				Size = Size,
				Text = Text,
				TextXAlignment = p2 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left,
				AnchorPoint = p2 and Vector2.new(1, 0.5) or Vector2.new(0, 0.5),
				Font = ThemeModule.font(Enum.Font.SourceSansBold, "HelpGamepad"),
				FontSize = FontSizeResult,
				TextColor3 = Color3.new(1, 1, 1),
				Name = Text .. "Label",
				Parent = Parent,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
			Label.TextWrapped = true
			local X = TextService:GetTextSize(Text, TextSizeResult, ThemeModule.font(Enum.Font.SourceSansBold, "Bold"), Vector2.new(0, 0)).X
			local Magnitude = math.abs(Position.X.Offset)
			
			local function updateNameLabelSize()
				-- upvalues: p2 (copy), Frame (copy), Magnitude (copy), Label (copy), TextSizeResult (upval), X (copy), FontSizeResult (upval)
				local XDelta: number = p2 and Frame.AbsoluteSize.X / 2 + 30 - Magnitude or Frame.AbsoluteSize.X / 2 - 30 - Magnitude
				Label.Size = UDim2.new(Label.Size.X.Scale, XDelta, Label.Size.Y.Scale, TextSizeResult * 2)
				Label.TextScaled = false
				
				if XDelta >= X then
					Label.FontSize = FontSizeResult
				end
			end
			
			local _ = Frame:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
				-- upvalues: updateNameLabelSize (copy)
				updateNameLabelSize()
			end)
			updateNameLabelSize()
		end
		
		local XOffset = -Parent.Size.X.Offset / 2 - 20
		local OffsetDelta = Parent.Size.X.Offset / 2 - 20
		local XOffset1 = OffsetDelta + 40
		createGamepadLabel("Switch Tool", UDim2.new(0.5, XOffset, 0, 15), UDim2.new(0, 100, 0, TextSizeResult), true)
		createGamepadLabel(RobloxTranslatorModule:FormatByKey("InGame.HelpMenu.Controls.ToggleGameMenu"), UDim2.new(0.5, XOffset, 0.15, 10), UDim2.new(0, 164, 0, TextSizeResult), true)
		createGamepadLabel("Move", UDim2.new(0.5, XOffset, 0.31, 5), UDim2.new(0, 46, 0, TextSizeResult), true)
		createGamepadLabel("Menu Navigation", UDim2.new(0.5, XOffset, 0.46, 0), UDim2.new(0, 164, 0, TextSizeResult), true)
		createGamepadLabel("Use Tool", UDim2.new(0.5, OffsetDelta, 0, 15), UDim2.new(0, 73, 0, TextSizeResult))
		createGamepadLabel("Roblox Menu", UDim2.new(0.5, OffsetDelta, 0.15, 10), UDim2.new(0, 122, 0, TextSizeResult))
		createGamepadLabel("Back", UDim2.new(0.5, OffsetDelta, 0.31, 5), UDim2.new(0, 43, 0, TextSizeResult))
		createGamepadLabel("Jump", UDim2.new(0.5, OffsetDelta, 0.46, 0), UDim2.new(0, 49, 0, TextSizeResult))
		createGamepadLabel("Rotate Camera", UDim2.new(0.5, XOffset1, 0.62, -10), UDim2.new(0, 132, 0, TextSizeResult))
		createGamepadLabel("Camera Zoom", UDim2.new(0.5, XOffset1, 0.77, -10), UDim2.new(0, 122, 0, TextSizeResult))
	end
	
	local function updateTouchLayout(TouchMovementMode)
		-- upvalues: NewPage (copy), UtilityModule (upval)
		NewPage.ActiveHelpScheme = TouchMovementMode
		local IsPortrait = UtilityModule:IsPortrait()
		
		if NewPage.HelpPages.Touch then
			local Touch = NewPage.HelpPageContents.Touch
			
			local function _(p2)
				-- upvalues: Touch (copy)
				if p2 then
					for i, value in pairs(Touch) do
						value.Visible = not p2[i]
					end
				end
			end
			local config = nil
			
			if TouchMovementMode == Enum.TouchMovementMode.DynamicThumbstick or TouchMovementMode == Enum.TouchMovementMode.Default then
				config = { MoveImageCTM = true }
				Touch.MoveLabel.Position = IsPortrait and UDim2.new(0.25, -Touch.MoveLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.15, -Touch.MoveLabel.AbsoluteSize.x / 2, 0.85, -Touch.MoveLabel.AbsoluteSize.y)
				Touch.JumpLabel.Position = IsPortrait and UDim2.new(0.75, -Touch.JumpLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.85, -60, 0.85, -Touch.JumpLabel.AbsoluteSize.y)
				Touch.RotateLabel.Position = IsPortrait and UDim2.new(1, -Touch.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.85, -Touch.RotateLabel.AbsoluteSize.x / 2, 0.02, 0)
				Touch.UseToolLabel.Position = IsPortrait and UDim2.new(0.5, -Touch.UseToolLabel.AbsoluteSize.x / 2, 0.5, -100) or UDim2.new(0.5, -Touch.UseToolLabel.AbsoluteSize.x / 2, 0.5, -60)
				Touch.EquipLabel.Position = IsPortrait and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0)
				Touch.ZoomLabel.Position = IsPortrait and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0)
			elseif TouchMovementMode == Enum.TouchMovementMode.ClickToMove then
				config = { MoveImageDTS = true, JumpLabel = true }
				Touch.MoveLabel.Position = IsPortrait and UDim2.new(0.25, -Touch.MoveLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.25, -Touch.MoveLabel.AbsoluteSize.x / 2, 0.5, 40)
				Touch.RotateLabel.Position = IsPortrait and UDim2.new(1, -Touch.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0)
				Touch.UseToolLabel.Position = IsPortrait and UDim2.new(0.75, -Touch.UseToolLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.85, -60, 0.02, 0)
				Touch.EquipLabel.Position = IsPortrait and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0)
				Touch.ZoomLabel.Position = IsPortrait and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0)
			else
				config = {
					MoveImageDTS = true,
					MoveImageCTM = true,
					JumpImage = true
				}
				Touch.MoveLabel.Position = IsPortrait and UDim2.new(0.06, 0, 1, -120) or UDim2.new(0.06, 0, 0.58, 0)
				Touch.JumpLabel.Position = IsPortrait and UDim2.new(0.94, -Touch.JumpLabel.AbsoluteSize.x, 1, -120) or UDim2.new(0.8, 0, 0.58, 0)
				Touch.RotateLabel.Position = IsPortrait and UDim2.new(1, -Touch.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0)
				Touch.UseToolLabel.Position = IsPortrait and UDim2.new(0.5, -Touch.UseToolLabel.AbsoluteSize.x / 2, 0.25, 50) or UDim2.new(0.85, -60, 0.02, 0)
				Touch.EquipLabel.Position = IsPortrait and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0)
				Touch.ZoomLabel.Position = IsPortrait and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0)
			end
			local config1 = config
			
			if config1 then
				for i, value in pairs(Touch) do
					value.Visible = not config1[i]
				end
			end
		end
	end
	
	local function createTouchHelp(Parent)
		-- upvalues: UtilityModule (upval), GuiService (upval), CreateFunction (upval), ThemeModule (upval)
		local IsSmallTouchScreen = UtilityModule:IsSmallTouchScreen()
		Parent.Size = UDim2.new(1, 0, 0, if IsSmallTouchScreen then GuiService:GetScreenResolution().y - 100 else GuiService:GetScreenResolution().y - 350)
		
		local function createTouchLabel(Text, Position, Size, Parent)
			-- upvalues: CreateFunction (upval), ThemeModule (upval), IsSmallTouchScreen (copy)
			local Parent1 = CreateFunction("TextLabel")({
				BackgroundTransparency = 1,
				Position = Position,
				Size = Size,
				Name = Text .. "Frame",
				Parent = Parent
			})
			local v2 = CreateFunction("TextLabel")({
				BackgroundTransparency = 1,
				ZIndex = 3,
				TextScaled = true,
				TextWrapped = true,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				Text = Text,
				Font = ThemeModule.font(Enum.Font.SourceSansBold, "HelpTouch"),
				FontSize = ThemeModule.fontSize(Enum.FontSize.Size14, "HelpTouch"),
				TextColor3 = Color3.new(1, 1, 1),
				Name = Text .. "Label",
				Parent = Parent1
			})
			
			if not IsSmallTouchScreen then
				v2.FontSize = ThemeModule.fontSize(Enum.FontSize.Size18, "HelpTitle")
				v2.Size = UDim2.new(v2.Size.X.Scale, v2.Size.X.Offset, v2.Size.Y.Scale, v2.Size.Y.Offset + 4)
			end
			local _ = CreateFunction("ImageLabel")({
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/Settings/Radial/RadialLabel.png",
				ZIndex = 2,
				Name = Text .. "BackgroundImage",
				Size = UDim2.new(1.25, 0, 1.25, 0),
				Position = UDim2.new(-0.125, 0, -0.065, 0),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(12, 2, 65, 21),
				Parent = Parent1
			})
			Instance.new("UITextSizeConstraint", v2).MaxTextSize = ThemeModule.textSize(18, "HelpText")
			
			return Parent1
		end
		
		local function _(Name, Image, Position, Size, Parent)
			-- upvalues: CreateFunction (upval)
			return (CreateFunction("ImageLabel")({
				BackgroundTransparency = 1,
				ZIndex = 2,
				Name = Name,
				Size = Size,
				Position = Position,
				Image = Image,
				Parent = Parent
			}))
		end
		
		local v2: number = if IsSmallTouchScreen then 0 else 30
		local config = {
			MoveLabel = createTouchLabel("Move", UDim2.new(0.06, 0, 0.58, 0), UDim2.new(0, v2 + 77, 0, 25), Parent)
		}
		config.MoveImageDTS = CreateFunction("ImageLabel")({
			Name = "MoveImageDTS",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 65, 0, 48),
			Position = UDim2.new(0.5, -32, 1, 3),
			Parent = config.MoveLabel
		})
		config.MoveImageCTM = CreateFunction("ImageLabel")({
			Name = "MoveImageCTM",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 38, 0, 52),
			Position = UDim2.new(0.5, -19, 1, 3),
			Parent = config.MoveLabel
		})
		config.JumpLabel = createTouchLabel("Jump", UDim2.new(0.8, 0, 0.58, 0), UDim2.new(0, v2 + 77, 0, 25), Parent)
		config.JumpImage = CreateFunction("ImageLabel")({
			Name = "JumpImage",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 38, 0, 52),
			Position = UDim2.new(0.5, -19, 1, 3),
			Parent = config.JumpLabel
		})
		config.EquipLabel = createTouchLabel("Equip/Unequip Tools", UDim2.new(0.5, -60, 0.64, 0), UDim2.new(0, v2 + 120, 0, 25), Parent)
		config.ZoomLabel = createTouchLabel("Zoom In/Out", UDim2.new(0.15, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), Parent)
		config.ZoomImage = CreateFunction("ImageLabel")({
			Name = "ZoomImage",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/ZoomGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 53, 0, 59),
			Position = UDim2.new(0.5, -26, 1, 3),
			Parent = config.ZoomLabel
		})
		config.RotateLabel = createTouchLabel("Rotate Camera", UDim2.new(0.5, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), Parent)
		config.RotateImage = CreateFunction("ImageLabel")({
			Name = "RotateImage",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 65, 0, 48),
			Position = UDim2.new(0.5, -32, 1, 3),
			Parent = config.RotateLabel
		})
		config.UseToolLabel = createTouchLabel("Use Tool", UDim2.new(0.85, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), Parent)
		config.ToolImage = CreateFunction("ImageLabel")({
			Name = "ToolImage",
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png",
			ZIndex = 2,
			Size = UDim2.new(0, 38, 0, 52),
			Position = UDim2.new(0.5, -19, 1, 3),
			Parent = config.UseToolLabel
		})
		
		return config
	end
	
	local function createSpatialGamepadHelp(Parent)
		-- upvalues: HelpConstantsModule (upval), CreateFunction (upval), NewPage (copy), NewResult (upval), ThemeModule (upval)
		local GamepadQuest = HelpConstantsModule.Images.GamepadQuest
		local QuestGamepadLabels = HelpConstantsModule.Labels.QuestGamepadLabels
		local HeightRatio = GamepadQuest.HeightRatio
		local LocalizationKeyPrefix = QuestGamepadLabels.LocalizationKeyPrefix
		local LabelRelativeTextHeight = QuestGamepadLabels.LabelRelativeTextHeight
		local LabelsInfo = QuestGamepadLabels.LabelsInfo
		local Parent1 = CreateFunction("ImageLabel")({
			Name = "SpatialGamepadImage",
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1, 0, HeightRatio, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			Image = GamepadQuest.Image,
			Parent = Parent
		})
		local UIPadding = NewPage.Page:FindFirstChildOfClass("UIPadding")
		Parent.Size = UDim2.new(Parent.Size.X.Scale, Parent.Size.X.Offset, 0, (NewPage.Page.AbsoluteSize.X - (if UIPadding then UIPadding.PaddingLeft.Offset + UIPadding.PaddingRight.Offset else 0)) * HeightRatio)
		
		for _, value in LabelsInfo do
			CreateFunction("TextLabel")({
				BackgroundTransparency = 1,
				ZIndex = 2,
				TextScaled = true,
				Name = value.labelKey,
				Position = UDim2.fromScale(value.xPosition, value.yPosition),
				Size = UDim2.fromScale(value.width, LabelRelativeTextHeight),
				Text = NewResult:Format(LocalizationKeyPrefix .. value.labelKey),
				TextXAlignment = value.xAlignment or Enum.TextXAlignment.Right,
				Font = ThemeModule.font(nil, "HelpGamepad"),
				TextColor3 = ThemeModule.color("TextEmphasis"),
				TextTransparency = ThemeModule.transparency("TextEmphasis"),
				Parent = Parent1
			})
		end
	end
	
	local function createHelpDisplay(p2)
		-- upvalues: CreateFunction (upval), createPCHelp (copy), createGamepadHelp (copy), createTouchHelp (copy), IsInExperienceUIVREnabled (upval), createSpatialGamepadHelp (copy)
		local v2 = nil
		local Parent = CreateFunction("Frame")({
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Name = "HelpFrame" .. tostring(p2)
		})
		
		if p2 == "KeyboardMouse" then
			local _ = CreateFunction("UIListLayout")({
				Wraps = true,
				FillDirection = Enum.FillDirection.Horizontal,
				Parent = Parent,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			})
		end
		if p2 == "KeyboardMouse" then
			createPCHelp(Parent)
		elseif p2 == "Gamepad" then
			createGamepadHelp(Parent)
		elseif p2 == "Touch" then
			v2 = createTouchHelp(Parent)
		elseif IsInExperienceUIVREnabled and p2 == "SpatialGamepad" then
			createSpatialGamepadHelp(Parent)
		end
		return Parent, v2
	end
	
	local function displayHelp(HelpPage)
		-- upvalues: NewPage (copy), IsEnabled (upval), UserInputService (upval)
		for _, helpPage in pairs(NewPage.HelpPages) do
			if helpPage == HelpPage then
				helpPage.Parent = NewPage.Page
				NewPage.Page.Size = helpPage.Size
				
				if IsEnabled then
					NewPage.Page.Size = UDim2.new(helpPage.Size.X.Scale, helpPage.Size.X.Offset, helpPage.Size.Y.Scale, 0)
				end
			else
				helpPage.Parent = nil
			end
		end
		if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
			NewPage.HubRef.PageViewClipper.ClipsDescendants = false
			NewPage.HubRef.PageView.ClipsDescendants = false
		end
	end
	
	local function switchToHelp(CurrentInputType)
		-- upvalues: NewPage (copy), displayHelp (copy), GameSettings (upval), updateTouchLayout (copy), createHelpDisplay (copy), switchToHelp (copy)
		local HelpPage = NewPage.HelpPages[CurrentInputType]
		
		if HelpPage then
			displayHelp(HelpPage)
			
			if CurrentInputType == "Touch" then
				local TouchMovementMode = GameSettings.TouchMovementMode
				
				if NewPage.ActiveHelpScheme ~= TouchMovementMode then
					updateTouchLayout(TouchMovementMode)
					
					return
				end
			end
		else
			NewPage.HelpPages[CurrentInputType], NewPage.HelpPageContents[CurrentInputType] = createHelpDisplay(CurrentInputType)
			switchToHelp(CurrentInputType)
		end
	end
	
	local function _()
		-- upvalues: switchToHelp (copy), NewPage (copy)
		switchToHelp(NewPage:GetCurrentInputType())
	end
	
	function NewPage:PageDisplayed()
		-- upvalues: NewPage (copy), UserInputService (upval), LastInputType (ref), switchToHelp (copy)
		if not NewPage.LastInputTypeChangedConnection then
			NewPage.LastInputTypeChangedConnection = UserInputService.LastInputTypeChanged:Connect(function(UserInputType)
				-- upvalues: LastInputType (upval), switchToHelp (upval), NewPage (upval)
				if UserInputType ~= Enum.UserInputType.Focus and UserInputType ~= Enum.UserInputType.None then
					LastInputType = UserInputType
					switchToHelp(NewPage:GetCurrentInputType())
				end
			end)
		end
		LastInputType = UserInputService:GetLastInputType()
		switchToHelp(NewPage:GetCurrentInputType())
	end
	
	function NewPage:PageHidden()
		-- upvalues: NewPage (copy)
		if NewPage.LastInputTypeChangedConnection then
			NewPage.LastInputTypeChangedConnection:Disconnect()
			NewPage.LastInputTypeChangedConnection = nil
		end
	end
	
	local function adjustForScreenLayout(p2)
		-- upvalues: NewPage (copy), GameSettings (upval), UtilityModule (upval), GuiService (upval), updateTouchLayout (copy)
		if NewPage:GetCurrentInputType() == "Touch" then
			local TouchMovementMode = GameSettings.TouchMovementMode
			local IsSmallTouchScreen = UtilityModule:IsSmallTouchScreen()
			local P28 = p2 or GuiService:GetScreenResolution()
			NewPage.HelpPages.Touch.Size = UDim2.new(1, 0, 0, if IsSmallTouchScreen then P28.y - 120 else P28.y - 350)
			updateTouchLayout(TouchMovementMode)
		end
	end
	
	NewPage.TabHeader.Name = "HelpTab"
	local IconsMenuHelp = Uiblox["icons/menu/help"]
	NewPage.TabHeader.TabLabel.Icon.FontFace = BuilderIconsModule.Font[IconsMenuHelp.variant]
	NewPage.TabHeader.TabLabel.Icon.Text = IconsMenuHelp.name
	NewPage.TabHeader.TabLabel.Title.Text = "Help"
	NewPage.Page.Name = "Help"
	UtilityModule:OnResized(NewPage, function(p2, _)
		-- upvalues: NewPage (copy), adjustForScreenLayout (copy)
		if NewPage.HelpPages.Touch then
			adjustForScreenLayout(p2)
		end
	end)
	
	return NewPage
end)()
v1.Displayed.Event:connect(function()
	-- upvalues: v1 (ref)
	v1:PageDisplayed()
	
	if v1.HubRef.VersionContainer then
		v1.HubRef.VersionContainer.Visible = true
	end
end)
v1.Hidden.Event:connect(function()
	-- upvalues: v1 (ref)
	v1:PageHidden()
	v1.HubRef.PageViewClipper.ClipsDescendants = true
	v1.HubRef.PageView.ClipsDescendants = true
	v1.HubRef:ShowShield()
	
	if v1.HubRef.VersionContainer then
		v1.HubRef.VersionContainer.Visible = false
	end
end)

return v1