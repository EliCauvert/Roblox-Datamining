local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local themeModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Theme)
local semibold = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
local var1 = themeModule.textSize(19)
local color = Color3.fromRGB(222, 225, 227)
local color_1 = Color3.fromRGB(255, 255, 255)
local shareButton = roactModule.PureComponent:extend("ShareButton")

function shareButton.init(p1)
	p1.state = { isHovering = false }
end

function shareButton.render(p1)
	-- upvalues: roactModule (ref), color (ref), color_1 (ref), themeModule (ref), var1 (ref), semibold (ref)
	local size = p1.props.size
	local layoutOrder = p1.props.layoutOrder
	local onShare = p1.props.onShare
	local isEnabled = p1.props.isEnabled
	
	return roactModule.createElement("TextButton", {
		LayoutOrder = layoutOrder,
		Size = size,
		Text = p1.props.text,
		TextSize = var1,
		Font = semibold,
		AutoButtonColor = false,
		BackgroundColor3 = if p1.state.isHovering and isEnabled then color else color_1,
		Transparency = if isEnabled then 0 else 0.5,
		[roactModule.Event.Activated] = function()
			-- upvalues: isEnabled (ref), onShare (ref)
			if isEnabled then
				onShare()
			end
		end,
		[roactModule.Event.InputBegan] = function()
			-- upvalues: p1 (ref)
			p1:setState({ isHovering = true })
		end,
		[roactModule.Event.InputEnded] = function()
			-- upvalues: p1 (ref)
			p1:setState({ isHovering = false })
		end
	}, {
		Border = roactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = if p1.state.isHovering and isEnabled then color else color_1,
			Thickness = themeModule.DefaultStokeThickness,
			Transparency = if isEnabled then 0 else 0.5
		}),
		UICorner = roactModule.createElement("UICorner", { CornerRadius = themeModule.DefaultCornerRadius })
	})
end

return shareButton