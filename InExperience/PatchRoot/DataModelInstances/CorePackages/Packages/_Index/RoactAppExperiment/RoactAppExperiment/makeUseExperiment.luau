local RoactAppExperiment = script:FindFirstAncestor("RoactAppExperiment")
local ReactModule = require(RoactAppExperiment.Parent.React)
local UsePreviousModule = require(script.Parent.usePrevious)
local UseIXPServiceModule = require(RoactAppExperiment.useIXPService)

local function _(List): string
	local Text = ""
	
	for i, value in ipairs(List) do
		if i > 1 then
			Text ..= ","
		end
		Text ..= value
	end
	return Text
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: UseIXPServiceModule (copy), ReactModule (copy), UsePreviousModule (copy)
	return function(List, Callback, p6: boolean)
		-- upvalues: UseIXPServiceModule (upval), p3 (copy), p2 (copy), ReactModule (upval), p1 (copy), UsePreviousModule (upval), p5 (copy), p4 (copy)
		if p6 == nil then
			p6 = true
		end
		local UseIXPServiceModuleResult = UseIXPServiceModule()
		assert(type(List) == "table", "useExperiment expects layerNames to be a list of layers")
		assert(type(Callback) == "function", "useExperiment expects mapLayers to be a function")
		
		local function getNewLayerToVariables()
			-- upvalues: List (copy), UseIXPServiceModuleResult (copy), p3 (upval)
			local t = {}
			
			for _, value in ipairs(List) do
				t[value] = UseIXPServiceModuleResult[p3](UseIXPServiceModuleResult, value)
				
				if t[value] and not next(t[value]) then
					t[value] = nil
				end
			end
			return t
		end
		
		local function getLoadingStatus()
			-- upvalues: UseIXPServiceModuleResult (copy), p2 (upval)
			return UseIXPServiceModuleResult[p2](UseIXPServiceModuleResult)
		end
		
		local UseStateResult, UseStateResult2 = ReactModule.useState(getNewLayerToVariables)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(getLoadingStatus)
		local Text = ""
		
		for i, value in ipairs(List) do
			if i > 1 then
				Text ..= ","
			end
			Text ..= value
		end
		ReactModule.useEffect(function()
			-- upvalues: UseIXPServiceModuleResult (copy), p2 (upval), getNewLayerToVariables (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), p1 (upval)
			if UseIXPServiceModuleResult == nil then
				return function() end
			else
				local function _()
					-- upvalues: UseIXPServiceModuleResult (upval), p2 (upval), getNewLayerToVariables (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
					local v1 = UseIXPServiceModuleResult[p2](UseIXPServiceModuleResult)
					local NewLayerToVariables = getNewLayerToVariables()
					UseStateResult2(function(p7)
						-- upvalues: NewLayerToVariables (copy)
						return if not next(NewLayerToVariables) == not next(p7) then p7 else NewLayerToVariables
					end)
					UseStateResult2_1(v1)
				end
				
				local Connection = UseIXPServiceModuleResult[p1]:Connect(function(_)
					-- upvalues: UseIXPServiceModuleResult (upval), p2 (upval), getNewLayerToVariables (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
					local v1 = UseIXPServiceModuleResult[p2](UseIXPServiceModuleResult)
					local NewLayerToVariables = getNewLayerToVariables()
					UseStateResult2(function(p7)
						-- upvalues: NewLayerToVariables (copy)
						return if not next(NewLayerToVariables) == not next(p7) then p7 else NewLayerToVariables
					end)
					UseStateResult2_1(v1)
				end)
				local v1 = UseIXPServiceModuleResult[p2](UseIXPServiceModuleResult)
				local NewLayerToVariables = getNewLayerToVariables()
				UseStateResult2(function(p7)
					-- upvalues: NewLayerToVariables (copy)
					return if not next(NewLayerToVariables) == not next(p7) then p7 else NewLayerToVariables
				end)
				UseStateResult2_1(v1)
				
				return function()
					-- upvalues: Connection (copy)
					if Connection ~= nil then
						Connection:Disconnect()
					end
				end
			end
		end, { UseIXPServiceModuleResult, Text })
		local UsePreviousModuleResult = UsePreviousModule(UseStateResult1) or Enum.IXPLoadingStatus.None
		ReactModule.useEffect(function()
			-- upvalues: p6 (ref), UseIXPServiceModuleResult (copy), UseStateResult1 (copy), UsePreviousModuleResult (copy), List (copy), p5 (upval), p4 (upval)
			if p6 and UseIXPServiceModuleResult ~= nil and UseStateResult1 == Enum.IXPLoadingStatus.Initialized and UsePreviousModuleResult ~= Enum.IXPLoadingStatus.Initialized then
				for _, value in ipairs(List) do
					if UseIXPServiceModuleResult[p5](UseIXPServiceModuleResult, value) == Enum.IXPLoadingStatus.Initialized then
						UseIXPServiceModuleResult[p4](UseIXPServiceModuleResult, value)
					end
				end
			end
		end, {
			UseIXPServiceModuleResult,
			Text,
			p6,
			UseStateResult1,
			UsePreviousModuleResult
		})
		
		return Callback(UseStateResult)
	end
end