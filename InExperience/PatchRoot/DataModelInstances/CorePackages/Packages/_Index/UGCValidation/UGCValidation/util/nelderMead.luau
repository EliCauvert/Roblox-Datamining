local FloatVectorModule = require(script.Parent.Parent.util.FloatVector)
local NelderMeadModule = {}
NelderMeadModule.__index = NelderMeadModule

function NelderMeadModule.new(Entry, ObjectFunction, TerminateFunction)
	-- upvalues: NelderMeadModule (copy), FloatVectorModule (copy)
	local self = setmetatable({}, NelderMeadModule)
	
	if Entry and #Entry > 0 then
		local Entry1 = Entry[1]
		
		for _, value in Entry do
			if not Entry1:checkCompatible(value) then
				error("initial simplex has vectors that are not compatible")
			end
		end
	else
		error("must provide an initial simplex")
	end
	self.simplex = {}
	
	for _, value1 in Entry do
		table.insert(self.simplex, FloatVectorModule.new(value1))
	end
	self.objectFunction = ObjectFunction
	self.terminateFunction = TerminateFunction
	
	return self
end

function NelderMeadModule:evaluate()
	-- upvalues: FloatVectorModule (copy)
	local Simplex = self.simplex
	local ObjectResults = {}
	
	local function _(Key)
		-- upvalues: ObjectResults (ref), self (copy)
		local ObjectResult = ObjectResults[Key]
		
		if not ObjectResult then
			ObjectResult = self.objectFunction(Key)
			ObjectResults[Key] = ObjectResult
		end
		return ObjectResult
	end
	
	local Count = 0
	while not self.terminateFunction(Simplex, Count) do
		ObjectResults = {}
		table.sort(Simplex, function(A, B): boolean
			-- upvalues: ObjectResults (ref), self (copy)
			local ObjectResult = ObjectResults[A]
			
			if not ObjectResult then
				ObjectResult = self.objectFunction(A)
				ObjectResults[A] = ObjectResult
			end
			local ObjectResult1 = ObjectResult
			local ObjectResult2 = ObjectResults[B]
			
			if not ObjectResult2 then
				ObjectResult2 = self.objectFunction(B)
				ObjectResults[B] = ObjectResult2
			end
			return ObjectResult1 < ObjectResult2
		end)
		local SimplexEntry = Simplex[#Simplex]
		local List = {}
		
		for _ = 1, Simplex[1]:getSize() do
			table.insert(List, 0)
		end
		local NewFloatVector = FloatVectorModule.new(List)
		
		for i = 1, #Simplex - 1 do
			NewFloatVector += Simplex[i]
		end
		local NewFloatVectorDelta = NewFloatVector / (#Simplex - 1) - SimplexEntry
		local NewSimplexEntry = SimplexEntry + NewFloatVectorDelta * 2
		local ObjectResult = ObjectResults[NewSimplexEntry]
		
		if not ObjectResult then
			ObjectResult = self.objectFunction(NewSimplexEntry)
			ObjectResults[NewSimplexEntry] = ObjectResult
		end
		local ObjectResult1 = ObjectResult
		local SimplexEntry1 = Simplex[1]
		local ObjectResult2 = ObjectResults[SimplexEntry1]
		
		if not ObjectResult2 then
			ObjectResult2 = self.objectFunction(SimplexEntry1)
			ObjectResults[SimplexEntry1] = ObjectResult2
		end
		if ObjectResult2 < ObjectResult1 then
			local SimplexEntry2 = Simplex[#Simplex - 1]
			local ObjectResult3 = ObjectResults[SimplexEntry2]
			
			if not ObjectResult3 then
				ObjectResult3 = self.objectFunction(SimplexEntry2)
				ObjectResults[SimplexEntry2] = ObjectResult3
			end
			if ObjectResult1 < ObjectResult3 then
				Simplex[#Simplex] = NewSimplexEntry
				continue
			end
		end
		local SimplexEntry3 = Simplex[1]
		local ObjectResult21 = ObjectResults[SimplexEntry3]
		
		if not ObjectResult21 then
			ObjectResult21 = self.objectFunction(SimplexEntry3)
			ObjectResults[SimplexEntry3] = ObjectResult21
		end
		if ObjectResult1 < ObjectResult21 then
			local NewNewSimplexEntry = NewSimplexEntry + NewFloatVectorDelta
			local ObjectResult4 = ObjectResults[NewNewSimplexEntry]
			
			if not ObjectResult4 then
				ObjectResult4 = self.objectFunction(NewNewSimplexEntry)
				ObjectResults[NewNewSimplexEntry] = ObjectResult4
			end
			if ObjectResult4 < ObjectResult1 then
				Simplex[#Simplex] = NewNewSimplexEntry
			else
				Simplex[#Simplex] = NewSimplexEntry
			end
		else
			local NewSimplexEntry1 = SimplexEntry + NewFloatVectorDelta * 0.5
			local NewSimplexEntry2 = SimplexEntry + NewFloatVectorDelta * 1.5
			local ObjectResult3 = ObjectResults[NewSimplexEntry1]
			
			if not ObjectResult3 then
				ObjectResult3 = self.objectFunction(NewSimplexEntry1)
				ObjectResults[NewSimplexEntry1] = ObjectResult3
			end
			local ObjectResult5 = ObjectResult3
			local ObjectResult4 = ObjectResults[NewSimplexEntry2]
			
			if not ObjectResult4 then
				ObjectResult4 = self.objectFunction(NewSimplexEntry2)
				ObjectResults[NewSimplexEntry2] = ObjectResult4
			end
			local NewSimplexEntry3 = if ObjectResult5 < ObjectResult4 then NewSimplexEntry1 else NewSimplexEntry2
			local ObjectResult6 = ObjectResults[NewSimplexEntry3]
			
			if not ObjectResult6 then
				ObjectResult6 = self.objectFunction(NewSimplexEntry3)
				ObjectResults[NewSimplexEntry3] = ObjectResult6
			end
			local ObjectResult51 = ObjectResult6
			local SimplexEntry4 = Simplex[#Simplex - 1]
			local ObjectResult7 = ObjectResults[SimplexEntry4]
			
			if not ObjectResult7 then
				ObjectResult7 = self.objectFunction(SimplexEntry4)
				ObjectResults[SimplexEntry4] = ObjectResult7
			end
			if ObjectResult51 < ObjectResult7 then
				Simplex[#Simplex] = NewSimplexEntry3
			else
				for i1 = 1, #Simplex do
					Simplex[i1] = (Simplex[i1] - Simplex[1]) * 0.8 + Simplex[1]
				end
			end
		end
		Count += 1
	end
end

function NelderMeadModule:calculateMaxLengthBetweenVertices(): number
	local Largest = 0
	
	for i = 1, #self - 1 do
		for i1 = i + 1, #self do
			Largest = math.max(Largest, ((self[i1] - self[i]):magnitude()))
		end
	end
	return Largest
end

return NelderMeadModule