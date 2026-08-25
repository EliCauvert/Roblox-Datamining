local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useDesignTokens = require(parent.Style).useDesignTokens
local UIBloxModule = require(parent.UIBlox)
local baseMenu = UIBloxModule.App.Menu.BaseMenu
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local playerContextualMenuHeaderModule = require(script.Parent.PlayerContextualMenuHeader)
local t = { width = UDim.new(1, 0) }

return function(p0)
	-- upvalues: dashModule (ref), t (ref), useCursor (ref), useDesignTokens (ref), reactModule (ref), playerContextualMenuHeaderModule (ref), baseMenu (ref)
	local var5 = dashModule.join(t, p0)
	local var6 = useCursor()
	local var7 = useDesignTokens(function(p1)
		return {
			overlayBackgroundColor3 = p1.Color.Common.Scrim.Color3,
			overlayBackgroundTransparency = p1.Color.Common.Scrim.Transparency,
			backgroundColor = p1.Color.Surface.Surface_0.Color3,
			backgroundTransparency = p1.Color.Surface.Surface_0.Transparency,
			menuCornerRadius = p1.Radius.Medium
		}
	end)
	local var8, var9 = reactModule.useState(0)
	
	return reactModule.createElement("Frame", {
		ZIndex = -1,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = var7.overlayBackgroundColor3,
		BackgroundTransparency = var7.overlayBackgroundTransparency
	}, {
		PositionFrame = reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			Text = "",
			ZIndex = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = var7.backgroundColor,
			BackgroundTransparency = var7.backgroundTransparency,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Selectable = #var5.buttonProps == 0,
			SelectionImageObject = var6,
			Size = UDim2.new(var5.width, UDim.new(0, 0))
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var7.menuCornerRadius) }),
			BaseMenu = reactModule.createElement(baseMenu, {
				topElementRounded = false,
				enableTokenOverride = true,
				buttonProps = var5.buttonProps,
				width = var5.width,
				renderHeader = reactModule.useCallback(function()
					-- upvalues: reactModule (copy), playerContextualMenuHeaderModule (copy), dashModule (copy), var5 (ref), var9 (ref)
					return reactModule.createElement(playerContextualMenuHeaderModule, dashModule.join(var5.headerProps, { onHeaderHeightChanged = var9 }))
				end, { var5.headerProps }),
				headerHeight = var8
			})
		})
	})
end