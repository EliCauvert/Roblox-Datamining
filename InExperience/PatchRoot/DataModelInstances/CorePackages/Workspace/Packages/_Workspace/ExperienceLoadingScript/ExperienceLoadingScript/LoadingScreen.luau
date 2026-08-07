local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local parent = experienceLoadingScript.Parent
local contextActionService = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local experienceService = game:GetService("ExperienceService")
local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local localizationService = game:GetService("LocalizationService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local inGameMenuDependenciesModule = require(parent.InGameMenuDependencies)
local cryo = inGameMenuDependenciesModule.Cryo
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local externalEventConnection = require(parent.RoactUtils).ExternalEventConnection
local getGameProductInfoModule = require(experienceLoadingScript.Thunks.GetGameProductInfo)
local getIsSubjectToChinaPoliciesModule = require(experienceLoadingScript.Thunks.GetIsSubjectToChinaPolicies)
local getUniverseIdModule = require(experienceLoadingScript.Thunks.GetUniverseId)
local placeLauncherStateModule = require(experienceLoadingScript.Enums.PlaceLauncherState)
local verifiedBadgesModule = require(parent.VerifiedBadges)
local loggingProtocolModule = require(parent.LoggingProtocol)
local UIBloxModule = require(parent.UIBlox)
local fFlagIncreaseLoadingScreenOrder = require(parent.SharedFlags).FFlagIncreaseLoadingScreenOrder
local fFlagAddAutoTranslateToLoadingScreen = require(parent.SharedFlags).FFlagAddAutoTranslateToLoadingScreen
local fFlagAutoTranslateSkipZeroUniverseId = require(parent.SharedFlags).FFlagAutoTranslateSkipZeroUniverseId
local withStyle = UIBloxModule.Style.withStyle
local responsiveModule = require(parent.Responsive)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local foundationProvider = foundationModule.FoundationProvider
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local autoTranslateBadgeModule = require(experienceLoadingScript.Components.AutoTranslateBadge)
local loadingScreenTelemetryModule = require(parent.ProgressLoading.LoadingScreenTelemetry)
local policyContainerModule = require(experienceLoadingScript.Components.PolicyContainer)
local serverStatusModule = require(experienceLoadingScript.Components.ServerStatus)
local serverStatusWithCountdownModule = require(experienceLoadingScript.Components.ServerStatusWithCountdown)
local var25 = localization.new(localizationService.RobloxLocaleId)
local requestInternalWrapper = require(parent.Http).NetworkLayers.requestInternalWrapper
local queueExperimentation = require(parent.SocialExperiments).QueueExperimentation
local getFFlagReportFirstExperienceCancelledModule = require(experienceLoadingScript.Flags.GetFFlagReportFirstExperienceCancelled)
local var27 = if fFlagAddAutoTranslateToLoadingScreen then require(experienceLoadingScript.createNetworking) else requestInternalWrapper(httpService)
local var28 = if fFlagIncreaseLoadingScreenOrder then 8 else 7
local vector2 = Vector2.new(768, 432)
local color = Color3.fromRGB(101, 102, 104)
local t = {
	MOBILE_PORTRAIT = { TOP = 44, BOTTOM = 44, LEFT = 24, RIGHT = 24 },
	MOBILE_LANDSCAPE = { TOP = 24, BOTTOM = 24, LEFT = 44, RIGHT = 44 },
	DESKTOP = { TOP = 24, BOTTOM = 24, LEFT = 24, RIGHT = 24 },
	CONSOLE = { TOP = 64, BOTTOM = 64, LEFT = 64, RIGHT = 64 }
}
local var32 = guiService:IsTenFootInterface()
local platform = userInputService:GetPlatform()
local var34 = if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true
local list = { 150, 256 }
local var36 = nil
local var37 = 0
local var38 = 1e999

local function _(p0) --[[ line: 101 | named "getPadding" ]]
	-- upvalues: var34 (ref), t (ref), var32 (ref)
	return if var34 then if p0 then t.MOBILE_PORTRAIT else t.MOBILE_LANDSCAPE elseif var32 then t.CONSOLE else t.DESKTOP
end

local _ = function(startValue, endValue) --[[ line: 111 | named "lerp" ]]
	if type(startValue) == "table" and #startValue >= 2 then
		local clampedValue = math.clamp(endValue, 0, 1)
		
		return startValue[1] * (1 - clampedValue) + startValue[2] * clampedValue
	end
	return 0
end

local t_1 = {
	FadeIn = function(p1, _, p2, p3) --[[ line: 120 ]]
		local list = { 1, 1 }
		local list_1 = { 1, 0 }
		local list_2 = { 1, 0.2 }
		
		if p1 <= 0.6 then
			local var46
			local var45 = p1 / 0.6
			local iconTransparency = p2.iconTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var45, 0, 1)
				var46 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var46 = 0
			end
			local var48
			iconTransparency(var46)
			local iconSize = p2.iconSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var45, 0, 1)
				var48 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var48 = 0
			end
			local var50
			iconSize(var48)
			local infoFrameTransparency = p2.infoFrameTransparency
			
			if type(list_2) == "table" and #list_2 >= 2 then
				local clampedValue = math.clamp(var45, 0, 1)
				var50 = list_2[1] * (1 - clampedValue) + list_2[2] * clampedValue
			else
				var50 = 0
			end
			local var52
			infoFrameTransparency(var50)
			local thumbnailTransparency = p2.thumbnailTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var45, 0, 1)
				var52 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var52 = 0
			end
			local var54
			thumbnailTransparency(var52)
			local placeTextTransparency = p2.placeTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var45, 0, 1)
				var54 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var54 = 0
			end
			local var56
			placeTextTransparency(var54)
			local placeTextSize = p2.placeTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var45, 0, 1)
				var56 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var56 = 0
			end
			local var58
			placeTextSize(var56)
			local creatorTextTransparency = p2.creatorTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var45, 0, 1)
				var58 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var58 = 0
			end
			local var60
			creatorTextTransparency(var58)
			local creatorTextSize = p2.creatorTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var45, 0, 1)
				var60 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var60 = 0
			end
			creatorTextSize(var60)
			
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
	FadeOut = function(p4, _, p5, p6) --[[ line: 149 ]]
		-- upvalues: runService (ref)
		local list = { 1, 0.6 }
		local list_1 = { 0, 1 }
		local list_2 = { 0.2, 1 }
		
		if p4 <= 0.6 then
			local var66
			local var65 = p4 / 0.6
			local iconTransparency = p5.iconTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var65, 0, 1)
				var66 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var66 = 0
			end
			local var68
			iconTransparency(var66)
			local iconSize = p5.iconSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var65, 0, 1)
				var68 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var68 = 0
			end
			local var70
			iconSize(var68)
			local infoFrameTransparency = p5.infoFrameTransparency
			
			if type(list_2) == "table" and #list_2 >= 2 then
				local clampedValue = math.clamp(var65, 0, 1)
				var70 = list_2[1] * (1 - clampedValue) + list_2[2] * clampedValue
			else
				var70 = 0
			end
			local var72
			infoFrameTransparency(var70)
			local thumbnailTransparency = p5.thumbnailTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var65, 0, 1)
				var72 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var72 = 0
			end
			local var74
			thumbnailTransparency(var72)
			local placeTextTransparency = p5.placeTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var65, 0, 1)
				var74 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var74 = 0
			end
			local var76
			placeTextTransparency(var74)
			local placeTextSize = p5.placeTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var65, 0, 1)
				var76 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var76 = 0
			end
			local var78
			placeTextSize(var76)
			local creatorTextTransparency = p5.creatorTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var65, 0, 1)
				var78 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var78 = 0
			end
			local var80
			creatorTextTransparency(var78)
			local creatorTextSize = p5.creatorTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var65, 0, 1)
				var80 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var80 = 0
			end
			creatorTextSize(var80)
			
			return
		else
			runService:SetRobloxGuiFocused(false)
			p5.iconTransparency(if type(list_1) == "table" and #list_1 >= 2 then list_1[1] * 0 + list_1[2] * 1 else 0)
			p5.iconSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
			p5.infoFrameTransparency(if type(list_2) == "table" and #list_2 >= 2 then list_2[1] * 0 + list_2[2] * 1 else 0)
			p5.thumbnailTransparency(if type(list_1) == "table" and #list_1 >= 2 then list_1[1] * 0 + list_1[2] * 1 else 0)
			p5.placeTextTransparency(if type(list_1) == "table" and #list_1 >= 2 then list_1[1] * 0 + list_1[2] * 1 else 0)
			p5.placeTextSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
			p5.creatorTextTransparency(if type(list_1) == "table" and #list_1 >= 2 then list_1[1] * 0 + list_1[2] * 1 else 0)
			p5.creatorTextSize(if type(list) == "table" and #list >= 2 then list[1] * 0 + list[2] * 1 else 0)
			p6()
		end
	end
}

local _ = function() --[[ line: 182 | named "disconnectAndCloseHealthStat" ]]
	-- upvalues: var36 (write), guiService (ref)
	if var36 then
		var36:disconnect()
		var36 = nil
		guiService:CloseStatsBasedOnInputString("ConnectionHealth")
	end
end

local loadingScreen = roact.Component:extend("LoadingScreen")

function loadingScreen.playAnimation(p7, p8, p9, p10) --[[ line: 193 ]]
	-- upvalues: runService (ref)
	p7.animationStartTime = tick()
	p7.animationFunction = p8
	
	if not p7.renderSteppedConnection then
		p7.renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 198 ]]
			-- upvalues: p7 (ref), p9 (ref), p10 (ref)
			p7.animationFunction(tick() - p7.animationStartTime, p9, p7.updateBindings, function() --[[ line: 199 ]]
				-- upvalues: p7 (copy), p10 (copy)
				p7:stopAnimation()
				
				if p10 then
					p10()
				end
			end)
		end)
	end
end

function loadingScreen.stopAnimation(p11) --[[ line: 209 ]]
	if p11.renderSteppedConnection then
		p11.renderSteppedConnection:Disconnect()
		p11.renderSteppedConnection = nil
	end
end

function loadingScreen.renderBackground(value, p12) --[[ line: 216 ]]
	-- upvalues: roact (ref), var28 (write), externalEventConnection (ref), runService (ref)
	return roact.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = var28,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		roact.createElement("Frame", {
			Name = "BackgroundFrame",
			[roact.Change.AbsoluteSize] = value.onAbsoluteSizeChange,
			BackgroundColor3 = p12.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Active = true
		}, {
			ThumbnailImage = roact.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = if value.props.placeId and value.props.placeId > 0 then ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(value.props.placeId) else "",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(value.state.thumbnailPositionX, 0.5),
				Size = UDim2.fromOffset(value.state.thumbnailScaledWidth, value.state.thumbnailScaledHeight),
				ImageTransparency = value.bindings.thumbnailTransparency
			}),
			renderStepped = not p12.Settings.ReducedMotion and roact.createElement(externalEventConnection, {
				event = runService.renderStepped,
				callback = value.renderBackgroundSteppedCallback
			})
		})
	})
