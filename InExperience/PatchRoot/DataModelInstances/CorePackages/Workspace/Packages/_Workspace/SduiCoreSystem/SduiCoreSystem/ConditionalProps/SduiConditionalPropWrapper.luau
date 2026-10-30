local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local GetInputModeStoreFunction = require(Parent.Responsive).GetInputModeStore
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local SduiResponsiveDetectorModule = require(SduiCoreSystem.ConditionalProps.SduiResponsiveDetector)
local SduiPresenceDetectorModule = require(SduiCoreSystem.ConditionalProps.SduiPresenceDetector)
local GetDisplayStoreFunction = require(Parent.Display).GetDisplayStore
local CheckPresenceConditionsModule = require(SduiCoreSystem.ConditionalProps.checkPresenceConditions)
local CheckResponsiveConditionsFunction = require(SduiCoreSystem.SduiResponsiveHelpers).checkResponsiveConditions
local SduiConditionalPropTypesModule = require(SduiCoreSystem.ConditionalProps.SduiConditionalPropTypes)
local SduiConditionKey = SduiConditionalPropTypesModule.SduiConditionKey
local SduiResponsiveKey = SduiConditionalPropTypesModule.SduiResponsiveKey
local t = {}

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), SduiConditionKey (copy), SduiResponsiveKey (copy), GetDisplayStoreFunction (copy), GetInputModeStoreFunction (copy), CheckResponsiveConditionsFunction (copy), t (copy), CheckPresenceConditionsModule (copy), CryoModule (copy), SduiPresenceDetectorModule (copy), SduiResponsiveDetectorModule (copy)
	local SduiContext = p1.sduiContext
	SduiContext.dependencies.instrumentation:startTimerFlow("SduiConditionalPropWrapper")
	local ConditionalProps = p1.componentConfig.conditionalProps
	local DataStore = SduiContext.dataStore
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ConditionalProps (copy), SduiConditionKey (upval), SduiResponsiveKey (upval)
		local t = {}
		
		if not ConditionalProps then
			return t
		end
		assert(ConditionalProps, "conditionalProps must exist")
		
		for _, conditionalProp in ConditionalProps do
			if conditionalProp.conditions then
				for i, _ in conditionalProp.conditions do
					if i == SduiConditionKey.friendInGame then
						t.hasPresenceProp = true
						continue
					end
					if SduiResponsiveKey[i] == nil then
						t.hasCustomProp = true
					else
						t.hasResponsiveProp = true
					end
				end
			end
		end
		return t
	end, { ConditionalProps })
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(Tbl)
			-- upvalues: p3 (copy), p2 (copy)
			if Tbl == nil and p3 == nil then
				return Tbl
			elseif Tbl == nil then
				return { [p2] = p3 }
			elseif Tbl[p2] == p3 then
				return Tbl
			else
				local Copy = table.clone(Tbl)
				Copy[p2] = p3
				
				return Copy
			end
		end)
	end, {})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function()
		-- upvalues: UseMemoResult (copy), GetDisplayStoreFunction (upval), GetInputModeStoreFunction (upval), CheckResponsiveConditionsFunction (upval), ConditionalProps (copy), SduiContext (copy), t (upval)
		return if UseMemoResult.hasResponsiveProp then CheckResponsiveConditionsFunction(ConditionalProps, GetDisplayStoreFunction(false).getViewportSize(false), GetInputModeStoreFunction(false).getLastInputType(false), GetInputModeStoreFunction(false).getPreferredInputType(false), GetDisplayStoreFunction(false).getIsSpatial(false), SduiContext) else t
	end)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(function()
		-- upvalues: UseMemoResult (copy), CheckPresenceConditionsModule (upval), ConditionalProps (copy), DataStore (copy), t (upval)
		return if UseMemoResult.hasPresenceProp then CheckPresenceConditionsModule(ConditionalProps, DataStore.social.getInGameFriendsByGame(false)) else t
	end)
	local UseResult1 = ReactModule.useCallback(function(p2, p3): boolean
		-- upvalues: UseStateResult1 (copy), UseStateResult3 (copy), SduiResponsiveKey (upval), SduiConditionKey (upval), UseStateResult (copy)
		if UseStateResult1[p2] or UseStateResult3[p2] then
			return false
		end
		if p3.conditions then
			for i, condition in p3.conditions do
				if SduiResponsiveKey[i] == nil and i ~= SduiConditionKey.friendInGame then
					return if UseStateResult then UseStateResult[i] == condition else false
				end
			end
		end
		return true
	end, { UseStateResult1, UseStateResult3, UseStateResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseResult (copy), ConditionalProps (copy), UseResult1 (copy), CryoModule (upval)
		local JoinResult = { setCustomConditionState = UseResult }
		
		if ConditionalProps then
			for i, conditionalProp in ConditionalProps do
				if conditionalProp.propOverrides and UseResult1(i, conditionalProp) then
					JoinResult = CryoModule.Dictionary.join(JoinResult, conditionalProp.propOverrides)
				end
			end
		end
		return JoinResult
	end, { UseResult1, ConditionalProps, UseResult })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: ConditionalProps (copy), UseMemoResult (copy), ReactModule (upval), SduiPresenceDetectorModule (upval), UseStateResult2_2 (copy), SduiContext (copy), SduiResponsiveDetectorModule (upval), UseStateResult2_1 (copy)
		if not ConditionalProps then
			return {}
		end
		assert(ConditionalProps, "conditionalProps must exist")
		local t = {}
		
		if UseMemoResult.hasPresenceProp then
			t.PresenceDetector = ReactModule.createElement(SduiPresenceDetectorModule, {
				setFailedPresencePropIndexes = UseStateResult2_2,
				sduiContext = SduiContext,
				allConditionalProps = ConditionalProps
			})
		end
		if UseMemoResult.hasResponsiveProp then
			t.ResponsiveDetector = ReactModule.createElement(SduiResponsiveDetectorModule, {
				setFailedResponsivePropIndexes = UseStateResult2_1,
				sduiContext = SduiContext,
				allConditionalProps = ConditionalProps
			})
		end
		return t
	end, { ConditionalProps, SduiContext, UseMemoResult })
	UseMemoResult2.WrappedComponent = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), p1 (copy), CryoModule (upval), UseMemoResult1 (copy)
		return ReactModule.createElement(p1.wrappedComponent, CryoModule.Dictionary.join(p1, { conditionalProps = UseMemoResult1 }))
	end, { p1.wrappedComponent, UseMemoResult1, p1 })
	SduiContext.dependencies.instrumentation:stopTimerFlow("SduiConditionalPropWrapper", SduiContext)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, UseMemoResult2)
end, (require(SduiCoreSystem.compareSduiProps)))