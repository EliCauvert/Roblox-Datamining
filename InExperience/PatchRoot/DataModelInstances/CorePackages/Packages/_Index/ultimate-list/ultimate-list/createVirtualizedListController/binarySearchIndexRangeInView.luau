local UltimateList = script:FindFirstAncestor("ultimate-list")
local DataSourceMethodsModule = require(UltimateList.DataSources.DataSourceMethods)
local _ = require(UltimateList.DataSources)
local _ = require(UltimateList.Dimensions)
local ExhaustiveMatchModule = require(UltimateList.Util.exhaustiveMatch)

return function(p1, Callback, p2, p3, p4) --[[ Line: 8 | Named "binarySearchIndexRangeInView" ]]
	-- upvalues: ExhaustiveMatchModule (copy), DataSourceMethodsModule (copy)
	local function compareInView(p5): string --[[ Line: 18 ]]
		-- upvalues: p4 (copy), ExhaustiveMatchModule (upval), p2 (copy), p3 (copy)
		local Offset = if p4 == "x" then p5.position.X.Offset elseif p4 == "y" then p5.position.Y.Offset else ExhaustiveMatchModule(p4)
		local Offset1 = if p4 == "x" then p5.size.X.Offset elseif p4 == "y" then p5.size.Y.Offset else ExhaustiveMatchModule(p4)
		
		return if Offset + Offset1 < p2 then "before" elseif p2 + p3 < Offset then "after" else "inside"
	end
	
	local v1 = 1
	local LengthResult = DataSourceMethodsModule.length(p1)
	local LengthResult1: number = LengthResult
	local LengthResultRatio = nil
	local GetResult = nil
	while v1 <= LengthResult1 do
		LengthResultRatio = (v1 + LengthResult1) // 2
		GetResult = DataSourceMethodsModule.get(p1, LengthResultRatio)
		assert(GetResult ~= nil, "get() returned nil, meaning the length is inaccurate")
		local CompareInViewResult: string = compareInView((Callback(GetResult.value, LengthResultRatio)))
		
		if CompareInViewResult == "after" then
			LengthResult1 = LengthResultRatio - 1
		elseif CompareInViewResult == "before" then
			v1 = LengthResultRatio + 1
		else
			if CompareInViewResult == "inside" then
				local X: number = LengthResultRatio
				local GetResult1 = GetResult
				while X > 1 do
					local BeforeResult = GetResult1.before()
					
					if BeforeResult == nil or compareInView(Callback(BeforeResult.value, X - 1)) ~= "inside" then break end
					X -= 1
					GetResult1 = BeforeResult
				end
				local Y: number = LengthResultRatio
				local GetResult2 = GetResult
				while Y < LengthResult do
					local AfterResult = GetResult2.after()
					
					if AfterResult == nil or compareInView(Callback(AfterResult.value, Y + 1)) ~= "inside" then break end
					Y += 1
					GetResult2 = AfterResult
				end
				return (Vector3.new(X, Y))
			end
			ExhaustiveMatchModule(CompareInViewResult)
		end
	end
	return vector.create(0, 0, 0)
end