end

function loadingScreen.showConnnectionHealthDebugMenu(_, _) --[[ line: 258 ]]
	-- upvalues: var37 (write), var38 (write), var34 (ref), guiService (ref)
	if var37 == 0 then
		var37 = 1
		var38 = tick()
		
		return
	elseif var34 and tick() - var38 <= 0.5 then
		guiService:ShowStatsBasedOnInputString("ConnectionHealth")
	end
	var37 = 0
	var38 = 1e999
end

function loadingScreen.renderPlaceIcon(p13, p14) --[[ line: 275 ]]
	-- upvalues: roact (ref), color (ref), externalEventConnection (ref), runService (ref)
	local shimPos = p13.state.shimPos
	local value = p13.bindings.iconTransparency:getValue()
	local var83 = if p13.props.universeId and p13.props.universeId > 0 then ("rbxthumb://type=GameIcon&id=%d&w=256&h=256"):format(p13.props.universeId) else ""
	local reducedMotion = p14.Settings.ReducedMotion
	local createElement = roact.createElement
	local var84 = "Frame"
	local t = {
		Name = "IconFrame",
		BorderSizePixel = 0,
		Active = true,
		BackgroundTransparency = p13.bindings.iconTransparency,
		BackgroundColor3 = color,
		Size = p13.bindings.iconSize,
		Position = UDim2.fromScale(0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}
	local t_1 = {}
	local var87 = not reducedMotion
	
	if var87 then
		local var96
		var87 = roact.createElement
		local var88 = "Frame"
		local t_2 = {
			BackgroundTransparency = 0,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}
		local t_3 = { Corner = roact.createElement("UICorner") }
		local createElement_1 = roact.createElement
		local var91 = "UIGradient"
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
		local var94 = 0
		local list = { 0.7, 1 }
		
		if type(list) == "table" and #list >= 2 then
			local clampedValue = math.clamp(value, 0, 1)
			var96 = list[1] * (1 - clampedValue) + list[2] * clampedValue
		else
			var96 = 0
		end
		new_1 = new_1(var94, var96)
		local new_2 = NumberSequenceKeypoint.new
		local var98 = 0.5
		local list_1 = { 0.3, 1 }
		
		if type(list_1) == "table" and #list_1 >= 2 then
			local clampedValue = math.clamp(value, 0, 1)
			list = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
		else
			list = 0
		end
		new_2 = new_2(var98, list)
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
		t_3.Gradient = createElement_1(var91, t_4)
		t_3.renderStepped = roact.createElement(externalEventConnection, {
			event = runService.renderStepped,
			callback = p13.renderShimmerCallback
		})
		var87 = var87(var88, t_2, t_3)
	end
	t_1.LoadingOverlay = var87
	t_1.GameIconImage = roact.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = var83,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		ImageTransparency = p13.bindings.iconTransparency
	}, { Corner = roact.createElement("UICorner") })
	t_1.Corner = roact.createElement("UICorner")
	
	return createElement(var84, t, t_1)
