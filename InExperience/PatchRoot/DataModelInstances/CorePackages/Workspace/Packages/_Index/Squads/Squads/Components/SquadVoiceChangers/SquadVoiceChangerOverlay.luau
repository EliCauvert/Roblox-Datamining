local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local FFlagSquadsEnableFoundationTestIdsModule = require(Squads.Flags.FFlagSquadsEnableFoundationTestIds)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local CryoModule = require(Parent.Cryo)
local UseNavigationFunction = require(Squads.dependencies).useNavigation
local SquadVoiceChangersModule = require(script.Parent.SquadVoiceChangers)
local config = {
	fillListWithExtraVoicePacks = false,
	enableTestingTheme = false
}

function SquadVoiceChangerOverlay(p1)
	-- upvalues: CryoModule (copy), config (copy), UseNavigationFunction (copy), ReactModule (copy), FoundationModule (copy), FFlagSquadsEnableFoundationTestIdsModule (copy), SquadVoiceChangersModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseNavigationResult = UseNavigationFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		if UseNavigationResult and UseNavigationResult.pop then
			UseNavigationResult.pop()
		end
	end, { UseNavigationResult })
	local WideModeScreenProps = UseNavigationResult.getScreenProps("wideMode", false)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		AbsorbInput = ReactModule.createElement(FoundationModule.View, {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			ZIndex = 1,
			tag = {
				["size-full anchor-center-center position-center-center"] = true,
				["bg-action-subtle"] = not JoinResult.enableTestingTheme,
				["bg-action-soft-emphasis"] = JoinResult.enableTestingTheme
			},
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = UseResult,
			testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-voice-changer-overlay--backdrop" else nil
		}),
		OverlayContainer = ReactModule.createElement(FoundationModule.View, {
			BorderSizePixel = 0,
			Selectable = true,
			ZIndex = 2,
			tag = {
				["bg-action-subtle no-clip"] = true,
				["anchor-center-center position-center-center"] = WideModeScreenProps,
				["anchor-bottom-center position-bottom-center"] = not WideModeScreenProps
			},
			Size = if WideModeScreenProps then UDim2.new(0.75, 0, 0.9, 0) else UDim2.new(1, 0, 0.9, 0),
			onActivated = function() end,
			testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-voice-changer-overlay" else nil
		}, {
			SquadVoiceChangers = ReactModule.createElement(SquadVoiceChangersModule, {
				closeSquadVoiceChangers = UseResult,
				fillListWithExtraVoicePacks = JoinResult.fillListWithExtraVoicePacks,
				enableTestingTheme = JoinResult.enableTestingTheme
			})
		})
	})
end

return SquadVoiceChangerOverlay