local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local RobloxAppHooksModule = require(Parent1.RobloxAppHooks)
local _ = require(Parent.Enums.InputTypesEnum)
local HelpPageTelemetryModule = require(Parent.Telemetry.HelpPageTelemetry)
local UseAbilitiesModule = require(Parent.Hooks.useAbilities)

return function(p1)
	-- upvalues: RobloxAppHooksModule (copy), UseAbilitiesModule (copy), ReactModule (copy), HelpPageTelemetryModule (copy)
	local UseDeviceOrientationResult = RobloxAppHooksModule.useDeviceOrientation()
	local UseAbilitiesModuleResult = UseAbilitiesModule()
	local Abilities_shown = 0
	local Abilities_unavailable_count = 0
	
	if UseAbilitiesModuleResult ~= nil then
		for _, value in UseAbilitiesModuleResult do
			Abilities_shown += 1
			
			if value.disabled == true then
				Abilities_unavailable_count += 1
			end
		end
	end
	ReactModule.useEffect(function()
		-- upvalues: UseDeviceOrientationResult (copy), p1 (copy), Abilities_shown (ref), Abilities_unavailable_count (ref), HelpPageTelemetryModule (upval)
		HelpPageTelemetryModule.default:logHelpPageInteraction("Help_Interaction", {
			orientation = UseDeviceOrientationResult,
			last_input_type = p1.lastInputType,
			abilities_shown = Abilities_shown,
			abilities_unavailable_count = Abilities_unavailable_count
		})
	end, {
		UseDeviceOrientationResult,
		p1.lastInputType,
		Abilities_shown,
		Abilities_unavailable_count
	})
	
	return nil
end