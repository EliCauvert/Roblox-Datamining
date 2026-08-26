local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.ConditionalProps.SduiConditionalPropTypes)
local checkPresenceConditionsModule = require(sduiCoreSystem.ConditionalProps.checkPresenceConditions)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), checkPresenceConditionsModule (ref), signalsModule (ref)
	local allConditionalProps = p1.allConditionalProps
	local setFailedPresencePropIndexes = p1.setFailedPresencePropIndexes
	local getInGameFriendsByGame = p1.sduiContext.dataStore.social.getInGameFriendsByGame
	reactModule.useLayoutEffect(function()
		-- upvalues: checkPresenceConditionsModule (copy), allConditionalProps (ref), setFailedPresencePropIndexes (ref), getInGameFriendsByGame (ref), signalsModule (copy)
		local t = {}
		
		local function checkConditions(p2)
			-- upvalues: checkPresenceConditionsModule (copy), allConditionalProps (copy), t (write), setFailedPresencePropIndexes (copy)
			local var1 = checkPresenceConditionsModule(allConditionalProps, p2)
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
				setFailedPresencePropIndexes(var1)
			end
		end
		
		checkConditions(getInGameFriendsByGame(false))
		
		return signalsModule.createEffect(function(p3)
			-- upvalues: checkConditions (ref), getInGameFriendsByGame (copy)
			checkConditions(getInGameFriendsByGame(p3))
		end)
	end, {
		getInGameFriendsByGame,
		allConditionalProps,
		setFailedPresencePropIndexes
	})
	
	return nil
end)