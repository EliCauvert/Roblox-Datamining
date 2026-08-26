local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")

if require(experienceLoadingScript.Flags.FFlagUseSharedLoadingScreenView) then
	return require(experienceLoadingScript.LoadingScreenWrapper)
end
local parent = experienceLoadingScript.Parent
local contextActionService = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local experienceService = game:GetService("ExperienceService")
local guiService = game:GetService("GuiService")
local localizationService = game:GetService("LocalizationService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local externalEventConnection = require(parent.RoactUtils).ExternalEventConnection
local getGameProductInfoModule = require(experienceLoadingScript.Thunks.GetGameProductInfo)
local getIsSubjectToChinaPoliciesModule = require(experienceLoadingScript.Thunks.GetIsSubjectToChinaPolicies)
local getUniverseIdModule = require(experienceLoadingScript.Thunks.GetUniverseId)
local progressLoadingModule = require(parent.ProgressLoading)
local placeLauncherState = progressLoadingModule.PlaceLauncherState
local verifiedBadgesModule = require(parent.VerifiedBadges)
local loggingProtocolModule = require(parent.LoggingProtocol)
local fFlagIncreaseLoadingScreenOrder = require(parent.SharedFlags).FFlagIncreaseLoadingScreenOrder
local withStyle = require(parent.UIBlox).Style.withStyle
local responsiveModule = require(parent.Responsive)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local foundationProvider = foundationModule.FoundationProvider
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local autoTranslateBadge = progressLoadingModule.AutoTranslateBadge
local loadingScreenTelemetryModule = require(parent.ProgressLoading.LoadingScreenTelemetry)
local policyContainer = progressLoadingModule.PolicyContainer
local serverStatus = progressLoadingModule.ServerStatus
local serverStatusWithCountdown = progressLoadingModule.ServerStatusWithCountdown
local var1 = localization.new(localizationService.RobloxLocaleId)
local queueExperimentation = require(parent.SocialExperiments).QueueExperimentation
local getFFlagReportFirstExperienceCancelledModule = require(experienceLoadingScript.Flags.GetFFlagReportFirstExperienceCancelled)
local createNetworking = progressLoadingModule.createNetworking
local var2 = if fFlagIncreaseLoadingScreenOrder then 8 else 7
local vector2 = Vector2.new(768, 432)
local color = Color3.fromRGB(101, 102, 104)
local t = {
	MOBILE_PORTRAIT = { TOP = 44, BOTTOM = 44, LEFT = 24, RIGHT = 24 },
	MOBILE_LANDSCAPE = { TOP = 24, BOTTOM = 24, LEFT = 44, RIGHT = 44 },
	DESKTOP = { TOP = 24, BOTTOM = 24, LEFT = 24, RIGHT = 24 },
	CONSOLE = { TOP = 64, BOTTOM = 64, LEFT = 64, RIGHT = 64 }
}
local var3 = guiService:IsTenFootInterface()
local platform = userInputService:GetPlatform()
local var4 = if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true
local list = { 150, 256 }
local var5 = nil
local var6 = 0
local var7 = 1e999

local function _(p1)
	-- upvalues: var4 (ref), t (ref), var3 (ref)
	return if var4 then if p1 then t.MOBILE_PORTRAIT else t.MOBILE_LANDSCAPE elseif var3 then t.CONSOLE else t.DESKTOP
end

local _ = function(startValue, endValue)
	if type(startValue) == "table" and #startValue >= 2 then
		local clampedValue = math.clamp(endValue, 0, 1)
		
		return startValue[1] * (1 - clampedValue) + startValue[2] * clampedValue
	end
	return 0
end

local t_1 = {
	FadeIn = function(p1, _, p2, p3)
		local list = { 1, 1 }
		local list_1 = { 1, 0 }
		local list_2 = { 1, 0.2 }
		
		if p1 <= 0.6 then
			local var8
			local var9 = p1 / 0.6
			local iconTransparency = p2.iconTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var8 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var8 = 0
			end
			local var10
			iconTransparency(var8)
			local iconSize = p2.iconSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var10 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var10 = 0
			end
			local var11
			iconSize(var10)
			local infoFrameTransparency = p2.infoFrameTransparency
			
			if type(list_2) == "table" and #list_2 >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var11 = list_2[1] * (1 - clampedValue) + list_2[2] * clampedValue
			else
				var11 = 0
			end
			local var12
			infoFrameTransparency(var11)
			local thumbnailTransparency = p2.thumbnailTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var12 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var12 = 0
			end
			local var13
			thumbnailTransparency(var12)
			local placeTextTransparency = p2.placeTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var13 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var13 = 0
			end
			local var14
			placeTextTransparency(var13)
			local placeTextSize = p2.placeTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var14 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var14 = 0
			end
			local var15
			placeTextSize(var14)
			local creatorTextTransparency = p2.creatorTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var15 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var15 = 0
			end
			local var16
			creatorTextTransparency(var15)
			local creatorTextSize = p2.creatorTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var16 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var16 = 0
			end
			creatorTextSize(var16)
			
			return
		else
			p2.iconTransparency(if type(list_1) == "table" and #list_1 >= 2 then list_1[1] * 0 + list_1[2] * 1 else 0)
			p2.iconSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
			p2.infoFrameTransparency(if type(list_2) == "table" and #list_2 >= 2 then list_2[1] * 0 + list_2[2] * 1 else 0)
			p2.thumbnailTransparency(if type(list_1) == "table" and #list_1 >= 2 then list_1[1] * 0 + list_1[2] * 1 else 0)
			p2.placeTextTransparency(if type(list_1) == "table" and #list_1 >= 2 then list_1[1] * 0 + list_1[2] * 1 else 0)
			p2.placeTextSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
			p2.creatorTextTransparency(if type(list_1) == "table" and #list_1 >= 2 then list_1[1] * 0 + list_1[2] * 1 else 0)
			p2.creatorTextSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
			p3()
		end
	end,
	FadeOut = function(p1, _, p2, p3)
		-- upvalues: runService (ref)
		local list = { 1, 0.6 }
		local list_1 = { 0, 1 }
		local list_2 = { 0.2, 1 }
		
		if p1 <= 0.6 then
			local var8
			local var9 = p1 / 0.6
			local iconTransparency = p2.iconTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var8 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var8 = 0
			end
			local var10
			iconTransparency(var8)
			local iconSize = p2.iconSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var10 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var10 = 0
			end
			local var11
			iconSize(var10)
			local infoFrameTransparency = p2.infoFrameTransparency
			
			if type(list_2) == "table" and #list_2 >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var11 = list_2[1] * (1 - clampedValue) + list_2[2] * clampedValue
			else
				var11 = 0
			end
			local var12
			infoFrameTransparency(var11)
			local thumbnailTransparency = p2.thumbnailTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var12 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var12 = 0
			end
			local var13
			thumbnailTransparency(var12)
			local placeTextTransparency = p2.placeTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var13 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var13 = 0
			end
			local var14
			placeTextTransparency(var13)
			local placeTextSize = p2.placeTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var14 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var14 = 0
			end
			local var15
			placeTextSize(var14)
			local creatorTextTransparency = p2.creatorTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var15 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var15 = 0
			end
			local var16
			creatorTextTransparency(var15)
			local creatorTextSize = p2.creatorTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var9, 0, 1)
				var16 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var16 = 0
			end
			creatorTextSize(var16)
			
			return
		else
			runService:SetRobloxGuiFocused(false)
			p2.iconTransparency(if type(list_1) == "table" and #list_1 >= 2 then list_1[1] * 0 + list_1[2] * 1 else 0)
			p2.iconSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
			p2.infoFrameTransparency(if type(list_2) == "table" and #list_2 >= 2 then list_2[1] * 0 + list_2[2] * 1 else 0)
			p2.thumbnailTransparency(if type(list_1) == "table" and #list_1 >= 2 then list_1[1] * 0 + list_1[2] * 1 else 0)
			p2.placeTextTransparency(if type(list_1) == "table" and #list_1 >= 2 then list_1[1] * 0 + list_1[2] * 1 else 0)
			p2.placeTextSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
			p2.creatorTextTransparency(if type(list_1) == "table" and #list_1 >= 2 then list_1[1] * 0 + list_1[2] * 1 else 0)
			p2.creatorTextSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
			p3()
		end
	end
}

local _ = function()
	-- upvalues: var5 (write), guiService (ref)
	if var5 then
		var5:disconnect()
		var5 = nil
		guiService:CloseStatsBasedOnInputString("ConnectionHealth")
	end
end

local loadingScreen = roactModule.Component:extend("LoadingScreen")

function loadingScreen.playAnimation(p1, p2, p3, p4)
	-- upvalues: runService (ref)
	p1.animationStartTime = tick()
	p1.animationFunction = p2
	
	if not p1.renderSteppedConnection then
		p1.renderSteppedConnection = runService.RenderStepped:Connect(function()
			-- upvalues: p1 (ref), p3 (ref), p4 (ref)
			p1.animationFunction(tick() - p1.animationStartTime, p3, p1.updateBindings, function()
				-- upvalues: p1 (copy), p4 (copy)
				p1:stopAnimation()
				
				if p4 then
					p4()
				end
			end)
		end)
	end
end

function loadingScreen.stopAnimation(p1)
	if p1.renderSteppedConnection then
		p1.renderSteppedConnection:Disconnect()
		p1.renderSteppedConnection = nil
	end
end

function loadingScreen.renderBackground(value, p1)
	-- upvalues: roactModule (ref), var2 (write), externalEventConnection (ref), runService (ref)
	return roactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = var2,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		roactModule.createElement("Frame", {
			Name = "BackgroundFrame",
			[roactModule.Change.AbsoluteSize] = value.onAbsoluteSizeChange,
			BackgroundColor3 = p1.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Active = true
		}, {
			ThumbnailImage = roactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = if value.props.placeId and value.props.placeId > 0 then ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(value.props.placeId) else "",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(value.state.thumbnailPositionX, 0.5),
				Size = UDim2.fromOffset(value.state.thumbnailScaledWidth, value.state.thumbnailScaledHeight),
				ImageTransparency = value.bindings.thumbnailTransparency
			}),
			renderStepped = not p1.Settings.ReducedMotion and roactModule.createElement(externalEventConnection, {
				event = runService.renderStepped,
				callback = value.renderBackgroundSteppedCallback
			})
		})
	})
end

function loadingScreen.showConnnectionHealthDebugMenu(_, _)
	-- upvalues: var6 (write), var7 (write), var4 (ref), guiService (ref)
	if var6 == 0 then
		var6 = 1
		var7 = tick()
		
		return
	elseif var4 and tick() - var7 <= 0.5 then
		guiService:ShowStatsBasedOnInputString("ConnectionHealth")
	end
	var6 = 0
	var7 = 1e999
end

function loadingScreen.renderPlaceIcon(p1, p2)
	-- upvalues: roactModule (ref), color (ref), externalEventConnection (ref), runService (ref)
	local shimPos = p1.state.shimPos
	local value = p1.bindings.iconTransparency:getValue()
	local var8 = if p1.props.universeId and p1.props.universeId > 0 then ("rbxthumb://type=GameIcon&id=%d&w=256&h=256"):format(p1.props.universeId) else ""
	local reducedMotion = p2.Settings.ReducedMotion
	local createElement = roactModule.createElement
	local var9 = "Frame"
	local t = {
		Name = "IconFrame",
		BorderSizePixel = 0,
		Active = true,
		BackgroundTransparency = p1.bindings.iconTransparency,
		BackgroundColor3 = color,
		Size = p1.bindings.iconSize,
		Position = UDim2.fromScale(0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}
	local t_1 = {}
	local var10 = not reducedMotion
	
	if var10 then
		local var11
		var10 = roactModule.createElement
		local var12 = "Frame"
		local t_2 = {
			BackgroundTransparency = 0,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}
		local t_3 = { Corner = roactModule.createElement("UICorner") }
		local createElement_1 = roactModule.createElement
		local var13 = "UIGradient"
		local t_4 = {
			Rotation = 25,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(0.5, 0.5, 0.5)),
				ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
				ColorSequenceKeypoint.new(1, Color3.new(0.5, 0.5, 0.5))
			})
		}
		local new = NumberSequence.new
		local t_5 = {}
		local new_1 = NumberSequenceKeypoint.new
		local var14 = 0
		local list = { 0.7, 1 }
		
		if type(list) == "table" and #list >= 2 then
			local clampedValue = math.clamp(value, 0, 1)
			var11 = list[1] * (1 - clampedValue) + list[2] * clampedValue
		else
			var11 = 0
		end
		new_1 = new_1(var14, var11)
		local new_2 = NumberSequenceKeypoint.new
		local var15 = 0.5
		local list_1 = { 0.3, 1 }
		
		if type(list_1) == "table" and #list_1 >= 2 then
			local clampedValue = math.clamp(value, 0, 1)
			list = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
		else
			list = 0
		end
		new_2 = new_2(var15, list)
		local new_3 = NumberSequenceKeypoint.new
		list = 1
		local list_2 = { 0.7, 1 }
		
		if type(list_2) == "table" and #list_2 >= 2 then
			local clampedValue = math.clamp(value, 0, 1)
			list_1 = list_2[1] * (1 - clampedValue) + list_2[2] * clampedValue
		else
			list_1 = 0
		end
		-- Unknown statement at pc 0: <SetList>
		t_4.Transparency = new(t_5)
		t_4.Offset = Vector2.new(shimPos, 0)
		t_3.Gradient = createElement_1(var13, t_4)
		t_3.renderStepped = roactModule.createElement(externalEventConnection, {
			event = runService.renderStepped,
			callback = p1.renderShimmerCallback
		})
		var10 = var10(var12, t_2, t_3)
	end
	t_1.LoadingOverlay = var10
	t_1.GameIconImage = roactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = var8,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		ImageTransparency = p1.bindings.iconTransparency
	}, { Corner = roactModule.createElement("UICorner") })
	t_1.Corner = roactModule.createElement("UICorner")
	
	return createElement(var9, t, t_1)
end

function loadingScreen.renderInfoFrame(p1, p2)
	-- upvalues: verifiedBadgesModule (ref), list (ref), roactModule (ref), var4 (ref)
	local productInfo = p1.props.productInfo
	local var8 = if productInfo then productInfo.Name else ""
	local var9 = if productInfo then productInfo.Creator.Name else ""
	
	if productInfo and productInfo.Creator.HasVerifiedBadge then
		var9 = verifiedBadgesModule.appendVerifiedBadge(var9)
	end
	return roactModule.createElement("Frame", {
		Name = "InfoFrame",
		BackgroundColor3 = p2.Theme.BackgroundMuted.Color,
		BackgroundTransparency = p1.bindings.infoFrameTransparency,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = p1.isPortrait and UDim2.fromScale(1, 0) or UDim2.fromScale(0.6, 0),
		Active = true,
		[roactModule.Change.AbsoluteSize] = function(p3)
			-- upvalues: p1 (ref)
			p1.updateBindings.updateInfoFrameAbsoluteSize(p3.AbsoluteSize)
		end
	}, {
		PlaceIcon = p1:renderPlaceIcon(p2),
		TextLayoutFrame = roactModule.createElement("Frame", {
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
			PlaceLabel = roactModule.createElement("TextLabel", {
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
				Font = p2.Font.Title.Font,
				TextSize = p1.bindings.placeTextSize,
				TextColor3 = p2.Theme.TextEmphasis.Color,
				Text = var8,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			CreatorLabel = roactModule.createElement("TextLabel", {
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
				Font = p2.Font.CaptionBody.Font,
				TextSize = p1.bindings.creatorTextSize,
				TextColor3 = p2.Theme.TextDefault.Color,
				Text = var9,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			UIListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, if var4 then 12 else 36)
			}),
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, if var4 then 12 else 36),
				PaddingBottom = UDim.new(0, if var4 then 12 else 36)
			})
		}),
		Corner = roactModule.createElement("UICorner")
	})
