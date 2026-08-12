local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local contextActionService = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local localizationService = game:GetService("LocalizationService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local externalEventConnection = require(parent.RoactUtils).ExternalEventConnection
local verifiedBadgesModule = require(parent.VerifiedBadges)
local withStyle = require(parent.UIBlox).Style.withStyle
local responsiveModule = require(parent.Responsive)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local foundationProvider = foundationModule.FoundationProvider
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local autoTranslateBadgeModule = require(progressLoading.Components.AutoTranslateBadge)
local loadingScreenTelemetryModule = require(progressLoading.LoadingScreenTelemetry)
local policyContainerModule = require(progressLoading.Components.PolicyContainer)
local serverStatusModule = require(progressLoading.Components.ServerStatus)
local serverStatusWithCountdownModule = require(progressLoading.Components.ServerStatusWithCountdown)
local var17 = localization.new(localizationService.RobloxLocaleId)
local queueExperimentation = require(parent.SocialExperiments).QueueExperimentation
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAddAutoTranslateToLoadingScreen = sharedFlagsModule.FFlagAddAutoTranslateToLoadingScreen
local fFlagAutoTranslateSkipZeroUniverseId = sharedFlagsModule.FFlagAutoTranslateSkipZeroUniverseId
local var19 = if sharedFlagsModule.FFlagIncreaseLoadingScreenOrder then 8 else 7
local vector2 = Vector2.new(768, 432)
local color = Color3.fromRGB(101, 102, 104)
local t = {
	MOBILE_PORTRAIT = { TOP = 44, BOTTOM = 44, LEFT = 24, RIGHT = 24 },
	MOBILE_LANDSCAPE = { TOP = 24, BOTTOM = 24, LEFT = 44, RIGHT = 44 },
	DESKTOP = { TOP = 24, BOTTOM = 24, LEFT = 24, RIGHT = 24 },
	CONSOLE = { TOP = 64, BOTTOM = 64, LEFT = 64, RIGHT = 64 }
}
local var23 = guiService:IsTenFootInterface()
local platform = userInputService:GetPlatform()
local var25 = if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true
local list = { 150, 256 }
local var27 = nil
local var28 = 0
local var29 = 1e999

local function _(p0) --[[ line: 101 | named "getPadding" ]]
	-- upvalues: var25 (ref), t (ref), var23 (ref)
	return if var25 then if p0 then t.MOBILE_PORTRAIT else t.MOBILE_LANDSCAPE elseif var23 then t.CONSOLE else t.DESKTOP
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
			local var37
			local var36 = p1 / 0.6
			local iconTransparency = p2.iconTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var36, 0, 1)
				var37 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var37 = 0
			end
			local var39
			iconTransparency(var37)
			local iconSize = p2.iconSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var36, 0, 1)
				var39 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var39 = 0
			end
			local var41
			iconSize(var39)
			local infoFrameTransparency = p2.infoFrameTransparency
			
			if type(list_2) == "table" and #list_2 >= 2 then
				local clampedValue = math.clamp(var36, 0, 1)
				var41 = list_2[1] * (1 - clampedValue) + list_2[2] * clampedValue
			else
				var41 = 0
			end
			local var43
			infoFrameTransparency(var41)
			local thumbnailTransparency = p2.thumbnailTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var36, 0, 1)
				var43 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var43 = 0
			end
			local var45
			thumbnailTransparency(var43)
			local placeTextTransparency = p2.placeTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var36, 0, 1)
				var45 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var45 = 0
			end
			local var47
			placeTextTransparency(var45)
			local placeTextSize = p2.placeTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var36, 0, 1)
				var47 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var47 = 0
			end
			local var49
			placeTextSize(var47)
			local creatorTextTransparency = p2.creatorTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var36, 0, 1)
				var49 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var49 = 0
			end
			local var51
			creatorTextTransparency(var49)
			local creatorTextSize = p2.creatorTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var36, 0, 1)
				var51 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var51 = 0
			end
			creatorTextSize(var51)
			
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
			local var57
			local var56 = p4 / 0.6
			local iconTransparency = p5.iconTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var56, 0, 1)
				var57 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var57 = 0
			end
			local var59
			iconTransparency(var57)
			local iconSize = p5.iconSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var56, 0, 1)
				var59 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var59 = 0
			end
			local var61
			iconSize(var59)
			local infoFrameTransparency = p5.infoFrameTransparency
			
			if type(list_2) == "table" and #list_2 >= 2 then
				local clampedValue = math.clamp(var56, 0, 1)
				var61 = list_2[1] * (1 - clampedValue) + list_2[2] * clampedValue
			else
				var61 = 0
			end
			local var63
			infoFrameTransparency(var61)
			local thumbnailTransparency = p5.thumbnailTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var56, 0, 1)
				var63 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var63 = 0
			end
			local var65
			thumbnailTransparency(var63)
			local placeTextTransparency = p5.placeTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var56, 0, 1)
				var65 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var65 = 0
			end
			local var67
			placeTextTransparency(var65)
			local placeTextSize = p5.placeTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var56, 0, 1)
				var67 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var67 = 0
			end
			local var69
			placeTextSize(var67)
			local creatorTextTransparency = p5.creatorTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var56, 0, 1)
				var69 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var69 = 0
			end
			local var71
			creatorTextTransparency(var69)
			local creatorTextSize = p5.creatorTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var56, 0, 1)
				var71 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var71 = 0
			end
			creatorTextSize(var71)
			
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
	-- upvalues: var27 (write), guiService (ref)
	if var27 then
		var27:disconnect()
		var27 = nil
		guiService:CloseStatsBasedOnInputString("ConnectionHealth")
	end
