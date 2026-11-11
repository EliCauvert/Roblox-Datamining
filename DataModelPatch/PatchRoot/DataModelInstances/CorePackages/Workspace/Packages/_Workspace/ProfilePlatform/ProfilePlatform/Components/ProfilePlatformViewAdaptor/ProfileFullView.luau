local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseIsMeTabModule = require(ProfilePlatform.Hooks.useIsMeTab)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local VisibilityControl = require(Parent.AppNavBar).VisibilityControl
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FFlagProfilePlatformMeTabScrollAwayModule = require(ProfilePlatform.Flags.FFlagProfilePlatformMeTabScrollAway)
local View = FoundationModule.View
local IconButton = FoundationModule.IconButton
local IconSize = FoundationModule.Enums.IconSize
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseProfileFormFactorModule (copy), EnumsModule (copy), FFlagAXEnableProfileTab (copy), UseProfileWrapperContextModule (copy), UseIsMeTabModule (copy), UseProfileJsonComponentModule (copy), ConstantsModule (copy), ReactModule (copy), FFlagProfilePlatformMeTabScrollAwayModule (copy), VisibilityControl (copy), UserInputService (copy), View (copy), IconButton (copy), IconSize (copy), FullscreenPageWithSafeArea (copy)
	local Theme = UseStyleFunction().Theme
	local IsFormFactorMatch = UseProfileFormFactorModule().formFactor == EnumsModule.ProfileFormFactor.Wide
	local UseProfileWrapperContextModuleResult = if FFlagAXEnableProfileTab then UseProfileWrapperContextModule() else nil
	local IsForceFullView = if FFlagAXEnableProfileTab then UseProfileWrapperContextModuleResult.forceFullView == true else nil
	local UseIsMeTabModuleResult = if FFlagAXEnableProfileTab then UseIsMeTabModule() else nil
	local Offset: number = if IsFormFactorMatch then 36 else 16
	local Offset1: number = if IsFormFactorMatch then 24 else 16
	local X: number = if IsFormFactorMatch and (not FFlagAXEnableProfileTab or not UseIsMeTabModuleResult) then 1018 else 1e999
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.CoverPhoto) or {}
	local Negated = if IsForceFullView then 0 elseif UseProfileJsonComponentModuleResult.coverPhotoId == nil then 56 else -ConstantsModule.PAGE_PADDING
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local IsUseStateResultAbove = UseStateResult > 50
	local IsForceFullView1 = if FFlagProfilePlatformMeTabScrollAwayModule then IsForceFullView else nil
	local UseRefResult = if FFlagProfilePlatformMeTabScrollAwayModule then ReactModule.useRef(false) else nil
	local UseRefResult1 = if FFlagProfilePlatformMeTabScrollAwayModule then ReactModule.useRef(0) else nil
	local UseResult = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseStateResult2 (copy), IsForceFullView1 (copy), UseRefResult (copy), UseRefResult1 (copy), VisibilityControl (upval)
		local CanvasPosition = ScrollFrame.CanvasPosition
		UseStateResult2((math.abs(CanvasPosition.Y)))
		
		if IsForceFullView1 then
			if UseRefResult.current then
				local YDelta = CanvasPosition.Y - UseRefResult1.current
				
				if YDelta ~= 0 then
					VisibilityControl.onTouchMoved(-YDelta)
				end
			end
			UseRefResult1.current = CanvasPosition.Y
		end
	end, {
		if FFlagProfilePlatformMeTabScrollAwayModule then IsForceFullView1 else nil
	})
	
	if FFlagProfilePlatformMeTabScrollAwayModule then
		ReactModule.useEffect(function()
			-- upvalues: IsForceFullView1 (copy), UserInputService (upval), UseRefResult (copy), VisibilityControl (upval)
			if IsForceFullView1 then
				local TouchStartedConnection = UserInputService.TouchStarted:Connect(function()
					-- upvalues: UseRefResult (upval)
					UseRefResult.current = true
				end)
				local TouchEndedConnection = UserInputService.TouchEnded:Connect(function()
					-- upvalues: UseRefResult (upval), VisibilityControl (upval)
					UseRefResult.current = false
					VisibilityControl.onTouchEnded()
				end)
				
				return function()
					-- upvalues: TouchStartedConnection (copy), TouchEndedConnection (copy), VisibilityControl (upval)
					TouchStartedConnection:Disconnect()
					TouchEndedConnection:Disconnect()
					VisibilityControl.show()
				end
			else
				return function() end
			end
		end, { IsForceFullView1 })
	end
	local Frame = ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = 1000,
		Size = UDim2.new(1, 0, 0, 56),
		Position = UDim2.fromOffset(0, 0),
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = if IsUseStateResultAbove then 0.1 else 1
	}, {
		DropShadow = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 2),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = Theme.DropShadow.Color,
			BackgroundTransparency = if IsUseStateResultAbove then Theme.DropShadow.Transparency else 1
		}),
		HeaderContent = ReactModule.createElement(View, { tag = "padding-medium", Size = UDim2.fromScale(1, 1) }, {
			CloseButton = ReactModule.createElement(IconButton, {
				icon = "icons/navigation/close",
				backgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				iconSize = IconSize.Medium,
				onActivated = p1.navigateBack
			})
		})
	})
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = not FFlagAXEnableProfileTab or not IsForceFullView,
		useFullScalePage = FFlagAXEnableProfileTab and IsForceFullView or nil,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency
	}, {
		ContentContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromOffset(0, 0)
		}, {
			ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
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
				[ReactModule.Change.CanvasPosition] = UseResult
			}, {
				ContentFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromScale(1, if IsFormFactorMatch then 0 else 1),
					AutomaticSize = Enum.AutomaticSize.Y,
					Position = UDim2.new(0, 0, 0, Negated)
				}, {
					UIListLayout = if IsFormFactorMatch then ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 0)
					}) else nil,
					ConstrainedContent = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.fromScale(1, if IsFormFactorMatch then 0 else 1),
						AutomaticSize = Enum.AutomaticSize.Y,
						LayoutOrder = if IsFormFactorMatch then 1 else nil
					}, {
						UISizeConstraint = if IsFormFactorMatch then ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(X, 1e999) }) else nil,
						UIPadding = ReactModule.createElement("UIPadding", {
							PaddingLeft = if FFlagAXEnableProfileTab and UseIsMeTabModuleResult then nil elseif IsFormFactorMatch then UDim.new(0, Offset) else nil,
							PaddingRight = if FFlagAXEnableProfileTab and UseIsMeTabModuleResult then nil elseif IsFormFactorMatch then UDim.new(0, Offset) else nil,
							PaddingTop = if FFlagAXEnableProfileTab and UseIsMeTabModuleResult then UDim.new(0, 24) elseif IsFormFactorMatch then UDim.new(0, Offset1) else nil,
							PaddingBottom = UDim.new(0, Offset1)
						}),
						Content = p1.renderContent()
					})
				})
			})
		}),
		StickyHeader = if FFlagAXEnableProfileTab and IsForceFullView then nil else Frame
	})
end