end

function loadingScreen.renderInfoFrame(p15, p16) --[[ line: 336 ]]
	-- upvalues: verifiedBadgesModule (ref), list (ref), roact (ref), fFlagAddAutoTranslateToLoadingScreen (ref), var34 (ref)
	local productInfo = p15.props.productInfo
	local var103 = if productInfo then productInfo.Name else ""
	local var104 = if productInfo then productInfo.Creator.Name else ""
	
	if productInfo and productInfo.Creator.HasVerifiedBadge then
		var104 = verifiedBadgesModule.appendVerifiedBadge(var104)
	end
	return roact.createElement("Frame", {
		Name = "InfoFrame",
		BackgroundColor3 = p16.Theme.BackgroundMuted.Color,
		BackgroundTransparency = p15.bindings.infoFrameTransparency,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = p15.isPortrait and UDim2.fromScale(1, 0) or UDim2.fromScale(0.6, 0),
		Active = true,
		[roact.Change.AbsoluteSize] = if fFlagAddAutoTranslateToLoadingScreen then function(p17) --[[ line: 360 ]]
			-- upvalues: p15 (ref)
			p15.updateBindings.updateInfoFrameAbsoluteSize(p17.AbsoluteSize)
		end else nil
	}, {
		PlaceIcon = p15:renderPlaceIcon(p16),
		TextLayoutFrame = roact.createElement("Frame", {
			Name = "TextLayout",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = true,
			BackgroundColor3 = p16.Theme.BackgroundMuted.Color,
			AnchorPoint = Vector2.new(0.5, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0.5, 0, 0, math.clamp(math.max(p15.state.absoluteSize.X, p15.state.absoluteSize.Y) / 1024 * list[1], list[1], list[2]) / 2),
			Size = UDim2.fromScale(1, 0)
		}, {
			PlaceLabel = roact.createElement("TextLabel", {
				Name = "PlaceLabel",
				BackgroundTransparency = 1,
				TextScaled = false,
				TextWrapped = true,
				TextStrokeTransparency = 1,
				ZIndex = 2,
				LayoutOrder = 1,
				RichText = false,
				TextTransparency = p15.bindings.placeTextTransparency,
				Size = UDim2.fromScale(0.8, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = p16.Font.Title.Font,
				TextSize = p15.bindings.placeTextSize,
				TextColor3 = p16.Theme.TextEmphasis.Color,
				Text = var103,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			CreatorLabel = roact.createElement("TextLabel", {
				Name = "CreatorLabel",
				BackgroundTransparency = 1,
				TextWrapped = true,
				TextScaled = false,
				TextStrokeTransparency = 1,
				ZIndex = 2,
				LayoutOrder = 2,
				RichText = false,
				TextTransparency = p15.bindings.creatorTextTransparency,
				Size = UDim2.fromScale(0.6, 0),
				AnchorPoint = Vector2.new(0.5, 1),
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = p16.Font.CaptionBody.Font,
				TextSize = p15.bindings.creatorTextSize,
				TextColor3 = p16.Theme.TextDefault.Color,
				Text = var104,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			UIListLayout = roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, if var34 then 12 else 36)
			}),
			Padding = roact.createElement("UIPadding", {
				PaddingTop = UDim.new(0, if var34 then 12 else 36),
				PaddingBottom = UDim.new(0, if var34 then 12 else 36)
			})
		}),
		Corner = roact.createElement("UICorner")
	})
end

function loadingScreen.renderMain(p18, p19) --[[ line: 434 ]]
	-- upvalues: var34 (ref), t (ref), var32 (ref), roact (ref), var28 (write), loading (ref), iconSize (ref), fFlagAddAutoTranslateToLoadingScreen (ref)
	local var105 = if var34 then if p18.isPortrait then t.MOBILE_PORTRAIT else t.MOBILE_LANDSCAPE elseif var32 then t.CONSOLE else t.DESKTOP
	
	return roact.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		DisplayOrder = var28 + 1,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		DarkGradient = roact.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			Gradient = roact.createElement("UIGradient", {
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
			Spinner = p19.Settings.ReducedMotion and roact.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 20,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Color3.new(1, 1, 1)
			}, {
				roact.createElement(loading, {
					size = iconSize.Medium,
					Position = UDim2.new(1, 0, 1, 0),
					AnchorPoint = Vector2.new(1, 1)
				})
			}),
			infoFrame = p18:renderInfoFrame(p19),
			AutoTranslate = fFlagAddAutoTranslateToLoadingScreen and p18:renderAutoTranslate() or nil,
			serverFrame = if not p18.isQueueTreatmentEnabled then p18:renderServerFrame(p19) else nil,
			policyContainer = if p18.isQueueTreatmentEnabled then p18:renderPolicyContainer() else nil,
			serverStatusContainer = if p18.isQueueTreatmentEnabled then p18:renderServerStatus() else nil,
			closeBtn = p18:renderCloseBtn(p19),
			gamepadCancelBtn = p18:renderGamepadCancelBtn(p19),
			Padding = roact.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var105.LEFT),
				PaddingRight = UDim.new(0, var105.RIGHT),
				PaddingTop = UDim.new(0, var105.TOP),
				PaddingBottom = UDim.new(0, var105.BOTTOM)
			})
		})
	})
