local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local constantsModule = require(peopleReactView.Constants)

return function()
	-- upvalues: useTokens (ref), reactModule (ref), constantsModule (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useBinding(0)
	local var4, var5 = reactModule.useBinding(0)
	local var6, var7 = reactModule.useBinding(0)
	
	return var2, var4, var6, reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: constantsModule (copy), var7 (ref), var3 (ref), var5 (ref), var1 (ref)
		local clampedValue = math.clamp(math.floor(p2 / p1), constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MIN_CARD_COLUMNS, constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MAX_CARD_COLUMNS)
		local var8 = math.floor(p2 / clampedValue) - math.ceil(p3 * (clampedValue - 1) / clampedValue)
		var7(clampedValue)
		var3(var8)
		var5(var8 + var1.Size.Size_1400)
	end, { var1.Size.Size_1400 })
end