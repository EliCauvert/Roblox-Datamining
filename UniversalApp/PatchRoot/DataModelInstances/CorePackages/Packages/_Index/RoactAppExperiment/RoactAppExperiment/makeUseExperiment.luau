local roactAppExperiment = script:FindFirstAncestor("RoactAppExperiment")
local reactModule = require(roactAppExperiment.Parent.React)
local usePreviousModule = require(script.Parent.usePrevious)
local useIXPServiceModule = require(roactAppExperiment.useIXPService)

local function _(p1)
	local var1 = ""
	
	for i, v in ipairs(p1) do
		if i > 1 then
			var1 ..= ","
		end
		var1 ..= v
	end
	return var1
end

return function(p2, p3, p4, p5, p6)
	-- upvalues: useIXPServiceModule (ref), reactModule (ref), usePreviousModule (ref)
	return function(p7, p8, p9)
		-- upvalues: useIXPServiceModule (copy), p4 (ref), p3 (ref), reactModule (copy), p2 (ref), usePreviousModule (copy), p6 (ref), p5 (ref)
		if p9 == nil then
			p9 = true
		end
		local var2 = useIXPServiceModule()
		assert(type(p7) == "table", "useExperiment expects layerNames to be a list of layers")
		assert(type(p8) == "function", "useExperiment expects mapLayers to be a function")
		
		local function getNewLayerToVariables()
			-- upvalues: p7 (ref), var2 (ref), p4 (copy)
			local t = {}
			
			for i, v in ipairs(p7) do
				t[v] = var2[p4](var2, v)
				
				if t[v] and not next(t[v]) then
					t[v] = nil
				end
			end
			return t
		end
		
		local function getLoadingStatus()
			-- upvalues: var2 (ref), p3 (copy)
			return var2[p3](var2)
		end
		
		local var3, var4 = reactModule.useState(getNewLayerToVariables)
		local var5, var6 = reactModule.useState(getLoadingStatus)
		local var7 = ""
		
		for i, v in ipairs(p7) do
			if i > 1 then
				var7 ..= ","
			end
			var7 ..= v
		end
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), p3 (copy), getNewLayerToVariables (ref), var4 (ref), var6 (ref), p2 (copy)
			if var2 == nil then
				return function() end
			end
			local function _()
				-- upvalues: var2 (copy), p3 (copy), getNewLayerToVariables (copy), var4 (copy), var6 (copy)
				local var8 = var2[p3](var2)
				local var9 = getNewLayerToVariables()
				var4(function(p10)
					-- upvalues: var9 (ref)
					return if not next(var9) == not next(p10) then p10 else var9
				end)
				var6(var8)
			end
			
			local var8 = var2[p2]:Connect(function(_)
				-- upvalues: var2 (copy), p3 (copy), getNewLayerToVariables (copy), var4 (copy), var6 (copy)
				local var9 = var2[p3](var2)
				local var10 = getNewLayerToVariables()
				var4(function(p10)
					-- upvalues: var10 (ref)
					return if not next(var10) == not next(p10) then p10 else var10
				end)
				var6(var9)
			end)
			local var9 = var2[p3](var2)
			local var10 = getNewLayerToVariables()
			var4(function(p10)
				-- upvalues: var10 (ref)
				return if not next(var10) == not next(p10) then p10 else var10
			end)
			var6(var9)
			
			return function()
				-- upvalues: var8 (ref)
				if var8 ~= nil then
					var8:Disconnect()
				end
			end
		end, { var2, var7 })
		local var8 = usePreviousModule(var5) or Enum.IXPLoadingStatus.None
		reactModule.useEffect(function()
			-- upvalues: p9 (write), var2 (ref), var5 (ref), var8 (ref), p7 (ref), p6 (copy), p5 (copy)
			if p9 and var2 ~= nil and (var5 == Enum.IXPLoadingStatus.Initialized and var8 ~= Enum.IXPLoadingStatus.Initialized) then
				for i, v in ipairs(p7) do
					if var2[p6](var2, v) == Enum.IXPLoadingStatus.Initialized then
						var2[p5](var2, v)
					end
				end
			end
		end, {
			var2,
			var7,
			p9,
			var5,
			var8
		})
		
		return p8(var3)
	end
end