end

function loadingScreen.renderCloseBtn(p20, _) --[[ line: 493 ]]
	-- upvalues: responsiveModule (ref), roact (ref), getFFlagReportFirstExperienceCancelledModule (ref), loggingProtocolModule (ref)
	if p20.props.preferredInputRef.current ~= responsiveModule.Input.Directional and not p20.state.showCloseBtn and tick() - p20.startTime > 5 then
		p20:setState({ showCloseBtn = true })
	end
	return p20.state.showCloseBtn and roact.createElement("ImageButton", {
		Name = "CloseButton",
		Image = "rbxasset://textures/loading/cancelButton.png",
		ImageTransparency = 0,
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.fromOffset(if p20.isQueueTreatmentEnabled then 32 else 32, if p20.isQueueTreatmentEnabled then 32 else 32),
		Active = false,
		ZIndex = 10,
		[roact.Event.MouseButton1Click] = function() --[[ line: 516 ]]
			-- upvalues: getFFlagReportFirstExperienceCancelledModule (copy), loggingProtocolModule (copy)
			if getFFlagReportFirstExperienceCancelledModule then
				loggingProtocolModule.default:logEventOnce("first_experience_cancelled")
			end
			game:Shutdown()
		end
	})
end

function loadingScreen.renderServerFrame(p21, p22) --[[ line: 525 ]]
	-- upvalues: var32 (ref), roact (ref), var25 (ref), coreGuiService (ref)
	local serverStatusText = p21.state.serverStatusText
	local isSubjectToChinaPolicies = p21.props.isSubjectToChinaPolicies
	local var106 = if var32 then 16 else 12
	local var107 = if var32 then 16 else 12
	
	return roact.createElement("Frame", {
		Name = "ServerFrame",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.fromScale(0.5, 1),
		Size = UDim2.new(1, -48, 0.2, 0)
	}, {
		PolicyLabel = isSubjectToChinaPolicies and roact.createElement("TextLabel", {
			Name = "PolicyLabel",
			BackgroundTransparency = 1,
			TextWrapped = true,
			TextScaled = false,
			TextStrokeTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, 2 * var107),
			Position = UDim2.new(0, 0, 1, -4 * var106 - 2 * var107),
			Font = p22.Font.Footer.Font,
			TextSize = var107,
			TextColor3 = p22.Theme.TextDefault.Color,
			Text = var25:Format("Authentication.Login.WeChat.AntiAddictionText"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		JoinServerLabel = roact.createElement("TextLabel", {
			Name = "JoinText",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 4 * var106),
			Position = UDim2.new(0, 0, 1, -2 * var106),
			Font = p22.Font.Footer.Font,
			TextSize = var106,
			TextWrapped = true,
			TextScaled = false,
			TextColor3 = p22.Theme.TextDefault.Color,
			TextStrokeTransparency = 1,
			Text = serverStatusText,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 2,
			RootLocalizationTable = coreGuiService.CoreScriptLocalization,
			[roact.Event.InputBegan] = if not p21.props.isSubjectToChinaPolicies then p21.showConnnectionHealthDebugMenu else nil
		})
	})
end

function loadingScreen.renderGamepadCancelBtn(p23, p24) --[[ line: 578 ]]
	-- upvalues: responsiveModule (ref), roact (ref), var25 (ref)
	return p23.props.preferredInputRef.current == responsiveModule.Input.Directional and (not p23.state.gamepadCancelPressed and roact.createElement("Frame", {
		Name = "GamepadCancelFrame",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Active = true,
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1),
		Size = UDim2.fromOffset(150, 48)
	}, {
		CancelIcon = roact.createElement("ImageLabel", {
			Name = "GamepadCancel",
			Image = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png",
			BackgroundTransparency = 1,
			Active = false,
			ZIndex = 10,
			LayoutOrder = 0,
			Size = UDim2.fromOffset(24, 24)
		}),
		CancelLabel = roact.createElement("TextLabel", {
			Name = "CancelText",
			BackgroundTransparency = 1,
			TextSize = 24,
			TextWrapped = true,
			TextStrokeTransparency = 1,
			ZIndex = 2,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1),
			Font = p24.Font.SubHeader1.Font,
			TextColor3 = p24.Theme.TextEmphasis.Color,
			Text = var25:Format("CoreScripts.TopBar.Back"),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		UIListLayout = roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 5)
		})
	}))
