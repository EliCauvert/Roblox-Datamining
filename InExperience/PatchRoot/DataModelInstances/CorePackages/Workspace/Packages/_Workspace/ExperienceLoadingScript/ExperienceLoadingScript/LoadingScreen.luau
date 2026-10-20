local ExperienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")

if require(ExperienceLoadingScript.Flags.FFlagUseSharedLoadingScreenView) then
	return require(ExperienceLoadingScript.LoadingScreenWrapper)
else
	local Parent = ExperienceLoadingScript.Parent
	local ContextActionService = game:GetService("ContextActionService")
	local CoreGui = game:GetService("CoreGui")
	local ExperienceService = game:GetService("ExperienceService")
	local GuiService = game:GetService("GuiService")
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local ReactModule = require(Parent.React)
	local CryoModule = require(Parent.Cryo)
	local RoactModule = require(Parent.Roact)
	local RoactRoduxModule = require(Parent.RoactRodux)
	local ExternalEventConnection = require(Parent.RoactUtils).ExternalEventConnection
	local GetGameProductInfoModule = require(ExperienceLoadingScript.Thunks.GetGameProductInfo)
	local GetIsSubjectToChinaPoliciesModule = require(ExperienceLoadingScript.Thunks.GetIsSubjectToChinaPolicies)
	local GetUniverseIdModule = require(ExperienceLoadingScript.Thunks.GetUniverseId)
	local ProgressLoadingModule = require(Parent.ProgressLoading)
	local PlaceLauncherState = ProgressLoadingModule.PlaceLauncherState
	local VerifiedBadgesModule = require(Parent.VerifiedBadges)
	local LoggingProtocolModule = require(Parent.LoggingProtocol)
	local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
	local ResponsiveModule = require(Parent.Responsive)
	local FoundationModule = require(Parent.Foundation)
	local IconSize = FoundationModule.Enums.IconSize
	local Loading = FoundationModule.Loading
	local FoundationProvider = FoundationModule.FoundationProvider
	local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
	local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
	local LocalizationProvider = require(Parent.Localization).LocalizationProvider
	local AutoTranslateBadge = ProgressLoadingModule.AutoTranslateBadge
	local LoadingScreenTelemetryModule = require(Parent.ProgressLoading.LoadingScreenTelemetry)
	local PolicyContainer = ProgressLoadingModule.PolicyContainer
	local ServerStatus = ProgressLoadingModule.ServerStatus
	local ServerStatusWithCountdown = ProgressLoadingModule.ServerStatusWithCountdown
	local NewResult = require(Parent.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
	local QueueExperimentation = require(Parent.SocialExperiments).QueueExperimentation
	local GetFFlagReportFirstExperienceCancelledModule = require(ExperienceLoadingScript.Flags.GetFFlagReportFirstExperienceCancelled)
	local CreateNetworking = ProgressLoadingModule.createNetworking
	local DisplayOrder: number = if require(Parent.SharedFlags).FFlagIncreaseLoadingScreenOrder then 8 else 7
	local _Vector2 = Vector2.new(768, 432)
	local _Color3 = Color3.fromRGB(101, 102, 104)
	local config = {
		MOBILE_PORTRAIT = { TOP = 44, BOTTOM = 44, LEFT = 24, RIGHT = 24 },
		MOBILE_LANDSCAPE = { TOP = 24, BOTTOM = 24, LEFT = 44, RIGHT = 44 },
		DESKTOP = { TOP = 24, BOTTOM = 24, LEFT = 24, RIGHT = 24 },
		CONSOLE = { TOP = 64, BOTTOM = 64, LEFT = 64, RIGHT = 64 }
	}
	local IsTenFootInterface = require(Parent.AppCommonLib).isTenFootInterface()
	local Platform = UserInputService:GetPlatform()
	local IsPlatformMatch: boolean = Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android
	local list = { 150, 256 }
	local InputBeganConnection = nil
	local v1 = 0
	local CurrentTime = 1e999
	
	local function _(p1)
		-- upvalues: IsPlatformMatch (copy), config (copy), IsTenFootInterface (copy)
		return if IsPlatformMatch then p1 and config.MOBILE_PORTRAIT or config.MOBILE_LANDSCAPE elseif IsTenFootInterface then config.CONSOLE else config.DESKTOP
	end
	
	local _ = function(Entry, Value: number)
		if type(Entry) == "table" and #Entry >= 2 then
			local ClampedValue = math.clamp(Value, 0, 1)
			
			return Entry[1] * (1 - ClampedValue) + Entry[2] * ClampedValue
		else
			return 0
		end
	end
	
	local config1 = {
		FadeIn = function(p1: number, _, Bindings, Callback: () -> ())
			local list = { 1, 1 }
			local list1 = { 1, 0 }
			local list2 = { 1, 0.2 }
			
			if p1 > 0.6 then
				Bindings.iconTransparency(if type(list1) == "table" and #list1 >= 2 then list1[1] * 0 + list1[2] * 1 else 0)
				Bindings.iconSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
				Bindings.infoFrameTransparency(if type(list2) == "table" and #list2 >= 2 then list2[1] * 0 + list2[2] * 1 else 0)
				Bindings.thumbnailTransparency(if type(list1) == "table" and #list1 >= 2 then list1[1] * 0 + list1[2] * 1 else 0)
				Bindings.placeTextTransparency(if type(list1) == "table" and #list1 >= 2 then list1[1] * 0 + list1[2] * 1 else 0)
				Bindings.placeTextSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
				Bindings.creatorTextTransparency(if type(list1) == "table" and #list1 >= 2 then list1[1] * 0 + list1[2] * 1 else 0)
				Bindings.creatorTextSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
				Callback()
				
				return
			end
			local Value = p1 / 0.6
			local IconTransparencyFunction: (any) -> () = Bindings.iconTransparency
			local v2 = nil
			
			if type(list1) == "table" and #list1 >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v2 = list1[1] * (1 - ClampedValue) + list1[2] * ClampedValue
			else
				v2 = 0
			end
			IconTransparencyFunction(v2)
			local IconSizeFunction: (any) -> () = Bindings.iconSize
			local v3 = nil
			
			if type(list) == "table" and #list >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v3 = list[1] * (1 - ClampedValue) + list[2] * ClampedValue
			else
				v3 = 0
			end
			IconSizeFunction(v3)
			local InfoFrameTransparencyFunction: (any) -> () = Bindings.infoFrameTransparency
			local v4 = nil
			
			if type(list2) == "table" and #list2 >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v4 = list2[1] * (1 - ClampedValue) + list2[2] * ClampedValue
			else
				v4 = 0
			end
			InfoFrameTransparencyFunction(v4)
			local ThumbnailTransparencyFunction: (any) -> () = Bindings.thumbnailTransparency
			local v5 = nil
			
			if type(list1) == "table" and #list1 >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v5 = list1[1] * (1 - ClampedValue) + list1[2] * ClampedValue
			else
				v5 = 0
			end
			ThumbnailTransparencyFunction(v5)
			local PlaceTextTransparencyFunction: (any) -> () = Bindings.placeTextTransparency
			local v6 = nil
			
			if type(list1) == "table" and #list1 >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v6 = list1[1] * (1 - ClampedValue) + list1[2] * ClampedValue
			else
				v6 = 0
			end
			PlaceTextTransparencyFunction(v6)
			local PlaceTextSizeFunction: (any) -> () = Bindings.placeTextSize
			local v7 = nil
			
			if type(list) == "table" and #list >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v7 = list[1] * (1 - ClampedValue) + list[2] * ClampedValue
			else
				v7 = 0
			end
			PlaceTextSizeFunction(v7)
			local CreatorTextTransparencyFunction: (any) -> () = Bindings.creatorTextTransparency
			local v8 = nil
			
			if type(list1) == "table" and #list1 >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v8 = list1[1] * (1 - ClampedValue) + list1[2] * ClampedValue
			else
				v8 = 0
			end
			CreatorTextTransparencyFunction(v8)
			local CreatorTextSizeFunction: (any) -> () = Bindings.creatorTextSize
			local v9 = nil
			
			if type(list) == "table" and #list >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v9 = list[1] * (1 - ClampedValue) + list[2] * ClampedValue
			else
				v9 = 0
			end
			CreatorTextSizeFunction(v9)
		end,
		FadeOut = function(p1: number, _, Bindings, Callback: () -> ())
			-- upvalues: RunService (copy)
			local list = { 1, 0.6 }
			local list1 = { 0, 1 }
			local list2 = { 0.2, 1 }
			
			if p1 > 0.6 then
				RunService:SetRobloxGuiFocused(false)
				Bindings.iconTransparency(if type(list1) == "table" and #list1 >= 2 then list1[1] * 0 + list1[2] * 1 else 0)
				Bindings.iconSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
				Bindings.infoFrameTransparency(if type(list2) == "table" and #list2 >= 2 then list2[1] * 0 + list2[2] * 1 else 0)
				Bindings.thumbnailTransparency(if type(list1) == "table" and #list1 >= 2 then list1[1] * 0 + list1[2] * 1 else 0)
				Bindings.placeTextTransparency(if type(list1) == "table" and #list1 >= 2 then list1[1] * 0 + list1[2] * 1 else 0)
				Bindings.placeTextSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
				Bindings.creatorTextTransparency(if type(list1) == "table" and #list1 >= 2 then list1[1] * 0 + list1[2] * 1 else 0)
				Bindings.creatorTextSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
				Callback()
				
				return
			end
			local Value = p1 / 0.6
			local IconTransparencyFunction: (any) -> () = Bindings.iconTransparency
			local v2 = nil
			
			if type(list1) == "table" and #list1 >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v2 = list1[1] * (1 - ClampedValue) + list1[2] * ClampedValue
			else
				v2 = 0
			end
			IconTransparencyFunction(v2)
			local IconSizeFunction: (any) -> () = Bindings.iconSize
			local v3 = nil
			
			if type(list) == "table" and #list >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v3 = list[1] * (1 - ClampedValue) + list[2] * ClampedValue
			else
				v3 = 0
			end
			IconSizeFunction(v3)
			local InfoFrameTransparencyFunction: (any) -> () = Bindings.infoFrameTransparency
			local v4 = nil
			
			if type(list2) == "table" and #list2 >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v4 = list2[1] * (1 - ClampedValue) + list2[2] * ClampedValue
			else
				v4 = 0
			end
			InfoFrameTransparencyFunction(v4)
			local ThumbnailTransparencyFunction: (any) -> () = Bindings.thumbnailTransparency
			local v5 = nil
			
			if type(list1) == "table" and #list1 >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v5 = list1[1] * (1 - ClampedValue) + list1[2] * ClampedValue
			else
				v5 = 0
			end
			ThumbnailTransparencyFunction(v5)
			local PlaceTextTransparencyFunction: (any) -> () = Bindings.placeTextTransparency
			local v6 = nil
			
			if type(list1) == "table" and #list1 >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v6 = list1[1] * (1 - ClampedValue) + list1[2] * ClampedValue
			else
				v6 = 0
			end
			PlaceTextTransparencyFunction(v6)
			local PlaceTextSizeFunction: (any) -> () = Bindings.placeTextSize
			local v7 = nil
			
			if type(list) == "table" and #list >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v7 = list[1] * (1 - ClampedValue) + list[2] * ClampedValue
			else
				v7 = 0
			end
			PlaceTextSizeFunction(v7)
			local CreatorTextTransparencyFunction: (any) -> () = Bindings.creatorTextTransparency
			local v8 = nil
			
			if type(list1) == "table" and #list1 >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v8 = list1[1] * (1 - ClampedValue) + list1[2] * ClampedValue
			else
				v8 = 0
			end
			CreatorTextTransparencyFunction(v8)
			local CreatorTextSizeFunction: (any) -> () = Bindings.creatorTextSize
			local v9 = nil
			
			if type(list) == "table" and #list >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v9 = list[1] * (1 - ClampedValue) + list[2] * ClampedValue
			else
				v9 = 0
			end
			CreatorTextSizeFunction(v9)
		end
	}
	
	local _ = function()
		-- upvalues: InputBeganConnection (ref), GuiService (copy)
		if InputBeganConnection then
			InputBeganConnection:disconnect()
			InputBeganConnection = nil
			GuiService:CloseStatsBasedOnInputString("ConnectionHealth")
		end
	end
	
	local LoadingScreen = RoactModule.Component:extend("LoadingScreen")
	
	function LoadingScreen.playAnimation(p1, AnimationFunction, p2, Callback)
		-- upvalues: RunService (copy)
		p1.animationStartTime = tick()
		p1.animationFunction = AnimationFunction
		
		if not p1.renderSteppedConnection then
			p1.renderSteppedConnection = RunService.RenderStepped:Connect(function()
				-- upvalues: p1 (copy), p2 (copy), Callback (copy)
				p1.animationFunction(tick() - p1.animationStartTime, p2, p1.updateBindings, function()
					-- upvalues: p1 (upval), Callback (upval)
					p1:stopAnimation()
					
					if Callback then
						Callback()
					end
				end)
			end)
		end
	end
	
	function LoadingScreen.stopAnimation(p1)
		if p1.renderSteppedConnection then
			p1.renderSteppedConnection:Disconnect()
			p1.renderSteppedConnection = nil
		end
	end
	
	function LoadingScreen.renderBackground(p1, p2)
		-- upvalues: RoactModule (copy), DisplayOrder (ref), ExternalEventConnection (copy), RunService (copy)
		return RoactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			DisplayOrder = DisplayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			RoactModule.createElement("Frame", {
				Name = "BackgroundFrame",
				[RoactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChange,
				BackgroundColor3 = p2.Theme.BackgroundUIDefault.Color,
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Active = true
			}, {
				ThumbnailImage = RoactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Image = if p1.props.placeId and p1.props.placeId > 0 then ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(p1.props.placeId) else "",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(p1.state.thumbnailPositionX, 0.5),
					Size = UDim2.fromOffset(p1.state.thumbnailScaledWidth, p1.state.thumbnailScaledHeight),
					ImageTransparency = p1.bindings.thumbnailTransparency
				}),
				renderStepped = not p2.Settings.ReducedMotion and RoactModule.createElement(ExternalEventConnection, {
					event = RunService.renderStepped,
					callback = p1.renderBackgroundSteppedCallback
				})
			})
		})
	end
	
	function LoadingScreen:showConnnectionHealthDebugMenu(_)
		-- upvalues: v1 (ref), CurrentTime (ref), IsPlatformMatch (copy), GuiService (copy)
		if v1 == 0 then
			v1 = 1
			CurrentTime = tick()
			
			return
		end
		if IsPlatformMatch and tick() - CurrentTime <= 0.5 then
			GuiService:ShowStatsBasedOnInputString("ConnectionHealth")
		end
		v1 = 0
		CurrentTime = 1e999
	end
	
	function LoadingScreen.renderPlaceIcon(p1, p2)
		-- upvalues: RoactModule (copy), _Color3 (copy), ExternalEventConnection (copy), RunService (copy)
		local ShimPos = p1.state.shimPos
		local Value: number = p1.bindings.iconTransparency:getValue()
		local RbxthumbName: string = if p1.props.universeId and p1.props.universeId > 0 then ("rbxthumb://type=GameIcon&id=%d&w=256&h=256"):format(p1.props.universeId) else ""
		local CreateElementFunction = RoactModule.createElement
		local v2 = "Frame"
		local config = {
			Name = "IconFrame",
			BorderSizePixel = 0,
			Active = true,
			BackgroundTransparency = p1.bindings.iconTransparency,
			BackgroundColor3 = _Color3,
			Size = p1.bindings.iconSize,
			Position = UDim2.fromScale(0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}
		local t = {}
		local NoReducedMotion = not p2.Settings.ReducedMotion
		
		if NoReducedMotion then
			local CreateElementFunction2 = RoactModule.createElement
			local v3 = "Frame"
			local config1 = {
				BackgroundTransparency = 0,
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Color3.new(1, 1, 1)
			}
			local config2 = { Corner = RoactModule.createElement("UICorner") }
			local CreateElementFunction1 = RoactModule.createElement
			local v4 = "UIGradient"
			local config3 = {
				Rotation = 25,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.new(0.5, 0.5, 0.5)),
					ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
					ColorSequenceKeypoint.new(1, Color3.new(0.5, 0.5, 0.5))
				})
			}
			local NewFunction = NumberSequence.new
			local t1 = {}
			local NewFunction2 = NumberSequenceKeypoint.new
			local v5 = 0
			local list = { 0.7, 1 }
			local v6 = nil
			
			if type(list) == "table" and #list >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v6 = list[1] * (1 - ClampedValue) + list[2] * ClampedValue
			else
				v6 = 0
			end
			local NewResult = NewFunction2(v5, v6)
			local NewFunction3 = NumberSequenceKeypoint.new
			local v7 = 0.5
			local list1 = { 0.3, 1 }
			local v8 = nil
			
			if type(list1) == "table" and #list1 >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				v8 = list1[1] * (1 - ClampedValue) + list1[2] * ClampedValue
			else
				v8 = 0
			end
			local NewResult1 = NewFunction3(v7, v8)
			local NewFunction1 = NumberSequenceKeypoint.new
			local v9 = 1
			local list2 = { 0.7, 1 }
			local NewClampedValue = nil
			
			if type(list2) == "table" and #list2 >= 2 then
				local ClampedValue = math.clamp(Value, 0, 1)
				NewClampedValue = list2[1] * (1 - ClampedValue) + list2[2] * ClampedValue
			else
				NewClampedValue = 0
			end
			SETLIST_FALLBACK(t1, 1, NewResult, NewResult1, NewFunction1(v9, NewClampedValue))
			config3.Transparency = NewFunction(t1)
			config3.Offset = Vector2.new(ShimPos, 0)
			config2.Gradient = CreateElementFunction1(v4, config3)
			config2.renderStepped = RoactModule.createElement(ExternalEventConnection, {
				event = RunService.renderStepped,
				callback = p1.renderShimmerCallback
			})
			NoReducedMotion = CreateElementFunction2(v3, config1, config2)
		end
		t.LoadingOverlay = NoReducedMotion
		t.GameIconImage = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = RbxthumbName,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1),
			ImageTransparency = p1.bindings.iconTransparency
		}, { Corner = RoactModule.createElement("UICorner") })
		t.Corner = RoactModule.createElement("UICorner")
		
		return CreateElementFunction(v2, config, t)
	end
	
	function LoadingScreen.renderInfoFrame(p1, p2)
		-- upvalues: VerifiedBadgesModule (copy), list (copy), RoactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), IsPlatformMatch (copy)
		local ProductInfo = p1.props.productInfo
		local Name = ProductInfo and ProductInfo.Name or ""
		local Name1 = ProductInfo and ProductInfo.Creator.Name or ""
		
		if ProductInfo and ProductInfo.Creator.HasVerifiedBadge then
			Name1 = VerifiedBadgesModule.appendVerifiedBadge(Name1)
		end
		return RoactModule.createElement("Frame", {
			Name = "InfoFrame",
			BackgroundColor3 = p2.Theme.BackgroundMuted.Color,
			BackgroundTransparency = p1.bindings.infoFrameTransparency,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = p1.isPortrait and UDim2.fromScale(1, 0) or UDim2.fromScale(0.6, 0),
			Active = true,
			[RoactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: p1 (copy)
				p1.updateBindings.updateInfoFrameAbsoluteSize(Frame.AbsoluteSize)
			end
		}, {
			PlaceIcon = p1:renderPlaceIcon(p2),
			TextLayoutFrame = RoactModule.createElement("Frame", {
				Name = "TextLayout",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Active = true,
				BackgroundColor3 = p2.Theme.BackgroundMuted.Color,
				AnchorPoint = Vector2.new(0.5, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.new(0.5, 0, 0, math.clamp(math.max(p1.state.absoluteSize.X, p1.state.absoluteSize.Y) / 1024 * list[1], list[1], list[2]) / 2),
				Size = UDim2.fromScale(1, 0)
			}, {
				PlaceLabel = RoactModule.createElement("TextLabel", {
					Name = "PlaceLabel",
					BackgroundTransparency = 1,
					TextScaled = false,
					TextWrapped = true,
					TextStrokeTransparency = 1,
					ZIndex = 2,
					LayoutOrder = 1,
					RichText = false,
					TextTransparency = p1.bindings.placeTextTransparency,
					Size = UDim2.fromScale(0.8, 0),
					AnchorPoint = Vector2.new(0.5, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Font = if FoundationFontFaceMigration then nil else p2.Font.Title.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.HeadingLarge.Font) else nil,
					TextSize = p1.bindings.placeTextSize,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					Text = Name,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextTruncate = Enum.TextTruncate.AtEnd
				}),
				CreatorLabel = RoactModule.createElement("TextLabel", {
					Name = "CreatorLabel",
					BackgroundTransparency = 1,
					TextWrapped = true,
					TextScaled = false,
					TextStrokeTransparency = 1,
					ZIndex = 2,
					LayoutOrder = 2,
					RichText = false,
					TextTransparency = p1.bindings.creatorTextTransparency,
					Size = UDim2.fromScale(0.6, 0),
					AnchorPoint = Vector2.new(0.5, 1),
					AutomaticSize = Enum.AutomaticSize.Y,
					Font = if FoundationFontFaceMigration then nil else p2.Font.CaptionBody.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodySmall.Font) else nil,
					TextSize = p1.bindings.creatorTextSize,
					TextColor3 = p2.Theme.TextDefault.Color,
					Text = Name1,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextTruncate = Enum.TextTruncate.AtEnd
				}),
				UIListLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, if IsPlatformMatch then 12 else 36)
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, if IsPlatformMatch then 12 else 36),
					PaddingBottom = UDim.new(0, if IsPlatformMatch then 12 else 36)
				})
			}),
			Corner = RoactModule.createElement("UICorner")
		})
	end
	
	function LoadingScreen.renderMain(p1, p2)
		-- upvalues: IsPlatformMatch (copy), config (copy), IsTenFootInterface (copy), RoactModule (copy), DisplayOrder (ref), Loading (copy), IconSize (copy)
		local IsPortrait = p1.isPortrait
		local MOBILEPORTRAIT = if IsPlatformMatch then IsPortrait and config.MOBILE_PORTRAIT or config.MOBILE_LANDSCAPE elseif IsTenFootInterface then config.CONSOLE else config.DESKTOP
		
		return RoactModule.createElement("ScreenGui", {
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = true,
			DisplayOrder = DisplayOrder + 1,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			DarkGradient = RoactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, {
				Gradient = RoactModule.createElement("UIGradient", {
					Rotation = 90,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
						ColorSequenceKeypoint.new(0.5, Color3.new(0, 0, 0)),
						ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.5, 1),
						NumberSequenceKeypoint.new(1, 0.5)
					})
				}),
				Spinner = p2.Settings.ReducedMotion and RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 20,
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = Color3.new(1, 1, 1)
				}, {
					RoactModule.createElement(Loading, {
						size = IconSize.Medium,
						Position = UDim2.new(1, 0, 1, 0),
						AnchorPoint = Vector2.new(1, 1)
					})
				}),
				infoFrame = p1:renderInfoFrame(p2),
				AutoTranslate = p1:renderAutoTranslate(),
				serverFrame = if p1.isQueueTreatmentEnabled then nil else p1:renderServerFrame(p2),
				policyContainer = if p1.isQueueTreatmentEnabled then p1:renderPolicyContainer() else nil,
				serverStatusContainer = if p1.isQueueTreatmentEnabled then p1:renderServerStatus() else nil,
				closeBtn = p1:renderCloseBtn(p2),
				gamepadCancelBtn = p1:renderGamepadCancelBtn(p2),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, MOBILEPORTRAIT.LEFT),
					PaddingRight = UDim.new(0, MOBILEPORTRAIT.RIGHT),
					PaddingTop = UDim.new(0, MOBILEPORTRAIT.TOP),
					PaddingBottom = UDim.new(0, MOBILEPORTRAIT.BOTTOM)
				})
			})
		})
	end
	
	function LoadingScreen.renderCloseBtn(p1, _)
		-- upvalues: ResponsiveModule (copy), RoactModule (copy), GetFFlagReportFirstExperienceCancelledModule (copy), LoggingProtocolModule (copy)
		if p1.props.preferredInputRef.current ~= ResponsiveModule.Input.Directional and not p1.state.showCloseBtn and tick() - p1.startTime > 5 then
			p1:setState({ showCloseBtn = true })
		end
		return p1.state.showCloseBtn and RoactModule.createElement("ImageButton", {
			Name = "CloseButton",
			Image = "rbxasset://textures/loading/cancelButton.png",
			ImageTransparency = 0,
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.fromOffset(if p1.isQueueTreatmentEnabled then 32 else 32, if p1.isQueueTreatmentEnabled then 32 else 32),
			Active = false,
			ZIndex = 10,
			[RoactModule.Event.MouseButton1Click] = function()
				-- upvalues: GetFFlagReportFirstExperienceCancelledModule (upval), LoggingProtocolModule (upval)
				if GetFFlagReportFirstExperienceCancelledModule then
					LoggingProtocolModule.default:logEventOnce("first_experience_cancelled")
				end
				game:Shutdown()
			end
		})
	end
	
	function LoadingScreen.renderServerFrame(p1, p2)
		-- upvalues: IsTenFootInterface (copy), RoactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), NewResult (copy), CoreGui (copy)
		local TextSize: number = if IsTenFootInterface then 16 else 12
		local TextSize1: number = if IsTenFootInterface then 16 else 12
		
		return RoactModule.createElement("Frame", {
			Name = "ServerFrame",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = true,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.fromScale(0.5, 1),
			Size = UDim2.new(1, -48, 0.2, 0)
		}, {
			PolicyLabel = p1.props.isSubjectToChinaPolicies and RoactModule.createElement("TextLabel", {
				Name = "PolicyLabel",
				BackgroundTransparency = 1,
				TextWrapped = true,
				TextScaled = false,
				TextStrokeTransparency = 1,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 0, 2 * TextSize1),
				Position = UDim2.new(0, 0, 1, -4 * TextSize - 2 * TextSize1),
				Font = if FoundationFontFaceMigration then nil else p2.Font.Footer.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.CaptionSmall.Font) else nil,
				TextSize = TextSize1,
				TextColor3 = p2.Theme.TextDefault.Color,
				Text = NewResult:Format("Authentication.Login.WeChat.AntiAddictionText"),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center
			}),
			JoinServerLabel = RoactModule.createElement("TextLabel", {
				Name = "JoinText",
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 4 * TextSize),
				Position = UDim2.new(0, 0, 1, -2 * TextSize),
				Font = if FoundationFontFaceMigration then nil else p2.Font.Footer.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.CaptionSmall.Font) else nil,
				TextSize = TextSize,
				TextWrapped = true,
				TextScaled = false,
				TextColor3 = p2.Theme.TextDefault.Color,
				TextStrokeTransparency = 1,
				Text = p1.state.serverStatusText,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				ZIndex = 2,
				RootLocalizationTable = CoreGui.CoreScriptLocalization,
				[RoactModule.Event.InputBegan] = if p1.props.isSubjectToChinaPolicies then nil else p1.showConnnectionHealthDebugMenu or nil
			})
		})
	end
	
	function LoadingScreen.renderGamepadCancelBtn(p1, p2)
		-- upvalues: ResponsiveModule (copy), RoactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), NewResult (copy)
		return p1.props.preferredInputRef.current == ResponsiveModule.Input.Directional and (not p1.state.gamepadCancelPressed and RoactModule.createElement("Frame", {
			Name = "GamepadCancelFrame",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = true,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			Size = UDim2.fromOffset(150, 48)
		}, {
			CancelIcon = RoactModule.createElement("ImageLabel", {
				Name = "GamepadCancel",
				Image = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png",
				BackgroundTransparency = 1,
				Active = false,
				ZIndex = 10,
				LayoutOrder = 0,
				Size = UDim2.fromOffset(24, 24)
			}),
			CancelLabel = RoactModule.createElement("TextLabel", {
				Name = "CancelText",
				BackgroundTransparency = 1,
				TextSize = 24,
				TextWrapped = true,
				TextStrokeTransparency = 1,
				ZIndex = 2,
				LayoutOrder = 1,
				Size = UDim2.fromScale(1, 1),
				Font = if FoundationFontFaceMigration then nil else p2.Font.SubHeader1.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.TitleLarge.Font) else nil,
				TextColor3 = p2.Theme.TextEmphasis.Color,
				Text = NewResult:Format("CoreScripts.TopBar.Back"),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			}),
			UIListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 5)
			})
		}))
	end
	
	function LoadingScreen.init(p1)
		-- upvalues: _Vector2 (copy), IsTenFootInterface (copy), QueueExperimentation (copy), ContextActionService (copy), config1 (copy), RoactModule (copy), list (copy), IsPlatformMatch (copy), GuiService (copy)
		p1.thumbnailMoveSpd = 0.05
		p1.fadeinComplete = false
		p1.isPortrait = false
		p1.startTime = tick()
		p1.numberOfTaps = 0
		p1.lastTapTime = 1e999
		p1:setState({
			visible = true,
			thumbnailPositionX = 0.5,
			shimPos = 0,
			serverStatusText = "",
			showCloseBtn = false,
			gamepadCancelPressed = false,
			absoluteSize = Vector2.new(0, 0),
			thumbnailScaledWidth = _Vector2.x,
			thumbnailScaledHeight = _Vector2.y,
			showTenFootCancelBtn = IsTenFootInterface
		})
		p1.isQueueTreatmentEnabled = if QueueExperimentation.getIsJoinNewServerButtonEnabled() then p1.props.placeId > 0 else QueueExperimentation.getIsAutoJoinNewServerEnabled() and p1.props.placeId > 0
		
		function p1.onAbsoluteSizeChange(Frame: Frame)
			-- upvalues: p1 (copy)
			p1:setState({ absoluteSize = Frame.AbsoluteSize })
			p1.isPortrait = Frame.AbsoluteSize.X < Frame.AbsoluteSize.Y
			p1.updateBindings.iconSize(1)
		end
		
		game.Loaded:Connect(function()
			-- upvalues: IsTenFootInterface (upval), ContextActionService (upval), p1 (copy), config1 (upval)
			if IsTenFootInterface then
				ContextActionService:UnbindCoreAction("CancelGameLoad")
			end
			while not p1.fadeinComplete do
				wait()
			end
			p1:stopAnimation()
			p1:playAnimation(config1.FadeOut, {}, function()
				-- upvalues: p1 (upval)
				p1:setState({ visible = false })
			end)
		end)
		local Binding, Binding2 = RoactModule.createBinding(1)
		local Binding1, Binding2_1 = RoactModule.createBinding(1)
		local Binding3, Binding2_2 = RoactModule.createBinding(0)
		local Binding4, Binding2_3 = RoactModule.createBinding(1)
		local Binding5, Binding2_4 = RoactModule.createBinding(0)
		local Binding6, Binding2_5 = RoactModule.createBinding(1)
		local Binding7, Binding2_6 = RoactModule.createBinding(0)
		local Binding8, Binding2_7 = RoactModule.createBinding(1)
		local Binding9, Binding2_8 = RoactModule.createBinding(Vector2.new(0, 0))
		p1.bindings = {
			thumbnailTransparency = Binding,
			iconTransparency = Binding1,
			iconSize = Binding3:map(function(p2): UDim2
				-- upvalues: p1 (copy), list (upval)
				local ClampedValue = math.clamp(math.max(p1.state.absoluteSize.X, p1.state.absoluteSize.Y) / 1024 * list[1], list[1], list[2])
				
				return UDim2.fromOffset(ClampedValue * p2, ClampedValue * p2)
			end),
			placeTextTransparency = Binding4,
			placeTextSize = Binding5:map(function(p2)
				-- upvalues: IsPlatformMatch (upval)
				return (if IsPlatformMatch then 20 else 36) * p2
			end),
			creatorTextTransparency = Binding6,
			creatorTextSize = Binding7:map(function(p2: number): number
				return 20 * p2
			end),
			infoFrameTransparency = Binding8,
			infoFrameAbsoluteSize = Binding9
		}
		p1.updateBindings = {
			thumbnailTransparency = Binding2,
			iconTransparency = Binding2_1,
			iconSize = Binding2_2,
			placeTextTransparency = Binding2_3,
			placeTextSize = Binding2_4,
			creatorTextTransparency = Binding2_5,
			creatorTextSize = Binding2_6,
			infoFrameTransparency = Binding2_7,
			updateInfoFrameAbsoluteSize = Binding2_8
		}
		
		function p1.renderBackgroundSteppedCallback(p2)
			-- upvalues: p1 (copy), _Vector2 (upval)
			local AbsoluteSize = p1.state.absoluteSize
			local ScaledX = AbsoluteSize.x * 1.5
			local ScaledScaledX = ScaledX / _Vector2.x * _Vector2.y
			
			if ScaledScaledX < AbsoluteSize.y then
				ScaledX = AbsoluteSize.y / _Vector2.y * _Vector2.x
				ScaledScaledX = AbsoluteSize.y
			end
			local ScaledXRatio = ScaledX / AbsoluteSize.x / 2
			local Largest = math.max(ScaledXRatio, 1 - ScaledXRatio)
			local Smallest = math.min(ScaledXRatio, 1 - ScaledXRatio)
			local NewThumbnailPositionX = p1.state.thumbnailPositionX + p1.thumbnailMoveSpd * p2
			
			if Largest <= NewThumbnailPositionX or NewThumbnailPositionX <= Smallest then
				p1.thumbnailMoveSpd = -p1.thumbnailMoveSpd
				NewThumbnailPositionX = math.clamp(NewThumbnailPositionX, Smallest, Largest)
			end
			p1:setState({
				thumbnailPositionX = NewThumbnailPositionX,
				thumbnailScaledHeight = ScaledScaledX,
				thumbnailScaledWidth = ScaledX
			})
		end
		
		function p1.renderShimmerCallback(p2: number)
			-- upvalues: p1 (copy)
			local NewShimPos = p1.state.shimPos + p2 * 1
			
			if NewShimPos > 1 then
				NewShimPos = -1
			end
			p1:setState({ shimPos = NewShimPos })
		end
		
		if GuiService:GetUiMessage() ~= "" then
			p1:setState({ serverStatusText = GuiService:GetUiMessage() })
		end
		GuiService.UiMessageChanged:Connect(function(MsgType, ServerStatusText)
			-- upvalues: p1 (copy)
			if MsgType == Enum.UiMessageType.UiMessageInfo then
				p1:setState({ serverStatusText = ServerStatusText })
			end
		end)
		local Flag = false
		ContextActionService:BindCoreAction("CancelGameLoad", function(_, UserInputState, _)
			-- upvalues: Flag (ref), p1 (copy), ContextActionService (upval)
			if UserInputState == Enum.UserInputState.Begin then
				Flag = true
				
				return
			end
			if UserInputState == Enum.UserInputState.End and Flag then
				p1:setState({ showTenFootCancelBtn = false })
				p1:setState({ gamepadCancelPressed = true })
				ContextActionService:UnbindCoreAction("CancelGameLoad")
				
				if not game:IsLoaded() then
					game:Shutdown()
				end
			end
		end, false, Enum.KeyCode.ButtonB)
	end
	
	function LoadingScreen.renderAutoTranslate(p2)
		-- upvalues: LoadingScreenTelemetryModule (copy), RoactModule (copy), AutoTranslateBadge (copy)
		if p2.props.universeId <= 0 then
			LoadingScreenTelemetryModule.countAutoTranslateZeroUniverseId()
			
			return nil
		else
			return RoactModule.createElement(AutoTranslateBadge, {
				universeId = p2.props.universeId,
				positionBinding = p2.bindings.infoFrameAbsoluteSize,
				transparencyBinding = p2.bindings.infoFrameTransparency
			})
		end
	end
	
	function LoadingScreen.renderPolicyContainer(p2)
		-- upvalues: ReactModule (copy), PolicyContainer (copy)
		return if p2.props.isSubjectToChinaPolicies then ReactModule.createElement(PolicyContainer, { position = UDim2.new(0, 0, 0, 32) }) else nil
	end
	
	function LoadingScreen.renderServerStatus(p2)
		-- upvalues: QueueExperimentation (copy), RoactModule (copy), ServerStatusWithCountdown (copy), ServerStatus (copy)
		return if QueueExperimentation.getIsAutoJoinNewServerEnabled() then RoactModule.createElement(ServerStatusWithCountdown, {
			anchorPoint = Vector2.new(0.5, 1),
			isSubjectToChinaPolicies = p2.props.isSubjectToChinaPolicies,
			placeId = p2.props.placeId,
			position = UDim2.fromScale(0.5, 1),
			size = UDim2.fromScale(1, 0.2),
			universeId = p2.props.universeId
		}) elseif QueueExperimentation.getIsJoinNewServerButtonEnabled() then RoactModule.createElement(ServerStatus, {
			anchorPoint = Vector2.new(0.5, 1),
			isSubjectToChinaPolicies = p2.props.isSubjectToChinaPolicies,
			placeId = p2.props.placeId,
			position = UDim2.fromScale(0.5, 1),
			size = UDim2.fromScale(1, 0.2),
			universeId = p2.props.universeId
		}) else nil
	end
	
	function LoadingScreen.renderMainWithProviders(p2, p3)
		-- upvalues: RoactModule (copy), FoundationProvider (copy), FoundationModule (copy), LocalizationProvider (copy), NewResult (copy)
		return RoactModule.createElement(FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			RoactModule.createElement(LocalizationProvider, { localization = NewResult }, p2:renderMain(p3))
		})
	end
	
	function LoadingScreen.render(p2)
		-- upvalues: WithStyleFunction (copy), RoactModule (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: p2 (copy), RoactModule (upval)
			return p2.state.visible and RoactModule.createElement("Folder", {}, {
				BackgroundScreen = p2:renderBackground(p3),
				MainScreen = p2:renderMainWithProviders(p3)
			})
		end)
	end
	
	function LoadingScreen:willUpdate(_, _) end
	
	function LoadingScreen.didMount(p2)
		-- upvalues: RunService (copy), config1 (copy), QueueExperimentation (copy), ExperienceService (copy), PlaceLauncherState (copy)
		RunService:SetRobloxGuiFocused(true)
		p2.props.fetchUniverseId(p2.props.placeId)
		p2.props.fetchGameProductInfo(p2.props.placeId)
		p2.props.fetchSubjectToChinaPolicies()
		p2:playAnimation(config1.FadeIn, {}, function()
			-- upvalues: p2 (copy)
			p2.fadeinComplete = true
		end)
		
		if QueueExperimentation.isInExperiment() and ExperienceService:GetFollowUserId() > 0 and p2.props.placeId > 0 then
			if ExperienceService:GetPlaceJoinState() == PlaceLauncherState.Queued then
				QueueExperimentation.logExposure()
				
				return
			end
			p2.placeJoinStateConnection = ExperienceService.PlaceJoinStateChanged:Connect(function(Queued)
				-- upvalues: PlaceLauncherState (upval), QueueExperimentation (upval)
				if Queued == PlaceLauncherState.Queued then
					QueueExperimentation.logExposure()
				end
			end)
		end
	end
	
	function LoadingScreen.willUnmount(p2)
		-- upvalues: ContextActionService (copy), RunService (copy), InputBeganConnection (ref), UserInputService (copy), GuiService (copy), QueueExperimentation (copy)
		ContextActionService:UnbindCoreAction("CancelGameLoad")
		RunService:SetRobloxGuiFocused(false)
		
		if not InputBeganConnection then
			InputBeganConnection = UserInputService.InputBegan:Connect(function()
				-- upvalues: InputBeganConnection (upval), GuiService (upval)
				if InputBeganConnection then
					InputBeganConnection:disconnect()
					InputBeganConnection = nil
					GuiService:CloseStatsBasedOnInputString("ConnectionHealth")
				end
			end)
		end
		if QueueExperimentation.isInExperiment() and p2.placeJoinStateConnection then
			p2.placeJoinStateConnection:Disconnect()
			p2.placeJoinStateConnection = nil
		end
	end
	
	local v2 = RoactRoduxModule.connect(function(p2, p3)
		return {
			productInfo = p2.productInfo,
			isSubjectToChinaPolicies = p2.isSubjectToChinaPolicies,
			placeId = p2.gameIds and p2.gameIds.placeId or p3.placeId,
			universeId = p2.gameIds and p2.gameIds.universeId or 0,
			settings = p2.settings
		}
	end, function(Callback)
		-- upvalues: GetGameProductInfoModule (copy), GetIsSubjectToChinaPoliciesModule (copy), GetUniverseIdModule (copy), CreateNetworking (copy)
		return {
			fetchGameProductInfo = function(p2)
				-- upvalues: Callback (copy), GetGameProductInfoModule (upval)
				Callback(GetGameProductInfoModule(p2))
			end,
			fetchSubjectToChinaPolicies = function()
				-- upvalues: Callback (copy), GetIsSubjectToChinaPoliciesModule (upval)
				Callback(GetIsSubjectToChinaPoliciesModule())
			end,
			fetchUniverseId = function(p2)
				-- upvalues: Callback (copy), GetUniverseIdModule (upval), CreateNetworking (upval)
				Callback(GetUniverseIdModule(CreateNetworking, p2))
			end
		}
	end)(LoadingScreen)
	
	return function(p2)
		-- upvalues: ReactModule (copy), ResponsiveModule (copy), v2 (ref), CryoModule (copy)
		local UseRefResult = ReactModule.useRef(nil)
		UseRefResult.current = ResponsiveModule.usePreferredInput()
		
		return ReactModule.createElement(v2, CryoModule.Dictionary.join(p2, { preferredInputRef = UseRefResult }))
	end
end