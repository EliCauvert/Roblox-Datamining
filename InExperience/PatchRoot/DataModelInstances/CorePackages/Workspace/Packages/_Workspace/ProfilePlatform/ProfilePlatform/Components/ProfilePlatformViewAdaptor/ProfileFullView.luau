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

return function(p1)
	-- upvalues: useStyle (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagAXEnableProfileTab (ref), useProfileWrapperContextModule (ref), useIsMeTabModule (ref), useProfileJsonComponentModule (ref), constantsModule (ref), reactModule (ref), fFlagProfilePlatformMeTabScrollAwayModule (ref), visibilityControl (ref), userInputService (ref), view (ref), iconButton (ref), iconSize (ref), fullscreenPageWithSafeArea (ref)
	local var1
	local theme = useStyle().Theme
	local var2 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local var3 = if fFlagAXEnableProfileTab then useProfileWrapperContextModule() else nil
	
	if fFlagAXEnableProfileTab then
		var1 = var3.forceFullView == true
		var1 = nil
	else
		var1 = nil
	end
	local var4 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	local var5 = if var2 then 36 else 16
	local var6 = if var2 then 24 else 16
	local var7 = if var2 and (not fFlagAXEnableProfileTab or not var4) then 1018 else 1e999
	local var8 = if var1 then 0 elseif (useProfileJsonComponentModule(enumsModule.Components.CoverPhoto) or {}).coverPhotoId ~= nil then 56 else -constantsModule.PAGE_PADDING
	local var9, var10 = reactModule.useState(0)
	local var11 = var9 > 50
	local var12 = if fFlagProfilePlatformMeTabScrollAwayModule then var1 else nil
	local var13 = if fFlagProfilePlatformMeTabScrollAwayModule then reactModule.useRef(false) else nil
	local var14 = if fFlagProfilePlatformMeTabScrollAwayModule then reactModule.useRef(0) else nil
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref), var12 (ref), var13 (ref), var14 (ref), visibilityControl (copy)
		local canvasPosition = p2.CanvasPosition
		var10(math.abs(canvasPosition.Y))
		
		if var12 then
			if var13.current then
				local var16 = canvasPosition.Y - var14.current
				
				if var16 ~= 0 then
					visibilityControl.onTouchMoved(-var16)
				end
			end
			var14.current = canvasPosition.Y
		end
	end, {
		if fFlagProfilePlatformMeTabScrollAwayModule then var12 else nil
	})
	
	if fFlagProfilePlatformMeTabScrollAwayModule then
		reactModule.useEffect(function()
			-- upvalues: var12 (ref), userInputService (copy), var13 (ref), visibilityControl (copy)
			if var12 then
				local touchStartedConnection = userInputService.TouchStarted:Connect(function()
					-- upvalues: var13 (copy)
					var13.current = true
				end)
				local touchEndedConnection = userInputService.TouchEnded:Connect(function()
					-- upvalues: var13 (copy), visibilityControl (copy)
					var13.current = false
					visibilityControl.onTouchEnded()
				end)
				
				return function()
					-- upvalues: touchStartedConnection (ref), touchEndedConnection (ref), visibilityControl (copy)
					touchStartedConnection:Disconnect()
					touchEndedConnection:Disconnect()
					visibilityControl.show()
				end
			end
			return function() end
		end, { var12 })
	end
	local frame = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = 1000,
		Size = UDim2.new(1, 0, 0, 56),
		Position = UDim2.fromOffset(0, 0),
		BackgroundColor3 = theme.BackgroundDefault.Color,
		BackgroundTransparency = if var11 then 0.1 else 1
	}, {
		DropShadow = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 2),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = theme.DropShadow.Color,
			BackgroundTransparency = if var11 then theme.DropShadow.Transparency else 1
		}),
		HeaderContent = reactModule.createElement(view, { tag = "padding-medium", Size = UDim2.fromScale(1, 1) }, {
			CloseButton = reactModule.createElement(iconButton, {
				icon = "icons/navigation/close",
				backgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				iconSize = iconSize.Medium,
				onActivated = p1.navigateBack
			})
		})
	})
	local createElement = reactModule.createElement
	createElement = createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, if var2 then 0 else 1),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.new(0, 0, 0, var8)
	}, {
		UIListLayout = if var2 then reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0)
		}) else nil,
		ConstrainedContent = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, if var2 then 0 else 1),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = if var2 then 1 else nil
		}, {
			UISizeConstraint = if var2 then reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var7, 1e999) }) else nil,
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = if fFlagAXEnableProfileTab and var4 then nil elseif var2 then UDim.new(0, var5) else nil,
				PaddingRight = if fFlagAXEnableProfileTab and var4 then nil elseif var2 then UDim.new(0, var5) else nil,
				PaddingTop = if fFlagAXEnableProfileTab and var4 then UDim.new(0, 24) elseif var2 then UDim.new(0, var6) else nil,
				PaddingBottom = UDim.new(0, var6)
			}),
			Content = p1.renderContent()
		})
	})
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = if fFlagAXEnableProfileTab then not var1 else true,
		useFullScalePage = if fFlagAXEnableProfileTab then var1 or nil else nil,
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
				[reactModule.Change.CanvasPosition] = var15
			}, { ContentFrame = createElement })
		}),
		StickyHeader = if fFlagAXEnableProfileTab and var1 then nil else frame
	})
end