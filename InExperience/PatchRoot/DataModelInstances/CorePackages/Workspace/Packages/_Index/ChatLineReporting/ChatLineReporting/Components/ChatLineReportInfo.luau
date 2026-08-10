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

return function(p0) --[[ line: 32 | named "ChatLineReportInfo" ]]
	-- upvalues: useTokens (ref), reactModule (ref), useLocalization (ref), constantsModule (ref), reactOtterModule (ref), t (ref), fFlagChatLineReportingFocusFixesEnabled (ref), view (ref)
	local var6 = useTokens()
	local var7, var8 = reactModule.useState(false)
	local var9 = useLocalization(constantsModule.ChatLineLocalizationKeys)
	reactModule.useEffect(function() --[[ line: 38 ]]
		-- upvalues: var8 (ref), p0 (ref)
		var8(p0.visible)
	end, { p0.visible })
	local var10, var11 = reactOtterModule.useAnimatedBinding(1, function() --[[ line: 42 ]] end)
	local var12 = reactModule.useMemo(function() --[[ line: 44 ]]
		-- upvalues: var7 (ref)
		return if var7 then 0 else 1
	end, { var7 })
	reactModule.useEffect(function() --[[ line: 48 ]]
		-- upvalues: var11 (ref), reactOtterModule (copy), var12 (ref), t (copy)
		var11(reactOtterModule.spring(var12, t))
	end, { var12 })
	
	return reactModule.createElement("TextButton", {
		Active = var10:map(function(p1) --[[ line: 53 ]]
			return p1 == 0
		end),
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Selectable = if fFlagChatLineReportingFocusFixesEnabled then false else nil,
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		[reactModule.Event.Activated] = function() --[[ line: 62 ]]
			-- upvalues: var8 (ref)
			var8(false)
		end,
		ZIndex = var10:map(function(p2) --[[ line: 66 ]]
			return (1 - p2) * 4
		end)
	}, {
		InfoTextFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			ZIndex = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = var10:map(function(p3) --[[ line: 74 ]]
				return UDim2.new(1, 0, 0, 60):Lerp(UDim2.new(1, 0, 0, 0), p3)
			end)
		}, {
			InfoTextContainer = reactModule.createElement(view, {
				tag = "bg-over-media-0 radius-medium anchor-bottom-left position-bottom-left",
				Size = UDim2.new(1, 0, 1, -8)
			}, {
				InfoText = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					Font = var6.Typography.BodySmall.Font,
					Text = var9.InfoTextKey,
					TextColor3 = var6.Color.Content.Default.Color3,
					TextSize = var6.Typography.BodySmall.FontSize,
					Size = UDim2.new(1, 0, 1, 0)
				})
			})
		})
	})
end