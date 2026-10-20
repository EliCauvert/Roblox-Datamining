local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local DashModule = require(Parent1.Dash)
local FoundationModule = require(Parent1.Foundation)
local ScrollView = FoundationModule.ScrollView
local View = FoundationModule.View
local UseDesignTokensFunction = require(Parent1.Style).useDesignTokens
local UIBloxModule = require(Parent1.UIBlox)
local BaseMenu = UIBloxModule.App.Menu.BaseMenu
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local PlayerContextualMenuHeaderModule = require(script.Parent.PlayerContextualMenuHeader)
local FFlagPlayerContextualMenuFitToViewportModule = require(Parent.Flags.FFlagPlayerContextualMenuFitToViewport)

local function noop() end

local config = { width = UDim.new(1, 0) }

local function getCardLayout(JoinResult, UseMemoResult)
	local ScaleReferenceRatio = if JoinResult.scaleReference > 0 then JoinResult.scaleReference / 100 else 1
	local ContainerRatio = JoinResult.container / ScaleReferenceRatio
	local ContentRatio = JoinResult.content / ScaleReferenceRatio
	local NewMinScrollHeight = UseMemoResult.minScrollHeight + UseMemoResult.cornerRadius * 2
	local Largest: number = if ContainerRatio > 0 then math.max(ContainerRatio - UseMemoResult.viewportMargin * 2, NewMinScrollHeight) else 1e999
	local IsLargestBelow = Largest < ContentRatio
	
	return {
		isContentMeasured = ContentRatio > 0,
		isOverflowing = IsLargestBelow,
		height = if IsLargestBelow then Largest else ContentRatio,
		inset = if IsLargestBelow then UseMemoResult.cornerRadius else 0
	}
end

local function useFitToViewport(ViewportMargin, CornerRadius, MinScrollHeight)
	-- upvalues: ReactModule (copy), DashModule (copy), getCardLayout (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ViewportMargin (copy), CornerRadius (copy), MinScrollHeight (copy)
		return {
			viewportMargin = ViewportMargin,
			cornerRadius = CornerRadius,
			minScrollHeight = MinScrollHeight
		}
	end, { ViewportMargin, CornerRadius, MinScrollHeight })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding({ container = 0, content = 0, scaleReference = 0 })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: DashModule (upval), UseBindingResult (copy), UseBindingResult2 (copy), UseStateResult2 (copy), getCardLayout (upval), UseMemoResult (copy)
		local JoinResult = DashModule.join(UseBindingResult:getValue(), p1)
		UseBindingResult2(JoinResult)
		UseStateResult2(getCardLayout(JoinResult, UseMemoResult).isOverflowing)
	end, { UseBindingResult, UseMemoResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult (copy), getCardLayout (upval), UseMemoResult (copy)
		return UseBindingResult:map(function(p1)
			-- upvalues: getCardLayout (upval), UseMemoResult (upval)
			return (getCardLayout(p1, UseMemoResult))
		end)
	end, { UseBindingResult, UseMemoResult })
	
	return {
		isOverflowing = UseStateResult,
		automaticSize = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult1 (copy)
			return UseMemoResult1:map(function(p1)
				return if p1.isContentMeasured then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
			end)
		end, { UseMemoResult1 }),
		scrollViewSize = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult1 (copy)
			return UseMemoResult1:map(function(CardLayout): UDim2
				return UDim2.new(1, 0, 0, if CardLayout.isContentMeasured then CardLayout.height - CardLayout.inset * 2 else 0)
			end)
		end, { UseMemoResult1 }),
		inset = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult1 (copy)
			return UseMemoResult1:map(function(p1): UDim
				return UDim.new(0, p1.inset)
			end)
		end, { UseMemoResult1 }),
		onContainerAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseResult (copy)
			UseResult({ container = Frame.AbsoluteSize.Y })
		end, { UseResult }),
		onContentAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseResult (copy)
			UseResult({ content = Frame.AbsoluteSize.Y })
		end, { UseResult }),
		onScaleReferenceAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseResult (copy)
			UseResult({ scaleReference = Frame.AbsoluteSize.Y })
		end, { UseResult })
	}
end

