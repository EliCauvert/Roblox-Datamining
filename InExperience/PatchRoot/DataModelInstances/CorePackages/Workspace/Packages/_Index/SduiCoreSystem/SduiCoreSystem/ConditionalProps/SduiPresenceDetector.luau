local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.ConditionalProps.SduiConditionalPropTypes)
local checkPresenceConditionsModule = require(sduiCoreSystem.ConditionalProps.checkPresenceConditions)

return reactModule.memo(function(p0) --[[ line: 17 | named "SduiPresenceDetector" ]]
	-- upvalues: reactModule (ref), checkPresenceConditionsModule (ref), signalsModule (ref)
	local allConditionalProps = p0.allConditionalProps
	local setFailedPresencePropIndexes = p0.setFailedPresencePropIndexes
	local getInGameFriendsByGame = p0.sduiContext.dataStore.social.getInGameFriendsByGame
	reactModule.useLayoutEffect(function() --[[ line: 28 ]]
		-- upvalues: checkPresenceConditionsModule (copy), allConditionalProps (ref), setFailedPresencePropIndexes (ref), getInGameFriendsByGame (ref), signalsModule (copy)
		local t = {}
		
		local function checkConditions(p1) --[[ line: 31 ]]
			-- upvalues: checkPresenceConditionsModule (copy), allConditionalProps (copy), t (write), setFailedPresencePropIndexes (copy)
			local var6 = checkPresenceConditionsModule(allConditionalProps, p1)
			local var7 = nil
			
			for i, v in var6 do
				if not not t[i] ~= not not v then
					var7 = true
					break
				end
			end
			if not var7 then
				for i, v in t do
					if not not var6[i] ~= not not v then
						var7 = true
						break
					end
				end
			end
			if var7 then
				t = var6
				setFailedPresencePropIndexes(var6)
			end
		end
		
		checkConditions(getInGameFriendsByGame(false))
		
		return signalsModule.createEffect(function(p2) --[[ line: 58 ]]
			-- upvalues: checkConditions (ref), getInGameFriendsByGame (copy)
			checkConditions(getInGameFriendsByGame(p2))
		end)
	end, {
		getInGameFriendsByGame,
		allConditionalProps,
		setFailedPresencePropIndexes
	})
	
	return nil
end)