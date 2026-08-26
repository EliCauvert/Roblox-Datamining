local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local fFlagChatLineReportingFocusFixesEnabled = require(parent.SharedFlags).FFlagChatLineReportingFocusFixesEnabled
local constantsModule = require(chatLineReporting.Common.Constants)
local t = {
	stiffness = 400,
	damping = 40,
	mass = 1,
	restingPositionLimit = 0.5,
	restingVelocityLimit = 0.1
}

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), useLocalization (ref), constantsModule (ref), reactOtterModule (ref), t (ref), fFlagChatLineReportingFocusFixesEnabled (ref), view (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(false)
	local var4 = useLocalization(constantsModule.ChatLineLocalizationKeys)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), p1 (ref)
		var3(p1.visible)
	end, { p1.visible })
	local var5, var6 = reactOtterModule.useAnimatedBinding(1, function() end)
	local var7 = reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		return if var2 then 0 else 1
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), reactOtterModule (copy), var7 (ref), t (copy)
		var6(reactOtterModule.spring(var7, t))
	end, { var7 })
	
	return reactModule.createElement("TextButton", {
		Active = var5:map(function(p2)
			return p2 == 0
		end),
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Selectable = if fFlagChatLineReportingFocusFixesEnabled then false else nil,
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		[reactModule.Event.Activated] = function()
			-- upvalues: var3 (ref)
			var3(false)
		end,
		ZIndex = var5:map(function(p2)
			return (1 - p2) * 4
		end)
	}, {
		InfoTextFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			ZIndex = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = var5:map(function(p2)
				return UDim2.new(1, 0, 0, 60):Lerp(UDim2.new(1, 0, 0, 0), p2)
			end)
		}, {
			InfoTextContainer = reactModule.createElement(view, {
				tag = "bg-over-media-0 radius-medium anchor-bottom-left position-bottom-left",
				Size = UDim2.new(1, 0, 1, -8)
			}, {
				InfoText = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					Font = var1.Typography.BodySmall.Font,
					Text = var4.InfoTextKey,
					TextColor3 = var1.Color.Content.Default.Color3,
					TextSize = var1.Typography.BodySmall.FontSize,
					Size = UDim2.new(1, 0, 1, 0)
				})
			})
		})
	})
end