end

function loadingScreen.renderMain(p1, p2)
	-- upvalues: var4 (ref), t (ref), var3 (ref), roactModule (ref), var2 (write), loading (ref), iconSize (ref)
	local var8 = if var4 then if p1.isPortrait then t.MOBILE_PORTRAIT else t.MOBILE_LANDSCAPE elseif var3 then t.CONSOLE else t.DESKTOP
	
	return roactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		DisplayOrder = var2 + 1,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		DarkGradient = roactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			Gradient = roactModule.createElement("UIGradient", {
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
			Spinner = p2.Settings.ReducedMotion and roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 20,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Color3.new(1, 1, 1)
			}, {
				roactModule.createElement(loading, {
					size = iconSize.Medium,
					Position = UDim2.new(1, 0, 1, 0),
					AnchorPoint = Vector2.new(1, 1)
				})
			}),
			infoFrame = p1:renderInfoFrame(p2),
			AutoTranslate = p1:renderAutoTranslate(),
			serverFrame = if not p1.isQueueTreatmentEnabled then p1:renderServerFrame(p2) else nil,
			policyContainer = if p1.isQueueTreatmentEnabled then p1:renderPolicyContainer() else nil,
			serverStatusContainer = if p1.isQueueTreatmentEnabled then p1:renderServerStatus() else nil,
			closeBtn = p1:renderCloseBtn(p2),
			gamepadCancelBtn = p1:renderGamepadCancelBtn(p2),
			Padding = roactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var8.LEFT),
				PaddingRight = UDim.new(0, var8.RIGHT),
				PaddingTop = UDim.new(0, var8.TOP),
				PaddingBottom = UDim.new(0, var8.BOTTOM)
			})
		})
	})
