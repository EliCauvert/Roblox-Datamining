local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens

local function GenericText(Label)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local _UDim = UDim.new(0, UseDesignTokensResult.Size.Size_600)
	local TypographyEntry = UseDesignTokensResult.Semantic.Typography[Label.type]
	local Emphasis = if Label.emphasis then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Color.Content.Default
	local Padding = Label.padding or _UDim
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = Label.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = ReactModule.createElement("UIPadding", { PaddingLeft = Padding, PaddingRight = Padding }),
		Text = ReactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			TextWrapped = true,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = Label.text,
			Font = TypographyEntry.Font,
			TextColor3 = Emphasis.Color3,
			TextTransparency = Emphasis.Transparency,
			TextSize = TypographyEntry.FontSize,
			TextXAlignment = Label.TextXAlignment or Enum.TextXAlignment.Left,
			TextYAlignment = Label.TextYAlignment or Enum.TextYAlignment.Center,
			Size = Label.size or UDim2.new(1, 0, 1, 0)
		})
	})
end

return {
	HeaderText = function(p1)
		-- upvalues: ReactModule (copy), GenericText (copy), DashModule (copy)
		return ReactModule.createElement(GenericText, DashModule.join(p1, {
			type = "Header",
			emphasis = true,
			padding = UDim.new(0, 0)
		}))
	end,
	SubheaderText = function(p1)
		-- upvalues: ReactModule (copy), GenericText (copy), DashModule (copy)
		return ReactModule.createElement(GenericText, DashModule.join(p1, { type = "Subheader", emphasis = true }))
	end,
	BodyText = function(p1)
		-- upvalues: ReactModule (copy), GenericText (copy), DashModule (copy)
		return ReactModule.createElement(GenericText, DashModule.join(p1, { type = "Body", emphasis = false }))
	end,
	BoldBodyText = function(p1)
		-- upvalues: ReactModule (copy), GenericText (copy), DashModule (copy)
		return ReactModule.createElement(GenericText, DashModule.join(p1, { type = "Header", emphasis = false }))
	end
}