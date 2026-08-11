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
local var18 = if require(parent.SharedFlags).FFlagIncreaseLoadingScreenOrder then 8 else 7
local vector2 = Vector2.new(768, 432)
local color = Color3.fromRGB(101, 102, 104)
local t = {
	MOBILE_PORTRAIT = { TOP = 44, BOTTOM = 44, LEFT = 24, RIGHT = 24 },
	MOBILE_LANDSCAPE = { TOP = 24, BOTTOM = 24, LEFT = 44, RIGHT = 44 },
	DESKTOP = { TOP = 24, BOTTOM = 24, LEFT = 24, RIGHT = 24 },
	CONSOLE = { TOP = 64, BOTTOM = 64, LEFT = 64, RIGHT = 64 }
}
local var22 = guiService:IsTenFootInterface()
local platform = userInputService:GetPlatform()
local var24 = if platform ~= Enum.Platform.IOS then platform == Enum.Platform.Android else true
local list = { 150, 256 }
local var26 = nil
local var27 = 0
local var28 = 1e999

local function _(p0) --[[ line: 99 | named "getPadding" ]]
	-- upvalues: var24 (ref), t (ref), var22 (ref)
	return if var24 then if p0 then t.MOBILE_PORTRAIT else t.MOBILE_LANDSCAPE elseif var22 then t.CONSOLE else t.DESKTOP
end

local _ = function(startValue, endValue) --[[ line: 109 | named "lerp" ]]
	if type(startValue) == "table" and #startValue >= 2 then
		local clampedValue = math.clamp(endValue, 0, 1)
		
		return startValue[1] * (1 - clampedValue) + startValue[2] * clampedValue
	end
	return 0
end

local t_1 = {
	FadeIn = function(p1, _, p2, p3) --[[ line: 118 ]]
		local list = { 1, 1 }
		local list_1 = { 1, 0 }
		local list_2 = { 1, 0.2 }
		
		if p1 <= 0.6 then
			local var36
			local var35 = p1 / 0.6
			local iconTransparency = p2.iconTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var35, 0, 1)
				var36 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var36 = 0
			end
			local var38
			iconTransparency(var36)
			local iconSize = p2.iconSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var35, 0, 1)
				var38 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var38 = 0
			end
			local var40
			iconSize(var38)
			local infoFrameTransparency = p2.infoFrameTransparency
			
			if type(list_2) == "table" and #list_2 >= 2 then
				local clampedValue = math.clamp(var35, 0, 1)
				var40 = list_2[1] * (1 - clampedValue) + list_2[2] * clampedValue
			else
				var40 = 0
			end
			local var42
			infoFrameTransparency(var40)
			local thumbnailTransparency = p2.thumbnailTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var35, 0, 1)
				var42 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var42 = 0
			end
			local var44
			thumbnailTransparency(var42)
			local placeTextTransparency = p2.placeTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var35, 0, 1)
				var44 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var44 = 0
			end
			local var46
			placeTextTransparency(var44)
			local placeTextSize = p2.placeTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var35, 0, 1)
				var46 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var46 = 0
			end
			local var48
			placeTextSize(var46)
			local creatorTextTransparency = p2.creatorTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var35, 0, 1)
				var48 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var48 = 0
			end
			local var50
			creatorTextTransparency(var48)
			local creatorTextSize = p2.creatorTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var35, 0, 1)
				var50 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var50 = 0
			end
			creatorTextSize(var50)
			
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
	FadeOut = function(p4, _, p5, p6) --[[ line: 147 ]]
		-- upvalues: runService (ref)
		local list = { 1, 0.6 }
		local list_1 = { 0, 1 }
		local list_2 = { 0.2, 1 }
		
		if p4 <= 0.6 then
			local var56
			local var55 = p4 / 0.6
			local iconTransparency = p5.iconTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var55, 0, 1)
				var56 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var56 = 0
			end
			local var58
			iconTransparency(var56)
			local iconSize = p5.iconSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var55, 0, 1)
				var58 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var58 = 0
			end
			local var60
			iconSize(var58)
			local infoFrameTransparency = p5.infoFrameTransparency
			
			if type(list_2) == "table" and #list_2 >= 2 then
				local clampedValue = math.clamp(var55, 0, 1)
				var60 = list_2[1] * (1 - clampedValue) + list_2[2] * clampedValue
			else
				var60 = 0
			end
			local var62
			infoFrameTransparency(var60)
			local thumbnailTransparency = p5.thumbnailTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var55, 0, 1)
				var62 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var62 = 0
			end
			local var64
			thumbnailTransparency(var62)
			local placeTextTransparency = p5.placeTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var55, 0, 1)
				var64 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var64 = 0
			end
			local var66
			placeTextTransparency(var64)
			local placeTextSize = p5.placeTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var55, 0, 1)
				var66 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var66 = 0
			end
			local var68
			placeTextSize(var66)
			local creatorTextTransparency = p5.creatorTextTransparency
			
			if type(list_1) == "table" and #list_1 >= 2 then
				local clampedValue = math.clamp(var55, 0, 1)
				var68 = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
			else
				var68 = 0
			end
			local var70
			creatorTextTransparency(var68)
			local creatorTextSize = p5.creatorTextSize
			
			if type(list) == "table" and #list >= 2 then
				local clampedValue = math.clamp(var55, 0, 1)
				var70 = list[1] * (1 - clampedValue) + list[2] * clampedValue
			else
				var70 = 0
			end
			creatorTextSize(var70)
			
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

