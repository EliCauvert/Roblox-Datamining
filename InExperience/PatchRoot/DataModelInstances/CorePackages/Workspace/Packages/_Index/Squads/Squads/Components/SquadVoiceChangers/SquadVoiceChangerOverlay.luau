local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local dependenciesModule = require(squads.dependencies)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local cryoModule = require(parent.Cryo)
local useNavigation = dependenciesModule.useNavigation
local squadVoiceChangersModule = require(script.Parent.SquadVoiceChangers)
local t = {
	fillListWithExtraVoicePacks = false,
	enableTestingTheme = false
}

function SquadVoiceChangerOverlay(p0) --[[ line: 25 ]]
	-- upvalues: cryoModule (ref), t (ref), useNavigation (ref), reactModule (ref), foundationModule (ref), squadVoiceChangersModule (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	local var8 = useNavigation()
	local var9 = reactModule.useCallback(function() --[[ line: 29 ]]
		-- upvalues: var8 (ref)
		if var8 and var8.pop then
			var8.pop()
		end
	end, { var8 })
	local wideMode = var8.getScreenProps("wideMode", false)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		AbsorbInput = reactModule.createElement(foundationModule.View, {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			ZIndex = 1,
			tag = {
				["size-full anchor-center-center position-center-center"] = true,
				["bg-action-subtle"] = not var7.enableTestingTheme,
				["bg-action-soft-emphasis"] = var7.enableTestingTheme
			},
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = var9
		}),
		OverlayContainer = reactModule.createElement(foundationModule.View, {
			BorderSizePixel = 0,
			Selectable = true,
			ZIndex = 2,
			tag = {
				["bg-action-subtle no-clip"] = true,
				["anchor-center-center position-center-center"] = wideMode,
				["anchor-bottom-center position-bottom-center"] = not wideMode
			},
			Size = if wideMode then UDim2.new(0.75, 0, 0.9, 0) else UDim2.new(1, 0, 0.9, 0),
			onActivated = function() --[[ line: 62 ]] end
		}, {
			SquadVoiceChangers = reactModule.createElement(squadVoiceChangersModule, {
				closeSquadVoiceChangers = var9,
				fillListWithExtraVoicePacks = var7.fillListWithExtraVoicePacks,
				enableTestingTheme = var7.enableTestingTheme
			})
		})
	})
end

return SquadVoiceChangerOverlay