end

function loadingScreen.init(p25) --[[ line: 624 ]]
	-- upvalues: vector2 (ref), var32 (ref), queueExperimentation (ref), contextActionService (ref), t_1 (ref), roact (ref), fFlagAddAutoTranslateToLoadingScreen (ref), list (ref), var34 (ref), guiService (ref)
	local var108
	p25.thumbnailMoveSpd = 0.05
	p25.fadeinComplete = false
	p25.isPortrait = false
	p25.startTime = tick()
	p25.numberOfTaps = 0
	p25.lastTapTime = 1e999
	p25:setState({
		visible = true,
		thumbnailPositionX = 0.5,
		shimPos = 0,
		serverStatusText = "",
		showCloseBtn = false,
		gamepadCancelPressed = false,
		absoluteSize = Vector2.new(0, 0),
		thumbnailScaledWidth = vector2.x,
		thumbnailScaledHeight = vector2.y,
		showTenFootCancelBtn = var32
	})
	
	if not queueExperimentation.getIsJoinNewServerButtonEnabled() then
		var108 = queueExperimentation.getIsAutoJoinNewServerEnabled() and p25.props.placeId > 0
	end
	p25.isQueueTreatmentEnabled = var108
	
	function p25.onAbsoluteSizeChange(p26) --[[ line: 653 ]]
		-- upvalues: p25 (ref)
		p25:setState({ absoluteSize = p26.AbsoluteSize })
		p25.isPortrait = p26.AbsoluteSize.X < p26.AbsoluteSize.Y
		p25.updateBindings.iconSize(1)
	end
	
	game.Loaded:Connect(function() --[[ line: 662 ]]
		-- upvalues: var32 (copy), contextActionService (copy), p25 (ref), t_1 (copy)
		if var32 then
			contextActionService:UnbindCoreAction("CancelGameLoad")
		end
		while not p25.fadeinComplete do
			wait()
		end
		p25:stopAnimation()
		p25:playAnimation(t_1.FadeOut, {}, function() --[[ line: 670 ]]
			-- upvalues: p25 (copy)
			p25:setState({ visible = false })
		end)
	end)
	local var109, var110 = roact.createBinding(1)
	local var111, var112 = roact.createBinding(1)
	local var113, var114 = roact.createBinding(0)
	local var115, var116 = roact.createBinding(1)
	local var117, var118 = roact.createBinding(0)
	local var119, var120 = roact.createBinding(1)
	local var121, var122 = roact.createBinding(0)
	local var123, var124 = roact.createBinding(1)
	local var125 = nil
	local var126 = nil
	
	if fFlagAddAutoTranslateToLoadingScreen then
		local var127, var128 = roact.createBinding(Vector2.new(0, 0))
		var125 = var127
		var126 = var128
	end
	p25.bindings = {
		thumbnailTransparency = var109,
		iconTransparency = var111,
		iconSize = var113:map(function(p27) --[[ line: 694 ]]
			-- upvalues: p25 (ref), list (copy)
			local clampedValue = math.clamp(math.max(p25.state.absoluteSize.X, p25.state.absoluteSize.Y) / 1024 * list[1], list[1], list[2])
			
			return UDim2.fromOffset(clampedValue * p27, clampedValue * p27)
		end),
		placeTextTransparency = var115,
		placeTextSize = var117:map(function(p28) --[[ line: 700 ]]
			-- upvalues: var34 (copy)
			return (if var34 then 20 else 36) * p28
		end),
		creatorTextTransparency = var119,
		creatorTextSize = var121:map(function(p29) --[[ line: 704 ]]
			return 20 * p29
		end),
		infoFrameTransparency = var123,
		infoFrameAbsoluteSize = if fFlagAddAutoTranslateToLoadingScreen then var125 else nil
	}
	p25.updateBindings = {
		thumbnailTransparency = var110,
		iconTransparency = var112,
		iconSize = var114,
		placeTextTransparency = var116,
		placeTextSize = var118,
		creatorTextTransparency = var120,
		creatorTextSize = var122,
		infoFrameTransparency = var124,
		updateInfoFrameAbsoluteSize = if fFlagAddAutoTranslateToLoadingScreen then var126 else nil
	}
	
	function p25.renderBackgroundSteppedCallback(p30) --[[ line: 724 ]]
		-- upvalues: p25 (ref), vector2 (copy)
		local absoluteSize = p25.state.absoluteSize
		local var131 = absoluteSize.x * 1.5
		local var132 = var131 / vector2.x * vector2.y
		
		if var132 < absoluteSize.y then
			var131 = absoluteSize.y / vector2.y * vector2.x
			var132 = absoluteSize.y
		end
		local var133 = var131 / absoluteSize.x / 2
		local maxValue = math.max(var133, 1 - var133)
		local minValue = math.min(var133, 1 - var133)
		local var136 = p25.state.thumbnailPositionX + p25.thumbnailMoveSpd * p30
		
		if maxValue <= var136 or var136 <= minValue then
			p25.thumbnailMoveSpd = -p25.thumbnailMoveSpd
			var136 = math.clamp(var136, minValue, maxValue)
		end
		p25:setState({
			thumbnailPositionX = var136,
			thumbnailScaledHeight = var132,
			thumbnailScaledWidth = var131
		})
	end
	
	function p25.renderShimmerCallback(p31) --[[ line: 751 ]]
		-- upvalues: p25 (ref)
		local var137 = p25.state.shimPos + p31 * 1
		
		if var137 > 1 then
			var137 = -1
		end
		p25:setState({ shimPos = var137 })
	end
	
	if guiService:GetUiMessage() ~= "" then
		p25:setState({ serverStatusText = guiService:GetUiMessage() })
	end
	guiService.UiMessageChanged:Connect(function(p32, p33) --[[ line: 768 ]]
		-- upvalues: p25 (ref)
		if p32 == Enum.UiMessageType.UiMessageInfo then
			p25:setState({ serverStatusText = p33 })
		end
	end)
	local var129 = false
	contextActionService:BindCoreAction("CancelGameLoad", function(_, p34, _) --[[ line: 776 ]]
		-- upvalues: var129 (write), p25 (ref), contextActionService (copy)
		if p34 == Enum.UserInputState.Begin then
			var129 = true
			
			return
		elseif p34 == Enum.UserInputState.End and var129 then
			p25:setState({ showTenFootCancelBtn = false })
			p25:setState({ gamepadCancelPressed = true })
			contextActionService:UnbindCoreAction("CancelGameLoad")
			
			if not game:IsLoaded() then
				game:Shutdown()
			end
		end
	end, false, Enum.KeyCode.ButtonB)
