local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local getInputModeStore = require(parent.Responsive).GetInputModeStore
local compareSduiPropsModule = require(sduiCoreSystem.compareSduiProps)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiResponsiveDetectorModule = require(sduiCoreSystem.ConditionalProps.SduiResponsiveDetector)
local sduiPresenceDetectorModule = require(sduiCoreSystem.ConditionalProps.SduiPresenceDetector)
local getDisplayStore = require(parent.Display).GetDisplayStore
local checkPresenceConditionsModule = require(sduiCoreSystem.ConditionalProps.checkPresenceConditions)
local checkResponsiveConditions = require(sduiCoreSystem.SduiResponsiveHelpers).checkResponsiveConditions
local sduiConditionalPropTypesModule = require(sduiCoreSystem.ConditionalProps.SduiConditionalPropTypes)
local sduiConditionKey = sduiConditionalPropTypesModule.SduiConditionKey
local sduiResponsiveKey = sduiConditionalPropTypesModule.SduiResponsiveKey
local t = {}

return reactModule.memo(function(p0) --[[ line: 46 | named "SduiConditionalPropWrapper" ]]
	-- upvalues: reactModule (ref), sduiConditionKey (ref), sduiResponsiveKey (ref), getDisplayStore (ref), getInputModeStore (ref), checkResponsiveConditions (ref), t (ref), checkPresenceConditionsModule (ref), cryoModule (ref), sduiPresenceDetectorModule (ref), sduiResponsiveDetectorModule (ref)
	local sduiContext = p0.sduiContext
	sduiContext.dependencies.instrumentation:startTimerFlow("SduiConditionalPropWrapper")
	local conditionalProps = p0.componentConfig.conditionalProps
	local dataStore = sduiContext.dataStore
	local var9 = reactModule.useMemo(function() --[[ line: 55 ]]
		-- upvalues: conditionalProps (ref), sduiConditionKey (copy), sduiResponsiveKey (copy)
		local t = {}
		
		if not conditionalProps then
			return t
		end
		assert(conditionalProps, "conditionalProps must exist")
		
		for i, v in conditionalProps do
			if v.conditions then
				for i_1, v_1 in v.conditions do
					if i_1 == sduiConditionKey.friendInGame then
						t.hasPresenceProp = true
					elseif sduiResponsiveKey[i_1] == nil then
						t.hasCustomProp = true
					else
						t.hasResponsiveProp = true
					end
				end
			end
		end
		return t
	end, { conditionalProps })
	local var10, var11 = reactModule.useState(nil)
	local var12 = reactModule.useCallback(function(p1, p2) --[[ line: 81 ]]
		-- upvalues: var11 (ref)
		var11(function(p3) --[[ line: 82 ]]
			-- upvalues: p2 (ref), p1 (ref)
			if p3 == nil and p2 == nil then
				return p3
			elseif p3 == nil then
				return { [p1] = p2 }
			elseif p3[p1] == p2 then
				return p3
			end
			local cloned = table.clone(p3)
			cloned[p1] = p2
			
			return cloned
		end)
	end, {})
	local var13, var14 = reactModule.useState(function() --[[ line: 99 ]]
		-- upvalues: var9 (ref), getDisplayStore (copy), getInputModeStore (copy), checkResponsiveConditions (copy), conditionalProps (ref), sduiContext (ref), t (copy)
		return if var9.hasResponsiveProp then checkResponsiveConditions(conditionalProps, getDisplayStore(false).getViewportSize(false), getInputModeStore(false).getLastInputType(false), getInputModeStore(false).getPreferredInputType(false), getDisplayStore(false).getIsSpatial(false), sduiContext) else t
	end)
	local var15, var16 = reactModule.useState(function() --[[ line: 119 ]]
		-- upvalues: var9 (ref), checkPresenceConditionsModule (copy), conditionalProps (ref), dataStore (ref), t (copy)
		return if var9.hasPresenceProp then checkPresenceConditionsModule(conditionalProps, dataStore.social.getInGameFriendsByGame(false)) else t
	end)
	local var17 = reactModule.useCallback(function(p4, p5) --[[ line: 128 ]]
		-- upvalues: var13 (ref), var15 (ref), sduiResponsiveKey (copy), sduiConditionKey (copy), var10 (ref)
		if var13[p4] or var15[p4] then
			return false
		elseif p5.conditions then
			for i, v in p5.conditions do
				if sduiResponsiveKey[i] == nil and i ~= sduiConditionKey.friendInGame then
					return if var10 then true else false
				end
			end
		end
		return true
	end, { var13, var15, var10 })
	local var18 = reactModule.useMemo(function() --[[ line: 146 ]]
		-- upvalues: var12 (ref), conditionalProps (ref), var17 (ref), cryoModule (copy)
		local t = { setCustomConditionState = var12 }
		
		if conditionalProps then
			for i, v in conditionalProps do
				if v.propOverrides and var17(i, v) then
					t = cryoModule.Dictionary.join(t, v.propOverrides)
				end
			end
		end
		return t
	end, { var17, conditionalProps, var12 })
	local var19 = reactModule.useMemo(function() --[[ line: 166 ]]
		-- upvalues: conditionalProps (ref), var9 (ref), reactModule (copy), sduiPresenceDetectorModule (copy), var16 (ref), sduiContext (ref), sduiResponsiveDetectorModule (copy), var14 (ref)
		if not conditionalProps then
			return {}
		end
		assert(conditionalProps, "conditionalProps must exist")
		local t = {}
		
		if var9.hasPresenceProp then
			t.PresenceDetector = reactModule.createElement(sduiPresenceDetectorModule, {
				setFailedPresencePropIndexes = var16,
				sduiContext = sduiContext,
				allConditionalProps = conditionalProps
			})
		end
		if var9.hasResponsiveProp then
			t.ResponsiveDetector = reactModule.createElement(sduiResponsiveDetectorModule, {
				setFailedResponsivePropIndexes = var14,
				sduiContext = sduiContext,
				allConditionalProps = conditionalProps
			})
		end
		return t
	end, { conditionalProps, sduiContext, var9 })
	var19.WrappedComponent = reactModule.useMemo(function() --[[ line: 200 ]]
		-- upvalues: reactModule (copy), p0 (ref), cryoModule (copy), var18 (ref)
		return reactModule.createElement(p0.wrappedComponent, cryoModule.Dictionary.join(p0, { conditionalProps = var18 }))
	end, { p0.wrappedComponent, var18, p0 })
	sduiContext.dependencies.instrumentation:stopTimerFlow("SduiConditionalPropWrapper", sduiContext)
	
	return reactModule.createElement(reactModule.Fragment, nil, var19)
end, compareSduiPropsModule)