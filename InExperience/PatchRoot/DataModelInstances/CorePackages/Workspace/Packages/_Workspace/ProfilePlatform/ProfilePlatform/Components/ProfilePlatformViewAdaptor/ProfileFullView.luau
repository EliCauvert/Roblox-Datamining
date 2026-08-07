local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useIsMeTabModule = require(profilePlatform.Hooks.useIsMeTab)
local constantsModule = require(profilePlatform.Common.Constants)
local visibilityControl = require(parent.AppNavBar).VisibilityControl
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagProfilePlatformMeTabScrollAwayModule = require(profilePlatform.Flags.FFlagProfilePlatformMeTabScrollAway)
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local iconSize = foundationModule.Enums.IconSize
local useStyle = UIBloxModule.Core.Style.useStyle

return function(p0) --[[ line: 48 | named "ProfileFullView" ]]
	-- upvalues: useStyle (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagAXEnableProfileTab (ref), useProfileWrapperContextModule (ref), useIsMeTabModule (ref), useProfileJsonComponentModule (ref), constantsModule (ref), reactModule (ref), fFlagProfilePlatformMeTabScrollAwayModule (ref), visibilityControl (ref), userInputService (ref), view (ref), iconButton (ref), iconSize (ref), fullscreenPageWithSafeArea (ref)
	local var14
	local theme = useStyle().Theme
	local var12 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local var13 = if fFlagAXEnableProfileTab then useProfileWrapperContextModule() else nil
	
	if fFlagAXEnableProfileTab then
		var14 = var13.forceFullView == true
		var14 = nil
	else
		var14 = nil
	end
	local var15 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	local var16 = if var12 then 36 else 16
	local var17 = if var12 then 24 else 16
	local var18 = if var12 and (not fFlagAXEnableProfileTab or not var15) then 1018 else 1e999
	local var19 = if var14 then 0 elseif (useProfileJsonComponentModule(enumsModule.Components.CoverPhoto) or {}).coverPhotoId ~= nil then 56 else -constantsModule.PAGE_PADDING
	local var20, var21 = reactModule.useState(0)
	local var22 = var20 > 50
	local var23 = if fFlagProfilePlatformMeTabScrollAwayModule then var14 else nil
	local var24 = if fFlagProfilePlatformMeTabScrollAwayModule then reactModule.useRef(false) else nil
	local var25 = if fFlagProfilePlatformMeTabScrollAwayModule then reactModule.useRef(0) else nil
	local var26 = reactModule.useCallback(function(p1) --[[ line: 93 ]]
		-- upvalues: var21 (ref), var23 (ref), var24 (ref), var25 (ref), visibilityControl (copy)
		local canvasPosition = p1.CanvasPosition
		var21(math.abs(canvasPosition.Y))
		
		if var23 then
			if var24.current then
				local var28 = canvasPosition.Y - var25.current
				
				if var28 ~= 0 then
					visibilityControl.onTouchMoved(-var28)
				end
			end
			var25.current = canvasPosition.Y
		end
	end, {
		if fFlagProfilePlatformMeTabScrollAwayModule then var23 else nil
	})
	
	if fFlagProfilePlatformMeTabScrollAwayModule then
		reactModule.useEffect(function() --[[ line: 116 ]]
			-- upvalues: var23 (ref), userInputService (copy), var24 (ref), visibilityControl (copy)
			if var23 then
				local touchStartedConnection = userInputService.TouchStarted:Connect(function() --[[ line: 120 ]]
					-- upvalues: var24 (copy)
					var24.current = true
				end)
				local touchEndedConnection = userInputService.TouchEnded:Connect(function() --[[ line: 123 ]]
					-- upvalues: var24 (copy), visibilityControl (copy)
					var24.current = false
					visibilityControl.onTouchEnded()
				end)
				
				return function() --[[ line: 127 ]]
					-- upvalues: touchStartedConnection (ref), touchEndedConnection (ref), visibilityControl (copy)
					touchStartedConnection:Disconnect()
					touchEndedConnection:Disconnect()
					visibilityControl.show()
				end
			end
			return function() --[[ line: 118 ]] end
		end, { var23 })
	end
	local frame = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = 1000,
		Size = UDim2.new(1, 0, 0, 56),
		Position = UDim2.fromOffset(0, 0),
		BackgroundColor3 = theme.BackgroundDefault.Color,
		BackgroundTransparency = if var22 then 0.1 else 1
	}, {
		DropShadow = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 2),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = theme.DropShadow.Color,
			BackgroundTransparency = if var22 then theme.DropShadow.Transparency else 1
		}),
		HeaderContent = reactModule.createElement(view, { tag = "padding-medium", Size = UDim2.fromScale(1, 1) }, {
			CloseButton = reactModule.createElement(iconButton, {
				icon = "icons/navigation/close",
				backgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				iconSize = iconSize.Medium,
				onActivated = p0.navigateBack
			})
		})
	})
	local createElement = reactModule.createElement
	createElement = createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, if var12 then 0 else 1),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.new(0, 0, 0, var19)
	}, {
		UIListLayout = if var12 then reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0)
		}) else nil,
		ConstrainedContent = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, if var12 then 0 else 1),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = if var12 then 1 else nil
		}, {
			UISizeConstraint = if var12 then reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var18, 1e999) }) else nil,
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = if fFlagAXEnableProfileTab and var15 then nil elseif var12 then UDim.new(0, var16) else nil,
				PaddingRight = if fFlagAXEnableProfileTab and var15 then nil elseif var12 then UDim.new(0, var16) else nil,
				PaddingTop = if fFlagAXEnableProfileTab and var15 then UDim.new(0, 24) elseif var12 then UDim.new(0, var17) else nil,
				PaddingBottom = UDim.new(0, var17)
			}),
			Content = p0.renderContent()
		})
	})
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = if fFlagAXEnableProfileTab then not var14 else true,
		useFullScalePage = if fFlagAXEnableProfileTab then var14 or nil else nil,
		BackgroundColor3 = theme.BackgroundDefault.Color,
		BackgroundTransparency = theme.BackgroundDefault.Transparency
	}, {
		ContentContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromOffset(0, 0)
		}, {
			ScrollingFrame = reactModule.createElement("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromOffset(0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				Selectable = false,
				ElasticBehavior = Enum.ElasticBehavior.Never,
				[reactModule.Change.CanvasPosition] = var26
			}, { ContentFrame = createElement })
		}),
		StickyHeader = if fFlagAXEnableProfileTab and var14 then nil else frame
	})
end