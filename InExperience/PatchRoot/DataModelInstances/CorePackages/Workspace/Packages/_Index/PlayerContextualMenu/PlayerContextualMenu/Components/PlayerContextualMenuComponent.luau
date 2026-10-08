local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local dashModule = require(parent_1.Dash)
local foundationModule = require(parent_1.Foundation)
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local useDesignTokens = require(parent_1.Style).useDesignTokens
local UIBloxModule = require(parent_1.UIBlox)
local baseMenu = UIBloxModule.App.Menu.BaseMenu
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local playerContextualMenuHeaderModule = require(script.Parent.PlayerContextualMenuHeader)
local fFlagPlayerContextualMenuFitToViewportModule = require(parent.Flags.FFlagPlayerContextualMenuFitToViewport)

local function noop() end

local t = { width = UDim.new(1, 0) }

local function getCardLayout(p1, p2)
	local var1 = if p1.scaleReference > 0 then p1.scaleReference / 100 else 1
	local var2 = p1.container / var1
	local var3 = p1.content / var1
	local var4 = if var2 > 0 then math.max(var2 - p2.viewportMargin * 2, p2.minScrollHeight + p2.cornerRadius * 2) else 1e999
	local var5 = var4 < var3
	
	return {
		isContentMeasured = var3 > 0,
		isOverflowing = var5,
		height = if var5 then var4 else var3,
		inset = if var5 then p2.cornerRadius else 0
	}
end

local function useFitToViewport(p1, p2, p3)
	-- upvalues: reactModule (ref), dashModule (ref), getCardLayout (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), p2 (ref), p3 (ref)
		return {
			viewportMargin = p1,
			cornerRadius = p2,
			minScrollHeight = p3
		}
	end, { p1, p2, p3 })
	local var2, var3 = reactModule.useBinding({ container = 0, content = 0, scaleReference = 0 })
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useCallback(function(p4)
		-- upvalues: dashModule (copy), var2 (ref), var3 (ref), var5 (ref), getCardLayout (copy), var1 (ref)
		local var7 = dashModule.join(var2:getValue(), p4)
		var3(var7)
		var5(getCardLayout(var7, var1).isOverflowing)
	end, { var2, var1 })
	local var7 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), getCardLayout (copy), var1 (ref)
		return var2:map(function(p4)
			-- upvalues: getCardLayout (copy), var1 (copy)
			return getCardLayout(p4, var1)
		end)
	end, { var2, var1 })
	
	return {
		isOverflowing = var4,
		automaticSize = reactModule.useMemo(function()
			-- upvalues: var7 (ref)
			return var7:map(function(p4)
				return if p4.isContentMeasured then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
			end)
		end, { var7 }),
		scrollViewSize = reactModule.useMemo(function()
			-- upvalues: var7 (ref)
			return var7:map(function(p4)
				return UDim2.new(1, 0, 0, if p4.isContentMeasured then p4.height - p4.inset * 2 else 0)
			end)
		end, { var7 }),
		inset = reactModule.useMemo(function()
			-- upvalues: var7 (ref)
			return var7:map(function(p4)
				return UDim.new(0, p4.inset)
			end)
		end, { var7 }),
		onContainerAbsoluteSizeChanged = reactModule.useCallback(function(p4)
			-- upvalues: var6 (ref)
			var6({ container = p4.AbsoluteSize.Y })
		end, { var6 }),
		onContentAbsoluteSizeChanged = reactModule.useCallback(function(p4)
			-- upvalues: var6 (ref)
			var6({ content = p4.AbsoluteSize.Y })
		end, { var6 }),
		onScaleReferenceAbsoluteSizeChanged = reactModule.useCallback(function(p4)
			-- upvalues: var6 (ref)
			var6({ scaleReference = p4.AbsoluteSize.Y })
		end, { var6 })
	}
end

return function(p1)
	-- upvalues: dashModule (ref), t (ref), useCursor (ref), useDesignTokens (ref), reactModule (ref), fFlagPlayerContextualMenuFitToViewportModule (ref), useFitToViewport (ref), playerContextualMenuHeaderModule (ref), baseMenu (ref), scrollView (ref), view (ref), noop (ref)
	local var1 = dashModule.join(t, p1)
	local var2 = useCursor()
	local var3 = useDesignTokens(function(p2)
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
	local var4, var5 = reactModule.useState(0)
	local var6 = if fFlagPlayerContextualMenuFitToViewportModule then useFitToViewport(var3.viewportMargin, var3.menuCornerRadius, var3.minScrollHeight) else nil
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = var3.overlayBackgroundColor3,
		BackgroundTransparency = var3.overlayBackgroundTransparency,
		ZIndex = -1,
		[reactModule.Change.AbsoluteSize] = if var6 then var6.onContainerAbsoluteSizeChanged else nil
	}, {
		ScaleReference = if var6 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, 100),
			[reactModule.Change.AbsoluteSize] = var6.onScaleReferenceAbsoluteSizeChanged
		}) else nil,
		PositionFrame = reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			Text = "",
			ZIndex = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = var3.backgroundColor,
			BackgroundTransparency = var3.backgroundTransparency,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Selectable = #var1.buttonProps == 0,
			SelectionImageObject = var2,
			Size = UDim2.new(var1.width, UDim.new(0, 0))
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var3.menuCornerRadius) }),
			CardPadding = if var6 then reactModule.createElement("UIPadding", { PaddingTop = var6.inset, PaddingBottom = var6.inset }) else nil,
			BaseMenu = if var6 then nil else reactModule.createElement(baseMenu, {
				topElementRounded = false,
				enableTokenOverride = true,
				buttonProps = var1.buttonProps,
				width = var1.width,
				renderHeader = reactModule.useCallback(function()
					-- upvalues: reactModule (copy), playerContextualMenuHeaderModule (copy), dashModule (copy), var1 (ref), var5 (ref)
					return reactModule.createElement(playerContextualMenuHeaderModule, dashModule.join(var1.headerProps, { onHeaderHeightChanged = var5 }))
				end, { var1.headerProps }),
				headerHeight = var4
			}),
			CardScrollView = if var6 then reactModule.createElement(scrollView, {
				AutomaticSize = var6.automaticSize,
				Size = var6.scrollViewSize,
				scroll = {
					AutomaticSize = var6.automaticSize,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(),
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				selection = { Selectable = false }
			}, {
				Content = reactModule.createElement(view, {
					tag = "col size-full-0 auto-y",
					onAbsoluteSizeChanged = var6.onContentAbsoluteSizeChanged
				}, {
					HeaderFrame = reactModule.createElement(view, { LayoutOrder = 1, tag = "size-full-0 auto-y" }, {
						Header = reactModule.createElement(playerContextualMenuHeaderModule, dashModule.join(var1.headerProps, { onHeaderHeightChanged = noop }))
					}),
					BaseMenu = reactModule.createElement(baseMenu, {
						topElementRounded = false,
						enableTokenOverride = true,
						layoutOrder = 2,
						bottomElementRounded = not var6.isOverflowing,
						buttonProps = var1.buttonProps,
						width = var1.width
					})
				})
			}) else nil
		})
	})
end