local _ = function() --[[ line: 180 | named "disconnectAndCloseHealthStat" ]]
	-- upvalues: var26 (write), guiService (ref)
	if var26 then
		var26:disconnect()
		var26 = nil
		guiService:CloseStatsBasedOnInputString("ConnectionHealth")
	end
end

local loadingScreenView = roactModule.Component:extend("LoadingScreenView")

function loadingScreenView.playAnimation(p7, p8, p9, p10) --[[ line: 191 ]]
	-- upvalues: runService (ref)
	p7.animationStartTime = tick()
	p7.animationFunction = p8
	
	if not p7.renderSteppedConnection then
		p7.renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 196 ]]
			-- upvalues: p7 (ref), p9 (ref), p10 (ref)
			p7.animationFunction(tick() - p7.animationStartTime, p9, p7.updateBindings, function() --[[ line: 197 ]]
				-- upvalues: p7 (copy), p10 (copy)
				p7:stopAnimation()
				
				if p10 then
					p10()
				end
			end)
		end)
	end
end

function loadingScreenView.stopAnimation(p11) --[[ line: 207 ]]
	if p11.renderSteppedConnection then
		p11.renderSteppedConnection:Disconnect()
		p11.renderSteppedConnection = nil
	end
end

function loadingScreenView.renderBackground(value, p12) --[[ line: 214 ]]
	-- upvalues: roactModule (ref), var18 (write), externalEventConnection (ref), runService (ref)
	return roactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = value.props.displayOrder or var18,
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

function loadingScreenView.showConnnectionHealthDebugMenu(_, _) --[[ line: 256 ]]
	-- upvalues: var27 (write), var28 (write), var24 (ref), guiService (ref)
	if var27 == 0 then
		var27 = 1
		var28 = tick()
		
		return
	elseif var24 and tick() - var28 <= 0.5 then
		guiService:ShowStatsBasedOnInputString("ConnectionHealth")
	end
	var27 = 0
	var28 = 1e999
end

function loadingScreenView.renderPlaceIcon(p13, p14) --[[ line: 273 ]]
	-- upvalues: roactModule (ref), color (ref), externalEventConnection (ref), runService (ref)
	local shimPos = p13.state.shimPos
	local value = p13.bindings.iconTransparency:getValue()
	local var73 = if p13.props.universeId and p13.props.universeId > 0 then ("rbxthumb://type=GameIcon&id=%d&w=256&h=256"):format(p13.props.universeId) else ""
	local reducedMotion = p14.Settings.ReducedMotion
	local createElement = roactModule.createElement
	local var74 = "Frame"
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
	local var77 = not reducedMotion
	
	if var77 then
		local var86
		var77 = roactModule.createElement
		local var78 = "Frame"
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
		local var81 = "UIGradient"
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
		local var84 = 0
		local list = { 0.7, 1 }
		
		if type(list) == "table" and #list >= 2 then
			local clampedValue = math.clamp(value, 0, 1)
			var86 = list[1] * (1 - clampedValue) + list[2] * clampedValue
		else
			var86 = 0
		end
		new_1 = new_1(var84, var86)
		local new_2 = NumberSequenceKeypoint.new
		local var88 = 0.5
		local list_1 = { 0.3, 1 }
		
		if type(list_1) == "table" and #list_1 >= 2 then
			local clampedValue = math.clamp(value, 0, 1)
			list = list_1[1] * (1 - clampedValue) + list_1[2] * clampedValue
		else
			list = 0
		end
		new_2 = new_2(var88, list)
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
		t_3.Gradient = createElement_1(var81, t_4)
		t_3.renderStepped = roactModule.createElement(externalEventConnection, {
			event = runService.renderStepped,
			callback = p13.renderShimmerCallback
		})
		var77 = var77(var78, t_2, t_3)
	end
	t_1.LoadingOverlay = var77
	t_1.GameIconImage = roactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = var73,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		ImageTransparency = p13.bindings.iconTransparency
	}, { Corner = roactModule.createElement("UICorner") })
	t_1.Corner = roactModule.createElement("UICorner")
	
	return createElement(var74, t, t_1)