return function(p1)
	-- upvalues: DashModule (copy), config (copy), UseCursorFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), FFlagPlayerContextualMenuFitToViewportModule (copy), useFitToViewport (copy), PlayerContextualMenuHeaderModule (copy), BaseMenu (copy), ScrollView (copy), View (copy), noop (copy)
	local JoinResult = DashModule.join(config, p1)
	local UseCursorResult = UseCursorFunction()
	local UseDesignTokensResult = UseDesignTokensFunction(function(p2)
		return {
			overlayBackgroundColor3 = p2.Color.Common.Scrim.Color3,
			overlayBackgroundTransparency = p2.Color.Common.Scrim.Transparency,
			backgroundColor = p2.Color.Surface.Surface_0.Color3,
			backgroundTransparency = p2.Color.Surface.Surface_0.Transparency,
			menuCornerRadius = p2.Radius.Medium,
			viewportMargin = p2.Size.Size_400,
			minScrollHeight = p2.Size.Size_1400
		}
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseFitToViewportResult = if FFlagPlayerContextualMenuFitToViewportModule then useFitToViewport(UseDesignTokensResult.viewportMargin, UseDesignTokensResult.menuCornerRadius, UseDesignTokensResult.minScrollHeight) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), PlayerContextualMenuHeaderModule (upval), DashModule (upval), JoinResult (copy), UseStateResult2 (copy)
		return ReactModule.createElement(PlayerContextualMenuHeaderModule, DashModule.join(JoinResult.headerProps, { onHeaderHeightChanged = UseStateResult2 }))
	end, { JoinResult.headerProps })
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = UseDesignTokensResult.overlayBackgroundColor3,
		BackgroundTransparency = UseDesignTokensResult.overlayBackgroundTransparency,
		ZIndex = -1,
		[ReactModule.Change.AbsoluteSize] = if UseFitToViewportResult then UseFitToViewportResult.onContainerAbsoluteSizeChanged else nil
	}, {
		ScaleReference = if UseFitToViewportResult then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, 100),
			[ReactModule.Change.AbsoluteSize] = UseFitToViewportResult.onScaleReferenceAbsoluteSizeChanged
		}) else nil,
		PositionFrame = ReactModule.createElement("TextButton", {
			AutoButtonColor = false,
			Text = "",
			ZIndex = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = UseDesignTokensResult.backgroundColor,
			BackgroundTransparency = UseDesignTokensResult.backgroundTransparency,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Selectable = #JoinResult.buttonProps == 0,
			SelectionImageObject = UseCursorResult,
			Size = UDim2.new(JoinResult.width, UDim.new(0, 0))
		}, {
			Corner = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseDesignTokensResult.menuCornerRadius)
			}),
			CardPadding = if UseFitToViewportResult then ReactModule.createElement("UIPadding", {
				PaddingTop = UseFitToViewportResult.inset,
				PaddingBottom = UseFitToViewportResult.inset
			}) else nil,
			BaseMenu = if UseFitToViewportResult then nil else ReactModule.createElement(BaseMenu, {
				topElementRounded = false,
				enableTokenOverride = true,
				buttonProps = JoinResult.buttonProps,
				width = JoinResult.width,
				renderHeader = UseResult,
				headerHeight = UseStateResult
			}),
			CardScrollView = if UseFitToViewportResult then ReactModule.createElement(ScrollView, {
				AutomaticSize = UseFitToViewportResult.automaticSize,
				Size = UseFitToViewportResult.scrollViewSize,
				scroll = {
					AutomaticSize = UseFitToViewportResult.automaticSize,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(),
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				selection = { Selectable = false }
			}, {
				Content = ReactModule.createElement(View, {
					tag = "col size-full-0 auto-y",
					onAbsoluteSizeChanged = UseFitToViewportResult.onContentAbsoluteSizeChanged
				}, {
					HeaderFrame = ReactModule.createElement(View, { LayoutOrder = 1, tag = "size-full-0 auto-y" }, {
						Header = ReactModule.createElement(PlayerContextualMenuHeaderModule, DashModule.join(JoinResult.headerProps, { onHeaderHeightChanged = noop }))
					}),
					BaseMenu = ReactModule.createElement(BaseMenu, {
						topElementRounded = false,
						enableTokenOverride = true,
						layoutOrder = 2,
						bottomElementRounded = not UseFitToViewportResult.isOverflowing,
						buttonProps = JoinResult.buttonProps,
						width = JoinResult.width
					})
				})
			}) else nil
		})
	})
end