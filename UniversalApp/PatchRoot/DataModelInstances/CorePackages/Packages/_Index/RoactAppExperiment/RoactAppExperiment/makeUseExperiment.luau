local roactAppExperiment = script:FindFirstAncestor("RoactAppExperiment")
local reactModule = require(roactAppExperiment.Parent.React)
local usePreviousModule = require(script.Parent.usePrevious)
local useIXPServiceModule = require(roactAppExperiment.useIXPService)

local function _(p0) --[[ line: 21 | named "getLayerNamesKey" ]]
	local var4 = ""
	
	for i, v in ipairs(p0) do
		if i > 1 then
			var4 ..= ","
		end
		var4 ..= v
	end
	return var4
end

return function(p1, p2, p3, p4, p5) --[[ line: 35 | named "makeUseExperiment" ]]
	-- upvalues: useIXPServiceModule (ref), reactModule (ref), usePreviousModule (ref)
	return function(p6, p7, p8) --[[ line: 45 ]]
		-- upvalues: useIXPServiceModule (copy), p3 (ref), p2 (ref), reactModule (copy), p1 (ref), usePreviousModule (copy), p5 (ref), p4 (ref)
		if p8 == nil then
			p8 = true
		end
		local var5 = useIXPServiceModule()
		assert(type(p6) == "table", "useExperiment expects layerNames to be a list of layers")
		assert(type(p7) == "function", "useExperiment expects mapLayers to be a function")
		
		local function getNewLayerToVariables() --[[ line: 59 ]]
			-- upvalues: p6 (ref), var5 (ref), p3 (copy)
			local t = {}
			
			for i, v in ipairs(p6) do
				t[v] = var5[p3](var5, v)
				
				if t[v] and not next(t[v]) then
					t[v] = nil
				end
			end
			return t
		end
		
		local function getLoadingStatus() --[[ line: 75 ]]
			-- upvalues: var5 (ref), p2 (copy)
			return var5[p2](var5)
		end
		
		local var8, var9 = reactModule.useState(getNewLayerToVariables)
		local var10, var11 = reactModule.useState(getLoadingStatus)
		local var12 = ""
		
		for i, v in ipairs(p6) do
			if i > 1 then
				var12 ..= ","
			end
			var12 ..= v
		end
		reactModule.useEffect(function() --[[ line: 86 ]]
			-- upvalues: var5 (ref), p2 (copy), getNewLayerToVariables (ref), var9 (ref), var11 (ref), p1 (copy)
			if var5 == nil then
				return function() --[[ line: 88 ]] end
			end
			local function _() --[[ line: 91 | named "updateStateLayerData" ]]
				-- upvalues: var5 (copy), p2 (copy), getNewLayerToVariables (copy), var9 (copy), var11 (copy)
				local var18 = var5[p2](var5)
				local var19 = getNewLayerToVariables()
				var9(function(p9) --[[ line: 95 ]]
					-- upvalues: var19 (ref)
					return if not next(var19) == not next(p9) then p9 else var19
				end)
				var11(var18)
			end
			
			local var15 = var5[p1]:Connect(function(_) --[[ line: 106 ]]
				-- upvalues: var5 (copy), p2 (copy), getNewLayerToVariables (copy), var9 (copy), var11 (copy)
				local var20 = var5[p2](var5)
				local var21 = getNewLayerToVariables()
				var9(function(p10) --[[ line: 95 ]]
					-- upvalues: var21 (ref)
					return if not next(var21) == not next(p10) then p10 else var21
				end)
				var11(var20)
			end)
			local var16 = var5[p2](var5)
			local var17 = getNewLayerToVariables()
			var9(function(p11) --[[ line: 95 ]]
				-- upvalues: var17 (ref)
				return if not next(var17) == not next(p11) then p11 else var17
			end)
			var11(var16)
			
			return function() --[[ line: 117 ]]
				-- upvalues: var15 (ref)
				if var15 ~= nil then
					var15:Disconnect()
				end
			end
		end, { var5, var12 })
		local var13 = usePreviousModule(var10) or Enum.IXPLoadingStatus.None
		reactModule.useEffect(function() --[[ line: 127 ]]
			-- upvalues: p8 (write), var5 (ref), var10 (ref), var13 (ref), p6 (ref), p5 (copy), p4 (copy)
			if p8 and var5 ~= nil and (var10 == Enum.IXPLoadingStatus.Initialized and var13 ~= Enum.IXPLoadingStatus.Initialized) then
				for i, v in ipairs(p6) do
					if var5[p5](var5, v) == Enum.IXPLoadingStatus.Initialized then
						var5[p4](var5, v)
					end
				end
			end
		end, {
			var5,
			var12,
			p8,
			var10,
			var13
		})
		
		return p7(var8)
	end
end