end

function loadingScreenView.renderInfoFrame(p15, p16) --[[ line: 334 ]]
	-- upvalues: verifiedBadgesModule (ref), list (ref), roactModule (ref), var24 (ref)
	local productInfo = p15.props.productInfo
	local var93 = if productInfo then productInfo.Name else ""
	local var94 = if productInfo then productInfo.Creator.Name else ""
	
	if productInfo and productInfo.Creator.HasVerifiedBadge then
		var94 = verifiedBadgesModule.appendVerifiedBadge(var94)
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
		[roactModule.Change.AbsoluteSize] = function(p17) --[[ line: 357 ]]
			-- upvalues: p15 (ref)
			p15.updateBindings.updateInfoFrameAbsoluteSize(p17.AbsoluteSize)
		end
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
				Text = var93,
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
				Text = var94,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			UIListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, if var24 then 12 else 36)
			}),
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, if var24 then 12 else 36),
				PaddingBottom = UDim.new(0, if var24 then 12 else 36)
			})
		}),
		Corner = roactModule.createElement("UICorner")
	})
end

function loadingScreenView.renderMain(p18, p19) --[[ line: 430 ]]
	-- upvalues: var24 (ref), t (ref), var22 (ref), roactModule (ref), var18 (write), loading (ref), iconSize (ref)
	local var95 = if var24 then if p18.isPortrait then t.MOBILE_PORTRAIT else t.MOBILE_LANDSCAPE elseif var22 then t.CONSOLE else t.DESKTOP
	
	return roactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		DisplayOrder = (p18.props.displayOrder or var18) + 1,
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
			AutoTranslate = p18:renderAutoTranslate(),
			serverFrame = if not p18.isQueueTreatmentEnabled then p18:renderServerFrame(p19) else nil,
			policyContainer = if p18.isQueueTreatmentEnabled then p18:renderPolicyContainer() else nil,
			serverStatusContainer = if p18.isQueueTreatmentEnabled then p18:renderServerStatus() else nil,
			closeBtn = p18:renderCloseBtn(p19),
			gamepadCancelBtn = p18:renderGamepadCancelBtn(p19),
			Padding = roactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var95.LEFT),
				PaddingRight = UDim.new(0, var95.RIGHT),
				PaddingTop = UDim.new(0, var95.TOP),
				PaddingBottom = UDim.new(0, var95.BOTTOM)
			})
		})
	})
end

function loadingScreenView.renderCloseBtn(p20, _) --[[ line: 489 ]]
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
		[roactModule.Event.MouseButton1Click] = function() --[[ line: 512 ]]
			-- upvalues: p20 (ref)
			if p20.props.onCloseButtonActivated then
				p20.props.onCloseButtonActivated()
			end
		end
	})
end