end

function loadingScreen.renderCloseBtn(p1, _)
	-- upvalues: responsiveModule (ref), roactModule (ref), getFFlagReportFirstExperienceCancelledModule (ref), loggingProtocolModule (ref)
	if p1.props.preferredInputRef.current ~= responsiveModule.Input.Directional and not p1.state.showCloseBtn and tick() - p1.startTime > 5 then
		p1:setState({ showCloseBtn = true })
	end
	return p1.state.showCloseBtn and roactModule.createElement("ImageButton", {
		Name = "CloseButton",
		Image = "rbxasset://textures/loading/cancelButton.png",
		ImageTransparency = 0,
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.fromOffset(if p1.isQueueTreatmentEnabled then 32 else 32, if p1.isQueueTreatmentEnabled then 32 else 32),
		Active = false,
		ZIndex = 10,
		[roactModule.Event.MouseButton1Click] = function()
			-- upvalues: getFFlagReportFirstExperienceCancelledModule (copy), loggingProtocolModule (copy)
			if getFFlagReportFirstExperienceCancelledModule then
				loggingProtocolModule.default:logEventOnce("first_experience_cancelled")
			end
			game:Shutdown()
		end
	})
end

function loadingScreen.renderServerFrame(p1, p2)
	-- upvalues: var3 (ref), roactModule (ref), var1 (ref), coreGuiService (ref)
	local serverStatusText = p1.state.serverStatusText
	local isSubjectToChinaPolicies = p1.props.isSubjectToChinaPolicies
	local var8 = if var3 then 16 else 12
	local var9 = if var3 then 16 else 12
	
	return roactModule.createElement("Frame", {
		Name = "ServerFrame",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.fromScale(0.5, 1),
		Size = UDim2.new(1, -48, 0.2, 0)
	}, {
		PolicyLabel = isSubjectToChinaPolicies and roactModule.createElement("TextLabel", {
			Name = "PolicyLabel",
			BackgroundTransparency = 1,
			TextWrapped = true,
			TextScaled = false,
			TextStrokeTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, 2 * var9),
			Position = UDim2.new(0, 0, 1, -4 * var8 - 2 * var9),
			Font = p2.Font.Footer.Font,
			TextSize = var9,
			TextColor3 = p2.Theme.TextDefault.Color,
			Text = var1:Format("Authentication.Login.WeChat.AntiAddictionText"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		JoinServerLabel = roactModule.createElement("TextLabel", {
			Name = "JoinText",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 4 * var8),
			Position = UDim2.new(0, 0, 1, -2 * var8),
			Font = p2.Font.Footer.Font,
			TextSize = var8,
			TextWrapped = true,
			TextScaled = false,
			TextColor3 = p2.Theme.TextDefault.Color,
			TextStrokeTransparency = 1,
			Text = serverStatusText,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 2,
			RootLocalizationTable = coreGuiService.CoreScriptLocalization,
			[roactModule.Event.InputBegan] = if not p1.props.isSubjectToChinaPolicies then p1.showConnnectionHealthDebugMenu else nil
		})
	})
end

function loadingScreen.renderGamepadCancelBtn(p1, p2)
	-- upvalues: responsiveModule (ref), roactModule (ref), var1 (ref)
	return p1.props.preferredInputRef.current == responsiveModule.Input.Directional and (not p1.state.gamepadCancelPressed and roactModule.createElement("Frame", {
		Name = "GamepadCancelFrame",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = true,
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1),
		Size = UDim2.fromOffset(150, 48)
	}, {
		CancelIcon = roactModule.createElement("ImageLabel", {
			Name = "GamepadCancel",
			Image = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png",
			BackgroundTransparency = 1,
			Active = false,
			ZIndex = 10,
			LayoutOrder = 0,
			Size = UDim2.fromOffset(24, 24)
		}),
		CancelLabel = roactModule.createElement("TextLabel", {
			Name = "CancelText",
			BackgroundTransparency = 1,
			TextSize = 24,
			TextWrapped = true,
			TextStrokeTransparency = 1,
			ZIndex = 2,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1),
			Font = p2.Font.SubHeader1.Font,
			TextColor3 = p2.Theme.TextEmphasis.Color,
			Text = var1:Format("CoreScripts.TopBar.Back"),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		UIListLayout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 5)
		})
	}))
