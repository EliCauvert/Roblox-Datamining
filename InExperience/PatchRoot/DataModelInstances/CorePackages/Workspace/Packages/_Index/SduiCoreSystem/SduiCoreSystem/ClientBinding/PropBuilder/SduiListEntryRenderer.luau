local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.Signals)
local buildInputsForNestedComponentModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildInputsForNestedComponent)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiClientBindingBuilderModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local _ = require(sduiCoreSystem.SduiComponentType)
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local _ = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryNormalizer)
local fFlagSduiPoolBackedFeed = require(parent.SharedFlags).FFlagSduiPoolBackedFeed
local buildConfigForComponent = sduiClientBindingBuilderModule.buildConfigForComponent
local sduiDeferredItemStubModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiDeferredItemStub)
local fFlagSduiDeferredListItems = require(parent.SharedFlags).FFlagSduiDeferredListItems
local t = {}

local function captureErrorContext(p0) --[[ line: 63 ]]
	return {
		name = p0.debugName,
		componentType = p0.currentComponentType,
		parserName = p0.currentParserName,
		appPage = p0.appPage
	}
end

local function unwrapEntryData(p1) --[[ line: 75 ]]
	if typeof(p1) ~= "table" then
		return { value = p1 }
	end
	local inputData = p1.input_data
	
	if not inputData or not inputData.kind or not inputData.kind.value then
		return table.clone(p1)
	end
	local t = {}
	
	if typeof(inputData.kind.value) == "table" then
		for i, v in inputData.kind.value do
			t[i] = v
		end
	end
	return t
end

local function fillInputs(p2, p3, p4, p5, p6, p7, p8) --[[ line: 99 ]]
	-- upvalues: buildInputsForNestedComponentModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref)
	if p3 == nil then return end
	local ok, status = pcall(function() --[[ line: 111 ]]
		-- upvalues: buildInputsForNestedComponentModule (copy), p4 (ref), p3 (ref), p5 (ref), p6 (ref), p2 (ref), p7 (ref)
		buildInputsForNestedComponentModule(p4, p3, p5, p6, p2, p7)
	end)
	
	if not ok then
		sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
			message = `Failed to build inputs for ComponentList item: {sduiParseHelpersModule.stringifyValue(status)}`,
			name = p8.name,
			componentType = p8.componentType,
			parserName = p8.parserName
		}, p8.appPage)
	end
end

return {
	captureErrorContext = captureErrorContext,
	createInputSlicer = function(p9, p10, p11, p12, p13) --[[ line: 142 ]]
		-- upvalues: fillInputs (ref), cryoModule (ref), t (ref), unwrapEntryData (ref), fFlagSduiPoolBackedFeed (ref)
		local function rawSlice(p14, p15) --[[ line: 149 ]]
			-- upvalues: p9 (ref), fillInputs (copy), p10 (ref), p11 (ref), p12 (ref), cryoModule (copy), t (copy), unwrapEntryData (copy)
			if p14.sourceMode == "literal" then
				return if p15 then p9 else function(p16) --[[ line: 159 ]]
					-- upvalues: fillInputs (copy), p14 (ref), p9 (copy), p10 (copy), p11 (copy), p12 (copy)
					local t = {}
					fillInputs(t, p14.inputs, p9, p10, p16, p11, p12)
					
					return t
				end
			end
			local item = p14.item
			
			return if p15 then function(p18) --[[ line: 179 ]]
				-- upvalues: cryoModule (copy), p9 (copy), item (ref), t (copy)
				return cryoModule.Dictionary.join(p9(p18), if typeof(item) == "table" then item else t)
			end else function(p17) --[[ line: 186 ]]
				-- upvalues: unwrapEntryData (copy), item (ref), fillInputs (copy), p14 (ref), p9 (copy), p10 (copy), p11 (copy), p12 (copy)
				local var16 = unwrapEntryData(item)
				fillInputs(var16, p14.inputs, p9, p10, p17, p11, p12)
				
				return var16
			end
		end
		
		return if fFlagSduiPoolBackedFeed and p13 ~= nil then function(p19, p20) --[[ line: 204 ]]
			-- upvalues: rawSlice (ref), p13 (ref), cryoModule (copy)
			local var17 = rawSlice(p19, p20)
			
			return function(p21) --[[ line: 206 ]]
				-- upvalues: p13 (copy), p19 (ref), var17 (ref), cryoModule (copy)
				local var18 = p13(p19)
				
				return if var18 == nil then var17(p21) else cryoModule.Dictionary.join(var17(p21), var18)
			end
		end else rawSlice
	end,
	buildEntryConfigs = function(p22, p23, p24, p25, p26, p27, p28, p29, p30, p31) --[[ line: 235 ]]
		-- upvalues: fFlagSduiPoolBackedFeed (ref), sduiPropUtilsModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), fFlagSduiDeferredListItems (ref), sduiDeferredItemStubModule (ref), buildConfigForComponent (ref)
		local t = {}
		local t_1 = {}
		local var21 = fFlagSduiPoolBackedFeed and p31 ~= nil
		
		for i, v in p22 do
			if p24 and p24[i] then
				local var28 = p24[i]
				
				if sduiPropUtilsModule.isComponentVisible(var28, p29) then
					if var21 then
						local var29 = p31(v, p29)
						
						if var29 ~= nil then
							for i_2, v_2 in var29 do
								var28[i_2] = v_2
							end
						end
					end
					table.insert(t, var28)
					table.insert(t_1, i)
				end
			elseif v.template == nil then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `No template found for ComponentList item (identifier: {v.identifier or tostring(i)})`,
					name = p26.name,
					componentType = p26.componentType,
					parserName = p26.parserName
				}, p26.appPage)
			else
				local var22 = p23(v, v.isInline)
				local var23 = if v.isInline then p28 else nil
				
				if fFlagSduiDeferredListItems and p30 and (not v.template or (not v.template.kind or (not v.template.kind.value or (not v.template.kind.value.shared or v.template.kind.value.shared.is_component_filtered == nil)))) then
					local var26 = sduiDeferredItemStubModule.makeStub(v.template, var22, p25, p27, var23, p26)
					
					if var21 then
						local var27 = p31(v, p29)
						
						if var27 ~= nil then
							for v_1, v_2 in var27 do
								var26[v_1] = v_2
							end
						end
					end
					table.insert(t, var26)
					table.insert(t_1, i)
				else
					local var24 = buildConfigForComponent(v.template, var22, p25, p27, nil, var23)
					
					if var24 and sduiPropUtilsModule.isComponentVisible(var24, p29) then
						if var21 then
							local var25 = p31(v, p29)
							
							if var25 ~= nil then
								for i_1, v_1 in var25 do
									var24[i_1] = v_1
								end
							end
						end
						table.insert(t, var24)
						table.insert(t_1, i)
					end
				end
			end
		end
		return t, t_1
	end
}