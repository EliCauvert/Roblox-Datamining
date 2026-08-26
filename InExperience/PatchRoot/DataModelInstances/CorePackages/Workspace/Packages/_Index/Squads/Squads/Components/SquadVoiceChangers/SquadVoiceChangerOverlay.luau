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

function SquadVoiceChangerOverlay(p1)
	-- upvalues: cryoModule (ref), t (ref), useNavigation (ref), reactModule (ref), foundationModule (ref), squadVoiceChangersModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useNavigation()
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		if var2 and var2.pop then
			var2.pop()
		end
	end, { var2 })
	local wideMode = var2.getScreenProps("wideMode", false)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		AbsorbInput = reactModule.createElement(foundationModule.View, {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			ZIndex = 1,
			tag = {
				["size-full anchor-center-center position-center-center"] = true,
				["bg-action-subtle"] = not var1.enableTestingTheme,
				["bg-action-soft-emphasis"] = var1.enableTestingTheme
			},
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = var3
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
			onActivated = function() end
		}, {
			SquadVoiceChangers = reactModule.createElement(squadVoiceChangersModule, {
				closeSquadVoiceChangers = var3,
				fillListWithExtraVoicePacks = var1.fillListWithExtraVoicePacks,
				enableTestingTheme = var1.enableTestingTheme
			})
		})
	})
end

return SquadVoiceChangerOverlay