function loadingScreenView.renderServerFrame(p21, p22) --[[ line: 520 ]]
	-- upvalues: var22 (ref), roactModule (ref), var17 (ref), coreGuiService (ref)
	local serverStatusText = p21.state.serverStatusText
	local isSubjectToChinaPolicies = p21.props.isSubjectToChinaPolicies
	local var96 = if var22 then 16 else 12
	local var97 = if var22 then 16 else 12
	
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
			Size = UDim2.new(1, 0, 0, 2 * var97),
			Position = UDim2.new(0, 0, 1, -4 * var96 - 2 * var97),
			Font = p22.Font.Footer.Font,
			TextSize = var97,
			TextColor3 = p22.Theme.TextDefault.Color,
			Text = var17:Format("Authentication.Login.WeChat.AntiAddictionText"),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		JoinServerLabel = roactModule.createElement("TextLabel", {
			Name = "JoinText",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 4 * var96),
			Position = UDim2.new(0, 0, 1, -2 * var96),
			Font = p22.Font.Footer.Font,
			TextSize = var96,
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

function loadingScreenView.renderGamepadCancelBtn(p23, p24) --[[ line: 573 ]]
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

function loadingScreenView.init(p25) --[[ line: 619 ]]
	-- upvalues: vector2 (ref), var22 (ref), queueExperimentation (ref), roactModule (ref), list (ref), var24 (ref), guiService (ref), contextActionService (ref)
	local var98
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
		showTenFootCancelBtn = var22
	})
	
	if not queueExperimentation.getIsJoinNewServerButtonEnabled() then
		var98 = queueExperimentation.getIsAutoJoinNewServerEnabled() and p25.props.placeId > 0
	end
	p25.isQueueTreatmentEnabled = var98
	
	function p25.onAbsoluteSizeChange(p26) --[[ line: 649 ]]
		-- upvalues: p25 (ref)
		p25:setState({ absoluteSize = p26.AbsoluteSize })
		p25.isPortrait = p26.AbsoluteSize.X < p26.AbsoluteSize.Y
		p25.updateBindings.iconSize(1)
	end
	
	local var99, var100 = roactModule.createBinding(1)
	local var101, var102 = roactModule.createBinding(1)
	local var103, var104 = roactModule.createBinding(0)
	local var105, var106 = roactModule.createBinding(1)
	local var107, var108 = roactModule.createBinding(0)
	local var109, var110 = roactModule.createBinding(1)
	local var111, var112 = roactModule.createBinding(0)
	local var113, var114 = roactModule.createBinding(1)
	local var115, var116 = roactModule.createBinding(Vector2.new(0, 0))
	p25.bindings = {
		thumbnailTransparency = var99,
		iconTransparency = var101,
		iconSize = var103:map(function(p27) --[[ line: 671 ]]
			-- upvalues: p25 (ref), list (copy)
			local clampedValue = math.clamp(math.max(p25.state.absoluteSize.X, p25.state.absoluteSize.Y) / 1024 * list[1], list[1], list[2])
			
			return UDim2.fromOffset(clampedValue * p27, clampedValue * p27)
		end),
		placeTextTransparency = var105,
		placeTextSize = var107:map(function(p28) --[[ line: 677 ]]
			-- upvalues: var24 (copy)
			return (if var24 then 20 else 36) * p28
		end),
		creatorTextTransparency = var109,
		creatorTextSize = var111:map(function(p29) --[[ line: 681 ]]
			return 20 * p29
		end),
		infoFrameTransparency = var113,
		infoFrameAbsoluteSize = var115
	}
	p25.updateBindings = {
		thumbnailTransparency = var100,
		iconTransparency = var102,
		iconSize = var104,
		placeTextTransparency = var106,
		placeTextSize = var108,
		creatorTextTransparency = var110,
		creatorTextSize = var112,
		infoFrameTransparency = var114,
		updateInfoFrameAbsoluteSize = var116
	}
	
	function p25.renderBackgroundSteppedCallback(p30) --[[ line: 701 ]]
		-- upvalues: p25 (ref), vector2 (copy)
		local absoluteSize = p25.state.absoluteSize
		local var119 = absoluteSize.x * 1.5
		local var120 = var119 / vector2.x * vector2.y
		
		if var120 < absoluteSize.y then
			var119 = absoluteSize.y / vector2.y * vector2.x
			var120 = absoluteSize.y
		end
		local var121 = var119 / absoluteSize.x / 2
		local maxValue = math.max(var121, 1 - var121)
		local minValue = math.min(var121, 1 - var121)
		local var124 = p25.state.thumbnailPositionX + p25.thumbnailMoveSpd * p30
		
		if maxValue <= var124 or var124 <= minValue then
			p25.thumbnailMoveSpd = -p25.thumbnailMoveSpd
			var124 = math.clamp(var124, minValue, maxValue)
		end
		p25:setState({
			thumbnailPositionX = var124,
			thumbnailScaledHeight = var120,
			thumbnailScaledWidth = var119
		})
	end
	
	function p25.renderShimmerCallback(p31) --[[ line: 728 ]]
		-- upvalues: p25 (ref)
		local var125 = p25.state.shimPos + p31 * 1
		
		if var125 > 1 then
			var125 = -1
		end
		p25:setState({ shimPos = var125 })
	end
	
	if guiService:GetUiMessage() ~= "" then
		p25:setState({ serverStatusText = guiService:GetUiMessage() })
	end
	guiService.UiMessageChanged:Connect(function(p32, p33) --[[ line: 745 ]]
		-- upvalues: p25 (ref)
		if p32 == Enum.UiMessageType.UiMessageInfo then
			p25:setState({ serverStatusText = p33 })
		end
	end)
	local var117 = false
	contextActionService:BindCoreAction("CancelGameLoad", function(_, p34, _) --[[ line: 753 ]]
		-- upvalues: var117 (write), p25 (ref), contextActionService (copy)
		if p34 == Enum.UserInputState.Begin then
			var117 = true
			
			return
		elseif p34 == Enum.UserInputState.End and var117 then
			p25:setState({ showTenFootCancelBtn = false })
			p25:setState({ gamepadCancelPressed = true })
			contextActionService:UnbindCoreAction("CancelGameLoad")
			
			if p25.props.onGamepadCancel then
				p25.props.onGamepadCancel()
			end
		end
	end, false, Enum.KeyCode.ButtonB)