end

function loadingScreen.renderAutoTranslate(p35) --[[ line: 796 ]]
	-- upvalues: fFlagAutoTranslateSkipZeroUniverseId (ref), loadingScreenTelemetryModule (ref), roact (ref), autoTranslateBadgeModule (ref)
	if fFlagAutoTranslateSkipZeroUniverseId and p35.props.universeId <= 0 then
		loadingScreenTelemetryModule.countAutoTranslateZeroUniverseId()
		
		return nil
	end
	return roact.createElement(autoTranslateBadgeModule, {
		universeId = p35.props.universeId,
		positionBinding = p35.bindings.infoFrameAbsoluteSize,
		transparencyBinding = p35.bindings.infoFrameTransparency
	})
end

function loadingScreen.renderPolicyContainer(p36) --[[ line: 808 ]]
	-- upvalues: reactModule (ref), policyContainerModule (ref)
	return if p36.props.isSubjectToChinaPolicies then reactModule.createElement(policyContainerModule, { position = UDim2.new(0, 0, 0, 32) }) else nil
end

function loadingScreen.renderServerStatus(p37) --[[ line: 817 ]]
	-- upvalues: queueExperimentation (ref), roact (ref), serverStatusWithCountdownModule (ref), serverStatusModule (ref)
	return if queueExperimentation.getIsAutoJoinNewServerEnabled() then roact.createElement(serverStatusWithCountdownModule, {
		anchorPoint = Vector2.new(0.5, 1),
		isSubjectToChinaPolicies = p37.props.isSubjectToChinaPolicies,
		placeId = p37.props.placeId,
		position = UDim2.fromScale(0.5, 1),
		size = UDim2.fromScale(1, 0.2),
		universeId = p37.props.universeId
	}) elseif queueExperimentation.getIsJoinNewServerButtonEnabled() then roact.createElement(serverStatusModule, {
		anchorPoint = Vector2.new(0.5, 1),
		isSubjectToChinaPolicies = p37.props.isSubjectToChinaPolicies,
		placeId = p37.props.placeId,
		position = UDim2.fromScale(0.5, 1),
		size = UDim2.fromScale(1, 0.2),
		universeId = p37.props.universeId
	}) else nil
