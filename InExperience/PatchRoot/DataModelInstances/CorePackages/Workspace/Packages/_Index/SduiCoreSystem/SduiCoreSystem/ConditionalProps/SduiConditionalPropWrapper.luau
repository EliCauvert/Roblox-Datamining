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

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), sduiConditionKey (ref), sduiResponsiveKey (ref), getDisplayStore (ref), getInputModeStore (ref), checkResponsiveConditions (ref), t (ref), checkPresenceConditionsModule (ref), cryoModule (ref), sduiPresenceDetectorModule (ref), sduiResponsiveDetectorModule (ref)
	local sduiContext = p1.sduiContext
	sduiContext.dependencies.instrumentation:startTimerFlow("SduiConditionalPropWrapper")
	local conditionalProps = p1.componentConfig.conditionalProps
	local dataStore = sduiContext.dataStore
	local var1 = reactModule.useMemo(function()
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
	local var2, var3 = reactModule.useState(nil)
	local var4 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var3 (ref)
		var3(function(p4)
			-- upvalues: p3 (ref), p2 (ref)
			if p4 == nil and p3 == nil then
				return p4
			elseif p4 == nil then
				return { [p2] = p3 }
			elseif p4[p2] == p3 then
				return p4
			end
			local cloned = table.clone(p4)
			cloned[p2] = p3
			
			return cloned
		end)
	end, {})
	local var5, var6 = reactModule.useState(function()
		-- upvalues: var1 (ref), getDisplayStore (copy), getInputModeStore (copy), checkResponsiveConditions (copy), conditionalProps (ref), sduiContext (ref), t (copy)
		return if var1.hasResponsiveProp then checkResponsiveConditions(conditionalProps, getDisplayStore(false).getViewportSize(false), getInputModeStore(false).getLastInputType(false), getInputModeStore(false).getPreferredInputType(false), getDisplayStore(false).getIsSpatial(false), sduiContext) else t
	end)
	local var7, var8 = reactModule.useState(function()
		-- upvalues: var1 (ref), checkPresenceConditionsModule (copy), conditionalProps (ref), dataStore (ref), t (copy)
		return if var1.hasPresenceProp then checkPresenceConditionsModule(conditionalProps, dataStore.social.getInGameFriendsByGame(false)) else t
	end)
	local var9 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var5 (ref), var7 (ref), sduiResponsiveKey (copy), sduiConditionKey (copy), var2 (ref)
		if var5[p2] or var7[p2] then
			return false
		elseif p3.conditions then
			for i, v in p3.conditions do
				if sduiResponsiveKey[i] == nil and i ~= sduiConditionKey.friendInGame then
					return if var2 then true else false
				end
			end
		end
		return true
	end, { var5, var7, var2 })
	local var10 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), conditionalProps (ref), var9 (ref), cryoModule (copy)
		local t = { setCustomConditionState = var4 }
		
		if conditionalProps then
			for i, v in conditionalProps do
				if v.propOverrides and var9(i, v) then
					t = cryoModule.Dictionary.join(t, v.propOverrides)
				end
			end
		end
		return t
	end, { var9, conditionalProps, var4 })
	local var11 = reactModule.useMemo(function()
		-- upvalues: conditionalProps (ref), var1 (ref), reactModule (copy), sduiPresenceDetectorModule (copy), var8 (ref), sduiContext (ref), sduiResponsiveDetectorModule (copy), var6 (ref)
		if not conditionalProps then
			return {}
		end
		assert(conditionalProps, "conditionalProps must exist")
		local t = {}
		
		if var1.hasPresenceProp then
			t.PresenceDetector = reactModule.createElement(sduiPresenceDetectorModule, {
				setFailedPresencePropIndexes = var8,
				sduiContext = sduiContext,
				allConditionalProps = conditionalProps
			})
		end
		if var1.hasResponsiveProp then
			t.ResponsiveDetector = reactModule.createElement(sduiResponsiveDetectorModule, {
				setFailedResponsivePropIndexes = var6,
				sduiContext = sduiContext,
				allConditionalProps = conditionalProps
			})
		end
		return t
	end, { conditionalProps, sduiContext, var1 })
	var11.WrappedComponent = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), p1 (ref), cryoModule (copy), var10 (ref)
		return reactModule.createElement(p1.wrappedComponent, cryoModule.Dictionary.join(p1, { conditionalProps = var10 }))
	end, { p1.wrappedComponent, var10, p1 })
	sduiContext.dependencies.instrumentation:stopTimerFlow("SduiConditionalPropWrapper", sduiContext)
	
	return reactModule.createElement(reactModule.Fragment, nil, var11)
end, compareSduiPropsModule)