end

function loadingScreenView.renderAutoTranslate(p35) --[[ line: 772 ]]
	-- upvalues: loadingScreenTelemetryModule (ref), roactModule (ref), autoTranslateBadgeModule (ref)
	if p35.props.universeId <= 0 then
		loadingScreenTelemetryModule.countAutoTranslateZeroUniverseId()
		
		return nil
	end
	return roactModule.createElement(autoTranslateBadgeModule, {
		universeId = p35.props.universeId,
		positionBinding = p35.bindings.infoFrameAbsoluteSize,
		transparencyBinding = p35.bindings.infoFrameTransparency
	})
end

function loadingScreenView.renderPolicyContainer(p36) --[[ line: 784 ]]
	-- upvalues: reactModule (ref), policyContainerModule (ref)
	return if p36.props.isSubjectToChinaPolicies then reactModule.createElement(policyContainerModule, { position = UDim2.new(0, 0, 0, 32) }) else nil
end

function loadingScreenView.renderServerStatus(p37) --[[ line: 793 ]]
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

function loadingScreenView.renderMainWithProviders(p38, p39) --[[ line: 817 ]]
	-- upvalues: roactModule (ref), foundationProvider (ref), foundationModule (ref), localizationProvider (ref), var17 (ref)
	return roactModule.createElement(foundationProvider, { theme = foundationModule.Enums.Theme.Dark }, {
		roactModule.createElement(localizationProvider, { localization = var17 }, p38:renderMain(p39))
	})
end

function loadingScreenView.render(p40) --[[ line: 827 ]]
	-- upvalues: withStyle (ref), roactModule (ref)
	return withStyle(function(p41) --[[ line: 830 ]]
		-- upvalues: p40 (ref), roactModule (copy)
		return p40.state.visible and roactModule.createElement("Folder", {}, {
			BackgroundScreen = p40:renderBackground(p41),
			MainScreen = p40:renderMainWithProviders(p41)
		})
	end)
end

function loadingScreenView.willUpdate(_, _, _) --[[ line: 839 ]] end

function loadingScreenView.maybeStartFadeOut(p42) --[[ line: 842 ]]
	-- upvalues: var22 (ref), contextActionService (ref), t_1 (ref)
	if p42.props.shouldStartFadeOut and not p42.fadeOutTriggered then
		p42.fadeOutTriggered = true
		
		if var22 then
			contextActionService:UnbindCoreAction("CancelGameLoad")
		end
		task.spawn(function() --[[ line: 848 ]]
			-- upvalues: p42 (ref), t_1 (copy)
			while not p42.fadeinComplete do
				wait()
			end
			p42:stopAnimation()
			p42:playAnimation(t_1.FadeOut, {}, function() --[[ line: 853 ]]
				-- upvalues: p42 (copy)
				p42:setState({ visible = false })
			end)
		end)
	end
end

function loadingScreenView.didUpdate(p43, _, _) --[[ line: 862 ]]
	p43:maybeStartFadeOut()
end

function loadingScreenView.didMount(p44) --[[ line: 866 ]]
	-- upvalues: runService (ref), t_1 (ref)
	if p44.props.manageRobloxGuiFocus then
		runService:SetRobloxGuiFocused(true)
	end
	p44:playAnimation(t_1.FadeIn, {}, function() --[[ line: 871 ]]
		-- upvalues: p44 (ref)
		p44.fadeinComplete = true
	end)
	p44:maybeStartFadeOut()
end

function loadingScreenView.willUnmount(p45) --[[ line: 878 ]]
	-- upvalues: contextActionService (ref), runService (ref), var26 (write), userInputService (ref), guiService (ref)
	contextActionService:UnbindCoreAction("CancelGameLoad")
	
	if p45.props.manageRobloxGuiFocus then
		runService:SetRobloxGuiFocused(false)
	end
	if not var26 then
		var26 = userInputService.InputBegan:Connect(function() --[[ line: 884 ]]
			-- upvalues: var26 (copy), guiService (copy)
			if var26 then
				var26:disconnect()
				var26 = nil
				guiService:CloseStatsBasedOnInputString("ConnectionHealth")
			end
		end)
	end
end

return loadingScreenView