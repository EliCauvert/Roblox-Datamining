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

local function captureErrorContext(p1)
	return {
		name = p1.debugName,
		componentType = p1.currentComponentType,
		parserName = p1.currentParserName,
		appPage = p1.appPage
	}
end

local function unwrapEntryData(p1)
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

local function fillInputs(p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: buildInputsForNestedComponentModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref)
	if p3 == nil then return end
	local ok, status = pcall(function()
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
	createInputSlicer = function(p9, p10, p11, p12, p13)
		-- upvalues: fillInputs (ref), cryoModule (ref), t (ref), unwrapEntryData (ref), fFlagSduiPoolBackedFeed (ref)
		local function rawSlice(p14, p15)
			-- upvalues: p9 (ref), fillInputs (copy), p10 (ref), p11 (ref), p12 (ref), cryoModule (copy), t (copy), unwrapEntryData (copy)
			if p14.sourceMode == "literal" then
				return if p15 then p9 else function(p16)
					-- upvalues: fillInputs (copy), p14 (ref), p9 (copy), p10 (copy), p11 (copy), p12 (copy)
					local t = {}
					fillInputs(t, p14.inputs, p9, p10, p16, p11, p12)
					
					return t
				end
			end
			local item = p14.item
			
			return if p15 then function(p16)
				-- upvalues: cryoModule (copy), p9 (copy), item (ref), t (copy)
				return cryoModule.Dictionary.join(p9(p16), if typeof(item) == "table" then item else t)
			end else function(p16)
				-- upvalues: unwrapEntryData (copy), item (ref), fillInputs (copy), p14 (ref), p9 (copy), p10 (copy), p11 (copy), p12 (copy)
				local var1 = unwrapEntryData(item)
				fillInputs(var1, p14.inputs, p9, p10, p16, p11, p12)
				
				return var1
			end
		end
		
		return if fFlagSduiPoolBackedFeed and p13 ~= nil then function(p14, p15)
			-- upvalues: rawSlice (ref), p13 (ref), cryoModule (copy)
			local var1 = rawSlice(p14, p15)
			
			return function(p16)
				-- upvalues: p13 (copy), p14 (ref), var1 (ref), cryoModule (copy)
				local var2 = p13(p14)
				
				return if var2 == nil then var1(p16) else cryoModule.Dictionary.join(var1(p16), var2)
			end
		end else rawSlice
	end,
	buildEntryConfigs = function(p9, p10, p11, p12, p13, p14, p15, p16, p17, p18)
		-- upvalues: fFlagSduiPoolBackedFeed (ref), sduiPropUtilsModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), fFlagSduiDeferredListItems (ref), sduiDeferredItemStubModule (ref), buildConfigForComponent (ref)
		local t = {}
		local t_1 = {}
		local var1 = fFlagSduiPoolBackedFeed and p18 ~= nil
		
		for i, v in p9 do
			if p11 and p11[i] then
				local var2 = p11[i]
				
				if sduiPropUtilsModule.isComponentVisible(var2, p16) then
					if var1 then
						local var3 = p18(v, p16)
						
						if var3 ~= nil then
							for i_2, v_2 in var3 do
								var2[i_2] = v_2
							end
						end
					end
					table.insert(t, var2)
					table.insert(t_1, i)
				end
			elseif v.template == nil then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `No template found for ComponentList item (identifier: {v.identifier or tostring(i)})`,
					name = p13.name,
					componentType = p13.componentType,
					parserName = p13.parserName
				}, p13.appPage)
			else
				local var4 = p10(v, v.isInline)
				local var5 = if v.isInline then p15 else nil
				
				if fFlagSduiDeferredListItems and p17 and (not v.template or (not v.template.kind or (not v.template.kind.value or (not v.template.kind.value.shared or v.template.kind.value.shared.is_component_filtered == nil)))) then
					local var6 = sduiDeferredItemStubModule.makeStub(v.template, var4, p12, p14, var5, p13)
					
					if var1 then
						local var7 = p18(v, p16)
						
						if var7 ~= nil then
							for v_1, v_2 in var7 do
								var6[v_1] = v_2
							end
						end
					end
					table.insert(t, var6)
					table.insert(t_1, i)
				else
					local var8 = buildConfigForComponent(v.template, var4, p12, p14, nil, var5)
					
					if var8 and sduiPropUtilsModule.isComponentVisible(var8, p16) then
						if var1 then
							local var9 = p18(v, p16)
							
							if var9 ~= nil then
								for i_1, v_1 in var9 do
									var8[i_1] = v_1
								end
							end
						end
						table.insert(t, var8)
						table.insert(t_1, i)
					end
				end
			end
		end
		return t, t_1
	end
}