end

function loadingScreen.init(p1)
	-- upvalues: vector2 (ref), var3 (ref), queueExperimentation (ref), contextActionService (ref), t_1 (ref), roactModule (ref), list (ref), var4 (ref), guiService (ref)
	local var8
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
		thumbnailScaledWidth = vector2.x,
		thumbnailScaledHeight = vector2.y,
		showTenFootCancelBtn = var3
	})
	
	if not queueExperimentation.getIsJoinNewServerButtonEnabled() then
		var8 = queueExperimentation.getIsAutoJoinNewServerEnabled() and p1.props.placeId > 0
	end
	p1.isQueueTreatmentEnabled = var8
	
	function p25.onAbsoluteSizeChange(p2)
		-- upvalues: p1 (ref)
		p1:setState({ absoluteSize = p2.AbsoluteSize })
		p1.isPortrait = p2.AbsoluteSize.X < p2.AbsoluteSize.Y
		p1.updateBindings.iconSize(1)
	end
	
	game.Loaded:Connect(function()
		-- upvalues: var3 (copy), contextActionService (copy), p1 (ref), t_1 (copy)
		if var3 then
			contextActionService:UnbindCoreAction("CancelGameLoad")
		end
		while not p1.fadeinComplete do
			wait()
		end
		p1:stopAnimation()
		p1:playAnimation(t_1.FadeOut, {}, function()
			-- upvalues: p1 (copy)
			p1:setState({ visible = false })
		end)
	end)
	local var9, var10 = roactModule.createBinding(1)
	local var11, var12 = roactModule.createBinding(1)
	local var13, var14 = roactModule.createBinding(0)
	local var15, var16 = roactModule.createBinding(1)
	local var17, var18 = roactModule.createBinding(0)
	local var19, var20 = roactModule.createBinding(1)
	local var21, var22 = roactModule.createBinding(0)
	local var23, var24 = roactModule.createBinding(1)
	local var25, var26 = roactModule.createBinding(Vector2.new(0, 0))
	p1.bindings = {
		thumbnailTransparency = var9,
		iconTransparency = var11,
		iconSize = var13:map(function(p2)
			-- upvalues: p1 (ref), list (copy)
			local clampedValue = math.clamp(math.max(p1.state.absoluteSize.X, p1.state.absoluteSize.Y) / 1024 * list[1], list[1], list[2])
			
			return UDim2.fromOffset(clampedValue * p2, clampedValue * p2)
		end),
		placeTextTransparency = var15,
		placeTextSize = var17:map(function(p2)
			-- upvalues: var4 (copy)
			return (if var4 then 20 else 36) * p2
		end),
		creatorTextTransparency = var19,
		creatorTextSize = var21:map(function(p2)
			return 20 * p2
		end),
		infoFrameTransparency = var23,
		infoFrameAbsoluteSize = var25
	}
	p1.updateBindings = {
		thumbnailTransparency = var10,
		iconTransparency = var12,
		iconSize = var14,
		placeTextTransparency = var16,
		placeTextSize = var18,
		creatorTextTransparency = var20,
		creatorTextSize = var22,
		infoFrameTransparency = var24,
		updateInfoFrameAbsoluteSize = var26
	}
	
	function p25.renderBackgroundSteppedCallback(p2)
		-- upvalues: p1 (ref), vector2 (copy)
		local absoluteSize = p1.state.absoluteSize
		local var27 = absoluteSize.x * 1.5
		local var28 = var27 / vector2.x * vector2.y
		
		if var28 < absoluteSize.y then
			var27 = absoluteSize.y / vector2.y * vector2.x
			var28 = absoluteSize.y
		end
		local var29 = var27 / absoluteSize.x / 2
		local maxValue = math.max(var29, 1 - var29)
		local minValue = math.min(var29, 1 - var29)
		local var30 = p1.state.thumbnailPositionX + p1.thumbnailMoveSpd * p2
		
		if maxValue <= var30 or var30 <= minValue then
			p1.thumbnailMoveSpd = -p1.thumbnailMoveSpd
			var30 = math.clamp(var30, minValue, maxValue)
		end
		p1:setState({
			thumbnailPositionX = var30,
			thumbnailScaledHeight = var28,
			thumbnailScaledWidth = var27
		})
	end
	
	function p25.renderShimmerCallback(p2)
		-- upvalues: p1 (ref)
		local var27 = p1.state.shimPos + p2 * 1
		
		if var27 > 1 then
			var27 = -1
		end
		p1:setState({ shimPos = var27 })
	end
	
	if guiService:GetUiMessage() ~= "" then
		p1:setState({ serverStatusText = guiService:GetUiMessage() })
	end
	guiService.UiMessageChanged:Connect(function(p2, p3)
		-- upvalues: p1 (ref)
		if p2 == Enum.UiMessageType.UiMessageInfo then
			p1:setState({ serverStatusText = p3 })
		end
	end)
	local var27 = false
	contextActionService:BindCoreAction("CancelGameLoad", function(_, p2, _)
		-- upvalues: var27 (write), p1 (ref), contextActionService (copy)
		if p2 == Enum.UserInputState.Begin then
			var27 = true
			
			return
		elseif p2 == Enum.UserInputState.End and var27 then
			p1:setState({ showTenFootCancelBtn = false })
			p1:setState({ gamepadCancelPressed = true })
			contextActionService:UnbindCoreAction("CancelGameLoad")
			
			if not game:IsLoaded() then
				game:Shutdown()
			end
		end
	end, false, Enum.KeyCode.ButtonB)
