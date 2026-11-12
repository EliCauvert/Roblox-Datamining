local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Parent = ChatLineReporting.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ConstantsModule = require(ChatLineReporting.Common.Constants)
local config = {
	stiffness = 400,
	damping = 40,
	mass = 1,
	restingPositionLimit = 0.5,
	restingVelocityLimit = 0.1
}

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), ReactOtterModule (copy), config (copy), View (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.ChatLineLocalizationKeys)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(p1.visible)
	end, { p1.visible })
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1, function() end)
	local UseMemoResult = ReactModule.useMemo(function(): number
		-- upvalues: UseStateResult (copy)
		return if UseStateResult then 0 else 1
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseMemoResult (copy), config (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(UseMemoResult, config))
	end, { UseMemoResult })
	
	return ReactModule.createElement("TextButton", {
		Active = UseAnimatedBindingResult:map(function(p2): boolean
			return p2 == 0
		end),
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		[ReactModule.Event.Activated] = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end,
		ZIndex = UseAnimatedBindingResult:map(function(p2: number): number
			return (1 - p2) * 4
		end)
	}, {
		InfoTextFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			ZIndex = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UseAnimatedBindingResult:map(function(Alpha)
				return UDim2.new(1, 0, 0, 60):Lerp(UDim2.new(1, 0, 0, 0), Alpha)
			end)
		}, {
			InfoTextContainer = ReactModule.createElement(View, {
				tag = "bg-over-media-0 radius-medium anchor-bottom-left position-bottom-left",
				Size = UDim2.new(1, 0, 1, -8)
			}, {
				InfoText = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					Font = if FoundationFontFaceMigration then nil else UseTokensResult.Typography.BodySmall.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodySmall.Font) else nil,
					Text = UseLocalizationResult.InfoTextKey,
					TextColor3 = UseTokensResult.Color.Content.Default.Color3,
					TextSize = UseTokensResult.Typography.BodySmall.FontSize,
					Size = UDim2.new(1, 0, 1, 0)
				})
			})
		})
	})
end