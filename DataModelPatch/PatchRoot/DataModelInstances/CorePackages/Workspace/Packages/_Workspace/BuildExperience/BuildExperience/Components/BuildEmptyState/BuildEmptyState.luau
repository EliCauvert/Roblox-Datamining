local Parent = script:FindFirstAncestor("BuildExperience").Parent
local Players = game:GetService("Players")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), Players (copy), ReactModule (copy), View (copy), Icon (copy), IconName (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local Name = if Players.LocalPlayer then Players.LocalPlayer.Name else ""
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-small auto-xy",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "BuildEmptyState"
	}, {
		Nebula = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = IconName.Nebula,
			size = UseTokensResult.Size.Size_1400,
			style = UseTokensResult.Color.Content.Emphasis
		}),
		Headings = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-center gap-xxsmall auto-xy"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = ReactModule.useMemo(function(): string
					-- upvalues: Name (copy)
					return if Name == "" then "Hi" else `Hi, {Name}`
				end, { Name })
			}),
			Subline = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				Text = "What do you want to build today?",
				tag = "auto-xy text-body-medium content-default"
			})
		})
	})
end