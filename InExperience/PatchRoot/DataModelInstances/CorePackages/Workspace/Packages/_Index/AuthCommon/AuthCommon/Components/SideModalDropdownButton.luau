local Parent = script:FindFirstAncestor("AuthCommon").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local ControlState = FoundationModule.Enums.ControlState
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1) --[[ Line: 30 | Named "SideModalDropdown" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ControlState (copy), View (copy), Text (copy), Icon (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement(View, {
		Size = UDim2.new(if p1.fixSizeToParent then 1 else 0, 0, 0, p1.height or 40),
		tag = {
			["auto-x"] = not p1.fixSizeToParent,
			["radius-medium"] = true,
			["align-x-left"] = true,
			["align-y-center"] = true,
			["padding-xxsmall"] = true,
			["bg-shift-100"] = true
		},
		onStateChanged = ReactModule.useCallback(function(Hover) --[[ Line: 33 ]]
			-- upvalues: ControlState (upval), UseStateResult2 (copy)
			if Hover == ControlState.Hover then
				UseStateResult2(true)
				
				return
			else
				UseStateResult2(false)
			end
		end, { UseStateResult2 }),
		onActivated = p1.onActivated,
		backgroundStyle = p1.backgroundColorToken
	}, {
		UIStroke = ReactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = if p1.isDropdownError then UseTokensResult.Color.System.Alert.Color3 else UseTokensResult.Color.Stroke.Default.Color3,
			Transparency = if p1.isDropdownError then UseTokensResult.Color.System.Alert.Transparency elseif UseStateResult then UseTokensResult.Color.Stroke.Emphasis.Transparency else UseTokensResult.Color.Stroke.Default.Transparency,
			Thickness = UseTokensResult.Stroke.Standard
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Text = ReactModule.createElement(Text, {
			tag = "text-truncate-split padding-left-small",
			LayoutOrder = 0,
			Text = p1.text or "",
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, -40, 1, 0)
		}),
		IconContainer = ReactModule.createElement(View, { tag = "auto-xy padding-right-small", LayoutOrder = 1 }, {
			Icon = ReactModule.createElement(Icon, {
				name = "icons/actions/truncationExpand",
				LayoutOrder = 1,
				size = IconSize.Medium
			})
		})
	})
end