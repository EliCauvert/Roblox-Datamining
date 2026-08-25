local uDim2 = UDim2.new(1.1, 0, 1.1, 0)
local uDim2_1 = UDim2.new(0.9, 0, 0.9, 0)
local tweenService = game:GetService("TweenService")
local corePackagesService = game:GetService("CorePackages")
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Sine)
local tweenInfo_1 = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local localizeGameplayPaused = game:DefineFastFlag("LocalizeGameplayPaused", false)

local function build()
	-- upvalues: create (ref), uDim2_1 (ref), appFonts (ref), localizeGameplayPaused (ref), robloxTranslatorModule (ref)
	return create("ImageLabel")({
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
		create("UISizeConstraint")({ MaxSize = Vector2.new(312, 251) }),
		create("UIPadding")({
			PaddingTop = UDim.new(0, 24),
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24),
			PaddingBottom = UDim.new(0, 24)
		}),
		create("Frame")({
			Name = "Accent",
			BorderSizePixel = 0,
			BackgroundTransparency = 0,
			BackgroundColor3 = Color3.fromRGB(66, 66, 66),
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 0, 88)
		}),
		create("Frame")({
			Name = "Upper",
			Size = UDim2.new(1, 0, 0, 88),
			BackgroundTransparency = 1,
			create("Frame")({
				Name = "IconContainer",
				Size = UDim2.new(0, 40, 0, 37),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				BackgroundTransparency = 1,
				create("ImageLabel")({
					Name = "Icon",
					BackgroundTransparency = 1,
					Image = "rbxasset://textures/ui/NetworkPause/no connection.png",
					ImageTransparency = 0,
					Size = uDim2_1,
					Position = UDim2.new(0.5, 0, 0.88, 0),
					AnchorPoint = Vector2.new(0.5, 0.88)
				})
			}),
			create("TextLabel")({
				Name = "Label",
				TextSize = 22,
				TextWrapped = true,
				BackgroundTransparency = 1,
				TextTransparency = 0,
				Font = appFonts.default:getBold(),
				Text = localizeGameplayPaused and robloxTranslatorModule:FormatByKey("InGame.GameplayPaused.Title") or "Gameplay Paused",
				Size = UDim2.new(1, 0, 0, 22),
				Position = UDim2.new(0, 0, 0, 54),
				TextColor3 = Color3.fromRGB(255, 255, 255)
			})
		}),
		create("TextLabel")({
			Name = "Lower",
			TextSize = 18,
			TextWrapped = true,
			BackgroundTransparency = 1,
			TextTransparency = 0,
			Font = appFonts.default:getDefault(),
			Text = localizeGameplayPaused and robloxTranslatorModule:FormatByKey("InGame.GameplayPaused.Body") or "Gameplay has been paused: please wait while the game content loads.",
			TextColor3 = Color3.fromRGB(190, 190, 190),
			Position = UDim2.new(0, 0, 0, 89),
			Size = UDim2.new(1, 0, 1, -89)
		})
	})
end

local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), build (ref), tweenService (ref), tweenInfo (ref), tweenInfo_1 (ref), uDim2 (ref)
	local tbl = setmetatable({}, t)
	local var11 = build()
	local var12 = tweenService:Create(var11, tweenInfo, { ImageTransparency = 0 })
	local var13 = tweenService:Create(var11, tweenInfo, { ImageTransparency = 1 })
	local icon = tweenService:Create(var11.Upper.IconContainer.Icon, tweenInfo_1, { ImageTransparency = 0.75, Size = uDim2 })
	tbl.__gui = var11
	tbl.__guiParent = nil
	tbl.__show = false
	tbl.__animations = { show = var12, hide = var13, pulse = icon }
	
	return tbl
end

function t:Show()
	-- upvalues: uDim2_1 (ref)
	self.__gui.Upper.IconContainer.Icon.Size = uDim2_1
	self.__gui.Upper.IconContainer.Icon.ImageTransparency = 0
	self.__show = true
	self.__gui.Parent = self.__guiParent
	self.__animations.pulse:Play()
end

function t:Hide()
	self.__show = false
	self.__gui.Parent = nil
	self.__animations.pulse:Cancel()
end

function t:SetParent(p0)
	self.__guiParent = p0
	
	if self.__show then
		self.__gui.Parent = p0
	end
end

return t