local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useDesignTokens = require(parent.Style).useDesignTokens
local UIBloxModule = require(parent.UIBlox)
local baseMenu = UIBloxModule.App.Menu.BaseMenu
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local playerContextualMenuHeaderModule = require(script.Parent.PlayerContextualMenuHeader)
local t = { width = UDim.new(1, 0) }

return function(p1)
	-- upvalues: dashModule (ref), t (ref), useCursor (ref), useDesignTokens (ref), reactModule (ref), playerContextualMenuHeaderModule (ref), baseMenu (ref)
	local var1 = dashModule.join(t, p1)
	local var2 = useCursor()
	local var3 = useDesignTokens(function(p2)
		return {
			overlayBackgroundColor3 = p2.Color.Common.Scrim.Color3,
			overlayBackgroundTransparency = p2.Color.Common.Scrim.Transparency,
			backgroundColor = p2.Color.Surface.Surface_0.Color3,
			backgroundTransparency = p2.Color.Surface.Surface_0.Transparency,
			menuCornerRadius = p2.Radius.Medium
		}
	end)
	local var4, var5 = reactModule.useState(0)
	
	return reactModule.createElement("Frame", {
		ZIndex = -1,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = var3.overlayBackgroundColor3,
		BackgroundTransparency = var3.overlayBackgroundTransparency
	}, {
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
			BaseMenu = reactModule.createElement(baseMenu, {
				topElementRounded = false,
				enableTokenOverride = true,
				buttonProps = var1.buttonProps,
				width = var1.width,
				renderHeader = reactModule.useCallback(function()
					-- upvalues: reactModule (copy), playerContextualMenuHeaderModule (copy), dashModule (copy), var1 (ref), var5 (ref)
					return reactModule.createElement(playerContextualMenuHeaderModule, dashModule.join(var1.headerProps, { onHeaderHeightChanged = var5 }))
				end, { var1.headerProps }),
				headerHeight = var4
			})
		})
	})
end