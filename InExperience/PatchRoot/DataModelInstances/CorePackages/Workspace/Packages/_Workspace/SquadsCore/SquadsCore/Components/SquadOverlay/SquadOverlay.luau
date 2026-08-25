local parent = script:FindFirstAncestor("SquadsCore").Parent
local cryoModule = require(parent.Cryo)
local squadPromptModule = require(script.Parent.SquadPrompt)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useTokens = foundationModule.Hooks.useTokens

function SquadOverlay()
	-- upvalues: useTokens (ref), reactModule (ref), useSelector (ref), squadPromptModule (ref), cryoModule (ref)
	local var4 = useTokens()
	local var5, var6 = reactModule.useState(Vector2.new(0, 0))
	
	return reactModule.createElement("ScreenGui", {
		Enabled = true,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = 12,
		[reactModule.Change.AbsoluteSize] = function(p0)
			-- upvalues: var6 (ref)
			var6(p0.AbsoluteSize)
		end
	}, {
		Overlay = reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			Text = "",
			BackgroundColor3 = var4.Color.Extended.Black.Black_70.Color3,
			BackgroundTransparency = var4.Color.Extended.Black.Black_70.Transparency,
			Size = UDim2.new(1, 0, 1, 0)
		}),
		SquadPrompt = reactModule.createElement(squadPromptModule, cryoModule.Dictionary.join(useSelector(function(p1)
			return p1.Squad.SquadPrompt.arguments
		end), { screenSize = var5 }))
	})
end

return SquadOverlay