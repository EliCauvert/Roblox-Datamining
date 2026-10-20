local _UDim2 = UDim2.new(1.1, 0, 1.1, 0)
local _UDim2_1 = UDim2.new(0.9, 0, 0.9, 0)
local TweenService = game:GetService("TweenService")
local CorePackages = game:GetService("CorePackages")
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local _TweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Sine)
local _TweenInfo1 = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local LocalizeGameplayPaused = game:DefineFastFlag("LocalizeGameplayPaused", false)

local function build()
	-- upvalues: CreateFunction (copy), _UDim2_1 (copy), AppFonts (copy), LocalizeGameplayPaused (copy), RobloxTranslatorModule (copy)
	return CreateFunction("ImageLabel")({
		Name = "NetworkPause",
		Image = "rbxasset://textures/ui/PurchasePrompt/LoadingBG.png",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(8, 8, 12, 12),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		ImageColor3 = Color3.fromRGB(122, 122, 122),
		ImageTransparency = 0,
		BackgroundTransparency = 1,
		CreateFunction("UISizeConstraint")({ MaxSize = Vector2.new(312, 251) }),
		CreateFunction("UIPadding")({
			PaddingTop = UDim.new(0, 24),
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24),
			PaddingBottom = UDim.new(0, 24)
		}),
		CreateFunction("Frame")({
			Name = "Accent",
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			BackgroundColor3 = Color3.fromRGB(66, 66, 66),
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 0, 88)
		}),
		CreateFunction("Frame")({
			Name = "Upper",
			Size = UDim2.new(1, 0, 0, 88),
			BackgroundTransparency = 1,
			CreateFunction("Frame")({
				Name = "IconContainer",
				Size = UDim2.new(0, 40, 0, 37),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				BackgroundTransparency = 1,
				CreateFunction("ImageLabel")({
					Name = "Icon",
					BackgroundTransparency = 1,
					Image = "rbxasset://textures/ui/NetworkPause/no connection.png",
					ImageTransparency = 0,
					Size = _UDim2_1,
					Position = UDim2.new(0.5, 0, 0.88, 0),
					AnchorPoint = Vector2.new(0.5, 0.88)
				})
			}),
			CreateFunction("TextLabel")({
				Name = "Label",
				TextSize = 22,
				TextWrapped = true,
				BackgroundTransparency = 1,
				TextTransparency = 0,
				Font = AppFonts.default:getBold(),
				Text = LocalizeGameplayPaused and RobloxTranslatorModule:FormatByKey("InGame.GameplayPaused.Title") or "Gameplay Paused",
				Size = UDim2.new(1, 0, 0, 22),
				Position = UDim2.new(0, 0, 0, 54),
				TextColor3 = Color3.fromRGB(255, 255, 255)
			})
		}),
		CreateFunction("TextLabel")({
			Name = "Lower",
			TextSize = 18,
			TextWrapped = true,
			BackgroundTransparency = 1,
			TextTransparency = 0,
			Font = AppFonts.default:getDefault(),
			Text = LocalizeGameplayPaused and RobloxTranslatorModule:FormatByKey("InGame.GameplayPaused.Body") or "Gameplay has been paused: please wait while the game content loads.",
			TextColor3 = Color3.fromRGB(190, 190, 190),
			Position = UDim2.new(0, 0, 0, 89),
			Size = UDim2.new(1, 0, 1, -89)
		})
	})
end

local NetworkPauseNotificationModule = {}
NetworkPauseNotificationModule.__index = NetworkPauseNotificationModule

function NetworkPauseNotificationModule.new()
	-- upvalues: NetworkPauseNotificationModule (copy), build (copy), TweenService (copy), _TweenInfo (copy), _TweenInfo1 (copy), _UDim2 (copy)
	local self = setmetatable({}, NetworkPauseNotificationModule)
	local BuildResult = build()
	self.__gui = BuildResult
	self.__guiParent = nil
	self.__show = false
	self.__animations = {
		show = TweenService:Create(BuildResult, _TweenInfo, { ImageTransparency = 0 }),
		hide = TweenService:Create(BuildResult, _TweenInfo, { ImageTransparency = 1 }),
		pulse = TweenService:Create(BuildResult.Upper.IconContainer.Icon, _TweenInfo1, { ImageTransparency = 0.75, Size = _UDim2 })
	}
	
	return self
end

function NetworkPauseNotificationModule:Show()
	-- upvalues: _UDim2_1 (copy)
	self.__gui.Upper.IconContainer.Icon.Size = _UDim2_1
	self.__gui.Upper.IconContainer.Icon.ImageTransparency = 0
	self.__show = true
	self.__gui.Parent = self.__guiParent
	self.__animations.pulse:Play()
end

function NetworkPauseNotificationModule:Hide()
	self.__show = false
	self.__gui.Parent = nil
	self.__animations.pulse:Cancel()
end

function NetworkPauseNotificationModule:SetParent(Parent)
	self.__guiParent = Parent
	
	if self.__show then
		self.__gui.Parent = Parent
	end
end

return NetworkPauseNotificationModule