end

local loadingScreenView = roactModule.Component:extend("LoadingScreenView")

function loadingScreenView.playAnimation(p7, p8, p9, p10) --[[ line: 193 ]]
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

function loadingScreenView.stopAnimation(p11) --[[ line: 209 ]]
	if p11.renderSteppedConnection then
		p11.renderSteppedConnection:Disconnect()
		p11.renderSteppedConnection = nil
	end
end

function loadingScreenView.renderBackground(value, p12) --[[ line: 216 ]]
	-- upvalues: roactModule (ref), var19 (write), externalEventConnection (ref), runService (ref)
	return roactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = value.props.displayOrder or var19,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		roactModule.createElement("Frame", {
			Name = "BackgroundFrame",
			[roactModule.Change.AbsoluteSize] = value.onAbsoluteSizeChange,
			BackgroundColor3 = p12.Theme.BackgroundUIDefault.Color,
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
			renderStepped = not p12.Settings.ReducedMotion and roactModule.createElement(externalEventConnection, {
				event = runService.renderStepped,
				callback = value.renderBackgroundSteppedCallback
			})
		})
	})
end

function loadingScreenView.showConnnectionHealthDebugMenu(_, _) --[[ line: 258 ]]
	-- upvalues: var28 (write), var29 (write), var25 (ref), guiService (ref)
	if var28 == 0 then
		var28 = 1
		var29 = tick()
		
		return
	elseif var25 and tick() - var29 <= 0.5 then
		guiService:ShowStatsBasedOnInputString("ConnectionHealth")
	end
	var28 = 0
	var29 = 1e999
end