end

function loadingScreen.renderMainWithProviders(p38, p39) --[[ line: 841 ]]
	-- upvalues: roact (ref), foundationProvider (ref), foundationModule (ref), localizationProvider (ref), var25 (ref)
	return roact.createElement(foundationProvider, { theme = foundationModule.Enums.Theme.Dark }, {
		roact.createElement(localizationProvider, { localization = var25 }, p38:renderMain(p39))
	})
end

function loadingScreen.render(p40) --[[ line: 851 ]]
	-- upvalues: withStyle (ref), roact (ref), fFlagAddAutoTranslateToLoadingScreen (ref)
	return withStyle(function(p41) --[[ line: 854 ]]
		-- upvalues: p40 (ref), roact (copy), fFlagAddAutoTranslateToLoadingScreen (copy)
		return p40.state.visible and roact.createElement("Folder", {}, {
			BackgroundScreen = p40:renderBackground(p41),
			MainScreen = if fFlagAddAutoTranslateToLoadingScreen then p40:renderMainWithProviders(p41) else p40:renderMain(p41)
		})
	end)
end

function loadingScreen.willUpdate(_, _, _) --[[ line: 865 ]] end

function loadingScreen.didMount(p42) --[[ line: 867 ]]
	-- upvalues: runService (ref), t_1 (ref), queueExperimentation (ref), experienceService (ref), placeLauncherStateModule (ref)
	runService:SetRobloxGuiFocused(true)
	p42.props.fetchUniverseId(p42.props.placeId)
	p42.props.fetchGameProductInfo(p42.props.placeId)
	p42.props.fetchSubjectToChinaPolicies()
	p42:playAnimation(t_1.FadeIn, {}, function() --[[ line: 876 ]]
		-- upvalues: p42 (ref)
		p42.fadeinComplete = true
	end)
	
	if queueExperimentation.isInExperiment() and experienceService:GetFollowUserId() > 0 and p42.props.placeId > 0 then
		if experienceService:GetPlaceJoinState() == placeLauncherStateModule.Queued then
			queueExperimentation.logExposure()
			
			return
		end
		p42.placeJoinStateConnection = experienceService.PlaceJoinStateChanged:Connect(function(p43) --[[ line: 884 ]]
			-- upvalues: placeLauncherStateModule (copy), queueExperimentation (copy)
			if p43 == placeLauncherStateModule.Queued then
				queueExperimentation.logExposure()
			end
		end)
	end
