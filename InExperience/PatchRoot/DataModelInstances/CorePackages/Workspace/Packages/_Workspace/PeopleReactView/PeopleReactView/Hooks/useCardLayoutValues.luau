local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local constantsModule = require(peopleReactView.Constants)

return function() --[[ line: 11 | named "useCardLayoutValues" ]]
	-- upvalues: useTokens (ref), reactModule (ref), constantsModule (ref)
	local var3 = useTokens()
	local var4, var5 = reactModule.useBinding(0)
	local var6, var7 = reactModule.useBinding(0)
	local var8, var9 = reactModule.useBinding(0)
	
	return var4, var6, var8, reactModule.useCallback(function(p0, p1, p2) --[[ line: 19 ]]
		-- upvalues: constantsModule (copy), var9 (ref), var5 (ref), var7 (ref), var3 (ref)
		local clampedValue = math.clamp(math.floor(p1 / p0), constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MIN_CARD_COLUMNS, constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MAX_CARD_COLUMNS)
		local var11 = math.floor(p1 / clampedValue) - math.ceil(p2 * (clampedValue - 1) / clampedValue)
		var9(clampedValue)
		var5(var11)
		var7(var11 + var3.Size.Size_1400)
	end, { var3.Size.Size_1400 })
end