function loadingScreenView.renderPlaceIcon(p13, p14) --[[ line: 275 ]]
	-- upvalues: roactModule (ref), color (ref), externalEventConnection (ref), runService (ref)
	local shimPos = p13.state.shimPos
	local value = p13.bindings.iconTransparency:getValue()
	local var74 = if p13.props.universeId and p13.props.universeId > 0 then ("rbxthumb://type=GameIcon&id=%d&w=256&h=256"):format(p13.props.universeId) else ""
	local reducedMotion = p14.Settings.ReducedMotion
	local createElement = roactModule.createElement
	local var75 = "Frame"
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
	local var78 = not reducedMotion
	
	if var78 then
		local var87
		var78 = roactModule.createElement
		local var79 = "Frame"
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
		local var82 = "UIGradient"
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
		local var85 = 0
		local list = { 0.7, 1 }
		
		if type(list) == "table" and #list >= 2 then
			local clampedValue = math.clamp(value, 0, 1)
			var87 = list[1] * (1 - clampedValue) + list[2] * clampedValue
		else
			var87 = 0
		end
		new_1 = new_1(var85, var87)
		local new_2 = NumberSequenceKeypoint.new
		local var89 = 0.5
		local list_1 = { 0.3, 1 }
		
		if type(list_1) == "table" and #list_1 >= 2 then
			local clampedValue = math.clamp(value, 0, 1)
			list = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
		else
			list = 0
		end
		new_2 = new_2(var89, list)
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
		t_3.Gradient = createElement_1(var82, t_4)
		t_3.renderStepped = roactModule.createElement(externalEventConnection, {
			event = runService.renderStepped,
			callback = p13.renderShimmerCallback
		})
		var78 = var78(var79, t_2, t_3)
	end
	t_1.LoadingOverlay = var78
	t_1.GameIconImage = roactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = var74,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		ImageTransparency = p13.bindings.iconTransparency
	}, { Corner = roactModule.createElement("UICorner") })
	t_1.Corner = roactModule.createElement("UICorner")
	
	return createElement(var75, t, t_1)
end

function loadingScreenView.renderInfoFrame(p15, p16) --[[ line: 336 ]]
	-- upvalues: verifiedBadgesModule (ref), list (ref), roactModule (ref), fFlagAddAutoTranslateToLoadingScreen (ref), var25 (ref)
	local productInfo = p15.props.productInfo
	local var94 = if productInfo then productInfo.Name else ""
	local var95 = if productInfo then productInfo.Creator.Name else ""
	
	if productInfo and productInfo.Creator.HasVerifiedBadge then
		var95 = verifiedBadgesModule.appendVerifiedBadge(var95)
	end
	return roactModule.createElement("Frame", {
		Name = "InfoFrame",
		BackgroundColor3 = p16.Theme.BackgroundMuted.Color,
		BackgroundTransparency = p15.bindings.infoFrameTransparency,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = p15.isPortrait and UDim2.fromScale(1, 0) or UDim2.fromScale(0.6, 0),
		Active = true,
		[roactModule.Change.AbsoluteSize] = if fFlagAddAutoTranslateToLoadingScreen then function(p17) --[[ line: 360 ]]
			-- upvalues: p15 (ref)
			p15.updateBindings.updateInfoFrameAbsoluteSize(p17.AbsoluteSize)
		end else nil
	}, {
		PlaceIcon = p15:renderPlaceIcon(p16),
		TextLayoutFrame = roactModule.createElement("Frame", {
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
			PlaceLabel = roactModule.createElement("TextLabel", {
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
				Text = var94,
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
				TextTransparency = p15.bindings.creatorTextTransparency,
				Size = UDim2.fromScale(0.6, 0),
				AnchorPoint = Vector2.new(0.5, 1),
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = p16.Font.CaptionBody.Font,
				TextSize = p15.bindings.creatorTextSize,
				TextColor3 = p16.Theme.TextDefault.Color,
				Text = var95,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			UIListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, if var25 then 12 else 36)
			}),
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, if var25 then 12 else 36),
				PaddingBottom = UDim.new(0, if var25 then 12 else 36)
			})
		}),
		Corner = roactModule.createElement("UICorner")
	})
end

