local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UIBloxModule = require(Parent.UIBlox)
local BaseMenu = UIBloxModule.App.Menu.BaseMenu
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local PlayerContextualMenuHeaderModule = require(script.Parent.PlayerContextualMenuHeader)
local config = { width = UDim.new(1, 0) }

return function(p1)
	-- upvalues: DashModule (copy), config (copy), UseCursorFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), PlayerContextualMenuHeaderModule (copy), BaseMenu (copy)
	local JoinResult = DashModule.join(config, p1)
	local UseCursorResult = UseCursorFunction()
	local UseDesignTokensResult = UseDesignTokensFunction(function(p2)
		return {
			overlayBackgroundColor3 = p2.Color.Common.Scrim.Color3,
			overlayBackgroundTransparency = p2.Color.Common.Scrim.Transparency,
			backgroundColor = p2.Color.Surface.Surface_0.Color3,
			backgroundTransparency = p2.Color.Surface.Surface_0.Transparency,
			menuCornerRadius = p2.Radius.Medium
		}
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	
	return ReactModule.createElement("Frame", {
		ZIndex = -1,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = UseDesignTokensResult.overlayBackgroundColor3,
		BackgroundTransparency = UseDesignTokensResult.overlayBackgroundTransparency
	}, {
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
			BaseMenu = ReactModule.createElement(BaseMenu, {
				topElementRounded = false,
				enableTokenOverride = true,
				buttonProps = JoinResult.buttonProps,
				width = JoinResult.width,
				renderHeader = ReactModule.useCallback(function()
					-- upvalues: ReactModule (upval), PlayerContextualMenuHeaderModule (upval), DashModule (upval), JoinResult (copy), UseStateResult2 (copy)
					return ReactModule.createElement(PlayerContextualMenuHeaderModule, DashModule.join(JoinResult.headerProps, { onHeaderHeightChanged = UseStateResult2 }))
				end, { JoinResult.headerProps }),
				headerHeight = UseStateResult
			})
		})
	})
end