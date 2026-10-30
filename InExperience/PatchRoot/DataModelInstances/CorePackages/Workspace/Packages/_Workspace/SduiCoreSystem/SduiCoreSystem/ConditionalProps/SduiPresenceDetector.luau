local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.ConditionalProps.SduiConditionalPropTypes)
local CheckPresenceConditionsModule = require(SduiCoreSystem.ConditionalProps.checkPresenceConditions)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), CheckPresenceConditionsModule (copy), SignalsModule (copy)
	local AllConditionalProps = p1.allConditionalProps
	local SetFailedPresencePropIndexesFunction = p1.setFailedPresencePropIndexes
	local GetInGameFriendsByGameFunction = p1.sduiContext.dataStore.social.getInGameFriendsByGame
	ReactModule.useLayoutEffect(function()
		-- upvalues: CheckPresenceConditionsModule (upval), AllConditionalProps (copy), SetFailedPresencePropIndexesFunction (copy), GetInGameFriendsByGameFunction (copy), SignalsModule (upval)
		local t = {}
		
		local function checkConditions(p2)
			-- upvalues: CheckPresenceConditionsModule (upval), AllConditionalProps (upval), t (ref), SetFailedPresencePropIndexesFunction (upval)
			local CheckPresenceConditionsModuleResult = CheckPresenceConditionsModule(AllConditionalProps, p2)
			local Flag: boolean? = nil
			
			for i, value in CheckPresenceConditionsModuleResult do
				if not not t[i] ~= not not value then
					Flag = true
					break
				end
			end
			if not Flag then
				for i1, value1 in t do
					if not not CheckPresenceConditionsModuleResult[i1] ~= not not value1 then
						Flag = true
						break
					end
				end
			end
			if Flag then
				t = CheckPresenceConditionsModuleResult
				SetFailedPresencePropIndexesFunction(CheckPresenceConditionsModuleResult)
			end
		end
		
		checkConditions(GetInGameFriendsByGameFunction(false))
		
		return SignalsModule.createEffect(function(p3)
			-- upvalues: checkConditions (copy), GetInGameFriendsByGameFunction (upval)
			checkConditions(GetInGameFriendsByGameFunction(p3))
		end)
	end, {
		GetInGameFriendsByGameFunction,
		AllConditionalProps,
		SetFailedPresencePropIndexesFunction
	})
	
	return nil
end)