end

function loadingScreen.renderAutoTranslate(p2)
	-- upvalues: loadingScreenTelemetryModule (ref), roactModule (ref), autoTranslateBadge (ref)
	if p2.props.universeId <= 0 then
		loadingScreenTelemetryModule.countAutoTranslateZeroUniverseId()
		
		return nil
	end
	return roactModule.createElement(autoTranslateBadge, {
		universeId = p2.props.universeId,
		positionBinding = p2.bindings.infoFrameAbsoluteSize,
		transparencyBinding = p2.bindings.infoFrameTransparency
	})
end

function loadingScreen.renderPolicyContainer(p2)
	-- upvalues: reactModule (ref), policyContainer (ref)
	return if p2.props.isSubjectToChinaPolicies then reactModule.createElement(policyContainer, { position = UDim2.new(0, 0, 0, 32) }) else nil
end

function loadingScreen.renderServerStatus(p2)
	-- upvalues: queueExperimentation (ref), roactModule (ref), serverStatusWithCountdown (ref), serverStatus (ref)
	return if queueExperimentation.getIsAutoJoinNewServerEnabled() then roactModule.createElement(serverStatusWithCountdown, {
		anchorPoint = Vector2.new(0.5, 1),
		isSubjectToChinaPolicies = p2.props.isSubjectToChinaPolicies,
		placeId = p2.props.placeId,
		position = UDim2.fromScale(0.5, 1),
		size = UDim2.fromScale(1, 0.2),
		universeId = p2.props.universeId
	}) elseif queueExperimentation.getIsJoinNewServerButtonEnabled() then roactModule.createElement(serverStatus, {
		anchorPoint = Vector2.new(0.5, 1),
		isSubjectToChinaPolicies = p2.props.isSubjectToChinaPolicies,
		placeId = p2.props.placeId,
		position = UDim2.fromScale(0.5, 1),
		size = UDim2.fromScale(1, 0.2),
		universeId = p2.props.universeId
	}) else nil
