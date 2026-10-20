local function v0() end

local DevOnly = script:FindFirstChild("DevOnly")

if DevOnly == nil then
	return {
		register = function()
			-- upvalues: v0 (copy)
			return v0
		end
	}
else
	local Flag = false
	local v1 = nil
	
	return {
		register = function()
			-- upvalues: Flag (ref), v1 (ref), v0 (copy), DevOnly (copy)
			if Flag then
				return v1 or v0
			end
			Flag = true
			local List = {}
			
			for _, child in DevOnly:GetChildren() do
				local Success, Result = pcall(require, child)
				
				if Success and type(Result) == "function" then
					table.insert(List, Result)
				end
			end
			v1 = function()
				-- upvalues: List (copy), Flag (upval), v1 (upval)
				for _, value in List do
					value()
				end
				Flag = false
				v1 = nil
			end
			
			return v1
		end
	}
end