function loadingScreenView.renderMain(p18, p19) --[[ line: 434 ]]
	-- upvalues: var25 (ref), t (ref), var23 (ref), roactModule (ref), var19 (write), loading (ref), iconSize (ref), fFlagAddAutoTranslateToLoadingScreen (ref)
	local var96 = if var25 then if p18.isPortrait then t.MOBILE_PORTRAIT else t.MOBILE_LANDSCAPE elseif var23 then t.CONSOLE else t.DESKTOP
	
	return roactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		DisplayOrder = (p18.props.displayOrder or var19) + 1,
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
			Spinner = p19.Settings.ReducedMotion and roactModule.createElement("Frame", {
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
			infoFrame = p18:renderInfoFrame(p19),
			AutoTranslate = fFlagAddAutoTranslateToLoadingScreen and p18:renderAutoTranslate() or nil,
			serverFrame = if not p18.isQueueTreatmentEnabled then p18:renderServerFrame(p19) else nil,
			policyContainer = if p18.isQueueTreatmentEnabled then p18:renderPolicyContainer() else nil,
			serverStatusContainer = if p18.isQueueTreatmentEnabled then p18:renderServerStatus() else nil,
			closeBtn = p18:renderCloseBtn(p19),
			gamepadCancelBtn = p18:renderGamepadCancelBtn(p19),
			Padding = roactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var96.LEFT),
				PaddingRight = UDim.new(0, var96.RIGHT),
				PaddingTop = UDim.new(0, var96.TOP),
				PaddingBottom = UDim.new(0, var96.BOTTOM)
			})
		})
	})
end

function loadingScreenView.renderCloseBtn(p20, _) --[[ line: 493 ]]
	-- upvalues: responsiveModule (ref), roactModule (ref)
	if p20.props.preferredInputRef.current ~= responsiveModule.Input.Directional and not p20.state.showCloseBtn and tick() - p20.startTime > 5 then
		p20:setState({ showCloseBtn = true })
	end
	return p20.state.showCloseBtn and roactModule.createElement("ImageButton", {
		Name = "CloseButton",
		Image = "rbxasset://textures/loading/cancelButton.png",
		ImageTransparency = 0,
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.fromOffset(if p20.isQueueTreatmentEnabled then 32 else 32, if p20.isQueueTreatmentEnabled then 32 else 32),
		Active = false,
		ZIndex = 10,
		[roactModule.Event.MouseButton1Click] = function() --[[ line: 516 ]]
			-- upvalues: p20 (ref)
			if p20.props.onCloseButtonActivated then
				p20.props.onCloseButtonActivated()
			end
		end
	})
end

function loadingScreenView.renderServerFrame(p21, p22) --[[ line: 524 ]]
	-- upvalues: var23 (ref), roactModule (ref), var17 (ref), coreGuiService (ref)
	local serverStatusText = p21.state.serverStatusText
	local isSubjectToChinaPolicies = p21.props.isSubjectToChinaPolicies
	local var97 = if var23 then 16 else 12
	local var98 = if var23 then 16 else 12
	
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
			Size = UDim2.new(1, 0, 0, 2 * var98),
			Position = UDim2.new(0, 0, 1, -4 * var97 - 2 * var98),
			Font = p22.Font.Footer.Font,
			TextSize = var98,
			TextColor3 = p22.Theme.TextDefault.Color,
			Text = var17:Format("Authentication.Login.WeChat.AntiAddictionText"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		JoinServerLabel = roactModule.createElement("TextLabel", {
			Name = "JoinText",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 4 * var97),
			Position = UDim2.new(0, 0, 1, -2 * var97),
			Font = p22.Font.Footer.Font,
			TextSize = var97,
			TextWrapped = true,
			TextScaled = false,
			TextColor3 = p22.Theme.TextDefault.Color,
			TextStrokeTransparency = 1,
			Text = serverStatusText,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			ZIndex = 2,
			RootLocalizationTable = coreGuiService:FindFirstChild("CoreScriptLocalization"),
			[roactModule.Event.InputBegan] = if not p21.props.isSubjectToChinaPolicies then p21.showConnnectionHealthDebugMenu else nil
		})
	})
end