end

function loadingScreen.renderMainWithProviders(p2, p3)
	-- upvalues: roactModule (ref), foundationProvider (ref), foundationModule (ref), localizationProvider (ref), var1 (ref)
	return roactModule.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
		roactModule.createElement(localizationProvider, { localization = var1 }, p2:renderMain(p3))
	})
end

function loadingScreen.render(p2)
	-- upvalues: withStyle (ref), roactModule (ref)
	return withStyle(function(p3)
		-- upvalues: p2 (ref), roactModule (copy)
		return p2.state.visible and roactModule.createElement("Folder", {}, {
			BackgroundScreen = p2:renderBackground(p3),
			MainScreen = p2:renderMainWithProviders(p3)
		})
	end)
end

function loadingScreen.willUpdate(_, _, _) end

function loadingScreen.didMount(p2)
	-- upvalues: runService (ref), t_1 (ref), queueExperimentation (ref), experienceService (ref), placeLauncherState (ref)
	runService:SetRobloxGuiFocused(true)
	p2.props.fetchUniverseId(p2.props.placeId)
	p2.props.fetchGameProductInfo(p2.props.placeId)
	p2.props.fetchSubjectToChinaPolicies()
	p2:playAnimation(t_1.FadeIn, {}, function()
		-- upvalues: p2 (ref)
		p2.fadeinComplete = true
	end)
	
	if queueExperimentation.isInExperiment() and experienceService:GetFollowUserId() > 0 and p2.props.placeId > 0 then
		if experienceService:GetPlaceJoinState() == placeLauncherState.Queued then
			queueExperimentation.logExposure()
			
			return
		end
		p2.placeJoinStateConnection = experienceService.PlaceJoinStateChanged:Connect(function(p3)
			-- upvalues: placeLauncherState (copy), queueExperimentation (copy)
			if p3 == placeLauncherState.Queued then
				queueExperimentation.logExposure()
			end
		end)
	end
