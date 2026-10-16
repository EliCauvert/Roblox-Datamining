local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ThemeModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Theme)
local Semibold = ThemeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
local TextSizeResult = ThemeModule.textSize(19)
local _Color3 = Color3.fromRGB(222, 225, 227)
local _Color3_1 = Color3.fromRGB(255, 255, 255)
local ShareButton = RoactModule.PureComponent:extend("ShareButton")

function ShareButton.init(p1) --[[ Line: 14 ]]
	p1.state = { isHovering = false }
end

function ShareButton.render(p1) --[[ Line: 20 ]]
	-- upvalues: RoactModule (copy), _Color3 (copy), _Color3_1 (copy), ThemeModule (copy), TextSizeResult (copy), Semibold (copy)
	local OnShareFunction = p1.props.onShare
	local IsEnabled = p1.props.isEnabled
	
	return RoactModule.createElement("TextButton", {
		LayoutOrder = p1.props.layoutOrder,
		Size = p1.props.size,
		Text = p1.props.text,
		TextSize = TextSizeResult,
		Font = Semibold,
		AutoButtonColor = false,
		BackgroundColor3 = if p1.state.isHovering and IsEnabled then _Color3 else _Color3_1,
		Transparency = if IsEnabled then 0 else 0.5,
		[RoactModule.Event.Activated] = function() --[[ Line: 48 ]]
			-- upvalues: IsEnabled (copy), OnShareFunction (copy)
			if IsEnabled then
				OnShareFunction()
			end
		end,
		[RoactModule.Event.InputBegan] = function() --[[ Line: 53 ]]
			-- upvalues: p1 (copy)
			p1:setState({ isHovering = true })
		end,
		[RoactModule.Event.InputEnded] = function() --[[ Line: 56 ]]
			-- upvalues: p1 (copy)
			p1:setState({ isHovering = false })
		end
	}, {
		Border = RoactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = if p1.state.isHovering and IsEnabled then _Color3 else _Color3_1,
			Thickness = ThemeModule.DefaultStokeThickness,
			Transparency = if IsEnabled then 0 else 0.5
		}),
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = ThemeModule.DefaultCornerRadius })
	})
end

return ShareButton