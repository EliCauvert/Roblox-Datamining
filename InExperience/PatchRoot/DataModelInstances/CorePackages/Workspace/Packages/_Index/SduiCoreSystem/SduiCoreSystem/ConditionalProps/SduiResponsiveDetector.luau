local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local getDisplayStore = require(parent.Display).GetDisplayStore
local getInputModeStore = require(parent.Responsive).GetInputModeStore
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.ConditionalProps.SduiConditionalPropTypes)
local checkResponsiveConditions = require(sduiCoreSystem.SduiResponsiveHelpers).checkResponsiveConditions

return reactModule.memo(function(p1)
	-- upvalues: getDisplayStore (ref), getInputModeStore (ref), reactModule (ref), checkResponsiveConditions (ref), signalsModule (ref)
	local allConditionalProps = p1.allConditionalProps
	local setFailedResponsivePropIndexes = p1.setFailedResponsivePropIndexes
	local sduiContext = p1.sduiContext
	local getViewportSize = getDisplayStore(false).getViewportSize
	local getLastInputType = getInputModeStore(false).getLastInputType
	local getPreferredInputType = getInputModeStore(false).getPreferredInputType
	local getIsSpatial = getDisplayStore(false).getIsSpatial
	reactModule.useLayoutEffect(function()
		-- upvalues: checkResponsiveConditions (copy), allConditionalProps (ref), sduiContext (ref), setFailedResponsivePropIndexes (ref), getViewportSize (ref), getLastInputType (ref), getPreferredInputType (ref), getIsSpatial (ref), signalsModule (copy)
		local t = {}
		
		local function checkConditions(p2, p3, p4, p5)
			-- upvalues: checkResponsiveConditions (copy), allConditionalProps (copy), sduiContext (copy), t (write), setFailedResponsivePropIndexes (copy)
			local var1 = checkResponsiveConditions(allConditionalProps, p2, p3, p4, p5, sduiContext)
			local var2 = nil
			
			for i, v in var1 do
				if not not t[i] ~= not not v then
					var2 = true
					break
				end
			end
			if not var2 then
				for i, v in t do
					if not not var1[i] ~= not not v then
						var2 = true
						break
					end
				end
			end
			if var2 then
				t = var1
				setFailedResponsivePropIndexes(var1)
			end
		end
		
		checkConditions(getViewportSize(false), getLastInputType(false), getPreferredInputType(false), getIsSpatial(false))
		
		return signalsModule.createEffect(function(p6)
			-- upvalues: checkConditions (ref), getViewportSize (copy), getLastInputType (copy), getPreferredInputType (copy), getIsSpatial (copy)
			checkConditions(getViewportSize(p6), getLastInputType(p6), getPreferredInputType(p6), getIsSpatial(p6))
		end)
	end, {
		getViewportSize, getLastInputType, getPreferredInputType, getIsSpatial,
		allConditionalProps, setFailedResponsivePropIndexes, sduiContext
	})
	
	return nil
end)