end

function loadingScreen.willUnmount(p2)
	-- upvalues: contextActionService (ref), runService (ref), var5 (write), userInputService (ref), guiService (ref), queueExperimentation (ref)
	contextActionService:UnbindCoreAction("CancelGameLoad")
	runService:SetRobloxGuiFocused(false)
	
	if not var5 then
		var5 = userInputService.InputBegan:Connect(function()
			-- upvalues: var5 (copy), guiService (copy)
			if var5 then
				var5:disconnect()
				var5 = nil
				guiService:CloseStatsBasedOnInputString("ConnectionHealth")
			end
		end)
	end
	if queueExperimentation.isInExperiment() and p2.placeJoinStateConnection then
		p2.placeJoinStateConnection:Disconnect()
		p2.placeJoinStateConnection = nil
	end
end

loadingScreen = roactRoduxModule.connect(function(p2, p3)
	return {
		productInfo = p2.productInfo,
		isSubjectToChinaPolicies = p2.isSubjectToChinaPolicies,
		placeId = if p2.gameIds then p2.gameIds.placeId else p3.placeId,
		universeId = if p2.gameIds then p2.gameIds.universeId else 0,
		settings = p2.settings
	}
end, function(p2)
	-- upvalues: getGameProductInfoModule (ref), getIsSubjectToChinaPoliciesModule (ref), getUniverseIdModule (ref), createNetworking (ref)
	return {
		fetchGameProductInfo = function(p3)
			-- upvalues: p2 (ref), getGameProductInfoModule (copy)
			p2(getGameProductInfoModule(p3))
		end,
		fetchSubjectToChinaPolicies = function()
			-- upvalues: p2 (ref), getIsSubjectToChinaPoliciesModule (copy)
			p2(getIsSubjectToChinaPoliciesModule())
		end,
		fetchUniverseId = function(p3)
			-- upvalues: p2 (ref), getUniverseIdModule (copy), createNetworking (copy)
			p2(getUniverseIdModule(createNetworking, p3))
		end
	}
end)(loadingScreen)

return function(p2)
	-- upvalues: reactModule (ref), responsiveModule (ref), loadingScreen (write), cryoModule (ref)
	local var9 = reactModule.useRef(nil)
	var9.current = responsiveModule.usePreferredInput()
	
	return reactModule.createElement(loadingScreen, cryoModule.Dictionary.join(p2, { preferredInputRef = var9 }))
end