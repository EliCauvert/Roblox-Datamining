local Parent = script:FindFirstAncestor("SquadsCore").Parent
local CryoModule = require(Parent.Cryo)
local SquadPromptModule = require(script.Parent.SquadPrompt)
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

function SquadOverlay()
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseSelectorFunction (copy), SquadPromptModule (copy), CryoModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	
	return ReactModule.createElement("ScreenGui", {
		Enabled = true,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = 12,
		[ReactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize)
		end
	}, {
		Overlay = ReactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			Text = "",
			BackgroundColor3 = UseTokensResult.Color.Extended.Black.Black_70.Color3,
			BackgroundTransparency = UseTokensResult.Color.Extended.Black.Black_70.Transparency,
			Size = UDim2.new(1, 0, 1, 0)
		}),
		SquadPrompt = ReactModule.createElement(SquadPromptModule, CryoModule.Dictionary.join(UseSelectorFunction(function(p1)
			return p1.Squad.SquadPrompt.arguments
		end), { screenSize = UseStateResult }))
	})
end

return SquadOverlay