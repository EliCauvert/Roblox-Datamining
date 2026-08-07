local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getDisplayStore = require(parent.Display).GetDisplayStore
local getInputModeStore = require(parent.Responsive).GetInputModeStore
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.ConditionalProps.SduiConditionalPropTypes)
local checkResponsiveConditions = require(sduiCoreSystem.SduiResponsiveHelpers).checkResponsiveConditions

return reactModule.memo(function(p0) --[[ line: 21 | named "SduiResponsiveDetector" ]]
	-- upvalues: getDisplayStore (ref), getInputModeStore (ref), reactModule (ref), checkResponsiveConditions (ref), signalsModule (ref)
	local allConditionalProps = p0.allConditionalProps
	local setFailedResponsivePropIndexes = p0.setFailedResponsivePropIndexes
	local sduiContext = p0.sduiContext
	local getViewportSize = getDisplayStore(false).getViewportSize
	local getLastInputType = getInputModeStore(false).getLastInputType
	local getPreferredInputType = getInputModeStore(false).getPreferredInputType
	local getIsSpatial = getDisplayStore(false).getIsSpatial
	reactModule.useLayoutEffect(function() --[[ line: 35 ]]
		-- upvalues: checkResponsiveConditions (copy), allConditionalProps (ref), sduiContext (ref), setFailedResponsivePropIndexes (ref), getViewportSize (ref), getLastInputType (ref), getPreferredInputType (ref), getIsSpatial (ref), signalsModule (copy)
		local t = {}
		
		local function checkConditions(p1, p2, p3, p4) --[[ line: 38 ]]
			-- upvalues: checkResponsiveConditions (copy), allConditionalProps (copy), sduiContext (copy), t (write), setFailedResponsivePropIndexes (copy)
			local var5 = checkResponsiveConditions(allConditionalProps, p1, p2, p3, p4, sduiContext)
			local var6 = nil
			
			for i, v in var5 do
				if not not t[i] ~= not not v then
					var6 = true
					break
				end
			end
			if not var6 then
				for i, v in t do
					if not not var5[i] ~= not not v then
						var6 = true
						break
					end
				end
			end
			if var6 then
				t = var5
				setFailedResponsivePropIndexes(var5)
			end
		end
		
		checkConditions(getViewportSize(false), getLastInputType(false), getPreferredInputType(false), getIsSpatial(false))
		
		return signalsModule.createEffect(function(p5) --[[ line: 77 ]]
			-- upvalues: checkConditions (ref), getViewportSize (copy), getLastInputType (copy), getPreferredInputType (copy), getIsSpatial (copy)
			checkConditions(getViewportSize(p5), getLastInputType(p5), getPreferredInputType(p5), getIsSpatial(p5))
		end)
	end, {
		getViewportSize, getLastInputType, getPreferredInputType, getIsSpatial,
		allConditionalProps, setFailedResponsivePropIndexes, sduiContext
	})
	
	return nil
end)