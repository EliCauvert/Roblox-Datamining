local viewportQueryOptionsModule = require(script:FindFirstAncestor("SceneUnderstanding").options.ViewportQueryOptions)

return function(p1, p2, p3)
	-- upvalues: viewportQueryOptionsModule (ref)
	local var1 = viewportQueryOptionsModule.new(p3)
	local var2 = 0
	local var3 = 1
	local var4 = 0
	local var5 = 0
	local var6 = 1
	local var7 = 0
	local maxScreenDivisions = var1.maxScreenDivisions
	local var8 = math.ceil(maxScreenDivisions / 2) - 1
	local t = {}
	
	for _ = 1, maxScreenDivisions * maxScreenDivisions do
		local vector2 = Vector2.new((var2 + 0.5 + var8) * (p1.ViewportSize.X / maxScreenDivisions), (var4 + 0.5 + var8) * (p1.ViewportSize.Y / maxScreenDivisions))
		local x = p1:ScreenPointToRay(vector2.X, vector2.Y)
		local origin = workspace:Raycast(x.Origin, x.Direction * var1.maxDistance, var1.raycastParams)
		
		if origin and origin.Instance and (not table.find(t, origin.Instance) and p2(origin.Instance)) then
			table.insert(t, origin.Instance)
			
			if var1.limit > #t then
				var2 += var3
				var4 += var5
				var7 += 1
				
				if var7 == var6 then
					var7 = 0
					local var9 = var3
					var3 = -var5
					var5 = var9
					
					if var5 == 0 then
						var6 += 1
					end
				end
			end
			return t
		end
	end
	return t
end