end

function loadingScreen.willUnmount(p44) --[[ line: 893 ]]
	-- upvalues: contextActionService (ref), runService (ref), var36 (write), userInputService (ref), guiService (ref), queueExperimentation (ref)
	contextActionService:UnbindCoreAction("CancelGameLoad")
	runService:SetRobloxGuiFocused(false)
	
	if not var36 then
		var36 = userInputService.InputBegan:Connect(function() --[[ line: 897 ]]
			-- upvalues: var36 (copy), guiService (copy)
			if var36 then
				var36:disconnect()
				var36 = nil
				guiService:CloseStatsBasedOnInputString("ConnectionHealth")
			end
		end)
	end
	if queueExperimentation.isInExperiment() and p44.placeJoinStateConnection then
		p44.placeJoinStateConnection:Disconnect()
		p44.placeJoinStateConnection = nil
	end
end

loadingScreen = roactRodux.connect(function(p45, p46) --[[ line: 908 ]]
	return {
		productInfo = p45.productInfo,
		isSubjectToChinaPolicies = p45.isSubjectToChinaPolicies,
		placeId = if p45.gameIds then p45.gameIds.placeId else p46.placeId,
		universeId = if p45.gameIds then p45.gameIds.universeId else 0,
		settings = p45.settings
	}
end, function(p47) --[[ line: 916 ]]
	-- upvalues: getGameProductInfoModule (ref), getIsSubjectToChinaPoliciesModule (ref), getUniverseIdModule (ref), var27 (ref)
	return {
		fetchGameProductInfo = function(p48) --[[ line: 918 ]]
			-- upvalues: p47 (ref), getGameProductInfoModule (copy)
			p47(getGameProductInfoModule(p48))
		end,
		fetchSubjectToChinaPolicies = function() --[[ line: 921 ]]
			-- upvalues: p47 (ref), getIsSubjectToChinaPoliciesModule (copy)
			p47(getIsSubjectToChinaPoliciesModule())
		end,
		fetchUniverseId = function(p49) --[[ line: 924 ]]
			-- upvalues: p47 (ref), getUniverseIdModule (copy), var27 (copy)
			p47(getUniverseIdModule(var27, p49))
		end
	}
end)(loadingScreen)

return function(p50) --[[ line: 929 ]]
	-- upvalues: reactModule (ref), responsiveModule (ref), loadingScreen (write), cryo (ref)
	local var138 = reactModule.useRef(nil)
	var138.current = responsiveModule.usePreferredInput()
	
	return reactModule.createElement(loadingScreen, cryo.Dictionary.join(p50, { preferredInputRef = var138 }))
end