function loadingScreenView.renderGamepadCancelBtn(p23, p24) --[[ line: 577 ]]
	-- upvalues: responsiveModule (ref), roactModule (ref), var17 (ref)
	return p23.props.preferredInputRef.current == responsiveModule.Input.Directional and (not p23.state.gamepadCancelPressed and roactModule.createElement("Frame", {
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
			Font = p24.Font.SubHeader1.Font,
			TextColor3 = p24.Theme.TextEmphasis.Color,
			Text = var17:Format("CoreScripts.TopBar.Back"),
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

function loadingScreenView.init(p25) --[[ line: 623 ]]
	-- upvalues: vector2 (ref), var23 (ref), queueExperimentation (ref), roactModule (ref), fFlagAddAutoTranslateToLoadingScreen (ref), list (ref), var25 (ref), guiService (ref), contextActionService (ref)
	local var99
	p25.thumbnailMoveSpd = 0.05
	p25.fadeinComplete = false
	p25.isPortrait = false
	p25.startTime = tick()
	p25.fadeOutTriggered = false
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
		showTenFootCancelBtn = var23
	})
	
	if not queueExperimentation.getIsJoinNewServerButtonEnabled() then
		var99 = queueExperimentation.getIsAutoJoinNewServerEnabled() and p25.props.placeId > 0
	end
	p25.isQueueTreatmentEnabled = var99
	
	function p25.onAbsoluteSizeChange(p26) --[[ line: 653 ]]
		-- upvalues: p25 (ref)
		p25:setState({ absoluteSize = p26.AbsoluteSize })
		p25.isPortrait = p26.AbsoluteSize.X < p26.AbsoluteSize.Y
		p25.updateBindings.iconSize(1)
	end
	
	local var100, var101 = roactModule.createBinding(1)
	local var102, var103 = roactModule.createBinding(1)
	local var104, var105 = roactModule.createBinding(0)
	local var106, var107 = roactModule.createBinding(1)
	local var108, var109 = roactModule.createBinding(0)
	local var110, var111 = roactModule.createBinding(1)
	local var112, var113 = roactModule.createBinding(0)
	local var114, var115 = roactModule.createBinding(1)
	local var116 = nil
	local var117 = nil
	
	if fFlagAddAutoTranslateToLoadingScreen then
		local var118, var119 = roactModule.createBinding(Vector2.new(0, 0))
		var116 = var118
		var117 = var119
	end
	p25.bindings = {
		thumbnailTransparency = var100,
		iconTransparency = var102,
		iconSize = var104:map(function(p27) --[[ line: 678 ]]
			-- upvalues: p25 (ref), list (copy)
			local clampedValue = math.clamp(math.max(p25.state.absoluteSize.X, p25.state.absoluteSize.Y) / 1024 * list[1], list[1], list[2])
			
			return UDim2.fromOffset(clampedValue * p27, clampedValue * p27)
		end),
		placeTextTransparency = var106,
		placeTextSize = var108:map(function(p28) --[[ line: 684 ]]
			-- upvalues: var25 (copy)
			return (if var25 then 20 else 36) * p28
		end),
		creatorTextTransparency = var110,
		creatorTextSize = var112:map(function(p29) --[[ line: 688 ]]
			return 20 * p29
		end),
		infoFrameTransparency = var114,
		infoFrameAbsoluteSize = if fFlagAddAutoTranslateToLoadingScreen then var116 else nil
	}
	p25.updateBindings = {
		thumbnailTransparency = var101,
		iconTransparency = var103,
		iconSize = var105,
		placeTextTransparency = var107,
		placeTextSize = var109,
		creatorTextTransparency = var111,
		creatorTextSize = var113,
		infoFrameTransparency = var115,
		updateInfoFrameAbsoluteSize = if fFlagAddAutoTranslateToLoadingScreen then var117 else nil
	}
	
	function p25.renderBackgroundSteppedCallback(p30) --[[ line: 708 ]]
		-- upvalues: p25 (ref), vector2 (copy)
		local absoluteSize = p25.state.absoluteSize
		local var122 = absoluteSize.x * 1.5
		local var123 = var122 / vector2.x * vector2.y
		
		if var123 < absoluteSize.y then
			var122 = absoluteSize.y / vector2.y * vector2.x
			var123 = absoluteSize.y
		end
		local var124 = var122 / absoluteSize.x / 2
		local maxValue = math.max(var124, 1 - var124)
		local minValue = math.min(var124, 1 - var124)
		local var127 = p25.state.thumbnailPositionX + p25.thumbnailMoveSpd * p30
		
		if maxValue <= var127 or var127 <= minValue then
			p25.thumbnailMoveSpd = -p25.thumbnailMoveSpd
			var127 = math.clamp(var127, minValue, maxValue)
		end
		p25:setState({
			thumbnailPositionX = var127,
			thumbnailScaledHeight = var123,
			thumbnailScaledWidth = var122
		})
	end
	
	function p25.renderShimmerCallback(p31) --[[ line: 735 ]]
		-- upvalues: p25 (ref)
		local var128 = p25.state.shimPos + p31 * 1
		
		if var128 > 1 then
			var128 = -1
		end
		p25:setState({ shimPos = var128 })
	end
	
	if guiService:GetUiMessage() ~= "" then
		p25:setState({ serverStatusText = guiService:GetUiMessage() })
	end
	guiService.UiMessageChanged:Connect(function(p32, p33) --[[ line: 752 ]]
		-- upvalues: p25 (ref)
		if p32 == Enum.UiMessageType.UiMessageInfo then
			p25:setState({ serverStatusText = p33 })
		end
	end)
	local var120 = false
	contextActionService:BindCoreAction("CancelGameLoad", function(_, p34, _) --[[ line: 760 ]]
		-- upvalues: var120 (write), p25 (ref), contextActionService (copy)
		if p34 == Enum.UserInputState.Begin then
			var120 = true
			
			return
		elseif p34 == Enum.UserInputState.End and var120 then
			p25:setState({ showTenFootCancelBtn = false })
			p25:setState({ gamepadCancelPressed = true })
			contextActionService:UnbindCoreAction("CancelGameLoad")
			
			if p25.props.onGamepadCancel then
				p25.props.onGamepadCancel()
			end
		end
	end, false, Enum.KeyCode.ButtonB)
end

function loadingScreenView.renderAutoTranslate(p35) --[[ line: 779 ]]
	-- upvalues: fFlagAutoTranslateSkipZeroUniverseId (ref), loadingScreenTelemetryModule (ref), roactModule (ref), autoTranslateBadgeModule (ref)
	if fFlagAutoTranslateSkipZeroUniverseId and p35.props.universeId <= 0 then
		loadingScreenTelemetryModule.countAutoTranslateZeroUniverseId()
		
		return nil
	end
	return roactModule.createElement(autoTranslateBadgeModule, {
		universeId = p35.props.universeId,
		positionBinding = p35.bindings.infoFrameAbsoluteSize,
		transparencyBinding = p35.bindings.infoFrameTransparency
	})
end

function loadingScreenView.renderPolicyContainer(p36) --[[ line: 791 ]]
	-- upvalues: reactModule (ref), policyContainerModule (ref)
	return if p36.props.isSubjectToChinaPolicies then reactModule.createElement(policyContainerModule, { position = UDim2.new(0, 0, 0, 32) }) else nil
end

function loadingScreenView.renderServerStatus(p37) --[[ line: 800 ]]
	-- upvalues: queueExperimentation (ref), roactModule (ref), serverStatusWithCountdownModule (ref), serverStatusModule (ref)
	return if queueExperimentation.getIsAutoJoinNewServerEnabled() then roactModule.createElement(serverStatusWithCountdownModule, {
		anchorPoint = Vector2.new(0.5, 1),
		isSubjectToChinaPolicies = p37.props.isSubjectToChinaPolicies,
		placeId = p37.props.placeId,
		position = UDim2.fromScale(0.5, 1),
		size = UDim2.fromScale(1, 0.2),
		universeId = p37.props.universeId
	}) elseif queueExperimentation.getIsJoinNewServerButtonEnabled() then roactModule.createElement(serverStatusModule, {
		anchorPoint = Vector2.new(0.5, 1),
		isSubjectToChinaPolicies = p37.props.isSubjectToChinaPolicies,
		placeId = p37.props.placeId,
		position = UDim2.fromScale(0.5, 1),
		size = UDim2.fromScale(1, 0.2),
		universeId = p37.props.universeId
	}) else nil
end

function loadingScreenView.renderMainWithProviders(p38, p39) --[[ line: 824 ]]
	-- upvalues: roactModule (ref), foundationProvider (ref), foundationModule (ref), localizationProvider (ref), var17 (ref)
	return roactModule.createElement(foundationProvider, { theme = foundationModule.Enums.Theme.Dark }, {
		roactModule.createElement(localizationProvider, { localization = var17 }, p38:renderMain(p39))
	})
end

function loadingScreenView.render(p40) --[[ line: 834 ]]
	-- upvalues: withStyle (ref), roactModule (ref), fFlagAddAutoTranslateToLoadingScreen (ref)
	return withStyle(function(p41) --[[ line: 837 ]]
		-- upvalues: p40 (ref), roactModule (copy), fFlagAddAutoTranslateToLoadingScreen (copy)
		return p40.state.visible and roactModule.createElement("Folder", {}, {
			BackgroundScreen = p40:renderBackground(p41),
			MainScreen = if fFlagAddAutoTranslateToLoadingScreen then p40:renderMainWithProviders(p41) else p40:renderMain(p41)
		})
	end)
end

function loadingScreenView.willUpdate(_, _, _) --[[ line: 848 ]] end

function loadingScreenView.maybeStartFadeOut(p42) --[[ line: 851 ]]
	-- upvalues: var23 (ref), contextActionService (ref), t_1 (ref)
	if p42.props.shouldStartFadeOut and not p42.fadeOutTriggered then
		p42.fadeOutTriggered = true
		
		if var23 then
			contextActionService:UnbindCoreAction("CancelGameLoad")
		end
		task.spawn(function() --[[ line: 857 ]]
			-- upvalues: p42 (ref), t_1 (copy)
			while not p42.fadeinComplete do
				wait()
			end
			p42:stopAnimation()
			p42:playAnimation(t_1.FadeOut, {}, function() --[[ line: 862 ]]
				-- upvalues: p42 (copy)
				p42:setState({ visible = false })
			end)
		end)
	end
end

function loadingScreenView.didUpdate(p43, _, _) --[[ line: 871 ]]
	p43:maybeStartFadeOut()
end

function loadingScreenView.didMount(p44) --[[ line: 875 ]]
	-- upvalues: runService (ref), t_1 (ref)
	if p44.props.manageRobloxGuiFocus then
		runService:SetRobloxGuiFocused(true)
	end
	p44:playAnimation(t_1.FadeIn, {}, function() --[[ line: 880 ]]
		-- upvalues: p44 (ref)
		p44.fadeinComplete = true
	end)
	p44:maybeStartFadeOut()
end

function loadingScreenView.willUnmount(p45) --[[ line: 887 ]]
	-- upvalues: contextActionService (ref), runService (ref), var27 (write), userInputService (ref), guiService (ref)
	contextActionService:UnbindCoreAction("CancelGameLoad")
	
	if p45.props.manageRobloxGuiFocus then
		runService:SetRobloxGuiFocused(false)
	end
	if not var27 then
		var27 = userInputService.InputBegan:Connect(function() --[[ line: 893 ]]
			-- upvalues: var27 (copy), guiService (copy)
			if var27 then
				var27:disconnect()
				var27 = nil
				guiService:CloseStatsBasedOnInputString("ConnectionHealth")
			end
		end)
	end
end

return loadingScreenView